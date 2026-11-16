package com.cloudextensions.russian

import java.net.URLEncoder
import java.util.Collections
import kotlinx.coroutines.CancellationException
import org.json.JSONArray
import android.content.Context
import android.content.SharedPreferences
import kotlinx.coroutines.delay
import kotlinx.coroutines.withContext
import kotlin.coroutines.AbstractCoroutineContextElement
import kotlin.coroutines.CoroutineContext
import kotlin.coroutines.coroutineContext
import java.util.Locale

object Translation {
    @Volatile private var shared:SharedPreferences?=null
    fun configure(context:Context){shared=context.applicationContext.getSharedPreferences("cloudextensions-translations",Context.MODE_PRIVATE)}
    private class SourceOnly:AbstractCoroutineContextElement(Key){companion object Key:CoroutineContext.Key<SourceOnly>}
    suspend fun <T> originalOnly(block:suspend ()->T):T=withContext(SourceOnly()){block()}
    private val dictionary=mapOf("guy" to "парень","woman" to "женщина","girl" to "девушка","man" to "мужчина","mother" to "мать","mom" to "мама","aunt" to "тётя","lesbian" to "лесбиянка","lesbians" to "лесбиянки","two words" to "два слова")
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
        val valid=if(target=="ru")Regex("[А-Яа-яЁё]").containsMatchIn(result) else Regex("[A-Za-z]").containsMatchIn(result)&&!Regex("[А-Яа-яЁё]").containsMatchIn(result)
        return result.takeIf { it.isNotBlank()&&valid }
    }
    suspend fun translated(query:String):String? {
        if(coroutineContext[SourceOnly]!=null)return null
        val target=target(query)?:return null
        val normalized=query.trim().lowercase(Locale.ROOT)
        val known=if(target=="ru")dictionary[normalized] else dictionary.entries.firstOrNull{it.value==normalized}?.key
        if(known!=null)return known
        val key="$target:$normalized";cache[key]?.let{return it}
        val prefs=shared
        val digest=java.security.MessageDigest.getInstance("SHA-256").digest(key.toByteArray()).joinToString(""){"%02x".format(it)}
        val started=System.currentTimeMillis()
        if(prefs!=null)while(true) {
            var busy=false
            synchronized(prefs) {
                val cached=prefs.getString(digest,null)
                if(cached!=null && System.currentTimeMillis()-prefs.getLong(digest+".time",0)<86_400_000)return cached
                val stamp=prefs.getLong(digest+".pending",0)
                busy=System.currentTimeMillis()-stamp<8000
                if(!busy)prefs.edit().putLong(digest+".pending",System.currentTimeMillis()).apply()
            }
            if(!busy)break
            if(System.currentTimeMillis()-started>8500)break
            delay(50)
        }
        try {
            for(host in listOf("translate.googleapis.com","translate.google.com")) {
                val url="https://$host/translate_a/single?client=gtx&sl=auto&tl=$target&dt=t&q="+URLEncoder.encode(query,"UTF-8")
                val value=RequestLimits.optional(3000){parse(Network.page(PageRequest(url),"https://translate.google.com/").wholeText(),target)}?.takeUnless{it.equals(query,true)}
                if(value!=null){cache[key]=value;prefs?.edit()?.putString(digest,value)?.putLong(digest+".time",System.currentTimeMillis())?.apply();return value}
            }
            return null
        } finally { prefs?.edit()?.remove(digest+".pending")?.apply() }
    }
}
