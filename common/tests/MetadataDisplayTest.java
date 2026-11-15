import com.streambundle.MetadataDisplay;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public final class MetadataDisplayTest {
    private static int checks;
    private static void check(boolean ok, String name) {
        checks++;
        if (!ok) throw new AssertionError(name);
    }
    public static final class Response {
        private String name;
        private List<String> tags;
        private List<?> recommendations;
        public Response(String name, String... tags) { this.name = name; this.tags = Arrays.asList(tags); }
        public String getName() { return name; }
        public List<String> getTags() { return tags; }
        public List<?> getRecommendations() { return recommendations; }
        public Integer getDuration() { return 7; }
    }
    public static void main(String[] args) {
        String url = "https://example.test/video/1";
        Document source = Jsoup.parse("<meta property='og:video:height' content='1080'>", url);
        MetadataDisplay.record(source);
        Response current = new Response("Coastal walking tour", "coast");
        String description = "A complete description supplied by the source.";
        com.streambundle.SourceTiming.remember(url, "205.5");
        String plot = MetadataDisplay.decorate(current, url, description);
        check(plot.startsWith("Длительность: 03:25.5\nКачество: 1080p\n\n"), "duration and source quality first");
        check(plot.endsWith(description), "source description retained");
        check(MetadataDisplay.decorate(current, url, plot).equals(plot), "repeated enrichment is idempotent");
        check(MetadataDisplay.body("Длительность: 03:20\n\n" + description).equals(description), "legacy duration prefix retains source description");
        String unknown = MetadataDisplay.decorate(new Object(), "https://example.test/unknown", "");
        check(unknown.isEmpty(), "unknown duration and quality omitted");
        check(!MetadataDisplay.decorate(current, "https://example.test/no-exact-time", description).contains("Длительность:"), "rounded app minutes never presented as exact time");
        check(MetadataDisplay.quality("1920x1080").equals("1080p"), "explicit source dimensions");
        check(MetadataDisplay.quality("HD").equals("HD"), "HD not invented as 720p");
        check(MetadataDisplay.quality("unknown").isEmpty(), "unknown quality rejected");
        String imgUrl = "https://example.test/image-height";
        MetadataDisplay.record(Jsoup.parse("<div itemscope itemtype='https://schema.org/ImageObject'><meta itemprop='height' content='720'></div><video height='1080'></video>", imgUrl));
        check(MetadataDisplay.decorate(current, imgUrl, description).equals(description), "poster and display dimensions do not become video quality");
        String longTitle = String.join(" ", Collections.nCopies(150, "complete"));
        check(MetadataDisplay.preferTitle("Abbreviated…", longTitle, false).equals(longTitle), "complete source title replaces abbreviation without clipping");
        check(MetadataDisplay.preferTitle(longTitle, "short…", true).equals(longTitle), "truncated candidate cannot replace full title");
        check(MetadataDisplay.preferTitle("Longer truncated title…", "Short…", true).equals("Longer truncated title…"), "no degradation between truncated titles");
        Response similar = new Response("Forest journey", "coast");
        Response nameMatch = new Response("Walking tour in town");
        Response unrelated = new Response("Mountain astronomy", "space");
        List<Response> pool = Arrays.asList(similar, nameMatch, unrelated);
        List<?> fallback = MetadataDisplay.recommendations(pool, current);
        check(fallback.size() == 2 && !fallback.contains(unrelated), "fallback needs tag or title overlap");
        current.recommendations = Arrays.asList(unrelated);
        check(MetadataDisplay.recommendations(current.recommendations, current) == current.recommendations, "source recommendations are retained");
        Document empty = Jsoup.parse("<h1>No results found</h1><div class='trending'><a href='/video/1'>Popular item</a></div>", "https://example.test/search?q=absent");
        MetadataDisplay.sanitizeSearch(empty);
        check(empty.select("a[href]").isEmpty(), "explicit empty search cannot return trending links");
        Document search = Jsoup.parse("<main><a href='/video/1'>Match</a></main><section class='trending'><a href='/video/2'>Popular</a></section>", "https://example.test/search?q=walk");
        MetadataDisplay.sanitizeSearch(search);
        check(search.select("a[href]").size() == 1 && search.select("main a").size() == 1, "search recommendations removed while results remain");
        Document home = Jsoup.parse("<section class='trending'><a>Home content</a></section>", "https://example.test/");
        MetadataDisplay.sanitizeSearch(home);
        check(home.select(".trending").size() == 1, "home page preserved");
        System.out.println("PASS " + checks + " checks of actual MetadataDisplay code; no Cloudstream runtime claims.");
    }
}
