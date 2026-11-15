package com.cloudextensions.russian

/** Same category choices as the previous bundle; explicit allowed words take precedence. */
object ContentPolicy {
    @Volatile var enabled = true
    val blockedWords = listOf(
        "пеггинг",
        "пегинг",
        "gay",
        "gays",
        "gaysex",
        "gay sex",
        "homosexual",
        "homosexuals",
        "homosexuality",
        "male on male",
        "man on man",
        "male male",
        "m/m",
        "transgender",
        "transgenders",
        "transsexual",
        "transsexuals",
        "shemale",
        "shemales",
        "ladyboy",
        "ladyboys",
        "lady boy",
        "futanari",
        "femboy",
        "femboys",
        "sissy",
        "sissies",
        "femdom",
        "female domination",
        "dominatrix",
        "pegging",
        "гей",
        "геи",
        "геев",
        "геями",
        "гейский",
        "гейское",
        "гейские",
        "гомосексуал",
        "гомосексуалы",
        "гомосексуальный",
        "гомосексуальное",
        "гомосексуальность",
        "трансгендер",
        "трансгендеры",
        "трансгендерный",
        "транссексуал",
        "транссексуалы",
        "транссексуальный",
        "шимейл",
        "шимейлы",
        "ледибой",
        "ледибои",
        "футанари",
        "фембой",
        "фембои",
        "сисси",
        "фемдом",
        "фем дом",
        "женское доминирование",
        "домина",
        "доминатрикс",
    )
    private val allowed = Regex("(?iu)(?<![\\p{L}\\p{N}])(?:lesbians?|лесби|лесбиян(?:ка|ки|ок|ский|ское|ские)?)(?![\\p{L}\\p{N}])")
    private val blocked = Regex("(?iu)(?<![\\p{L}\\p{N}])(?:" + blockedWords.joinToString("|") { Regex.escape(it).replace(" ", "\\s+") } + ")(?![\\p{L}\\p{N}])")
    fun accepts(title: String, tags: List<String> = emptyList()): Boolean {
        if (!enabled) return true
        val evidence = (listOf(title) + tags).joinToString(" ")
        return allowed.containsMatchIn(evidence) || !blocked.containsMatchIn(evidence)
    }
}
