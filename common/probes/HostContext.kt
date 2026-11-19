package android.content

/** Minimal JVM context for loading the real extension entry point in the network audit. */
class Context {
    val applicationContext: Context get() = this
    fun getSharedPreferences(name: String, mode: Int): SharedPreferences? = null
}
