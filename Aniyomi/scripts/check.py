#!/usr/bin/env python3
from pathlib import Path
import argparse,json,subprocess,sys,zipfile,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parents[1]
def main():
 p=argparse.ArgumentParser();p.add_argument('--tools',type=Path,default=ROOT/'.tools');p.add_argument('--compiler-tools',type=Path);p.add_argument('--live',action='store_true');a=p.parse_args();compiler=a.compiler_tools or a.tools
 subprocess.run([sys.executable,str(ROOT/'scripts/run_probe.py'),'Contracts','--tools',str(compiler)],check=True)
 apk=ROOT/'build/CloudExtensions.apk'
 if not apk.exists():apk=ROOT/'build/cloudextensions-unsigned.apk'
 with zipfile.ZipFile(apk) as z:
  assert z.testzip() is None
  assert 'classes.dex'in z.namelist() and 'AndroidManifest.xml'in z.namelist()
  dex=z.read('classes.dex');assert dex.startswith(b'dex\n')
  assert b'Leu/kanade/tachiyomi/animeextension/all/cloudbundle/BundleFactory;' in dex
  assert b'Lcom/lagradost/cloudstream3/' not in dex,'CloudStream host dependency leaked into APK'
  assert b'Leu/kanade/tachiyomi/animesource/online/AnimeHttpSource;'in dex
  sys.path.insert(0,str(ROOT.parent/'scripts'));from build_repository import Dex
  classes=Dex(dex).classes
  assert 'Leu/kanade/tachiyomi/animesource/online/AnimeHttpSource;' not in classes,'Host stub was packaged'
  assert not any(c.startswith(('Lokhttp3/','Lkotlin/','Lorg/jsoup/','Lkotlinx/','Lrx/','Landroid/','Luy/kohesive/')) for c in classes),'Host dependencies were packaged'
 subprocess.run([str(a.tools/'aapt2'),'dump','badging',str(apk)],check=True,stdout=(ROOT/'build/apk-manifest.txt').open('w'))
 if 'unsigned' not in apk.name:subprocess.run(['java','-jar',str(a.tools/'apksigner-cli.jar'),'verify',str(apk)],check=True)
 print('PASS: factory APK, manifest, DEX, no host stubs/dependency duplication and signature (when signed)')
 if a.live:subprocess.run([sys.executable,str(ROOT/'scripts/run_probe.py'),'LiveAudit',str(ROOT/'build/live-audit.json'),'--tools',str(compiler)],check=True)
if __name__=='__main__':main()
