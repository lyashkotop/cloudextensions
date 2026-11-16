package com.cloudextensions.russian

/** Public URL obfuscation used by the source's xplayer-mobile.js; this is not media DRM. */
object PlayerUrls {
    private fun hex(value:String):String? {
        if(value.length<12 || value.length%2!=0 || !value.matches(Regex("[0-9a-fA-F]+")))return null
        val bytes=value.chunked(2).map{it.toInt(16)}
        val algorithm=bytes[0]
        if(algorithm !in 1..7)return null
        var state=bytes[1] or (bytes[2] shl 8) or (bytes[3] shl 16) or (bytes[4] shl 24)
        fun next():Int {
            val mixed=when(algorithm) {
                1->{state=state*1664525+0x3c6ef35f;state}
                2->{state=state xor (state shl 13);state=state xor (state ushr 17);state=state xor (state shl 5);state}
                3->{state+=0x9e3779b9.toInt();var n=state xor (state ushr 16);n*=0x85ebca77.toInt();n=n xor (n ushr 13);n*=0xc2b2ae3d.toInt();n xor (n ushr 16)}
                4->{state+=0x6d2b79f5;var n=(state shl 7) or (state ushr 25);n+=0x9e3779b9.toInt();n=n xor (n ushr 11);n*0x27d4eb2d}
                5->{state=state xor (state shl 7);state=state xor (state ushr 9);state=state xor (state shl 8);state+=0xa5a5a5a5.toInt();state}
                6->{state=state*0x2c9277b5+0xac564b05.toInt();(state xor (state ushr 18)) ushr ((state ushr 27) and 31)}
                else->{state+=0x9e3779b9.toInt();var n=state xor (state shl 5);n*=0x7feb352d;n=n xor (n ushr 15);n*0x846ca68b.toInt()}
            }
            return mixed and 255
        }
        val text=String(bytes.drop(5).map{(it xor next()).toByte()}.toByteArray(),Charsets.UTF_8)
        return text.takeIf{it.isNotEmpty() && it.all{c->c in ' '..'~'}}
    }
    fun decode(value:String):String {
        hex(value)?.let{return it}
        val start=value.indexOf('/',value.indexOf("://").takeIf{it>=0}?.plus(3) ?: 0)+1
        if(start<=0 || start>=value.length)return value
        val end=listOf(value.indexOf('/',start),value.indexOf(',',start)).filter{it>=0}.minOrNull() ?: return value
        val token=hex(value.substring(start,end)) ?: return value
        return value.substring(0,start)+token+value.substring(end)
    }
}
