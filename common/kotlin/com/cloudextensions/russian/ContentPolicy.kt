package com.cloudextensions.russian

/** Apply the same category rules to titles and individual tags. */
object ContentPolicy {
    @Volatile var enabled = true
    val blockedWords = listOf("cuckolding","куколдство","куколдинг","куколдский","транс","трансы","cuckold","cuckolds","куколд","куколды","куколда","куколдом","trans",
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
        "anime",
        "animation",
        "hebntai",
        "hentai",
        "ai generated",
        "ai",
        "asmr",
        "асмр",
        "3d",
        "3dporn",
        "3d animated",
        "3danimated",
        "black man",
        "bbc",
        "pregnant",
        "granny",
        "scat",
        "furry",
        "femboy",
        "femboys",
        "sissy",
        "sissies",
        "female domination",
        "dominatrix",
        "pegging",
        "ballbasting",
        "ball basting",
        "ballbusting",
        "ball busting",
        "ballbuster",
        "ballbusters",
        "ball buster",
        "ball busters",
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
        "фем дом",
        "женское доминирование",
        "домина",
        "доминатрикс",
    )
    private val allowed = Regex("(?iu)(?<![\\p{L}\\p{N}])(?:lesbians?|girls|лесби|лесбиян(?:ка|ки|ок|ке|ку|кой|кам|ками|ках|ский|ская|ское|ские)?|девуш(?:ки|ек|кам|ками|ках)|дівчат(?:а|ам|ами|ах)?)(?![\\p{L}\\p{N}])")
    private val blockedPatterns = blockedWords.joinToString("|") { word ->
        word.split(' ').joinToString("[\\s_-]+", transform = Regex::escape)
    }
    private val blocked = Regex("""(?iu)(?<![\p{L}\p{N}])(?:$blockedPatterns)(?![\p{L}\p{N}])""")
    private val blockedTag = Regex("""(?iu)(?<![\p{L}\p{N}])(?:pee|drain|farting|толстушки|urethra|eat[\s_-]+poop|high[\s_-]+heels)(?![\p{L}\p{N}])""")
    private val piercedCock = Regex("""(?iu)(?<![\p{L}\p{N}])pierced[\s_-]+cock(?![\p{L}\p{N}])""")
    private val strictSiteTags = mapOf(
        "BDSMStreak" to setOf("cbt", "femdom", "cbtfemdom"),
        "BDSMX" to setOf("femdom"),
    )
    private val blockedDescription = Regex("""(?iu)(?<![\p{L}\p{N}])hentai(?![\p{L}\p{N}])""")
    fun accepts(title: String, tags: List<String> = emptyList(), description: String? = null, source: String? = null): Boolean {
        if (!enabled) return true
        val sourceTags = strictSiteTags[source].orEmpty()
        if (tags.any { piercedCock.containsMatchIn(it) || Metadata.clean(it).trimStart('#').trim().lowercase() in sourceTags }) {
            return false
        }
        val siteTag = when (source) {
            "EPorner" -> "pornstar"
            "XHamster" -> "Видео HD"
            else -> null
        }
        val fields = listOf(title) + tags
        return fields.any(allowed::containsMatchIn) ||
            (fields.none(blocked::containsMatchIn) && tags.none { blockedTag.containsMatchIn(it) || Metadata.clean(it).equals(siteTag, ignoreCase = true) } &&
                !blockedDescription.containsMatchIn(description.orEmpty()))
    }
}
