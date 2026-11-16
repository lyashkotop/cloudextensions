#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,urllib.request,zipfile,sys
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT.parent/'common/tools'))
import importlib.util
spec=importlib.util.spec_from_file_location("shared_tool_fetch",ROOT.parent/"common/tools/fetch_tools.py");shared=importlib.util.module_from_spec(spec);spec.loader.exec_module(shared)
download=shared.download

def main():
 parser=argparse.ArgumentParser();parser.add_argument('--directory',type=Path,default=ROOT/'.tools');tools=parser.parse_args().directory;tools.mkdir(parents=True,exist_ok=True)
 for entry in json.loads((ROOT/'scripts/toolchain.json').read_text()):
  path=tools/entry['file']
  if not path.exists() or hashlib.sha256(path.read_bytes()).hexdigest()!=entry['sha256']:
   print('Downloading verified',entry['file'],flush=True);path.write_bytes(download(entry))
 with zipfile.ZipFile(tools/'lib14.aar') as z:(tools/'aniyomi-lib14.jar').write_bytes(z.read('classes.jar'))
 with zipfile.ZipFile(tools/'aapt2.jar') as z:(tools/'aapt2').write_bytes(z.read('aapt2'))
 (tools/'aapt2').chmod(0o755)
 with zipfile.ZipFile(tools/'build-tools.zip') as z:
  path=next(n for n in z.namelist() if n.endswith('/lib/apksigner.jar'));(tools/'apksigner-cli.jar').write_bytes(z.read(path))
 print('Verified Aniyomi build tools')
if __name__=='__main__':main()
