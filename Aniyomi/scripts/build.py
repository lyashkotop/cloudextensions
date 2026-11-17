#!/usr/bin/env python3
"""Build a single API-14 Aniyomi SourceFactory APK with pinned compile-only host libraries."""
from pathlib import Path
import argparse,os,sys,subprocess,zipfile,json,hashlib,shutil
ROOT=Path(__file__).resolve().parents[1]
def run(*args,**kw):subprocess.run(list(map(str,args)),check=True,**kw)
def main():
 parser=argparse.ArgumentParser();parser.add_argument('--tools',type=Path,default=ROOT/'.tools');parser.add_argument('--compiler-tools',type=Path);parser.add_argument('--compile-only',action='store_true');parser.add_argument('--unsigned',action='store_true');parser.add_argument('--version',type=int,default=6);args=parser.parse_args()
 tools=args.tools.resolve();compiler=(args.compiler_tools or tools).resolve();out=ROOT/'build';out.mkdir(exist_ok=True)
 run(sys.executable,ROOT/'scripts/generate_registry.py')
 libraries=[compiler/'kotlin-stdlib-2.1.0.jar',compiler/'kotlinx-coroutines-core-jvm-1.6.4.jar',compiler/'okhttp-4.12.0.jar',compiler/'okio-jvm-3.6.0.jar',compiler/'jsoup-1.18.3.jar',compiler/'json-20240303.jar',compiler/'annotations-13.0.jar',tools/'android.jar',tools/'aniyomi-lib14.jar',tools/'rxjava.jar',tools/'injekt.jar',tools/'injekt-api.jar']
 cp=os.pathsep.join(map(str,libraries));classes=out/'classes'
 if classes.exists():shutil.rmtree(classes)
 run('java','-cp',str(compiler/'*'),'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler','-no-stdlib','-no-reflect','-Xskip-metadata-version-check','-Xno-param-assertions','-Xno-call-assertions','-Xlambdas=class','-Xsam-conversions=class','-jvm-target','1.8','-cp',cp,'-d',classes,*sorted((ROOT/'src/main/kotlin').rglob('*.kt')))
 (out/'classpath.txt').write_text(os.pathsep.join(map(str,[classes,*libraries])))
 if args.compile_only:return
 jar=out/'extension.jar'
 with zipfile.ZipFile(jar,'w',zipfile.ZIP_DEFLATED) as z:
  for path in classes.rglob('*.class'):z.write(path,path.relative_to(classes).as_posix())
 dex=out/'dex';dex.mkdir(exist_ok=True)
 d8=['java','-cp',str(tools/'r8.jar'),'com.android.tools.r8.D8','--release','--min-api','26','--lib',str(tools/'android.jar'),'--output',str(dex)]
 for path in libraries:
  if path.name!='android.jar':d8+=['--classpath',str(path)]
 run(*d8,jar)
 aapt=tools/'aapt2';aapt.chmod(0o755)
 run(aapt,'compile','--dir',ROOT/'resources','-o',out/'resources.zip')
 manifest=(ROOT/'AndroidManifest.xml').read_text().replace('android:versionCode="1"',f'android:versionCode="{args.version}"').replace('android:versionName="14.1"',f'android:versionName="14.{args.version}"');(out/'AndroidManifest.xml').write_text(manifest)
 unsigned=out/'cloudextensions-unsigned.apk'
 run(aapt,'link','-o',unsigned,'-I',tools/'android.jar','--manifest',out/'AndroidManifest.xml',out/'resources.zip')
 with zipfile.ZipFile(unsigned,'a',zipfile.ZIP_DEFLATED) as z:
  for f in sorted(dex.glob('*.dex')):z.write(f,f.name)
  z.writestr('assets/NOTICE.txt',(ROOT/'NOTICE.md').read_text())
 keystore=os.environ.get('ANIYOMI_KEYSTORE');password=os.environ.get('ANIYOMI_KEYSTORE_PASSWORD')
 if args.unsigned:
  print('Built unsigned APK for validation; installation requires release signing');return
 if not keystore or not password:raise SystemExit('Signing requires ANIYOMI_KEYSTORE and ANIYOMI_KEYSTORE_PASSWORD; unsigned APK built')
 apk=out/'CloudExtensions.apk'
 run('java','-jar',tools/'apksigner-cli.jar','sign','--ks',keystore,'--ks-key-alias','cloudextensions','--ks-pass','env:ANIYOMI_KEYSTORE_PASSWORD','--key-pass','env:ANIYOMI_KEYSTORE_PASSWORD','--out',apk,unsigned)
 run('java','-jar',tools/'apksigner-cli.jar','verify','--verbose','--print-certs',apk)
 info={'file':apk.name,'version':args.version,'api':14,'sources':len(json.loads((ROOT/'catalogs/profiles.json').read_text())),'bytes':apk.stat().st_size,'sha256':hashlib.sha256(apk.read_bytes()).hexdigest()};(out/'build-info.json').write_text(json.dumps(info,indent=2)+'\n');print(json.dumps(info))
if __name__=='__main__':main()
