package eu.kanade.tachiyomi.animeextension.all.cloudbundle

import eu.kanade.tachiyomi.animesource.model.AnimeFilter
import eu.kanade.tachiyomi.animesource.model.AnimeFilterList

object Filters {
    class Category(val items:List<Taxon>):AnimeFilter.Select<String>("Категория",(listOf("Все категории")+items.map{it.label}).toTypedArray())
    class Sort(val items:List<Order>):AnimeFilter.Select<String>("Сортировка сайта",(listOf("По умолчанию")+items.map{it.label}).toTypedArray())
    class Match:AnimeFilter.Select<String>("Совпадение тегов",arrayOf("Все выбранные (И)","Любой выбранный (ИЛИ)"))
    class Tag(name:String):AnimeFilter.TriState(name)
    class Tags(name:String,tags:List<Taxon>):AnimeFilter.Group<Tag>(name,tags.map{Tag(it.label)})
    class Include:AnimeFilter.Text("Дополнительные теги через запятую")
    class Exclude:AnimeFilter.Text("Исключить теги через запятую")
    class Min:AnimeFilter.Text("Длительность от, минут")
    class Max:AnimeFilter.Text("Длительность до, минут")
    fun create(profile:Profile):AnimeFilterList {
        val filters=mutableListOf<AnimeFilter<*>>(AnimeFilter.Header("Поиск + категория + теги применяются вместе"))
        if(profile.orders.isNotEmpty())filters+=Sort(profile.orders)
        if(profile.categories.isNotEmpty())filters+=Category(profile.categories)
        filters+=Min();filters+=Max();filters+=Match();filters+=Include();filters+=Exclude()
        if(profile.tags.isNotEmpty()) {
            filters+=AnimeFilter.Header("Теги сайта и полученных карточек: включить / исключить.")
            // Small collapsible groups keep even large source dictionaries navigable.
            for((letter,items)in profile.tags.groupBy{it.label.firstOrNull()?.uppercaseChar()?.toString() ?: "#"}.toSortedMap()) {
                val chunks=items.chunked(150)
                chunks.forEachIndexed{i,chunk->filters+=Tags("Теги $letter"+if(chunks.size>1)" · ${i+1}/${chunks.size}" else "",chunk)}
            }
        }else filters+=AnimeFilter.Header("Метки появятся после загрузки карточек. Можно ввести точные теги выше.")
        return AnimeFilterList(filters)
    }
    fun selection(filters:AnimeFilterList):Selection {
        val tags=filters.filterIsInstance<Tags>().flatMap{it.state}
        val include=filters.filterIsInstance<Include>().firstOrNull()?.state.orEmpty().split(',').map{it.trim()}.filter{it.isNotBlank()}
        val exclude=filters.filterIsInstance<Exclude>().firstOrNull()?.state.orEmpty().split(',').map{it.trim()}.filter{it.isNotBlank()}
        fun seconds(raw:String):Int {if(raw.isBlank())return 0;val n=raw.trim().toIntOrNull();require(n!=null&&n in 0..100000){"Длительность указывается целым числом минут"};return n*60}
        val min=seconds(filters.filterIsInstance<Min>().firstOrNull()?.state.orEmpty());val max=seconds(filters.filterIsInstance<Max>().firstOrNull()?.state.orEmpty())
        require(max==0||min<=max){"Минимальная длительность больше максимальной"}
        val category=filters.filterIsInstance<Category>().firstOrNull()?.let{it.items.getOrNull(it.state-1)}
        val order=filters.filterIsInstance<Sort>().firstOrNull()?.let{it.items.getOrNull(it.state-1)}
        return Selection(category,(tags.filter{it.isIncluded()}.map{it.name}+include).distinct(),(tags.filter{it.isExcluded()}.map{it.name}+exclude).distinct(),filters.filterIsInstance<Match>().firstOrNull()?.state==1,order,min,max)
    }
}
