from pathlib import Path
import argparse,os,subprocess,urllib.parse
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('probe');p.add_argument('args',nargs='*');p.add_argument('--tools',type=Path,default=Path('/workspace/build-tools'));args=p.parse_args();tools=args.tools
cp=(ROOT/'build/classpath.txt').read_text();dest=ROOT/'build'/('probe-'+args.probe);source=ROOT/'tests'/(args.probe+'.kt')
subprocess.run(['java','-cp',str(tools/'*'),'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler','-no-stdlib','-no-reflect','-Xskip-metadata-version-check','-jvm-target','1.8','-cp',cp,'-d',str(dest),str(source)],check=True)
proxy=urllib.parse.urlparse(os.environ.get('HTTPS_PROXY') or os.environ.get('https_proxy') or '');options=[]
if proxy.hostname:
 for scheme in ['http','https']:options+=['-D'+scheme+'.proxyHost='+proxy.hostname,'-D'+scheme+'.proxyPort='+str(proxy.port or 80)]
subprocess.run(['java',*options,'-cp',str(dest)+os.pathsep+cp,'audit.'+args.probe+'Kt',*args.args],check=True)
