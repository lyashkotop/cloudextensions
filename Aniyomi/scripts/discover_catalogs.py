#!/usr/bin/env python3
"""Read real source taxonomy/control pages without requesting or displaying media."""
import argparse,json,re,time,concurrent.futures,urllib.parse
from pathlib import Path
import requests
from bs4 import BeautifulSoup
ROOT=Path(__file__).resolve().parents[1]
UA='Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36'
TAX=re.compile(r'/(tags?|categor(?:y|ies)|genres?|cat|c)/([^/?#]+)',re.I)
INDEX=re.compile(r'/(?:tags|categories|genres|category)(?:/|\.html)?$',re.I)
def crawl(p):
 start=time.monotonic();base=p['origin'];session=requests.Session();headers={'User-Agent':UA,'Referer':base+'/'}
 if p['engine']=='noodle':headers.update({'Cookie':'ui_lang='+p['lang'],'Accept-Language':p['lang']})
 result={'id':p['id'],'tags':[],'categories':[],'sorts':[],'pages':[],'directories':[],'navigation':[],'errors':[]};seen=set();tax={};controls={};queue=[base+('/recent' if p['engine']=='noodle' else '/')];directories=set()
 try:
  while queue:
   url=queue.pop(0)
   if url in seen:continue
   seen.add(url)
   try:
    r=session.get(url,headers=headers,timeout=14);result['pages'].append({'url':r.url,'http':r.status_code})
    if r.status_code!=200:continue
    s=BeautifulSoup(r.text,'html.parser')
    if len(seen)==1:
     cache=ROOT/'build/audit-pages';cache.mkdir(parents=True,exist_ok=True);(cache/(p['id']+'.html')).write_text(r.text)
    for a in s.select('a[href]'):
     link=urllib.parse.urljoin(r.url,a['href']);u=urllib.parse.urlsplit(link)
     if u.hostname!=urllib.parse.urlsplit(r.url).hostname:continue
     label=a.get_text(' ',strip=True) or a.get('title','') or (a.select_one('img').get('alt','') if a.select_one('img') else '');m=TAX.search(u.path)
     if len(seen)==1 and not a.select_one('img') and len(label)<60 and re.search(r'(?i)popular|most.view|trending|latest|recent|new videos|новин|популяр|новые|рейтин',label):result['navigation'].append({'label':label,'url':link})
     if m and 2<=len(label)<=100 and not re.search(r'/(?:albums?|photos?|members?)/|/(?:categories|tags)/page/',u.path,re.I) and not re.match(r'(?i)^(?:show more|view (?:all|more)|see (?:all|more)|next|previous|показать ещ[её])',label):
      kind='tags' if 'tag' in m[1].lower() or 'genre' in m[1].lower() else 'categories';tax[(kind,u.path)]={'label':re.sub(r'\s*\(?[\d,]+\)?$','',label).strip(),'url':link}
     if '/categories' in url:
      special=(p['engine']=='noodle' and u.path.startswith('/video/')) or (p['id']=='Semyana' and u.path=='/search/') or (p['id']=='TubeSafari' and u.path.startswith('/search/')) or (p['id']=='XRares' and u.path.startswith('/search/porn_videos'))
      if special and 2<=len(label)<=80 and not a.select_one('img') and label.lower() not in ['search','поиск']:
       tax[('tags',u.path+'?'+u.query)]={'label':label,'url':link}
     if INDEX.search(u.path) and link not in seen and link not in queue:queue.append(link);directories.add(link)
     if url in directories and (a.get('rel')==['next'] or 'next' in a.get('class',[]) or label.lower() in ['next','next page','следующая','далее','»']):
      if link not in seen and link not in queue:queue.append(link);directories.add(link)
    for e in s.select('[data-parameters]'):
     if e.find_parent(class_=re.compile(r'pagination|pager|load-more')):continue
     params=dict(t.split(':',1) for t in e['data-parameters'].split(';') if ':' in t)
     for k,v in params.items():
      if k in ['sort_by','sort','order','o','orderby'] and v and len(v)<80:
       label=e.get_text(' ',strip=True) or e.get('title') or v
       controls[(k,v)]={'label':label,'key':k,'value':v}
    for select in s.select('select[name]'):
     k=select['name']
     if k in ['sort_by','sort','order','o','orderby']:
      for o in select.select('option[value]'):
       if o['value']:controls[(k,o['value'])]={'label':o.get_text(' ',strip=True),'key':k,'value':o['value']}
   except Exception as e:result['errors'].append({'url':url,'error':type(e).__name__})
   # Avoid traversing listings or arbitrary site links. Follow only declared taxonomy pagination.
   if len(seen)>=300:result['errors'].append({'error':'taxonomy crawl budget reached; refresh continues in later runs'});break
  for (kind,_),value in tax.items():result[kind].append(value)
  for k in ['tags','categories']:result[k]=sorted(result[k],key=lambda e:e['label'].casefold())
  result['sorts']=list(controls.values());result['directories']=sorted(directories)
 except Exception as e:result['errors'].append({'error':str(type(e).__name__)})
 result['seconds']=round(time.monotonic()-start,2)
 (ROOT/'catalogs'/(p['id']+'.json')).write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
 print(p['id'],'pages',len(result['pages']),'http',result['pages'][0]['http'] if result['pages'] else '-','tags',len(result['tags']),'categories',len(result['categories']),'sorts',len(result['sorts']),flush=True)
 return result
if __name__=='__main__':
 parser=argparse.ArgumentParser();parser.add_argument('--source',action='append');args=parser.parse_args()
 profiles=json.loads((ROOT/'catalogs/profiles.json').read_text());profiles=[p for p in profiles if not args.source or p['id'] in args.source]
 with concurrent.futures.ThreadPoolExecutor(8) as ex:results=list(ex.map(crawl,profiles))
 (ROOT/'build').mkdir(exist_ok=True);(ROOT/'build/catalog-audit.json').write_text(json.dumps(results,ensure_ascii=False,indent=2))
