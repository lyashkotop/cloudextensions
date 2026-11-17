package eu.kanade.tachiyomi.animeextension.all.cloudbundle

/** Semantic aliases for explicit user filters; never adds options to source taxonomies. */
object Categories {
    private val names=linkedMapOf(
        "БДСМ" to setOf("bdsm","бдсм","bondage","бондаж"),
        "Домашнее" to setOf("homemade","home made","home video","домашнее","любительское","amateur"),
        "Анал" to setOf("anal","анал","анальный секс"),
        "Лесбиянки" to setOf("lesbian","lesbians","лесбиянки","лесби"),
        "Порка" to setOf("spanking","flogging","порка","whipping"),
        "Мужское доминирование" to setOf("maledom","male domination","мейлдом","мужское доминирование"),
        "Женское доминирование" to setOf("femdom","female domination","фемдом","женское доминирование"),
        "Групповой секс" to setOf("group sex","gangbang","групповой секс","групповое порно")
    )
    private fun normal(value:String)=value.trim().lowercase().replace('-', ' ').replace(Regex("\\s+")," ")
    fun aliases(label:String)=names[label] ?: names.values.firstOrNull{normal(label) in it} ?: when(normal(label)) {
        "гей","геи","gay","gays"->setOf("гей","геи","gay","gays","homosexual")
        "транс","trans","transgender"->setOf("транс","trans","transgender","transsexual")
        else->setOf(normal(label))
    }
    fun matchesCategory(label:String,values:Collection<String>):Boolean {
        if(label=="БДСМ")return values.any{v->normal(v) in (aliases(label)+aliases("Порка")+aliases("Мужское доминирование")+aliases("Женское доминирование"))}
        return matches(label,values)
    }
    fun matches(label:String,values:Collection<String>)=values.any{normal(it) in aliases(label)}
}
