package com.cloudextensions.russian

import java.net.URLEncoder
import java.util.Collections
import kotlinx.coroutines.CancellationException
import org.json.JSONArray

object Translation {
    private val cache=Collections.synchronizedMap(BoundedMap<String,String>(256))
    fun target(query: String): String? {
        val normalized=query.trim().replace(Regex("\\s+")," ")
        return when {
            normalized.matches(Regex("[А-Яа-яЁё]+(?:[-'][А-Яа-яЁё]+)*(?: [А-Яа-яЁё]+(?:[-'][А-Яа-яЁё]+)*)?"))->"en"
            normalized.matches(Regex("[A-Za-z]+(?:[-'][A-Za-z]+)*(?: [A-Za-z]+(?:[-'][A-Za-z]+)*)?"))->"ru"
            else->null
        }
    }
    fun parse(raw: String,target: String): String? {
        val rows=try { JSONArray(raw).optJSONArray(0) }catch(_:Exception){null} ?: return null
        val result=(0 until rows.length()).mapNotNull { rows.optJSONArray(it)?.optString(0) }.joinToString("").trim()
        val valid=if(target=="ru")Regex("[А-Яа-яЁё]").containsMatchIn(result) else Regex("[A-Za-z]").containsMatchIn(result)&&!Regex("[А-Яа-яЁё]").containsMatchIn(result)
        return result.takeIf { it.isNotBlank()&&valid }
    }
    suspend fun translated(query: String): String? {
        val target=target(query) ?: return null
        val key="$target:$query";cache[key]?.let { return it.takeIf(String::isNotBlank) }
        val url="https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$target&dt=t&q="+URLEncoder.encode(query,"UTF-8")
        val result=try { parse(Network.page(PageRequest(url),"https://translate.google.com/").wholeText(),target) }catch(e:CancellationException){throw e}catch(_:Exception){null}
        val value=result?.takeUnless { it.equals(query,true) }
        if(value!=null)cache[key]=value
        return value
    }
}
