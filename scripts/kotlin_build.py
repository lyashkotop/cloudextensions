"""Compile Kotlin against the real host SDK, then package only one provider and its shared core."""
from pathlib import Path
import os
import subprocess
import re
import struct
import shutil

ROOT = Path(__file__).resolve().parents[1]
LIBRARIES = ('cloudstream-sdk.jar', 'kotlin-stdlib-2.1.0.jar', 'jsoup-1.18.3.jar',
             'json-20240303.jar', 'android-4.1.1.4.jar', 'okhttp-4.12.0.jar',
             'okio-jvm-3.6.0.jar', 'nicehttp-0.4.13.jar',
             'kotlinx-coroutines-core-jvm-1.6.4.jar', 'annotations-13.0.jar', 'gson-2.13.2.jar', 'jackson-annotations-2.17.2.jar',
             'jackson-core-2.17.2.jar', 'jackson-databind-2.17.2.jar',
             'jackson-module-kotlin-2.17.2.jar', 'rhino-1.8.0.jar')


def compile_sources(tools, sources, destination, extra=()):
    if destination.exists():
        shutil.rmtree(destination)
    libraries = [tools / name for name in LIBRARIES] + list(extra)
    subprocess.run(['java', '-cp', str(tools / '*'), 'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler',
                    '-no-stdlib', '-no-reflect', '-Xskip-metadata-version-check',
                    '-Xno-param-assertions', '-Xno-call-assertions', '-Xno-receiver-assertions',
                    '-Xlambdas=class', '-Xsam-conversions=class', '-jvm-target', '1.8',
                    '-cp', os.pathsep.join(map(str, libraries)), '-d', str(destination),
                    *map(str, sources)], check=True)


def prepare(tools, temporary):
    common = temporary / 'kotlin-common'
    compile_sources(tools, sorted((ROOT / 'common/kotlin').rglob('*.kt')), common)
    tests = temporary / 'kotlin-tests'
    compile_sources(tools, sorted((ROOT / 'common/tests-kotlin').rglob('*.kt')), tests, [common])
    classpath = os.pathsep.join(map(str, [tests, common, *(tools / name for name in LIBRARIES)]))
    subprocess.run(['java', '-cp', classpath, 'com.cloudextensions.russian.RussianCoreTestKt'], check=True)
    return common


def reachable_classes(paths, entry):
    """Whole-class closure, including descriptors and literal reflection names; no method shrinking."""
    files = {}
    references = {}
    for path in paths:
        data = path.read_bytes()
        if data[:4] != b'\xca\xfe\xba\xbe':
            raise ValueError('Invalid compiler class file')
        count = struct.unpack_from('>H', data, 8)[0]
        offset, index = 10, 1
        strings, classes = {}, {}
        while index < count:
            tag = data[offset]
            offset += 1
            if tag == 1:
                size = struct.unpack_from('>H', data, offset)[0]
                offset += 2
                strings[index] = data[offset:offset + size].decode('utf-8', errors='ignore')
                offset += size
            elif tag == 7:
                classes[index] = struct.unpack_from('>H', data, offset)[0]
                offset += 2
            else:
                sizes = {3:4, 4:4, 5:8, 6:8, 8:2, 9:4, 10:4, 11:4, 12:4, 15:3, 16:2, 17:4, 18:4, 19:2, 20:2}
                if tag not in sizes:
                    raise ValueError('Unsupported class constant: ' + str(tag))
                offset += sizes[tag]
                if tag in (5, 6):
                    index += 1
            index += 1
        # Resolve this_class through its CONSTANT_Class name index.
        this_index = struct.unpack_from('>H', data, offset + 2)[0]
        name = strings[classes[this_index]]
        files[name] = path
        refs = {strings[i] for i in classes.values()}
        for value in strings.values():
            refs.update(re.findall(r'L([A-Za-z0-9_$/]+);', value))
            if re.fullmatch(r'(?:com|org)\.[A-Za-z0-9_.$]+', value):
                refs.add(value.replace('.', '/'))
        references[name] = refs
    pending, selected = [entry.replace('.', '/')], set()
    while pending:
        name = pending.pop()
        if name in selected or name not in files:
            continue
        selected.add(name)
        pending.extend(references[name] - selected)
    if not selected:
        raise ValueError('Missing Kotlin plugin entry')
    return [files[name] for name in sorted(selected)]


def package_dex(tools, temporary, common, module):
    stage = temporary / ('kotlin-' + module['id'])
    classes = stage / 'classes'
    compile_sources(tools, sorted((module['folder'] / 'src/main/kotlin').rglob('*.kt')), classes, [common])
    output = stage / 'dex'
    if output.exists():
        shutil.rmtree(output)
    output.mkdir(parents=True)
    available = sorted(common.rglob('*.class')) + sorted(classes.rglob('*.class'))
    production = reachable_classes(available, module['entryClass'])
    subprocess.run(['java', '-cp', str(tools / 'r8-8.3.37.jar'), 'com.android.tools.r8.D8',
                    '--release', '--min-api', '21', '--no-desugaring',
                    '--output', str(output), *map(str, production)], check=True)
    dex_files = list(output.glob('*.dex'))
    if len(dex_files) != 1:
        raise ValueError('Native extension must have exactly one DEX')
    return dex_files[0].read_bytes()
