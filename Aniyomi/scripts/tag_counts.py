"""Refresh only published taxonomy counters; no video or image requests."""
import concurrent.futures,json,re,urllib.parse
from pathlib import Path
import requests
from bs4 import BeautifulSoup
root=Path(__file__).resolve().parents[1]
def one(path):
 j=json.loads(path.read_text());rows=j.get('tags',[])+j.get('categories',[])
 if not rows:return
 def key(url):
  m=re.search(r'/(?:tags?|categories|category|genres?|cat)/([^/]+)',urllib.parse.urlsplit(url).path)
  return m.group(0) if m else url
 wanted={key(r['url']):r for r in rows};found={}
 pages=list(dict.fromkeys(p['url'] for p in j.get('pages',[]) if re.search(r'/(?:tags|categories|genres)(?:/|$)',urllib.parse.urlsplit(p['url']).path)))
 for u in pages:
  try:
   r=requests.get(u,headers={'User-Agent':'Mozilla/5.0'},timeout=5)
   if r.status_code!=200:continue
   s=BeautifulSoup(r.text,'html.parser')
   for a in s.select('a[href]'):
    k=key(urllib.parse.urljoin(u,a['href']))
    if k not in wanted:continue
    node=a.select_one('.count,.quantity,.total');n=None
    if node:
     raw=re.sub(r'[^0-9]','',node.get_text());n=int(raw) if raw else None
    if n is None:
     m=re.search(r'(\d[\d, ]*)\s*(?:Videos?|видео|Filmy)\b',a.get_text(' ',strip=True),re.I)
     if m:n=int(re.sub('[^0-9]','',m[1]))
    if n is not None:found[k]=n
   del s
  except requests.RequestException:continue
 for row in rows:
  if key(row['url']) in found:row['count']=found[key(row['url'])]
 path.write_text(json.dumps(j,ensure_ascii=False,indent=2)+'\n');print(path.stem,len(found),flush=True)
if __name__=='__main__':
 with concurrent.futures.ThreadPoolExecutor(8) as pool:list(pool.map(one,[p for p in (root/'catalogs').glob('*.json') if p.name!='profiles.json']))
