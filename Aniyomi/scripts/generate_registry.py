#!/usr/bin/env python3
from pathlib import Path
import json,gzip,base64
root=Path(__file__).resolve().parents[1]
rows=json.loads((root/'catalogs/profiles.json').read_text())
out=root/'src/main/kotlin/eu/kanade/tachiyomi/animeextension/all/cloudbundle/Registry.kt'
lines=['package eu.kanade.tachiyomi.animeextension.all.cloudbundle','import org.json.JSONObject','import java.util.zip.GZIPInputStream','import java.util.Base64','object Registry {',' private fun profile(data:String,controls:String,taxonomy:String):Profile = Profile(JSONObject(data),JSONObject(controls)){GZIPInputStream(Base64.getDecoder().decode(taxonomy).inputStream()).bufferedReader().use{JSONObject(it.readText())}}',' fun profiles():List<Profile> = listOf(']
for i,row in enumerate(rows):
 path=root/'catalogs'/(row['id']+'.json');catalog=json.loads(path.read_text()) if path.exists() else {'id':row['id']}
 # Runtime payload contains only actual controls/taxonomy, not audit diagnostics.
 catalog={k:v for k,v in catalog.items() if k in ['id','tags','categories','sorts','navigation','directories']}
 if row['engine']=='noodle':catalog={'id':row['id'],'tags':[],'categories':[],'sorts':catalog.get('sorts',[])}
 # Pager links repeat an active sort; they are not sorting controls.
 catalog['sorts']=[s for s in catalog.get('sorts',[]) if not s['label'].strip().isdigit() and s['label'].lower().strip() not in ['вперед','вперёд','далее','next','next page','»','›','назад','previous']]
 controls={k:v for k,v in catalog.items() if k not in ['tags','categories','directories']}
 data=base64.b64encode(gzip.compress(json.dumps({k:v for k,v in catalog.items() if k in ['tags','categories','directories']},ensure_ascii=False,separators=(',',':')).encode(),mtime=0)).decode()
 chunks=[data[n:n+50000] for n in range(0,len(data),50000)]
 expression='listOf('+','.join(json.dumps(c) for c in chunks)+').joinToString("")'
 lines.append('  profile('+json.dumps(json.dumps(row,ensure_ascii=False,separators=(",",":")),ensure_ascii=False)+','+json.dumps(json.dumps(controls,ensure_ascii=False,separators=(",",":")),ensure_ascii=False)+','+expression+')'+(',' if i<len(rows)-1 else ''))
lines+=[' )','}'];out.write_text('\n'.join(lines)+'\n');print('Generated',len(rows),'sources;',out.stat().st_size,'registry bytes')
