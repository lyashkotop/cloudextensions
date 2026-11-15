package com.streambundle.v38;

import com.lagradost.cloudstream3.MainAPI;
import com.lagradost.cloudstream3.MainAPIKt;
import com.lagradost.cloudstream3.MovieSearchResponse;
import com.lagradost.cloudstream3.TvType;
import java.util.*;
import kotlin.jvm.functions.Function1;
import com.streambundleextra.VideoMetadata;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public final class DetailMetadata {
    private static final Map<String, Info> VIDEO = cache(256);
    private static final Map<String, Info> LISTING = cache(1536);

    private static final Map<String, Info> BEEG = cache(1024);
    private static final Pattern BEEG_ID = Pattern.compile("(?i)^https?://(?:www\\.)?beeg\\.porn/xid/(\\d+)(?:[/?#]|$)");
    private static final Pattern PROMO = Pattern.compile("(?iu)(?:^|[.!?]\\s+)(?:советуем посмотреть|рекомендуем посмотреть|смотрите (?:у нас|онлайн|бесплатно|на нашем сайте)|смотри (?:у нас|онлайн|бесплатно)|смотреть (?:онлайн|бесплатно)|watch (?:this video|online|for free|free)|(?:most best porn|forget about other porn|beeg porn this is all|free porn tubes))");
    private static final Pattern GENERIC_TAG = Pattern.compile("(?iu)^(?:порно(?: видео| ролики)?|порнуха|(?:full[ -]?)?(?:hd|sd|[48]k)(?: порно)?|[0-9]{3,4}p|(?:free |hd )?porn(?: videos?)?|xxx|all videos|все видео|все категории|categories|категории|tags|теги|главная|home)$");
    private static final Pattern NON_VIDEO_SCOPE = Pattern.compile("(?i)(?:^|[-_\\s])(?:related|recommend(?:ed|ations)?|footer|menu|nav(?:igation)?|sidebar|browse|sitewide|popular|trending)(?:$|[-_\\s])");

    private DetailMetadata() {}

    private static Map<String, Info> cache(int limit) {
        return Collections.synchronizedMap(new LinkedHashMap<String, Info>(64, 0.75f, true) {
            @Override protected boolean removeEldestEntry(Map.Entry<String, Info> entry) {
                return size() > limit;
            }
        });
    }

    public static String listingTitle(String original, String url) {
        String key = BundleMetadata.key(url);
        Info page = VIDEO.get(key);
        Info card = LISTING.get(key);
        if (card != null && !card.title.isEmpty() && !truncated(card.title)) return card.title;
        if (page != null && !page.title.isEmpty()) return better(original, page.title, true);
        return card == null ? original : better(original, card.title, false);
    }

    public static MovieSearchResponse searchCard(MainAPI api, String title, String url, TvType type,
                                                boolean fix, Function1 initializer, int mask, Object marker) {
        String absolute = BundleMetadata.absolute(api.getMainUrl(), url);
        String selected = listingTitle(title, absolute);
        String key = BundleMetadata.key(absolute);
        synchronized (LISTING) {
            Info previous = LISTING.get(key);
            LISTING.put(key, new Info(selected, previous == null ? "" : previous.description,
                previous == null ? Collections.emptySet() : previous.tags));
        }
        return MainAPIKt.newMovieSearchResponse$default(api, selected,
            url, type, fix, initializer, mask, marker);
    }

    private static String better(String previous, String candidate, boolean authoritative) {
        return com.streambundle.MetadataDisplay.preferTitle(previous, candidate, authoritative);
    }

    private static boolean truncated(String value) {
        return value.trim().matches("(?s).*(?:…|\\.\\.\\.)$");
    }

    static boolean readyForOpen(String url, String title) {
        if (truncated(listingTitle(title, url))) return false;
        String key = BundleMetadata.key(url);
        return complete(VIDEO.get(key)) || complete(LISTING.get(key)) || complete(BEEG.get(beegId(url)));
    }

    private static boolean complete(Info info) {
        return info != null && !info.description.isEmpty() && !info.tags.isEmpty();
    }

    public static void collect(Document page) {
        String url = page.baseUri();
        String site = value(page, "meta[property=og:site_name]");
        int count = 0;
        for (Element link : page.select("a[href]")) {
            if (++count > 700) break;
            if (link.closest("nav, header, footer, .navigation") != null) continue;
            Element image = link.selectFirst("img");
            String title = clean(link.attr("title"), url, site);
            for (String candidate : Arrays.asList(link.attr("aria-label"), link.attr("data-title"),
                    image == null ? "" : image.attr("title"), image == null ? "" : image.attr("alt"))) {
                title = better(title, clean(candidate, url, site), false);
            }
            String description = description(link.attr("data-description"), title);
            Set<String> tags = new LinkedHashSet<>();
            addTags(tags, link.attr("data-tags"));
            if (title.isEmpty() && description.isEmpty() && tags.isEmpty()) continue;
            String address = BundleMetadata.absolute(url, link.attr("href"));
            if (address.isEmpty() || BundleMetadata.key(address).equals(BundleMetadata.key(url))) continue;
            synchronized (LISTING) {
                String key = BundleMetadata.key(address);
                Info previous = LISTING.get(key);
                if (previous != null) {
                    title = better(previous.title, title, false);
                    if (description.isEmpty()) description = previous.description;
                    tags.addAll(previous.tags);
                }
                LISTING.put(key, new Info(title, description, tags));
            }
        }

        collectVideo(page, false);
    }

    static void collectVideo(Document page, boolean isDetailPage) {
        String url = page.baseUri();
        String site = value(page, "meta[property=og:site_name]");
        if (page.title().matches("(?is).*(?:site unavailable|access denied|just a moment|error [45][0-9][0-9]).*")) return;
        JSONObject structured = null;
        for (Element script : page.select("script[type=application/ld+json]")) {
            try {
                structured = BundleMetadata.ownVideo(new JSONTokener(script.data()).nextValue(), url, 0, true);
                if (structured != null) break;
            } catch (Exception ignored) {}
        }
        Element scope = null;
        for (Element candidate : page.select("[itemscope][itemtype*=VideoObject]")) {
            if (videoScope(candidate)) { scope = candidate; break; }
        }
        boolean video = isDetailPage || scope != null || structured != null
            || value(page, "meta[property=og:type]").startsWith("video")
            || page.selectFirst("video, #player, .video-player, iframe#video2") != null;
        if (!video) return;
        com.streambundle.MetadataDisplay.record(page);
        com.streambundle.SourceTiming.record(page, structured);

        String title = scope == null ? "" : clean(value(scope, "[itemprop=name]"), url, site);
        if (title.isEmpty() && structured != null) title = clean(structured.optString("name", ""), url, site);
        for (String selector : Arrays.asList("h1.video-page-title, h1[itemprop=name], main h1", "h1", "meta[property=og:title]", "meta[name=twitter:title]", "title")) {
            if (!title.isEmpty() && !truncated(title)) break;
            title = better(title, clean(value(page, selector), url, site), false);
        }

        // Visible per-video labels outrank head keywords, which can be SEO word fragments.
        Set<String> tags = new LinkedHashSet<>();
        String tagSelector = ".video-taxonomy .tax-tags a, .video-taxonomy .tax-feature-tags a, " +
            "main a[rel=tag], article a[rel=tag], a[rel=tag], .video-tags a, .video_tags a, .video-categories a, " +
            "#tab_video_info a[href*=/tag], #tab_video_info a[href*=/categor], .item_info a[href*=/tag/], " +
            ".item_info a[href*=/category/], .video-info a[href*=/tag/], .video-info .tags a, .video-details .tags a, " +
            ".movie-info .tags a, .infometa a[href*=/tag/], .infometa a[href*=/category/], " +
            ".video-info a[href*=/genres/], .movie-info a[href*=/genres/], #video-info a[href*=/genres/], " +
            "#video-tags a, #tags a, .tagsbox a, .video-info .categories a, [itemscope][itemtype*=VideoObject] .categories a, .info .item a[href*=/tags/], .info .item a[href*=/categories/], [itemprop=keywords]:not(meta)";
        boolean tagsDeclared = page.selectFirst(".video-taxonomy, .video-tags, .video_tags, #video-tags, .video-info .tags") != null;
        for (Element tag : page.select(tagSelector)) if (videoScope(tag)) addTags(tags, tag.text());
        if (tags.isEmpty() && !tagsDeclared && structured != null) {
            addTags(tags, structured.opt("keywords")); addTags(tags, structured.opt("genre"));
            tagsDeclared = structured.has("keywords") || structured.has("genre");
        }
        if (tags.isEmpty() && !tagsDeclared) {
            for (Element tag : page.select("meta[property=video:tag],meta[property=og:video:tag]")) {
                String label = tag.attr("content").trim();
                if (!label.matches("[А-Яа-яЁё]{1,2}") && !label.matches("(?iu)(?:и|а|но|для|что|это|как|при|the|and|for|with|from|of|to|in|on|a|an)")) addTags(tags, label);
            }
        }

        Element declared = scope == null ? null : scope.selectFirst("[itemprop=description]");
        boolean descriptionDeclared = declared != null || (structured != null && structured.has("description"));
        String summary = declared == null ? "" : description(elementValue(declared), title);
        if (summary.isEmpty() && structured != null) summary = description(structured.optString("description", ""), title);
        if (summary.isEmpty()) {
            for (Element element : page.select("[itemprop=description]:not(meta), #tab_video_info .description, .video-description, #video-description, .video_description, .video-info .description, .video-details .description, #video_description, .item_info .description")) {
                if (videoScope(element)) { summary = description(elementValue(element), title); if (!summary.isEmpty()) break; }
            }
        }
        if (summary.isEmpty() && !descriptionDeclared) {
            for (Element element : page.select("meta[property=og:description],meta[name=twitter:description],meta[itemprop=description]")) {
                summary = description(element.attr("content"), title); if (!summary.isEmpty()) break;
            }
        }
        VIDEO.put(BundleMetadata.key(url), new Info(title, summary, tags, descriptionDeclared, tagsDeclared));
    }

    private static String elementValue(Element element) {
        return element.hasAttr("content") ? element.attr("content") : element.text();
    }

    /** Keep screening evidence consistent with the per-video fields used by the card. */
    public static void reconcile(Object pageData, String url) {
        Info info = VIDEO.get(BundleMetadata.key(url));
        if (pageData == null || info == null) return;
        try {
            StringBuilder categories = new StringBuilder();
            for (String tag : info.tags) { if (categories.length() > 0) categories.append(' '); categories.append(tag); }
            java.lang.reflect.Field tags = pageData.getClass().getDeclaredField("ownCategories");
            tags.setAccessible(true); tags.set(pageData, categories.toString());
            if (info.descriptionDeclared || !info.description.isEmpty()) {
                java.lang.reflect.Field plot = pageData.getClass().getDeclaredField("description");
                plot.setAccessible(true); plot.set(pageData, info.description);
            }
            if (!info.title.isEmpty()) {
                java.lang.reflect.Field title = pageData.getClass().getDeclaredField("title");
                title.setAccessible(true); title.set(pageData, info.title);
            }
        } catch (ReflectiveOperationException | RuntimeException ignored) {}
    }

    private static boolean videoScope(Element item) {
        for (Element node = item; node != null && !node.tagName().equals("body"); node = node.parent()) {
            if (node.tagName().matches("nav|header|footer|aside") ||
                NON_VIDEO_SCOPE.matcher(node.id() + " " + node.className()).find()) return false;
        }
        return true;
    }

    public static void rememberBeeg(JSONObject item, String url) {
        String id = beegId(url);
        if (id.isEmpty()) return;
        String title = clean(item.optString("title", ""), url, "");
        String description = "";
        Set<String> tags = new LinkedHashSet<>();
        for (String key : Arrays.asList("description", "video_description", "synopsis", "summary", "desc")) {
            Object field = item.opt(key);
            if (!(field instanceof String)) continue;
            description = description((String) field, title);
            if (!description.isEmpty()) break;
        }
        for (String key : Arrays.asList("cats", "categories", "tags", "keywords", "genre")) addTags(tags, item.opt(key));
        synchronized (BEEG) {
            Info previous = BEEG.get(id);
            if (previous != null) {
                title = better(previous.title, title, false);
                if (description.isEmpty()) description = previous.description;
                if (tags.isEmpty()) tags.addAll(previous.tags);
            }
            BEEG.put(id, new Info(title, description, tags));
        }
        com.streambundle.SourceTiming.remember(url, String.valueOf(item.opt("dur")));
        long duration = item.optLong("dur", 0);
        if (duration > 0) VideoMetadata.remember(url, duration);
    }

    private static String beegId(String url) {
        Matcher id = BEEG_ID.matcher(url);
        return id.find() ? id.group(1) : "";
    }

    static String preferredTitle(String current, String page, String listing) {
        return !page.isEmpty() ? better(current, page, true) : better(current, listing, false);
    }

    public static void enrich(Object response) {
        if (response == null || !response.getClass().getSimpleName().endsWith("LoadResponse")) return;
        String url = BundleMetadata.string(BundleMetadata.get(response, "Url"));
        String key = BundleMetadata.key(url);
        Info page = VIDEO.get(key);
        Info card = LISTING.get(key);
        String name = BundleMetadata.string(BundleMetadata.get(response, "Name"));
        try {
            BundleMetadata.set(response, "Name", String.class, listingTitle(name, url));
            Info beeg = BEEG.get(beegId(url));
            Set<String> tags = new LinkedHashSet<>();
            if (beeg != null) tags.addAll(beeg.tags);
            if (page != null) for (String tag : page.tags) addTags(tags, tag);
            if (tags.isEmpty() && card != null && (page == null || !page.tagsDeclared)) for (String tag : card.tags) addTags(tags, tag);
            if (tags.isEmpty() && page == null) {
                Object existing = BundleMetadata.get(response, "Tags");
                if (existing instanceof Iterable) for (Object tag : (Iterable<?>) existing) addTags(tags, tag);
            }
            BundleMetadata.set(response, "Tags", List.class, new ArrayList<>(tags));

            String plot = BundleMetadata.string(BundleMetadata.get(response, "Plot"));
            String summary = page == null ? "" : page.description;
            if (summary.isEmpty() && beeg != null) summary = beeg.description;
            if (summary.isEmpty() && card != null && (page == null || !page.descriptionDeclared)) summary = description(card.description, name);
            if (summary.isEmpty() && (page == null || !page.descriptionDeclared)) summary = description(plot, name);
            summary = com.streambundle.MetadataDisplay.decorate(response, url, summary);
            BundleMetadata.set(response, "Plot", String.class, summary);
        } catch (RuntimeException ignored) {}
    }

    private static String description(String raw, String title) {
        raw = com.streambundle.MetadataDisplay.body(raw);
        if (raw == null || raw.trim().startsWith("{") || raw.trim().startsWith("[")) return "";
        String text = BundleMetadata.text(raw).trim();
        if (text.length() < 10 || text.equalsIgnoreCase(title) || PROMO.matcher(text).find() ||
            text.matches("(?iu)^(?:описание (?:отсутствует|не опубликовано)|no description|duration|quality|tags|длительность|качество|категории|теги)(?:\\b|:).*")) return "";
        if (!title.isEmpty() && text.regionMatches(true, 0, title, 0, title.length())) {
            String tail = text.substring(title.length()).trim();
            if (tail.isEmpty() || tail.matches("(?isu)^[.·—-]*\\s*(?:категории|теги|categories|tags)(?:\\s|:|[-—]).*")) return "";
        }
        return text;
    }





    private static String value(Element root, String selector) {
        Element element = root.selectFirst(selector);
        return element == null ? "" : (element.hasAttr("content") ? element.attr("content") : element.text()).trim();
    }

    private static String clean(String value, String url, String site) {
        return BundleMetadata.title(value, url, site);
    }

    private static void addTags(Set<String> tags, Object value) {
        if (value instanceof JSONArray) {
            JSONArray items = (JSONArray) value;
            for (int i = 0; i < items.length() && tags.size() < 128; i++) addTags(tags, items.opt(i));
        } else if (value instanceof JSONObject) {
            JSONObject object = (JSONObject) value;
            addTags(tags, object.optString("name", object.optString("title", object.optString("label", ""))));
        } else if (value instanceof String) {
            for (String part : ((String) value).split("[,;]")) {
                String tag = BundleMetadata.text(part).trim();
                if (tags.size() < 128 && !tag.isEmpty() && tag.length() <= 70 && !tag.matches("(?i)^(?:null|none|n/a|#?\\d+)$")
                    && !GENERIC_TAG.matcher(tag).matches() && !containsTag(tags, tag)) tags.add(tag);
            }
        }
    }

    private static boolean containsTag(Set<String> tags, String value) {
        for (String tag : tags) if (tag.equalsIgnoreCase(value)) return true;
        return false;
    }

    private static final class Info {
        final String title;
        final String description;
        final Set<String> tags;
        final boolean descriptionDeclared;
        final boolean tagsDeclared;

        Info(String title, String description, Set<String> tags) {
            this(title, description, tags, false, false);
        }
        Info(String title, String description, Set<String> tags, boolean descriptionDeclared, boolean tagsDeclared) {
            this.descriptionDeclared = descriptionDeclared;
            this.tagsDeclared = tagsDeclared;
            this.title = title;
            this.description = description;
            this.tags = tags;
        }
    }
}
