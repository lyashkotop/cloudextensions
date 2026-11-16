import com.cloudextensions.russian.*
import com.lagradost.cloudstream3.*
import com.lagradost.cloudstream3.utils.*
import kotlinx.coroutines.runBlocking
import org.json.*
import java.io.File
class Sample:MainAPI(){override suspend fun loadLinks(data:String,isCasting:Boolean,subtitleCallback:(SubtitleFile)->Unit,callback:(ExtractorLink)->Unit):Boolean{for(q in listOf(720,1080))callback(newExtractorLink("source","3. UKDevilz ${q}p ${q}p","https://example.org/$q.mp4",ExtractorLinkType.VIDEO){quality=q;referer="https://example.org/";headers=mapOf("Authorization" to "test-value");extractorData="opaque"});return true}}
@OptIn(kotlin.uuid.ExperimentalUuidApi::class)
fun main(args:Array<String>){runBlocking{
 val links=mutableListOf<ExtractorLink>();check(ReliableProvider(Sample()).loadLinks("data",false,{}, {links+=it}));check(links.size==2);val labels=links.map{(it.name+" "+Qualities.getStringByInt(it.quality)).trim()};check(labels==listOf("720p","1080p"));check(links.all{it.source=="source"&&it.extractorData=="opaque"&&it.headers["Authorization"]=="test-value"&&it.referer=="https://example.org/"})
 val drm=newDrmExtractorLink("drm","3. Provider 720p","https://example.org/drm.mpd",ExtractorLinkType.DASH,java.util.UUID.fromString("edef8ba9-79d6-4ace-a3c8-27dcd51d21ed")){quality=720;kid="kid";key="key";licenseUrl="https://example.org/license";headers=mapOf("X-Test" to "test");extractorData="drm-data"};val copy=QualityLinks.choices(drm).single() as DrmExtractorLink;check(copy.uuid==drm.uuid&&copy.key==drm.key&&copy.kid==drm.kid&&copy.licenseUrl==drm.licenseUrl&&copy.headers==drm.headers&&copy.extractorData==drm.extractorData&&copy.name.isEmpty())
 val hls=newExtractorLink("test","HLS","https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8",ExtractorLinkType.M3U8);val variants=QualityLinks.choices(hls);val qualities=variants.map{it.quality};check(qualities.first()==0);check(qualities.any{it in listOf(720,1080)});check(variants.all{it.name.isEmpty()});val result=JSONObject().put("mp4Labels",JSONArray(labels)).put("preservedStreamFields",true).put("preservedDrm",true).put("realHlsQualities",JSONArray(qualities));File(args.firstOrNull() ?: "quality-link-results.json").writeText(result.toString(2));println("RESULT "+result)
 };kotlin.system.exitProcess(0)}
