package android.content

import java.io.File

/** Minimal JVM context for loading the real extension entry point in the network audit. */
class Context {
    val applicationContext: Context get() = this
    val cacheDir: File? get() = null
    fun getSharedPreferences(name: String, mode: Int): SharedPreferences? = null
}
