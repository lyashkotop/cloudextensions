"""Compile maintained Java, run isolated tests, regenerate smali, package atomically."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[1]
PRODUCTION = re.compile(r"(?:MetadataDisplay|SourceTiming|DetailMetadata)(?:\$[^/]+)?\.class$")


def run(arguments):
    subprocess.run([str(value) for value in arguments], check=True)


def verify_tools(directory):
    for tool in json.loads((ROOT / "tools/toolchain.json").read_text()):
        path = directory / tool["file"]
        if not path.is_file() or hashlib.sha256(path.read_bytes()).hexdigest() != tool["sha256"]:
            raise SystemExit(f"Missing or mismatched tool: {path}; run tools/fetch_tools.py")


def compile_java(tools, temporary):
    classes = temporary / "classes"
    library = os.pathsep.join(str(tools / name) for name in ("jsoup-1.18.3.jar", "json-20240303.jar"))
    sources = [ROOT / "java/com/streambundle/SourceTiming.java", ROOT / "java/com/streambundle/MetadataDisplay.java",
               ROOT / "java/com/streambundle/v38/DetailMetadata.java",
               *sorted((ROOT / "tests").rglob("*.java"))]
    run(["java", "-jar", tools / "ecj-3.40.0.jar", "-8", "-encoding", "UTF-8",
         "-proc:none", "-warn:none", "-cp", library, "-d", classes, *sources])
    for name in ("MetadataDisplayTest", "com.streambundle.v38.DetailMetadataRegressionTest", "SourceTimingTest", "com.streambundle.v38.MetadataSourceSelectionTest"):
        run(["java", "-cp", str(classes) + os.pathsep + library, name])
    return sorted(path for path in classes.rglob("*.class") if PRODUCTION.fullmatch(path.name))


def regenerate_smali(tools, temporary):
    production = compile_java(tools, temporary)
    dex = temporary / "java-dex"
    dex.mkdir()
    run(["java", "-cp", tools / "r8-8.3.37.jar", "com.android.tools.r8.D8",
         "--min-api", "21", "--no-desugaring", "--output", dex, *production])
    generated = temporary / "java-smali"
    run(["java", "-cp", str(tools / "*"), "org.jf.baksmali.Main", "disassemble",
         dex / "classes.dex", "-o", generated])
    allowed = re.compile(r"com/streambundle/(?:v38/DetailMetadata|MetadataDisplay|SourceTiming)(?:\$[^/]+)?\.smali$")
    files = list(generated.rglob("*.smali"))
    if not files or any(not allowed.fullmatch(path.relative_to(generated).as_posix()) for path in files):
        raise SystemExit("Unexpected class in Java output; refusing to package test doubles")
    for directory, name in ((ROOT / "smali/com/streambundle", "MetadataDisplay"),
                            (ROOT / "smali/com/streambundle", "SourceTiming"),
                            (ROOT / "smali/com/streambundle/v38", "DetailMetadata")):
        for path in directory.glob(name + "*.smali"):
            if re.fullmatch(name + r"(?:\$[^/]+)?\.smali", path.name):
                path.unlink()
    for path in files:
        target = ROOT / "smali" / path.relative_to(generated)
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(path, target)


def assemble(classpath, source, dex):
    result = subprocess.run(["java", "-cp", classpath, "org.jf.smali.Main", "assemble",
                             str(source), "-o", str(dex)], capture_output=True, text=True)
    if result.returncode or not dex.is_file() or not dex.read_bytes().startswith(b"dex\n") or result.stderr.strip():
        raise SystemExit("DEX assembly failed:\n" + result.stdout + result.stderr)


def package(classpath, temporary, keep_debug=False):
    dex = temporary / "classes.dex"
    assemble(classpath, ROOT / "smali", dex)
    if not keep_debug:
        release = temporary / "release-smali"
        run(["java", "-cp", classpath, "org.jf.baksmali.Main", "disassemble",
             "--debug-info", "false", dex, "-o", release])
        if not release.is_dir() or not any(release.rglob("*.smali")):
            raise SystemExit("Release disassembly failed; no package was replaced")
        compact = temporary / "release.dex"
        assemble(classpath, release, compact)
        compact.replace(dex)
    manifest = json.loads((ROOT / "manifest.json").read_text())
    target = ROOT / f"StreamBundle-v{manifest['version']}.cs3"
    staged = temporary / target.name
    with zipfile.ZipFile(staged, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name, data in (("manifest.json", (ROOT / "manifest.json").read_bytes()),
                           ("classes.dex", dex.read_bytes())):
            entry = zipfile.ZipInfo(name, (2026, 1, 1, 0, 0, 0))
            entry.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(entry, data, compress_type=zipfile.ZIP_DEFLATED, compresslevel=9)
    with zipfile.ZipFile(staged) as archive:
        if archive.testzip() is not None or set(archive.namelist()) != {"manifest.json", "classes.dex"}:
            raise SystemExit("Package validation failed")
    staged.replace(target)
    shutil.copyfile(dex, ROOT / "classes.dex")
    print(target)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tools", type=Path, default=Path(os.environ.get("STREAMBUNDLE_TOOLS", ROOT / ".tools")))
    parser.add_argument("--smali-only", action="store_true", help="Package committed smali without compiling Java or running Java tests")
    parser.add_argument("--keep-debug", action="store_true", help="Keep DEX line numbers and local variable names for diagnostics")
    args = parser.parse_args()
    tools = args.tools.resolve()
    with tempfile.TemporaryDirectory(prefix=".build-", dir=ROOT) as name:
        temporary = Path(name)
        if not args.smali_only:
            verify_tools(tools)
            regenerate_smali(tools, temporary)
        classpath = os.environ.get("SMALI_CLASSPATH", str(tools / "*"))
        package(classpath, temporary, keep_debug=args.keep_debug)
