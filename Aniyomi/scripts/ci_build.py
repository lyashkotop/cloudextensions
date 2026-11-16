import argparse,os,base64,subprocess,sys
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--tools');p.add_argument('--compiler-tools');p.add_argument('--version');a=p.parse_args()
args=[sys.executable,str(Path(__file__).with_name('build.py')),'--tools',a.tools,'--compiler-tools',a.compiler_tools,'--version',a.version]
data=os.environ.pop('ANIYOMI_KEYSTORE_DATA','')
if data and os.environ.get('ANIYOMI_KEYSTORE_PASSWORD'):
 key=Path(os.environ['ANIYOMI_KEYSTORE']);key.write_bytes(base64.b64decode(data));key.chmod(0o600)
else:
 args+=['--unsigned'];print('Release signing secrets are absent: validating an unsigned build; use the signed release APK for installation.',flush=True)
subprocess.run(args,check=True)
