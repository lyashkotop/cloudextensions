package com.cloudextensions.russian

/** Aniyomi has no automatic content stop-list. Only explicit user filters apply. */
object ContentPolicy {
    @Suppress("UNUSED_PARAMETER")
    fun accepts(title:String,tags:List<String> = emptyList())=true
}
