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
 val filters=Filters.create(profiles.first{it.tags.isNotEmpty()});check(filters.filterIsInstance<Filters.Tags>().size==1);val choice=filters.filterIsInstance<Filters.Tags>().first();choice.state.first().state=1;check(Filters.selection(filters).tags.contains(choice.state.first().name));check(Filters.selection(filters).durationBands.size==5)
 choice.state.first().state=0
 val length=filters.filterIsInstance<Filters.Length>().single();length.state.forEach{it.state=false};length.state[0].state=true;length.state[4].state=true;val ranges=Filters.selection(filters);check(ranges.accepts(card,detail));check(!ranges.accepts(card,detail.copy(duration="15:00")));check(ranges.accepts(card,detail.copy(duration="45:00")))
 check(profiles.first{it.id=="SickR"}.categories.none{it.label.contains("%")}){profiles.first{it.id=="SickR"}.categories.filter{it.label.contains("%")}.take(5).toString()};check(profiles.first{it.id=="NoodleMagazine"}.orders.none{it.value=="2"})

 val rawCategory="https://prostoporno.dev/categories/групповое порно/";val normalized=WebUrls.normalize(rawCategory);check(java.net.URI(normalized).host=="prostoporno.dev");check(!normalized.contains(" "));check(WebUrls.normalize(normalized)==normalized);check(WebUrls.normalize("https://example.org/a%2Fb?x=a+b").contains("a%2Fb?x=a+b"))
 for(p in profiles){check(Categories.choices(p.categories).any{it.label=="БДСМ"});p.categories.forEach{java.net.URI(WebUrls.normalize(it.url))}}
 val example=Selection(category=Taxon("БДСМ",""),tags=listOf("мейлдом"),excluded=listOf("гей"),durationBands=setOf(0))
 val matching=detail.copy(tags=listOf("Male domination","Whipping"),duration="04:00");check(example.accepts(card,matching));check(!example.accepts(card,matching.copy(tags=matching.tags+"Gay")));check(!example.accepts(card,matching.copy(duration="06:00")))
 val dark=profiles.first{it.id=="DarknessPorn"}.spec;val cardsDoc=Jsoup.parse("<a class=thumb href='/123-real-video/' title='Real'><img src='/image.jpg'></a><a class=thumb href='https://ads.example/banner' title='Ad'><img src='/ad.jpg'></a><div class=ads><a class=thumb href='/456-promoted/' title='Sponsored'><img src='/ad.jpg'></a></div>","https://darknessporn.com/");check(Metadata.cards(cardsDoc,dark).map{it.title}==listOf("Real"))
 check(ContentPolicy.accepts("guy"));check(ContentPolicy.accepts("gay lesbians"));check(ContentPolicy.accepts("gay trans cuckold femdom"));check(Translation.target("два слова")=="en");check(Translation.target("two words")=="ru");check(!profiles.first{it.id=="NoodleMagazine"}.translate);check(!profiles.first{it.id=="UKDevilz"}.translate)
 val doc=Jsoup.parse("<div id=list_videos_common_videos_list></div><h2>Trending Videos</h2><a class=tumbpu href='/videos/other/' title='Other'><img src='/poster.jpg'></a>","https://thisvid.com/search/?q=zzxq")
 check(Metadata.searchCards(doc,profiles.first{it.id=="ThisVid"}.spec,PageRequest(doc.baseUri())).isEmpty())
 check(Streams.unpack("var data='"+"x".repeat(200000)+"';").length==200012)
 println("PASS: 32-source registry, stable active set, taxonomy uniqueness, AND/OR/exclusion/category/duration, filter UI state, bilingual policy, ThisVid empty search and large script regression")
}
