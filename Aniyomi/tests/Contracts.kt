package audit
import com.cloudextensions.russian.*
import eu.kanade.tachiyomi.animeextension.all.cloudbundle.*
import org.jsoup.Jsoup
fun main(){kotlinx.coroutines.runBlocking{
 Metadata.scoped("ru-test"){check(Metadata.title("https://same.test/video/1",listOf("Полное русское название"))=="Полное русское название")}
 Metadata.scoped("en-test"){check(Metadata.title("https://same.test/video/1",listOf("English title"))=="English title")}
 Metadata.scoped("ru-test"){check(Metadata.title("https://same.test/video/1",emptyList())=="Полное русское название")}
}

 val profiles=Registry.profiles();check(profiles.size==32);check(profiles.map{it.id}.distinct().size==32);check(profiles.none{it.id in listOf("XVideos","Epawg","YouJizz","PunishBang")})
 for(p in profiles){check(p.base.startsWith("https://"));check(p.spec.cards.isNotBlank());check(p.lang in listOf("ru","ja","en"));check(p.tags.map{it.label.lowercase()}.distinct().size==p.tags.size)}
 val card=VideoCard("Full source title","https://example.test/video/1",null,"03:00")
 val detail=VideoDetail(card.title,null,"",listOf("One","Two","Category"),"03:00",null)
 check(Selection(tags=listOf("One","Two"),category=Taxon("Category","https://example.test/category"),minSeconds=120,maxSeconds=240).accepts(card,detail))
 check(!Selection(tags=listOf("One","Missing")).accepts(card,detail));check(Selection(tags=listOf("One","Missing"),anyTag=true).accepts(card,detail));check(!Selection(excluded=listOf("Two")).accepts(card,detail));check(!Selection(minSeconds=181).accepts(card,detail));check(!Selection(maxSeconds=179).accepts(card,detail));check(!Selection(tags=listOf("One")).accepts(card,null))
 val filters=Filters.create(profiles.first{it.tags.isNotEmpty()});check(filters.isNotEmpty());val group=filters.filterIsInstance<Filters.Tags>().first();group.state.first().state=1;check(Filters.selection(filters).tags.contains(group.state.first().name));group.state.first().state=2;check(Filters.selection(filters).excluded.contains(group.state.first().name))
 check(ContentPolicy.accepts("guy"));check(ContentPolicy.accepts("gay lesbians"));check(!ContentPolicy.accepts("gay"));check(Translation.target("два слова")=="en");check(Translation.target("two words")=="ru");check(!profiles.first{it.id=="NoodleMagazine"}.translate);check(!profiles.first{it.id=="UKDevilz"}.translate)
 val doc=Jsoup.parse("<div id=list_videos_common_videos_list></div><h2>Trending Videos</h2><a class=tumbpu href='/videos/other/' title='Other'><img src='/poster.jpg'></a>","https://thisvid.com/search/?q=zzxq")
 check(Metadata.searchCards(doc,profiles.first{it.id=="ThisVid"}.spec,PageRequest(doc.baseUri())).isEmpty())
 check(Streams.unpack("var data='"+"x".repeat(200000)+"';").length==200012)
 println("PASS: 32-source registry, stable active set, taxonomy uniqueness, AND/OR/exclusion/category/duration, filter UI state, bilingual policy, ThisVid empty search and large script regression")
}
