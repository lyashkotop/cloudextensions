#!/usr/bin/env python3
"""Download the published index and verify each package without running or displaying media."""
import argparse
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import hashlib
import io
import json
import urllib.request
import zipfile
from build_repository import Dex, modules, package_path


def get(url):
    request=urllib.request.Request(url,headers={'User-Agent':'CloudExtensions-package-verification'})
    with urllib.request.urlopen(request,timeout=40) as response:
        return response.read()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--version',type=int,required=True)
    parser.add_argument('--output',type=Path,default=Path('.release/remote-verification.json'))
    args=parser.parse_args()
    config=json.loads((Path(__file__).resolve().parents[1]/'repository.json').read_text())
    base='https://raw.githubusercontent.com/'+config['repository']+'/'+config['buildsBranch']+'/'
    info=json.loads(get(base+'build-info.json?verify='+str(args.version)))
    assert info['version']==args.version
    items=json.loads(get(base+'plugins.json?verify='+str(args.version)))
    expected={m['id']:m for m in modules()}
    assert len(items)==len(expected) and {i['internalName'] for i in items}==set(expected)
    def verify(item):
        assert 0 < item['version'] <= args.version
        if item['internalName'] in info.get('rebuilt', expected):
            assert item['version']==args.version
        module=expected[item['internalName']]
        expected_url=base+package_path(module,item['version']).as_posix()
        if info.get('packageLayout') != 'versioned':
            expected_url=base+module['category']+'/'+module['id']+'.cs3'
        assert item['url']==expected_url, item['internalName']
        raw=get(expected_url if info.get('packageLayout') == 'versioned' else expected_url+'?verify='+str(args.version))
        assert len(raw)==item['fileSize'], item['internalName']
        assert 'sha256-'+hashlib.sha256(raw).hexdigest()==item['fileHash'], item['internalName']
        with zipfile.ZipFile(io.BytesIO(raw)) as archive:
            assert archive.testzip() is None
            manifest=json.loads(archive.read('manifest.json'))
            assert manifest['version']==item['version']
            assert manifest['pluginClassName']==module['entryClass']
            Dex(archive.read('classes.dex')).validate_entry(module)
        return {'id':item['internalName'],'bytes':len(raw),'version':item['version'],'hashVerified':True,'entryVerified':True}
    with ThreadPoolExecutor(max_workers=6) as pool:
        rows=list(pool.map(verify,items))
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps({'packages':len(rows),'version':args.version,'results':rows},indent=2)+'\n')
    print('PASS:',len(rows),'published packages, version',args.version,'hashes, manifests and provider registrations')


if __name__=='__main__':main()
