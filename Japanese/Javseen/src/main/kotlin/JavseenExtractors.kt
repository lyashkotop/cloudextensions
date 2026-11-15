package com.byayzen
import com.kraptor.ortak.extractor.*
import com.kraptor.*
import com.lagradost.cloudstream3.extractors.EmturbovidExtractor
import com.lagradost.cloudstream3.extractors.FileMoonSx
import com.lagradost.cloudstream3.extractors.StreamTape
import com.lagradost.cloudstream3.extractors.VidStack
import com.lagradost.cloudstream3.extractors.Voe
import com.lagradost.cloudstream3.plugins.CloudstreamPlugin
import com.lagradost.cloudstream3.plugins.Plugin

fun registerJavseenExtractors(plugin: Plugin) {

        Filemoon.DOMAINS.forEach { plugin.registerExtractorAPI(Filemoon(it)) }
        VidHidePro.DOMAINS.forEach { plugin.registerExtractorAPI(VidHidePro(it)) }
        Streamwish.DOMAINS.forEach { plugin.registerExtractorAPI(Streamwish(it)) }
        LULUBASE.DOMAINS.forEach { plugin.registerExtractorAPI(LULUBASE(it)) }
        Player4Me.DOMAINS.forEach { plugin.registerExtractorAPI(Player4Me(it)) }
        DoodStream.DOMAINS.forEach { plugin.registerExtractorAPI(DoodStream(it)) }
        StreamTAPE.DOMAINS.forEach { plugin.registerExtractorAPI(StreamTAPE(it)) }
        Maxstream.DOMAINS.forEach { plugin.registerExtractorAPI(Maxstream(it)) }
        VOE.DOMAINS.forEach { plugin.registerExtractorAPI(VOE(it)) }

        plugin.registerExtractorAPI(CloudWish())
        plugin.registerExtractorAPI(MixDropis())
        plugin.registerExtractorAPI(Javclan())
        plugin.registerExtractorAPI(Javggvideo())
        plugin.registerExtractorAPI(EmturbovidExtractor())
        plugin.registerExtractorAPI(VidNest())
        plugin.registerExtractorAPI(VidStack())
        plugin.registerExtractorAPI(StbP2P())
        plugin.registerExtractorAPI(Playerupnone())
        plugin.registerExtractorAPI(Turtleviplay())
        plugin.registerExtractorAPI(Turboviplay())
        plugin.registerExtractorAPI(Vidguardto())
        plugin.registerExtractorAPI(MixDropAG())
        plugin.registerExtractorAPI(MixDropMy())
        plugin.registerExtractorAPI(Vinovo())
        plugin.registerExtractorAPI(Playmate())
    
}
