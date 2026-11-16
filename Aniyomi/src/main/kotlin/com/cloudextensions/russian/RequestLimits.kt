package com.cloudextensions.russian

import java.io.IOException
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.TimeoutCancellationException
import kotlinx.coroutines.withTimeout
import kotlinx.coroutines.withTimeoutOrNull

object RequestLimits {
    suspend fun <T> required(label:String,milliseconds:Long=22_000,block:suspend ()->T):T = try {
        withTimeout(milliseconds){block()}
    }catch(e:TimeoutCancellationException){throw IOException("$label: источник не ответил вовремя. Повтори запрос.")}
    catch(e:LinkageError){throw IOException("$label: несовместимая версия библиотек. Обнови CloudStream.")}
    suspend fun <T> optional(milliseconds:Long=2500,block:suspend ()->T):T? = try {
        withTimeoutOrNull(milliseconds){block()}
    }catch(e:CancellationException){throw e}catch(_:Exception){null}
}
