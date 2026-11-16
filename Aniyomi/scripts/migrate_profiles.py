#!/usr/bin/env python3
"""Import source selectors and declared routes; never turn section captions into fake tags."""
from pathlib import Path
import re,json
ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'Aniyomi/catalogs/profiles.json'
Q=r'"(?:\\.|[^"\\])*"'
def s(raw):return json.loads(raw)
rows=[]
for category in ['Russian','Japanese','English']:
 for manifest in sorted((ROOT/category).glob('*/plugin.json')):
  m=json.loads(manifest.read_text());name=m['providerClass'].split('.')[-1]
  path=next(p for p in (manifest.parent/'src').rglob('*.kt') if re.search(r'class\s+'+name+r'\s*:',p.read_text()))
  code=path.read_text();origin=re.search(r'(?:origin|mainUrl)\s*=\s*('+Q+')',code)
  data=dict(id=m['id'],name=m['name'],lang=m['language'],origin=s(origin[1]) if origin else '',cards='',link='a[href]',titleSelector='.title,h2,h3',sections=[])
  spec=code[code.index('SiteSpec('):] if 'SiteSpec(' in code else ''
  for key in ['cards','link','titleSelector','tagSelector','descriptionSelector','detailTitleSelector','durationSelector','titleLanguage','searchMode']:
   found=re.search(r'\b'+key+r'\s*=\s*('+Q+')',spec)
   if found:data[key]=s(found[1])
  data['sections']=[{'name':s(a),'path':s(b)} for a,b in re.findall(r'Section\(\s*('+Q+r'),\s*('+Q+')',code)]
  for a,b in re.findall('('+Q+r')\s+to\s+('+Q+')',code):
   a=s(a).replace('${mainUrl}',data['origin']).replace('$mainUrl',data['origin']);b=s(b)
   if a.startswith(('http','/')):data['sections'].append({'name':b,'path':a})
  rows.append(data)
fix={
 'NoodleMagazine':dict(origin='https://tyler-brown.com',cards='#list_videos div.item',titleSelector='.i_info .title',tagSelector='#videoTagsBar a.vtag',titleLanguage='ru',engine='noodle'),
 'UKDevilz':dict(link='a[href]',origin='https://tyler-brown.com',cards='div.item',titleSelector='.i_info .title',tagSelector='#videoTagsBar a.vtag',titleLanguage='en',engine='noodle'),
 'Beeg':dict(cards='span.item',titleSelector='.title',engine='beeg'),
 'MissAV':dict(cards='div.thumbnail.group,div.grid.grid-cols-2 > div',link='a[href*=/en/],a[href*=/dm]',titleSelector='div.my-2 a,div.title a,a.text-secondary',tagSelector='div.text-secondary:contains(genre) a',engine='missav'),
 'JavGuru':dict(cards='div.inside-article',link='.imgg a[href]',titleSelector='h2 a,h3 a',tagSelector='div.infometa a[href*=/genre/],div.infometa a[href*=/tag/]',engine='wordpress'),
 'XRares':dict(cards='div.col-sm-6:has(.video-title)',titleSelector='span.video-title',engine='avideo'),
 'HeavyR':dict(cards='div.video-item',link='h4.title a[href]',titleSelector='h4.title a',tagSelector='div.tags a[title]',descriptionSelector='div.video-data p',engine='heavy'),
 'EPorner':dict(cards='div#vidresults div.mb',link='p.mbtit a[href]',titleSelector='p.mbtit a',tagSelector='#video-info-tags li.vit-category a,#video-info-tags li.vit-tag a',engine='eporner'),
 'BDSMX':dict(cards='.none',engine='bdsmx'),
 'TubeSafari':dict(engine='safari'),
}
for row in rows:
 row.update(fix.get(row['id'],{}));row.setdefault('engine','html')
 row['translate']=row['lang']!='ja' and row['id'] not in ['NoodleMagazine','UKDevilz']
 assert row['origin'].startswith('https://') and row['cards'],row['id']
OUT.write_text(json.dumps(rows,ensure_ascii=False,indent=2)+'\n');print('Imported',len(rows),'active sources')
