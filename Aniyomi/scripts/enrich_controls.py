"""Collect sorting controls from real search pages; do not invent supported values."""
from pathlib import Path
import requests,json,concurrent.futures,urllib.parse,re
from bs4 import BeautifulSoup
ROOT=Path(__file__).resolve().parents[1]
KEYS={'sort','sort_by','order','orderby','o','by'}
def one(p):
 base=p['origin'];headers={'User-Agent':'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36','Referer':base+'/'}
 if p['engine']=='noodle':headers['Cookie']='ui_lang='+p['lang']
 routes={'noodle':'/video/guy','eporner':'/search/guy/','heavy':'/search/guy_1.html','wordpress':'/?s=guy','missav':'/en/search/guy','avideo':'/search/videos?search_query=guy&type=public','safari':'/search/guy'}
 try:
  path=ROOT/'catalogs'/(p['id']+'.json');catalog=json.loads(path.read_text());values={(x['key'],x['value']):x for x in catalog.get('sorts',[]) if x['label'].lower().strip() not in ['вперед','вперёд','назад','next','previous'] and not x['label'].isdigit()}
  if p['engine'] in routes:url=base+routes[p['engine']];r=requests.get(url,headers=headers,timeout=12)
  else:
   root=BeautifulSoup((ROOT/'build/audit-pages'/(p['id']+'.html')).read_text(),'html.parser');form=next((f for f in root.select('form') if f.select_one('input[name=q],input[name=search],input[name=s],input[name=query]')),None)
   if not form:return
   data={e['name']:e.get('value','') for e in form.select('input[name]') if e.get('type') not in ['button','submit']};field=form.select_one('input[name=q],input[name=search],input[name=s],input[name=query]')['name'];data[field]='guy';url=urllib.parse.urljoin(base+'/',form.get('action') or '')
   r=requests.post(url,data=data,headers=headers,timeout=12) if form.get('method','').lower()=='post' else requests.get(url,params=data,headers=headers,timeout=12)
  if r.status_code!=200:return
  soup=BeautifulSoup(r.text,'html.parser')
  for select in soup.select('select[name]'):
   key=select['name']
   if key not in KEYS:continue
   for option in select.select('option[value]'):
    val=option['value'];label=option.get_text(' ',strip=True)
    if val:values[(key,val)]={'key':key,'value':val,'label':label}
  for a in soup.select('a[href]'):
   u=urllib.parse.urlsplit(urllib.parse.urljoin(r.url,a['href']));params=urllib.parse.parse_qs(u.query)
   if u.hostname!=urllib.parse.urlsplit(r.url).hostname:continue
   for key in KEYS.intersection(params):
    value=params[key][0];label=a.get_text(' ',strip=True) or a.get('title')
    if label and len(label)<70:values[(key,value)]={'key':key,'value':value,'label':label}
  catalog['sorts']=list(values.values());catalog['controlsSource']={'url':r.url,'http':r.status_code};path.write_text(json.dumps(catalog,ensure_ascii=False,indent=2)+'\n');print(p['id'],len(values),flush=True)
 except Exception as e:print(p['id'],type(e).__name__,flush=True)
if __name__=='__main__':
 with concurrent.futures.ThreadPoolExecutor(8) as pool:list(pool.map(one,json.loads((ROOT/'catalogs/profiles.json').read_text())))
