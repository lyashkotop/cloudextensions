"""Download pinned Java tools with checksum verification, mirrors and bounded retries."""
import argparse
import hashlib
import json
from pathlib import Path
import time
import urllib.error
import urllib.request

CENTRAL = 'https://repo.maven.apache.org/maven2/'


def locations(url):
    if url.startswith(CENTRAL):
        path = url[len(CENTRAL):]
        return ['https://maven-central.storage-download.googleapis.com/maven2/' + path,
                url, 'https://repo1.maven.org/maven2/' + path]
    if url.startswith('https://dl.google.com/dl/android/maven2/'):
        return [url, url.replace('https://dl.google.com/dl/android/maven2/', 'https://maven.google.com/')]
    return [url]


def download(tool):
    failures = []
    for attempt in range(3):
        for url in locations(tool['url']):
            try:
                request = urllib.request.Request(url, headers={'User-Agent': 'CloudExtensionsBuilder/1.0'})
                with urllib.request.urlopen(request, timeout=30) as response:
                    data = response.read()
                if hashlib.sha256(data).hexdigest() != tool['sha256']:
                    raise ValueError('SHA-256 mismatch')
                return data
            except (OSError, urllib.error.URLError, ValueError) as error:
                failures.append(type(error).__name__ + ': ' + str(error))
        if attempt < 2:
            print(f'Retrying {tool["file"]}: {failures[-1]}', flush=True)
            time.sleep(2 ** attempt)
    raise SystemExit('Cannot download verified tool ' + tool['file'] + ': ' + failures[-1])


def main():
    root = Path(__file__).resolve().parents[1]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--directory', type=Path, default=root / '.tools')
    parser.add_argument('--manifest', type=Path, default=root / 'tools/toolchain.json')
    directory = parser.parse_args().directory
    directory.mkdir(parents=True, exist_ok=True)
    for tool in json.loads(args.manifest.read_text()):
        target = directory / tool['file']
        if target.is_file() and hashlib.sha256(target.read_bytes()).hexdigest() == tool['sha256']:
            continue
        print('Downloading ' + target.name, flush=True)
        data = download(tool)
        staged = target.with_suffix('.download')
        staged.write_bytes(data)
        staged.replace(target)
        print('Verified ' + target.name, flush=True)


if __name__ == '__main__':
    main()
