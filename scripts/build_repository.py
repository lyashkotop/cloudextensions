#!/usr/bin/env python3
"""Compile shared code once and produce an independently registered plugin per site."""
import argparse
import hashlib
import io
import json
import os
from pathlib import Path
import re
import shutil
import struct
import subprocess
import tempfile
import zipfile
import zlib
import kotlin_build
from concurrent.futures import ThreadPoolExecutor, as_completed

ROOT = Path(__file__).resolve().parents[1]
CATEGORIES = {'Russian': 'ru', 'Japanese': 'ja', 'English': 'en'}
LANGUAGE_LABELS = {'ru': '1 · RU', 'ja': '2 · JA', 'en': '3 · EN'}


def extension_name(module):
    """CloudStream sorts extension names; rank prefixes preserve language groups."""
    return LANGUAGE_LABELS[module['language']] + ' · ' + (module.get('displayFlag', '') + ' ' if module.get('displayFlag') else '') + module['name']


def modules():
    result = []
    ids = set()
    for category, language in CATEGORIES.items():
        paths = sorted((ROOT / category).glob('*/plugin.json'), key=lambda p: json.loads(p.read_text())['name'].casefold())
        for path in paths:
            data = json.loads(path.read_text())
            if data['category'] != category or data['language'] != language:
                raise ValueError('Language/category mismatch: ' + str(path))
            if not re.fullmatch(r'[A-Za-z][A-Za-z0-9]*', data['id']) or data['id'] in ids:
                raise ValueError('Invalid or duplicated module id: ' + str(path))
            icon = data.get('iconUrl', '')
            if not isinstance(icon, str) or not icon.startswith('https://'):
                raise ValueError('Each provider requires an HTTPS iconUrl: ' + str(path))
            prefix = 'https://raw.githubusercontent.com/' + json.loads((ROOT / 'repository.json').read_text())['repository'] + '/main/'
            if icon.startswith(prefix):
                icon_file = (ROOT / icon[len(prefix):]).resolve()
                if not icon_file.is_relative_to(ROOT.resolve()) or not icon_file.is_file():
                    raise ValueError('Missing local icon: ' + str(path))
                image = icon_file.read_bytes()
                if not image.startswith((b'\x89PNG\r\n\x1a\n', b'\xff\xd8\xff')):
                    raise ValueError('Icon must be a real PNG or JPEG: ' + str(path))
            ids.add(data['id'])
            data['folder'] = path.parent
            result.append(data)
    if not result:
        raise ValueError('No plugin modules found')
    return result



class Dex:
    """Minimal DEX reader for checksums, class membership and generated entry methods."""
    def __init__(self, raw):
        self.raw = raw
        if not raw.startswith(b'dex\n') or struct.unpack_from('<I', raw, 32)[0] != len(raw):
            raise ValueError('Invalid DEX header')
        if raw[12:32] != hashlib.sha1(raw[32:]).digest() or struct.unpack_from('<I', raw, 8)[0] != zlib.adler32(raw[12:]) & 0xffffffff:
            raise ValueError('Invalid DEX checksum')
        count, offset = struct.unpack_from('<II', raw, 56)
        self.strings = []
        for i in range(count):
            start = struct.unpack_from('<I', raw, offset + i * 4)[0]
            _, start = self.uleb(start)
            self.strings.append(raw[start:raw.index(b'\0', start)].decode('utf-8', errors='replace'))
        count, offset = struct.unpack_from('<II', raw, 64)
        self.types = [self.strings[struct.unpack_from('<I', raw, offset + i * 4)[0]] for i in range(count)]
        count, offset = struct.unpack_from('<II', raw, 88)
        self.methods = [struct.unpack_from('<HHI', raw, offset + i * 8) for i in range(count)]
        count, offset = struct.unpack_from('<II', raw, 96)
        self.classes = {self.types[struct.unpack_from('<I', raw, offset + i * 32)[0]]: struct.unpack_from('<I', raw, offset + i * 32 + 24)[0] for i in range(count)}

    def uleb(self, offset):
        value = shift = 0
        while True:
            byte = self.raw[offset]
            offset += 1
            value |= (byte & 127) << shift
            if not byte & 128:
                return value, offset
            shift += 7
            if shift > 35:
                raise ValueError('Invalid ULEB128')

    def entry(self, descriptor):
        position = self.classes[descriptor]
        counts = []
        for _ in range(4):
            value, position = self.uleb(position)
            counts.append(value)
        for _ in range(counts[0] + counts[1]):
            _, position = self.uleb(position)
            _, position = self.uleb(position)
        for count in counts[2:]:
            method_id = 0
            for _ in range(count):
                difference, position = self.uleb(position)
                method_id += difference
                _, position = self.uleb(position)
                code, position = self.uleb(position)
                name = self.strings[self.methods[method_id][2]]
                if name == 'load':
                    size = struct.unpack_from('<I', self.raw, code + 12)[0]
                    return struct.unpack_from('<' + 'H' * size, self.raw, code + 16)
        raise ValueError('No load method for ' + descriptor)

    def validate_entry(self, module):
        words = self.entry('L' + module['entryClass'].replace('.', '/') + ';')
        index = registrations = 0
        types = []
        sizes = {0x00: 1, 0x07: 1, 0x08: 2, 0x09: 3, 0x0e: 1, 0x12: 1, 0x1a: 2, 0x1b: 3, 0x1f: 2, 0x22: 2, 0x62: 2, 0x6e: 3, 0x70: 3, 0x71: 3}
        while index < len(words):
            opcode = words[index] & 255
            if opcode not in sizes:
                raise ValueError('Unexpected generated entry opcode: ' + hex(opcode))
            if opcode == 0x22:
                types.append(self.types[words[index + 1]])
            if opcode == 0x6e and self.strings[self.methods[words[index + 1]][2]] == 'registerMainAPI':
                registrations += 1
            index += sizes[opcode]
        if registrations != 1 or 'L' + module['providerClass'].replace('.', '/') + ';' not in types:
            raise ValueError('Entry must register exactly its own provider: ' + module['id'])


def package(path, manifest, dex):
    path.parent.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(path, 'w', zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
        for name, data in [('manifest.json', json.dumps(manifest, ensure_ascii=False, separators=(',', ':')).encode()), ('classes.dex', dex)]:
            info = zipfile.ZipInfo(name, (2026, 1, 1, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            archive.writestr(info, data, compresslevel=9)
    with zipfile.ZipFile(path) as archive:
        if archive.testzip() is not None or set(archive.namelist()) != {'manifest.json', 'classes.dex'}:
            raise ValueError('Invalid package: ' + str(path))


def package_path(module, version):
    return Path('packages', module['category'], str(version), f"{module['id']}.cs3")


def previous_packages(ref, modules, version):
    """Return verified unchanged artifacts from one published Git snapshot."""
    def git(*args):
        return subprocess.run(['git', *args], cwd=ROOT, check=True, capture_output=True).stdout

    try:
        if git('status', '--porcelain'):
            return {}
        revision = git('rev-parse', '--verify', ref).decode().strip()
        info = json.loads(git('show', revision + ':build-info.json'))
        base = info['sourceCommit']
        if not re.fullmatch(r'[0-9a-f]{40}', base):
            return {}
        git('merge-base', '--is-ancestor', base, 'HEAD')
        if git('diff', '--name-only', base, 'HEAD', '--', 'common/kotlin/', 'common/tools/toolchain.json',
               'scripts/kotlin_build.py', 'scripts/build_repository.py', 'repository.json'):
            return {}
        changed = set(git('diff', '--name-only', '-z', '--no-renames', base, 'HEAD').decode().split('\0'))
        entries = {item['internalName']: item for item in json.loads(git('show', revision + ':plugins.json'))}
    except (subprocess.CalledProcessError, ValueError, KeyError, TypeError):
        return {}

    reused = {}
    for module in modules:
        folder = module['folder'].relative_to(ROOT).as_posix()
        item = entries.get(module['id'])
        if not item or any(path.startswith(folder + '/') for path in changed):
            continue
        try:
            artifact = folder.rsplit('/', 1)[0] + '/' + module['id'] + '.cs3'
            raw = git('show', revision + ':' + artifact)
            prior_version = item['version']
            if type(prior_version) is not int or not 0 < prior_version <= version:
                continue
            if len(raw) != item['fileSize'] or 'sha256-' + hashlib.sha256(raw).hexdigest() != item['fileHash']:
                continue
            with zipfile.ZipFile(io.BytesIO(raw)) as archive:
                if set(archive.namelist()) != {'manifest.json', 'classes.dex'} or archive.testzip() is not None:
                    continue
                manifest = json.loads(archive.read('manifest.json'))
                if (manifest['version'], manifest['pluginClassName'], manifest['name']) != (
                    prior_version, module['entryClass'], extension_name(module)
                ):
                    continue
                dex = archive.read('classes.dex')
                Dex(dex).validate_entry(module)
            reused[module['id']] = (raw, dex, prior_version)
        except (subprocess.CalledProcessError, ValueError, KeyError, TypeError, zipfile.BadZipFile, struct.error):
            continue
    return reused


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--tools', type=Path, default=ROOT / '.tools')
    parser.add_argument('--output', type=Path, default=ROOT / '.release')
    parser.add_argument('--version', type=int, default=None)
    parser.add_argument('--reuse-from', help='Local Git ref for the previous published builds')
    args = parser.parse_args()
    config = json.loads((ROOT / 'repository.json').read_text())
    version = args.version if args.version is not None else config['versionBase']
    if not 0 < version < 2**31:
        raise ValueError('Version must be a positive signed 32-bit integer')
    repository = config['repository']
    if os.environ.get('GITHUB_REPOSITORY', repository) != repository:
        raise ValueError('Configure repository.json and repo.json for this repository before publishing')
    tools = args.tools.resolve()
    for tool in json.loads((ROOT / 'common/tools/toolchain.json').read_text()):
        path=tools / tool['file']
        if not path.is_file() or hashlib.sha256(path.read_bytes()).hexdigest()!=tool['sha256']:
            raise ValueError('Missing or mismatched tool: ' + str(path))
    selected = modules()
    if any(m.get("runtime")!="kotlin" for m in selected):
        raise ValueError("All providers must use native Kotlin")
    output = args.output.resolve()
    if output == ROOT or ROOT in output.parents and output.name in CATEGORIES:
        raise ValueError('Output cannot overwrite source directories')
    output.mkdir(parents=True, exist_ok=True)
    reused = previous_packages(args.reuse_from, selected, version) if args.reuse_from else {}
    expected = {m['category'] + '/' + m['id'] + '.cs3' for m in selected}
    for old in output.glob('*/*.cs3'):
        if old.relative_to(output).as_posix() not in expected:
            old.unlink()
    expected_versioned = {
        package_path(m, reused[m['id']][2] if m['id'] in reused else version) for m in selected
    }
    for old in (output / 'packages').glob('*/*/*.cs3'):
        if old.relative_to(output) not in expected_versioned:
            old.unlink()
    print(f'Compiling {len(selected) - len(reused)} of {len(selected)} providers, reusing {len(reused)} verified packages', flush=True)
    with tempfile.TemporaryDirectory(prefix='.repository-build-', dir=ROOT) as name:
        temporary = Path(name)
        native_common = kotlin_build.prepare(tools, temporary)
        native_results = {key: value[1] for key, value in reused.items()}
        native_modules = [m for m in selected if m['id'] not in reused]
        if native_modules:
            with ThreadPoolExecutor(max_workers=3) as pool:
                jobs = {pool.submit(kotlin_build.package_dex, tools, temporary, native_common, m): m['id'] for m in native_modules}
                for future in as_completed(jobs):
                    native_results[jobs[future]] = future.result()
        index = []
        for module in selected:
            module_data = native_results[module['id']]
            module_dex = Dex(module_data)
            module_dex.validate_entry(module)
            if module.get('runtime') == 'kotlin':
                expected_entry = 'L' + module['entryClass'].replace('.', '/') + ';'
                if any(name.startswith('Lcom/cloudextensions/entries/') and name != expected_entry for name in module_dex.classes):
                    raise ValueError('Foreign entry in native package: ' + module['id'])
                if any(name.startswith(('Lkotlin/', 'Lcom/lagradost/cloudstream3/', 'Lokhttp3/')) for name in module_dex.classes):
                    raise ValueError('Host dependency was packaged into native extension')
            relative = module['category'] + '/' + module['id'] + '.cs3'
            artifact = output / relative
            artifact_version = reused[module['id']][2] if module['id'] in reused else version
            manifest = {'pluginClassName': module['entryClass'], 'name': extension_name(module), 'version': artifact_version, 'requiresResources': False}
            if module['id'] in reused:
                artifact.parent.mkdir(parents=True, exist_ok=True)
                artifact.write_bytes(reused[module['id']][0])
            else:
                package(artifact, manifest, module_data)
            versioned = package_path(module, artifact_version)
            (output / versioned).parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(artifact, output / versioned)
            index.append({'url': f'https://raw.githubusercontent.com/{repository}/{config["buildsBranch"]}/{versioned.as_posix()}',
                          'status': module.get('status', 1), 'version': artifact_version, 'apiVersion': 1,
                          'name': extension_name(module), 'internalName': module['id'], 'authors': config['authors'],
                          'description': module['description'], 'repositoryUrl': 'https://github.com/' + repository,
                          'tvTypes': ['NSFW'], 'language': module['language'], 'iconUrl': module['iconUrl'],
                          'fileSize': artifact.stat().st_size, 'fileHash': 'sha256-' + hashlib.sha256(artifact.read_bytes()).hexdigest()})
        (output / 'plugins.json').write_text(json.dumps(index, ensure_ascii=False, indent=2) + '\n')
        shutil.copyfile(ROOT / 'repo.json', output / 'repo.json')
        (output / 'build-info.json').write_text(json.dumps({'version': version, 'sourceCommit': os.environ.get('GITHUB_SHA', 'local'), 'packageLayout': 'versioned', 'plugins': len(index), 'rebuilt': [m['id'] for m in selected if m['id'] not in reused], 'dexClasses': sum(len(Dex(raw).classes) for raw in native_results.values()), 'entryRegistrationsValidated': len(selected), 'kotlinProviders': sum(m.get('runtime') == 'kotlin' for m in selected)}, indent=2) + '\n')
        (output / 'README.md').write_text('# Generated CloudStream builds\n\nSource: https://github.com/' + repository + '\n\nAdd this URL in CloudStream:\n\nhttps://raw.githubusercontent.com/' + repository + '/' + config['sourceBranch'] + '/repo.json\n\nGenerated files are replaced only by a successful build. Site availability is not tested by CI.\n')
    # Validate the consumer-visible index against every real output file.
    for module, item in zip(selected, index):
        artifact = output / package_path(module, item['version'])
        with zipfile.ZipFile(artifact) as z:
            assert json.loads(z.read('manifest.json'))['version'] == item['version']
        assert item['fileSize'] == artifact.stat().st_size
        assert item['fileHash'] == 'sha256-' + hashlib.sha256(artifact.read_bytes()).hexdigest()
    print(f'Built {len(index)} independent plugins, version {version}: {output}')


if __name__ == '__main__':
    main()
