package com.cloudextensions.russian

import java.net.URLEncoder
import java.util.Collections
import com.lagradost.cloudstream3.app
import kotlinx.coroutines.channels.Channel
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.launch
import okhttp3.Request
import org.json.JSONArray
import android.content.Context
import android.content.SharedPreferences
import kotlinx.coroutines.delay
import java.util.Locale

object Translation {
    @Volatile private var shared:SharedPreferences?=null
    fun configure(context:Context){shared=context.applicationContext.getSharedPreferences("cloudextensions-translations",Context.MODE_PRIVATE)}
    private val dictionary=mapOf("bdsm" to "бдсм","guy" to "парень","woman" to "женщина","girl" to "девушка","man" to "мужчина","mother" to "мать","mom" to "мама","aunt" to "тётя","lesbian" to "лесбиянка","lesbians" to "лесбиянки","spanking" to "порка","two words" to "два слова", "russian slaves" to "русские рабыни")
    private val searchGroups = listOf(
        setOf("домашка", "домашнее", "любительское", "homemade", "amateur", "amateurs"),
        setOf("бдсм", "bdsm"),
        setOf("анал", "анальный секс", "anal", "anal sex"),
        setOf("порка", "spanking", "whipping", "whipped"),
        setOf("связывание", "бондаж", "bondage"),
        setOf("фетиш", "fetish"),
        setOf("лесби", "лесбиянки", "lesbian", "lesbians"),
        setOf("милф", "milf", "milfs"),
        setOf("групповое", "групповой секс", "group sex"),
    )
    private val genreQualifiers = Regex("""(?iu)^(?:порно|видео|porn|videos?) +| +(?:порно|видео|porn|videos?)$""")

    fun searchAliases(query: String): Set<String> {
        val label = Metadata.clean(query.replace('-', ' ').replace('_', ' ')).lowercase(Locale.ROOT)
        val term = genreQualifiers.replace(genreQualifiers.replace(label, ""), "")
        val canonical = when (term) {
            "home made", "real homemade", "русское домашнее", "russian homemade" -> "homemade"
            "анальное", "анальный", "анал секс" -> "анал"
            else -> term
        }
        return searchGroups.firstOrNull { canonical in it }.orEmpty()
    }
    private val cache=Collections.synchronizedMap(BoundedMap<String,String>(256))
    fun target(query: String): String? {
        val normalized=query.trim().replace(Regex("\\s+")," ")
        val words=normalized.split(' ')
        if(words.size !in 1..2 || words.any{!it.matches(Regex("[\\p{L}]+(?:[-'][\\p{L}]+)*"))})return null
        return when {
            Regex("[А-Яа-яЁё]").containsMatchIn(normalized)->"en"
            Regex("[A-Za-z]").containsMatchIn(normalized)->"ru"
            else->null
        }
    }
    fun parse(raw: String,target: String): String? {
        val rows=try { JSONArray(raw).optJSONArray(0) }catch(_:Exception){null} ?: return null
        val result=(0 until rows.length()).mapNotNull { rows.optJSONArray(it)?.optString(0) }.joinToString("").trim()
        return valid(result,target)
    }
    /** Chrome's translation endpoint uses a different response shape from /single. */
    fun parseCompact(raw:String,target:String):String? {
        val rows=try { JSONArray(raw) }catch(_:Exception){return null}
        val result=when(val first=rows.opt(0)) {
            is String->first
            is JSONArray->first.optString(0)
            else->return null
        }
        return valid(result.trim(),target)
    }
    private fun valid(result:String,target:String):String? {
        val valid=if(target=="ru")Regex("[А-Яа-яЁё]").containsMatchIn(result) else Regex("[A-Za-z]").containsMatchIn(result)&&!Regex("[А-Яа-яЁё]").containsMatchIn(result)
        return result.takeIf { it.isNotBlank()&&valid }
    }
    suspend fun translated(query:String):String? {
        val phrase = Metadata.clean(query)
        return text(phrase, target(phrase) ?: return null)
    }
    suspend fun text(query:String,target:String):String? {
        require(target in listOf("ru","en"))
        if(query.isBlank())return null
        val normalized=query.trim().lowercase(Locale.ROOT)
        val known=if(target=="ru")dictionary[normalized] else dictionary.entries.firstOrNull{it.value==normalized}?.key
        if(known!=null)return known
        val source = if (target == "en" && Regex("[а-яё]+(?:[\\s'-]+[а-яё]+)*").matches(normalized)) "ru" else "auto"
        val key="$source:$target:$normalized";cache[key]?.let{return it}
        val prefs=shared
        val digest=java.security.MessageDigest.getInstance("SHA-256").digest(key.toByteArray()).joinToString(""){"%02x".format(it)}
        val started=System.currentTimeMillis()
        if(prefs!=null)while(true) {
            var busy=false
            synchronized(prefs) {
                val cached=prefs.getString(digest,null)
                if(cached!=null && System.currentTimeMillis()-prefs.getLong(digest+".time",0)<86_400_000)return cached
                val stamp=prefs.getLong(digest+".pending",0)
                busy=System.currentTimeMillis()-stamp<11_000
                if(!busy)prefs.edit().putLong(digest+".pending",System.currentTimeMillis()).apply()
            }
            if(!busy)break
            if(System.currentTimeMillis()-started>11_500)break
            delay(50)
        }
        try {
            val encoded=URLEncoder.encode(query,"UTF-8")
            val endpoints=listOf(
                "https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=$source&tl=$target&q=$encoded",
                "https://translate.googleapis.com/translate_a/single?client=gtx&sl=$source&tl=$target&dt=t&q=$encoded",
                "https://translate.google.com/translate_a/single?client=gtx&sl=$source&tl=$target&dt=t&q=$encoded"
            )
            val value = firstTranslation(endpoints, query, target)
            if (value != null) {
                cache[key] = value
                prefs?.edit()?.putString(digest, value)?.putLong(digest + ".time", System.currentTimeMillis())?.apply()
            }
            return value
        } finally { prefs?.edit()?.remove(digest+".pending")?.apply() }
    }
    private suspend fun firstTranslation(endpoints: List<String>, query: String, target: String): String? = coroutineScope {
        val results = Channel<String?>(endpoints.size)
        val workers = endpoints.mapIndexed { index, endpoint ->
            launch {
                if (index > 0) delay(index * 200L)
                val translation = RequestLimits.optional(3000) {
                    val request = Request.Builder().url(endpoint)
                        .header("User-Agent", Network.USER_AGENT)
                        .header("Accept", "application/json").build()
                    val raw = Network.read(request, app.baseClient) { response ->
                        if (response.isSuccessful) response.body?.string() else null
                    } ?: return@optional null
                    if (index == 0) parseCompact(raw, target) else parse(raw, target)
                }
                results.send(translation?.takeUnless { it.equals(query, ignoreCase = true) })
            }
        }
        try {
            repeat(workers.size) { results.receive()?.let { return@coroutineScope it } }
            null
        } finally {
            workers.forEach { it.cancel() }
        }
    }

}
