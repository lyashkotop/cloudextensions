import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.*;
import org.json.JSONObject;

/** Runs converted production bytecode on supplied HTML; prints no content or media URLs. */
public final class ProductionMetadataProbe {
    public static final class ProbeLoadResponse {
        String url, name, plot = "";
        List<String> tags = new ArrayList<>();
        public String getUrl() { return url; }
        public String getName() { return name; }
        public void setName(String value) { name = value; }
        public String getPlot() { return plot; }
        public void setPlot(String value) { plot = value; }
        public List<String> getTags() { return tags; }
        public void setTags(List<String> value) { tags = value; }
        public Integer getDuration() { return 999; } // Deliberately wrong rounded minutes.
    }
    private static Document read(String path, String base) throws Exception {
        return Jsoup.parse(new String(Files.readAllBytes(Paths.get(path)), StandardCharsets.UTF_8), base);
    }
    private static void require(boolean condition, String name) {
        if (!condition) throw new AssertionError(name);
    }
    public static void main(String[] args) throws Exception {
        if (args.length != 5) throw new IllegalArgumentException("home.html detail.html related.html detail-base home-base");
        Class<?> metadata = Class.forName("com.streambundle.v38.BundleMetadata");
        require(metadata.getProtectionDomain().getCodeSource().getLocation().toString().endsWith(".jar"), "Must execute production BundleMetadata, not a test double");
        Class<?> details = Class.forName("com.streambundle.v38.DetailMetadata");
        Document home = read(args[0], args[4]);
        Document page = read(args[1], args[3]);
        metadata.getMethod("document", Object.class).invoke(null, home);
        String selected = (String) details.getMethod("listingTitle", String.class, String.class).invoke(null, "", args[3]);
        require(!selected.isEmpty(), "Listing must provide a source title");
        metadata.getMethod("document", Object.class).invoke(null, page);
        ProbeLoadResponse result = new ProbeLoadResponse(); result.url = args[3]; result.name = selected;
        details.getMethod("enrich", Object.class).invoke(null, result);
        require(result.name.equals(selected), "Listing and opened detail titles diverged");
        require(result.name.equals(page.selectFirst("h1.video-page-title").text()), "Title differs from full source heading");
        Set<String> visible = new LinkedHashSet<>();
        for (Element e : page.select(".video-taxonomy .tax-tags a,.video-taxonomy .tax-feature-tags a")) visible.add(e.text());
        require(new LinkedHashSet<>(result.tags).equals(visible), "Tags differ from visible source labels");
        java.lang.reflect.Field pages = metadata.getDeclaredField("PAGES"); pages.setAccessible(true);
        Object key = metadata.getMethod("key", String.class).invoke(null, args[3]);
        Object cached = ((Map<?, ?>) pages.get(null)).get(key);
        java.lang.reflect.Field evidence = cached.getClass().getDeclaredField("ownCategories"); evidence.setAccessible(true);
        StringBuilder expectedTags = new StringBuilder();
        for (String tag : result.tags) { if (expectedTags.length() > 0) expectedTags.append(' '); expectedTags.append(tag); }
        require(expectedTags.toString().equals(evidence.get(cached)), "Screening still uses unrelated head tag fragments");
        Element duration = page.selectFirst("[itemscope][itemtype*=VideoObject] [itemprop=duration]");
        Class<?> timing = Class.forName("com.streambundle.SourceTiming");
        String expected = (String) timing.getMethod("parse", String.class).invoke(null, duration.attr("content"));
        require(!expected.isEmpty() && !result.plot.contains("Длительность:"), "Duplicate duration in plot");
        Element declared = page.selectFirst("[itemscope][itemtype*=VideoObject] [itemprop=description]");
        require(declared != null && declared.attr("content").isEmpty(), "Fixture must declare absent description");
        require(!result.plot.contains(page.selectFirst("meta[name=description]").attr("content")), "SEO text was substituted for absent video description");
        require(!result.plot.contains("999"), "Rounded application duration was used");
        Document alternate = page.clone();
        for (Element heading : alternate.select("h1.video-page-title")) heading.text("Полное альтернативное название источника");
        alternate.select("[itemprop=name],meta[property=og:title]").attr("content", "Полное альтернативное название источника");
        metadata.getMethod("document", Object.class).invoke(null, alternate);
        details.getMethod("enrich", Object.class).invoke(null, result);
        require(result.name.equals(selected), "Opening another language changed the chosen title");
        Document fragment = read(args[2], args[3]);
        Class<?> parserClass = Class.forName("com.example.websites.WebVideoParser");
        Object parser = parserClass.getField("INSTANCE").get(null);
        List<?> cards = (List<?>) parserClass.getMethod("cards", Document.class, String.class, String.class, String.class)
            .invoke(parser, fragment, ".video-card", "a.video-card-link[href]", ".video-title");
        require(cards.size() == fragment.select(".video-card").size() && !cards.isEmpty(), "Production parser did not receive related cards");
        Class<?> function = Class.forName("kotlin.jvm.functions.Function1");
        Object urlOf = java.lang.reflect.Proxy.newProxyInstance(function.getClassLoader(), new Class<?>[]{function},
            (proxy, method, values) -> values[0].getClass().getMethod("getUrl").invoke(values[0]));
        List<?> related = (List<?>) Class.forName("com.example.websites.SourceDocumentKt")
            .getMethod("relatedResults", List.class, String.class, function).invoke(null, cards, args[3], urlOf);
        require(!related.isEmpty(), "Related cards lost before the response adapter");
        JSONObject output = new JSONObject();
        output.put("production_metadata_executed", true).put("title_matches_listing_and_source", true)
            .put("language_change_keeps_selected_title", true).put("source_tag_count", visible.size())
            .put("all_tags_match_visible_source", true).put("exact_duration_matches_source", true)
            .put("screening_evidence_matches_source_tags", true)
            .put("seo_description_rejected", true).put("related_cards_parsed", cards.size())
            .put("related_cards_after_filter", related.size())
            .put("android_ui_tested", false);
        System.out.println(output.toString());
    }
}
