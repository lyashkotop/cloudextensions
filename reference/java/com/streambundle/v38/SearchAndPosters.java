package com.streambundle.v38;

import com.example.websites.WebVideoParser;
import com.streambundle.v43.QueryWords;
import java.net.URI;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public final class SearchAndPosters {
    private static final Pattern CYRILLIC = Pattern.compile("\\p{IsCyrillic}");
    private static final Pattern LATIN = Pattern.compile("\\p{IsLatin}");
    private static final Pattern WORDS = Pattern.compile("[\\p{L}\\p{N}]+(?:[ .’'_\\-]+[\\p{L}\\p{N}]+)*");

    private static final Map<String, PosterSupport.Poster> SHOWN = Collections.synchronizedMap(
        new LinkedHashMap<String, PosterSupport.Poster>(64, 0.75f, true) {
            @Override protected boolean removeEldestEntry(Map.Entry<String, PosterSupport.Poster> entry) {
                return size() > 512;
            }
        });

    private SearchAndPosters() {}


    public static String target(Object provider, String query) {
        if (!WORDS.matcher(query.trim()).matches() || query.length() > 120) return "";
        if (CYRILLIC.matcher(query).find()) return "en";
        return LATIN.matcher(query).find() && BundleSettings.isRussianSource(provider) ? "ru" : "";
    }

    public static String local(String query, String language) {
        String value = query.trim().replaceAll("\\s+", " ");
        String translated = QueryWords.local(value, language);
        if (!translated.isEmpty() || !language.equals("en")) return translated;
        return value.matches("(?iu)порк[ауеиой]+|шльопки") ? "spanking" : "";
    }

    public static List<WebVideoParser.Card> ukCards(Document page) {
        String host;
        try {
            host = URI.create(page.baseUri()).getHost();
        } catch (IllegalArgumentException invalid) {
            return null;
        }
        if (!"ukdevilz.com".equalsIgnoreCase(host) && !"www.ukdevilz.com".equalsIgnoreCase(host)) return null;
        Map<String, WebVideoParser.Card> cards = new LinkedHashMap<>();
        for (Element link : page.select("a[href*=/watch/]")) {
            if (cards.size() >= 100) break;
            if (link.closest("nav,header,footer,.related,.recommendations") != null) continue;
            String address = link.absUrl("href");
            if (address.isEmpty()) continue;
            URI target;
            try {
                target = URI.create(address);
            } catch (IllegalArgumentException invalid) {
                continue;
            }
            if (target.getHost() == null || !target.getHost().replaceFirst("(?i)^www\\.", "").equalsIgnoreCase("ukdevilz.com")
                || !target.getPath().startsWith("/watch/")) continue;
            Element image = link.selectFirst("img");
            if (image == null && link.parent() != null) image = link.parent().selectFirst("img");
            String title = link.attr("title").trim();
            if (title.isEmpty()) title = link.attr("aria-label").trim();
            if (title.isEmpty() && image != null) title = image.attr("alt").trim();
            if (title.isEmpty()) title = link.text().trim();
            if (title.isEmpty()) continue;
            String poster = PosterSupport.picture(link, page.baseUri());
            if (poster.isEmpty() && image != null) poster = PosterSupport.picture(image, page.baseUri());
            String key = BundleMetadata.key(address);
            WebVideoParser.Card old = cards.get(key);
            if (old == null || (old.getPoster() == null && !poster.isEmpty()))
                cards.put(key, new WebVideoParser.Card(title, address, poster.isEmpty() ? null : poster));
        }
        return cards.isEmpty() ? null : new ArrayList<>(cards.values());
    }

    public static void reusePoster(Object response) {
        if (response == null) return;
        String type = response.getClass().getSimpleName();
        if (!type.endsWith("LoadResponse") && !type.endsWith("SearchResponse")) return;
        String page = BundleMetadata.string(BundleMetadata.get(response, "Url"));
        if (page.isEmpty()) return;
        String key = BundleMetadata.string(BundleMetadata.get(response, "ApiName")) + "\n" + BundleMetadata.key(page);
        String previous = BundleMetadata.string(BundleMetadata.get(response, "PosterUrl"));
        Map<String, String> headers = BundleMetadata.headers(BundleMetadata.get(response, "PosterHeaders"));
        if (type.endsWith("SearchResponse")) {
            if (PosterSupport.valid(previous)) SHOWN.put(key, new PosterSupport.Poster(previous, page, headers));
            return;
        }
        PosterSupport.Poster shown = SHOWN.get(key);
        if (shown != null) {
            BundleMetadata.set(response, "PosterUrl", String.class, shown.url);
            BundleMetadata.set(response, "BackgroundPosterUrl", String.class, shown.url);
            BundleMetadata.set(response, "PosterHeaders", Map.class, new LinkedHashMap<>(shown.headers));
            return;
        }
        PosterSupport.Poster thumbnail = PosterSupport.listing(page);
        if (thumbnail == null || !PosterSupport.valid(thumbnail.url)) return;
        if (PosterSupport.valid(previous) && !previous.equals(thumbnail.url)
            && !PosterSupport.sameHost(previous, thumbnail.url)) return;
        if (!PosterSupport.sameHost(previous, thumbnail.url)) {
            PosterSupport.removeHeader(headers, "Cookie");
            PosterSupport.removeHeader(headers, "Authorization");
        }
        PosterSupport.removeHeader(headers, "Referer");
        String referer = PosterSupport.referer(thumbnail.page, thumbnail.url);
        if (!referer.isEmpty()) headers.put("Referer", referer);
        BundleMetadata.set(response, "PosterUrl", String.class, thumbnail.url);
        BundleMetadata.set(response, "BackgroundPosterUrl", String.class, thumbnail.url);
        BundleMetadata.set(response, "PosterHeaders", Map.class, headers);
    }
}
