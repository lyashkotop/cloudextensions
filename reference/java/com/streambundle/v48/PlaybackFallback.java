package com.streambundle.v48;

import com.lagradost.cloudstream3.utils.ExtractorLink;
import com.lagradost.cloudstream3.utils.ExtractorLinkType;
import com.streambundle.Unified;
import com.streambundle.v38.TubeSources;
import com.streambundleextra.MediaFix;
import com.videobundle.fixes.SiteFix;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.*;
import java.util.concurrent.TimeUnit;
import kotlin.jvm.functions.Function1;
import kotlin.Unit;
import okhttp3.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

final class PlaybackFallback {
    private static final int BODY_LIMIT = 1536 * 1024;
    private static final int MAX_VISITS = 16;
    private static final int MAX_LINKS = 6;

    private PlaybackFallback() {}

    static void resolve(String source, String data, Function1<ExtractorLink, Unit> deliver) throws Exception {
        String page = Unified.playbackUrl(data);
        HttpUrl address = HttpUrl.parse(page);
        if (address == null) throw new IOException("Ссылка на страницу видео отсутствует");
        String adjusted = MediaFix.mediaRequestUrl(page);
        long deadline = System.nanoTime() + TimeUnit.SECONDS.toNanos(14);
        Deque<Target> queue = new ArrayDeque<>();
        queue.add(new Target(adjusted, page, 0, 0, TubeSources.playable(adjusted)));
        if (ResolveMedia.tube(data)) {
            String external = TubeSources.external(page);
            if (!external.isEmpty()) queue.add(new Target(external, page, 1, 0, false));
        }
        if (!adjusted.equals(page)) queue.add(new Target(page, page, 0, 0, false));
        Set<String> visited = new HashSet<>();
        int found = 0;
        String failure = "страница не отдала видеопоток";
        while (!queue.isEmpty() && visited.size() < MAX_VISITS && found < MAX_LINKS) {
            if (Thread.currentThread().isInterrupted()) throw new InterruptedException();
            long remaining = TimeUnit.NANOSECONDS.toMillis(deadline - System.nanoTime());
            if (remaining <= 0) break;
            Target target = queue.removeFirst();
            if (target.depth > 4 || ResolveMedia.unwanted(target.url) ||
                !visited.add(target.url)) continue;
            OkHttpClient client = PlaybackLinks.client(target.url, Math.min(remaining, 2700));
            Request.Builder request = PlaybackLinks.request(target.url, target.referer, null);
            try (Response response = fetch(client, request, target.media)) {
                HttpUrl location = response.request().url();
                if (!response.isSuccessful() || response.body() == null) {
                    if (target.depth == 0) failure = "сервер вернул HTTP " + response.code();
                    continue;
                }
                if (ResolveMedia.unwanted(location.toString())) continue;
                byte[] prefix = response.peekBody(512).bytes();
                String text = new String(prefix, StandardCharsets.UTF_8).replace("\uFEFF", "").trim();
                if (ResolveMedia.validMedia(prefix) || text.startsWith("#EXTM3U")) {
                    Map<String, String> headers = new LinkedHashMap<>();
                    for (String header : Arrays.asList("User-Agent", "Referer", "Cookie", "Origin")) {
                        String value = response.request().header(header);
                        if (value != null) headers.put(header, value);
                    }
                    int quality = target.quality == 0 ? PlaybackLinks.height("", location.toString()) : target.quality;
                    boolean hls = text.startsWith("#EXTM3U");
                    ExtractorLink link = PlaybackLinks.create(source, quality > 0 ? quality + "p" : hls ? "" : "Оригинал",
                        location.toString(), target.referer, quality > 0 ? quality : hls ? 0 : 400,
                        hls ? ExtractorLinkType.M3U8 : ExtractorLinkType.VIDEO, headers, null, Collections.emptyList());
                    deliver.invoke(link);
                    found++;
                } else if (response.code() != 206 && found == 0) {
                    collect(queue, target, location.toString(), response.peekBody(BODY_LIMIT).string());
                }
            } catch (IOException failed) {
                if (target.depth == 0) failure = "не удалось загрузить страницу видео";
            }
        }
        if (found == 0) throw new IOException(source + ": " + failure);
    }

    static Response fetch(OkHttpClient client, Request.Builder request, boolean media) throws IOException {
        if (media) request.header("Range", "bytes=0-511");
        Response response = client.newCall(request.build()).execute();
        if (media) {
            int status = response.code();
            if (status == 400 || status == 403 || status == 405 || status == 416 ||
                (status == 206 && !ResolveMedia.validMedia(response.peekBody(512).bytes()))) {
                response.close();
                return client.newCall(request.removeHeader("Range").build()).execute();
            }
        }
        return response;
    }

    private static void collect(Deque<Target> queue, Target parent, String url, String content) {
        if (content.isEmpty() || parent.depth >= 4) return;
        Document document = Jsoup.parse(content, url);
        LinkedHashSet<String> embeds = new LinkedHashSet<>();
        try {
            embeds.addAll(TubeSources.embeds(document));
        } catch (RuntimeException ignored) {
            // Continue with explicit HTML sources.
        }
        Map<String, String> sources = TubeSources.sources(document);
        for (Element video : document.select("video[src], video[data-src], video source[src], video source[data-src], source[type^=video][src]")) {
            String address = video.hasAttr("data-src") ? video.attr("data-src") : video.attr("src");
            String candidate = TubeSources.absolute(url, address);
            if (!candidate.isEmpty()) {
                String label = video.hasAttr("data-quality") ? video.attr("data-quality") : video.attr("label");
                if (!sources.containsKey(candidate) || !label.isEmpty()) sources.put(candidate, label);
            }
        }
        for (Element frame : document.select("iframe[src], iframe[data-src], iframe[data-lazy-src], [data-embed-url], [data-player-url]")) {
            for (String attr : Arrays.asList("data-src", "src", "data-lazy-src", "data-embed-url", "data-player-url")) {
                if (frame.hasAttr(attr)) {
                    String embed = TubeSources.absolute(url, frame.attr(attr));
                    if (!embed.isEmpty()) {
                        embeds.add(embed);
                        break;
                    }
                }
            }
        }
        try {
            com.streambundlehtml.nodes.Document extra = MediaFix.parse(content, url);
            MediaFix.media(extra);
            for (com.streambundlehtml.nodes.Element source : extra.select("source[src],video[src]")) {
                String candidate = source.absUrl("src");
                if (candidate.isEmpty()) continue;
                int quality = MediaFix.quality(candidate, extra);
                if (quality > 0 || !sources.containsKey(candidate)) sources.put(candidate, quality > 0 ? quality + "p" : "");
            }
        } catch (RuntimeException ignored) {
            // The generic parser still provides sources and embeds.
        }
        if ("jav.guru".equals(HttpUrl.parse(url).host())) {
            embeds.addAll(SiteFix.javEmbeds(document));
            String next = SiteFix.javNext(document);
            if (next != null && !next.isEmpty()) embeds.add(next);
        }
        List<Target> direct = new ArrayList<>();
        for (Map.Entry<String, String> source : sources.entrySet()) {
            if (!TubeSources.excluded(source.getKey())) {
                direct.add(new Target(source.getKey(), url, parent.depth + 1,
                    PlaybackLinks.height(source.getValue(), source.getKey()), true));
            }
        }
        for (int i = Math.min(direct.size(), 12) - 1; i >= 0; i--) queue.addFirst(direct.get(i));
        for (String embed : embeds) {
            if (queue.size() >= 28) break;
            if (!TubeSources.excluded(embed)) queue.addLast(new Target(embed, url, parent.depth + 1, 0, TubeSources.playable(embed)));
        }
    }

    private static final class Target {
        final String url;
        final String referer;
        final int depth;
        final int quality;
        final boolean media;

        Target(String url, String referer, int depth, int quality, boolean media) {
            this.url = url;
            this.referer = referer;
            this.depth = depth;
            this.quality = quality;
            this.media = media;
        }
    }
}
