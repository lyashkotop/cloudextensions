package com.streambundle;

import java.util.*;
import java.util.regex.*;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/** Presentation of source metadata. Never fetches media or manufactures missing fields. */
public final class MetadataDisplay {
    private static final Map<String, String> QUALITY = Collections.synchronizedMap(
        new LinkedHashMap<String, String>(64, .75f, true) {
            protected boolean removeEldestEntry(Map.Entry<String, String> e) { return size() > 1536; }
        });
    private static final Pattern HEIGHT = Pattern.compile("(?i)^(?:[0-9]{2,5}x)?(144|240|288|360|480|540|576|720|1080|1440|2160|4320)p?$");
    private MetadataDisplay() {}

    private static Object read(Object object, String field) {
        if (object == null) return null;
        try { return object.getClass().getMethod("get" + field).invoke(object); }
        catch (ReflectiveOperationException | RuntimeException ignored) { return null; }
    }
    private static Object call(String type, String method, String argument) {
        try { return Class.forName(type).getMethod(method, String.class).invoke(null, argument); }
        catch (ReflectiveOperationException | LinkageError | RuntimeException ignored) { return null; }
    }
    private static String key(String url) {
        Object value = call("com.streambundle.v38.BundleMetadata", "key", url);
        return value instanceof String ? (String) value : url == null ? "" : url.replaceFirst("#.*$", "");
    }
    public static String quality(String raw) {
        if (raw == null) return "";
        String value = raw.trim();
        Matcher m = HEIGHT.matcher(value);
        if (m.matches()) return m.group(1) + "p";
        return value.matches("(?i)HD|SD|FHD|UHD|4K|8K") ? value.toUpperCase(Locale.ROOT) : "";
    }
    public static void record(Document doc) {
        if (doc == null) return;
        for (Element element : doc.select("meta[property=video:quality],meta[property=og:video:quality],meta[property=video:height],meta[property=og:video:height],[itemprop=videoQuality],[itemprop=height]")) {
            if (element.closest("aside,nav,header,footer,.related,.recommendations") != null) continue;
            if (element.attr("itemprop").equals("height")) {
                Element scope = element.closest("[itemscope]");
                if (scope == null || !scope.attr("itemtype").contains("VideoObject")) continue;
            }
            String raw = element.hasAttr("content") ? element.attr("content") : element.text();
            String value = quality(raw);
            if (!value.isEmpty()) { QUALITY.put(key(doc.baseUri()), value); return; }
        }
    }
    public static String body(String plot) {
        if (plot == null) return "";
        return plot.replaceFirst("\\A(?:Длительность: [^\\r\\n]*(?:\\r?\\n|$))?(?:Качество: [^\\r\\n]*(?:\\r?\\n|$))?\\s*", "");
    }
    public static String decorate(Object response, String url, String description) {
        String duration = SourceTiming.label(url);
        String q = QUALITY.get(key(url));
        StringBuilder result = new StringBuilder();
        if (!duration.isEmpty()) result.append("Длительность: ").append(duration).append('\n');
        if (q != null && !q.isEmpty()) result.append("Качество: ").append(q).append('\n');
        String text = body(description).trim();
        if (result.length() > 0 && !text.isEmpty()) result.append('\n');
        return result.append(text).toString().trim();
    }
    private static boolean truncated(String value) { return value != null && value.trim().matches("(?s).*(?:…|\\.\\.\\.)$"); }
    public static String preferTitle(String previous, String candidate, boolean authoritative) {
        if (candidate == null || candidate.trim().isEmpty()) return previous;
        if (previous == null || previous.trim().isEmpty() || candidate.equals(previous)) return candidate;
        if (truncated(candidate) && !truncated(previous)) return previous;
        if (truncated(previous) && !truncated(candidate)) return candidate;
        if (truncated(previous) && truncated(candidate) && candidate.length() < previous.length()) return previous;
        return authoritative ? candidate : previous;
    }
    private static Set<String> tokens(Object raw) {
        Set<String> words = new HashSet<>();
        if (raw instanceof Iterable) {
            for (Object item : (Iterable<?>) raw) words.addAll(tokens(item));
        } else if (raw instanceof String) {
            for (String word : ((String) raw).toLowerCase(Locale.ROOT).split("[^\\p{L}\\p{N}]+"))
                if (word.length() >= 3 && !word.matches("video|videos|видео|full|online|watch|free|the|and|with|com")) words.add(word);
        }
        return words;
    }
    public static List<?> recommendations(List<?> source, Object current) {
        if (source == read(current, "Recommendations")) return source; // Source-provided list.
        Set<String> tags = tokens(read(current, "Tags"));
        Set<String> name = tokens(read(current, "Name"));
        List<Object> result = new ArrayList<>();
        for (Object candidate : source) {
            Set<String> other = tokens(read(candidate, "Tags"));
            other.retainAll(tags);
            Set<String> title = tokens(read(candidate, "Name"));
            title.retainAll(name);
            if (!other.isEmpty() || !title.isEmpty()) result.add(candidate);
        }
        return result;
    }
    public static void sanitizeSearch(Object page) {
        if (!(page instanceof Document)) return;
        Document doc = (Document) page;
        if (!Pattern.compile("(?i)(/search|[?&](s|q|k|query|search)=)").matcher(doc.baseUri()).find()) return;
        if (!doc.select(":matchesOwn((?iu)(nothing found|no (?:matching )?(?:results|videos)(?: were)? found|no results|ничего не найдено|ничего не нашлось|результатов не найдено|видео не найдено))").isEmpty()) {
            doc.empty(); return;
        }
        doc.select(".trending,#trending,[id*=trending],[class*=trending],.popular-videos,.recommended,.recommendations,.recommended-videos,#recommended-videos,.related,.related-videos").remove();
    }
}
