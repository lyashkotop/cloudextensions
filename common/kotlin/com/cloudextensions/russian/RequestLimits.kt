package com.cloudextensions.russian

import com.lagradost.cloudstream3.ErrorLoadingException
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.TimeoutCancellationException
import kotlinx.coroutines.withTimeout
import kotlinx.coroutines.withTimeoutOrNull

object RequestLimits {
    suspend fun <T> required(label:String,milliseconds:Long=22_000,block:suspend ()->T):T = try {
        withTimeout(milliseconds){block()}
    }catch(e:TimeoutCancellationException){throw ErrorLoadingException("$label: источник не ответил вовремя. Повтори запрос.")}
    suspend fun <T> optional(milliseconds:Long=2500,block:suspend ()->T):T? = try {
        withTimeoutOrNull(milliseconds){block()}
    }catch(e:CancellationException){throw e}catch(_:Exception){null}
}
