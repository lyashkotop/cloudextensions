"""Supplement genuine missing taxonomies; discard navigation/photo-album entries."""
from pathlib import Path
import json,re,concurrent.futures,urllib.parse,requests
from bs4 import BeautifulSoup
ROOT=Path(__file__).resolve().parents[1]
TAX=re.compile(r'/(tags?|categor(?:y|ies)|genres?|cat|c)/([^/?#]+)',re.I)
SERVICE=re.compile(r'^(?:show more|view (?:all|more)|see (?:all|more)|next|previous|показать ещ[её]|all (?:tags|categories)|все (?:теги|категории))\b',re.I)
def one(p):
 f=ROOT/'catalogs'/(p['id']+'.json');c=json.loads(f.read_text());base=p['origin'];host=urllib.parse.urlsplit(base).hostname
 for key in ['tags','categories']:
  c[key]=[x for x in c.get(key,[]) if not SERVICE.search(x['label']) and not re.search(r'/(?:albums?|photos?|members?)/|/(?:categories|tags)/page/',urllib.parse.urlsplit(x['url']).path,re.I)]
 pages=[]
 cached=ROOT/'build/audit-pages'/(p['id']+'.html')
 if cached.exists():pages.append((base+'/',cached.read_text()))
 dirs=[]
 for u,html in pages[:]:
  d=BeautifulSoup(html,'html.parser')
  for a in d.select('a[href]'):
   link=urllib.parse.urljoin(u,a['href']);path=urllib.parse.urlsplit(link).path
   if urllib.parse.urlsplit(link).hostname==host and re.fullmatch(r'/(?:categories|tags|genres)/?',path) and link not in dirs:dirs.append(link)
 # Existing valid tags remain untouched. Refresh only missing catalogues and the first directory page.
 for u in dirs:
  if ('tag' in u and c['tags']) or ('categor' in u and c['categories']):continue
  try:
   r=requests.get(u,headers={'User-Agent':'Mozilla/5.0 Chrome/131.0.0.0','Referer':base+'/'},timeout=10)
   if r.status_code==200:pages.append((r.url,r.text))
  except requests.RequestException:pass
 for u,html in pages:
  for a in BeautifulSoup(html,'html.parser').select('a[href]'):
   link=urllib.parse.urljoin(u,a['href']);v=urllib.parse.urlsplit(link);m=TAX.search(v.path)
   if v.hostname!=host or not m or re.search(r'/(?:albums?|photos?|members?)/|/(?:categories|tags)/page/',v.path,re.I):continue
   label=a.get_text(' ',strip=True) or a.get('title') or (a.select_one('img').get('alt','') if a.select_one('img') else '')
   if not 2<=len(label)<=100 or SERVICE.search(label):continue
   label=re.sub(r'\s+\d[\d,.]*\s*.*\d+%$','',label)
   label=re.sub(r'\s*\(?[\d,]+\)?$','',label).strip()
   key='tags' if 'tag' in m[1] or 'genre' in m[1] else 'categories'
   if not any(x['url'].split('#')[0]==link.split('#')[0] for x in c[key]):c[key].append({'label':label,'url':link})
 f.write_text(json.dumps(c,ensure_ascii=False,indent=2)+'\n')
 print(p['id'],'categories',len(c['categories']),'tags',len(c['tags']),flush=True)
if __name__=='__main__':
 with concurrent.futures.ThreadPoolExecutor(6) as ex:list(ex.map(one,json.loads((ROOT/'catalogs/profiles.json').read_text())))
