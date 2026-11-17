package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import eu.kanade.tachiyomi.animesource.model.AnimeFilter
import eu.kanade.tachiyomi.animesource.model.AnimeFilterList

object Filters {
    class Category(val items:List<Taxon>):AnimeFilter.Select<String>("Категория",(listOf("Все категории")+items.map{it.label}).toTypedArray())
    class Sort(val items:List<Order>):AnimeFilter.Select<String>("Сортировка сайта",(listOf("По умолчанию")+items.map{it.label}).toTypedArray())
    class Match:AnimeFilter.Select<String>("Совпадение тегов",arrayOf("Все выбранные (И)","Любой выбранный (ИЛИ)"))
    class Tag(name:String):AnimeFilter.TriState(name)
    class LazyTags(private val tags:List<Taxon>):AbstractList<Tag>() {
        private val cache=java.util.concurrent.ConcurrentHashMap<Int,Tag>()
        override val size get()=tags.size
        override fun get(index:Int):Tag=cache.getOrPut(index){Tag(tags[index].label)}
        fun selected(state:Int)=cache.values.filter{it.state==state}.map{it.name}
    }
    class Tags(name:String,tags:List<Taxon>):AnimeFilter.Group<Tag>(name,LazyTags(tags))
    class Band(name:String):AnimeFilter.CheckBox(name,true)
    class Length:AnimeFilter.Group<Band>("Длительность",listOf("До 5 минут","5–10 минут","10–20 минут","20–40 минут","Больше 40 минут").map{Band(it)})
    class Include:AnimeFilter.Text("Нужные теги — через запятую")
    class Exclude:AnimeFilter.Text("Исключить теги — через запятую")
    class Min:AnimeFilter.Text("Длительность от, минут")
    class Max:AnimeFilter.Text("Длительность до, минут")
    fun create(profile:Profile):AnimeFilterList {
        val filters=mutableListOf<AnimeFilter<*>>()
        val tags=profile.tags
        if(tags.isNotEmpty())filters+=Tags(if(tags.any{it.count!=null})"Все теги · по числу видео" else "Все теги",tags)
        filters+=Include();filters+=Exclude()
        filters+=Category(profile.categories)
        filters+=Sort(profile.orders)
        filters+=Length();filters+=Match()
        return AnimeFilterList(filters)
    }
    fun selection(filters:AnimeFilterList):Selection {
        fun selected(state:Int)=filters.filterIsInstance<Tags>().flatMap{(it.state as? LazyTags)?.selected(state) ?: it.state.filter{tag->tag.state==state}.map{tag->tag.name}}
        val tags=selected(1)
        val include=filters.filterIsInstance<Include>().firstOrNull()?.state.orEmpty().split(',').map{it.trim()}.filter{it.isNotBlank()}
        val exclude=filters.filterIsInstance<Exclude>().firstOrNull()?.state.orEmpty().split(',').map{it.trim()}.filter{it.isNotBlank()}
        fun seconds(raw:String):Int {if(raw.isBlank())return 0;val n=raw.trim().toIntOrNull();require(n!=null&&n in 0..100000){"Длительность указывается целым числом минут"};return n*60}
        val min=seconds(filters.filterIsInstance<Min>().firstOrNull()?.state.orEmpty());val max=seconds(filters.filterIsInstance<Max>().firstOrNull()?.state.orEmpty())
        require(max==0||min<=max){"Минимальная длительность больше максимальной"}
        val category=filters.filterIsInstance<Category>().firstOrNull()?.let{it.items.getOrNull(it.state-1)}
        val order=filters.filterIsInstance<Sort>().firstOrNull()?.let{it.items.getOrNull(it.state-1)}
        return Selection(category,(tags+include).distinct(),(selected(2)+exclude).distinct(),filters.filterIsInstance<Match>().firstOrNull()?.state==1,order,min,max,filters.filterIsInstance<Length>().firstOrNull()?.state?.mapIndexedNotNull{i,band->i.takeIf{band.state}}?.toSet() ?: setOf(0,1,2,3,4))
    }
}
