"""Compile Kotlin against the real host SDK, then package only one provider and its shared core."""
from pathlib import Path
import os
import subprocess

ROOT = Path(__file__).resolve().parents[1]
LIBRARIES = ('cloudstream-sdk.jar', 'kotlin-stdlib-2.1.0.jar', 'jsoup-1.18.3.jar',
             'json-20240303.jar', 'android-4.1.1.4.jar', 'okhttp-4.12.0.jar',
             'okio-jvm-3.6.0.jar', 'nicehttp-0.4.13.jar',
             'kotlinx-coroutines-core-jvm-1.6.4.jar', 'annotations-13.0.jar')


def compile_sources(tools, sources, destination, extra=()):
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


def package_dex(tools, temporary, common, module):
    stage = temporary / ('kotlin-' + module['id'])
    classes = stage / 'classes'
    compile_sources(tools, sorted((module['folder'] / 'src/main/kotlin').rglob('*.kt')), classes, [common])
    output = stage / 'dex'
    output.mkdir(parents=True)
    production = sorted(common.rglob('*.class')) + sorted(classes.rglob('*.class'))
    subprocess.run(['java', '-cp', str(tools / 'r8-8.3.37.jar'), 'com.android.tools.r8.D8',
                    '--release', '--min-api', '21', '--no-desugaring',
                    '--output', str(output), *map(str, production)], check=True)
    dex_files = list(output.glob('*.dex'))
    if len(dex_files) != 1:
        raise ValueError('Native extension must have exactly one DEX')
    return dex_files[0].read_bytes()
