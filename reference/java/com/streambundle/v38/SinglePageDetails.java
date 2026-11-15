package com.streambundle.v38;

import com.example.websites.WebVideoProvider;
import com.lagradost.cloudstream3.MainAPI;
import com.lagradost.cloudstream3.MainAPIKt;
import com.lagradost.cloudstream3.MainActivityKt;
import com.lagradost.cloudstream3.MovieLoadResponse;
import com.lagradost.cloudstream3.MovieSearchResponse;
import com.lagradost.cloudstream3.TvType;
import com.streambundle.v43.SiteAccess;
import com.streambundleextra.MediaFix;
import com.streambundleextra.VideoBundleSite;
import com.streambundleextra.VideoMetadata;
import java.util.*;
import java.util.concurrent.TimeUnit;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import okhttp3.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

final class SinglePageDetails {
    private SinglePageDetails() {}

    static boolean supports(MainAPI api, String url) {
        HttpUrl requested = HttpUrl.parse(url);
        if (requested == null || requested.fragment() != null) return false;
        String site = QuickSearch.host(api.getMainUrl());
        if (!site.equals(QuickSearch.host(url))) return false;
        if (Arrays.asList("bdsmx.tube","erome.com","semyana.com","strip2.co","huyamba.name","huyamba.mobi").contains(site)
            || requested.host().endsWith(".semyana.com") || requested.host().endsWith(".strip2.co")
            || requested.host().endsWith(".huyamba.name") || requested.host().endsWith(".huyamba.mobi")) return false;
        return api instanceof VideoBundleSite || api instanceof WebVideoProvider
            || site.equals("tubesafari.com") || site.equals("epawg.com") || site.equals("1ebalka.ru.actor");
    }

    static Object fetch(MainAPI api, String url, Continuation<Object> completion) throws Exception {
        Map<String, String> headers = MediaFix.headers(url);
        Request.Builder request = new Request.Builder().url(url);
        for (Map.Entry<String, String> header : headers.entrySet()) request.header(header.getKey(), header.getValue());
        OkHttpClient original = MainActivityKt.getApp().getBaseClient();
        OkHttpClient.Builder client = original.newBuilder().callTimeout(3500, TimeUnit.MILLISECONDS);
        try {
            Interceptor access = SiteAccess.interceptor(url);
            if (access != null && !original.interceptors().contains(access)) client.addInterceptor(access);
        } catch (RuntimeException | LinkageError ignored) {}
        try (Response reply = client.build().newCall(request.build()).execute()) {
            if (!reply.isSuccessful() || reply.body() == null) return null;
            String actual = reply.request().url().toString();
            if (!QuickSearch.host(url).equals(QuickSearch.host(actual))) return null;
            Document page = Jsoup.parse(reply.peekBody(1_800_000).string(), actual);
            if (page.title().matches("(?is).*(?:site unavailable|access denied|just a moment|error [45][0-9][0-9]).*")
                || page.selectFirst("#challenge-form,#cf-error-details") != null) return null;
            String name = text(page, "meta[property=og:title]", "h1", "title");
            if (name.isEmpty()) return null;
            if (!BundleMetadata.key(actual).equals(BundleMetadata.key(url))) {
                if (page.selectFirst("meta[property=og:type][content^=video], video, #player, .video-player") == null) return null;
                page.setBaseUri(url);
            }
            DetailMetadata.collectVideo(page, true);
            String poster = image(page);
            List<MovieSearchResponse> related = related(api, page, url);
            long duration = VideoMetadata.cached(url);
            if (duration <= 0) {
                long seconds = VideoMetadata.seconds(text(page, "meta[property=video:duration]", "meta[property=og:video:duration]", "[itemprop=duration]", ".video-duration", ".duration"));
                if (seconds > 0) VideoMetadata.remember(url, seconds);
                duration = seconds;
            }
            final long seconds = duration;
            TvType type = api instanceof VideoBundleSite ? TvType.Movie : TvType.NSFW;
            return MainAPIKt.newMovieLoadResponse(api, DetailMetadata.listingTitle(name, url), url, type, url, (item, end) -> {
                MovieLoadResponse video = (MovieLoadResponse) item;
                if (PosterSupport.valid(poster)) {
                    video.setPosterUrl(poster);
                    video.setBackgroundPosterUrl(poster);
                    video.setPosterHeaders(new LinkedHashMap<>(headers));
                }
                if (seconds > 0) video.setDuration((int) Math.max(1, Math.round(seconds / 60.0)));
                if (!related.isEmpty()) video.setRecommendations(new ArrayList<>(related));
                DetailMetadata.enrich(video);
                SearchAndPosters.reusePoster(video);
                return Unit.INSTANCE;
            }, completion);
        }
    }

    private static String text(Document page, String... selectors) {
        for (String selector : selectors) {
            Element element = page.selectFirst(selector);
            if (element == null) continue;
            String value = (element.hasAttr("content") ? element.attr("content") : element.text()).trim();
            if (!value.isEmpty()) return value;
        }
        return "";
    }

    private static String image(Document page) {
        String cover = text(page,"meta[property=og:image]","meta[name=twitter:image]","meta[itemprop=thumbnailUrl]");
        if (cover.isEmpty()) {
            Element video = page.selectFirst("video[poster]");
            if (video != null) cover = video.attr("poster");
        }
        return BundleMetadata.absolute(page.baseUri(), cover);
    }

    private static List<MovieSearchResponse> related(MainAPI api, Document page, String current) {
        List<MovieSearchResponse> result = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        seen.add(BundleMetadata.key(current));
        for (Element link : page.select("#related-videos a[href],.related a[href],.recommendations a[href],.related-videos a[href],.video-related a[href]")) {
            String url = link.absUrl("href");
            HttpUrl target = HttpUrl.parse(url);
            if (target == null || !QuickSearch.host(current).equals(QuickSearch.host(url))
                || !target.encodedPath().matches("(?i)^/(?:videos?|watch|view|play)/[^/]+.*")
                || !seen.add(BundleMetadata.key(url))) continue;
            Element image = link.selectFirst("img");
            String title = link.attr("title").trim();
            if (title.isEmpty() && image != null) title = image.attr("alt").trim();
            if (title.isEmpty()) title = link.text().trim();
            if (title.isEmpty()) continue;
            String poster = PosterSupport.picture(link, page.baseUri());
            TvType type = api instanceof VideoBundleSite ? TvType.Movie : TvType.NSFW;
            MovieSearchResponse card = DetailMetadata.searchCard(api, title, url, type, false, item -> {
                MovieSearchResponse movie = (MovieSearchResponse) item;
                if (PosterSupport.valid(poster)) {
                    movie.setPosterUrl(poster);
                    movie.setPosterHeaders(Collections.singletonMap("Referer", PosterSupport.referer(current, poster)));
                }
                return Unit.INSTANCE;
            }, 0, null);
            if (!BundleMetadata.blocked(card)) result.add(card);
            if (result.size() == 18) break;
        }
        return result;
    }
}
