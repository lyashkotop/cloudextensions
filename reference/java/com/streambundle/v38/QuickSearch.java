package com.streambundle.v38;

import com.lagradost.cloudstream3.MainAPI;
import com.lagradost.cloudstream3.MainActivityKt;
import com.lagradost.cloudstream3.MovieSearchResponse;
import com.lagradost.cloudstream3.TvType;
import com.streambundle.SearchLimit;
import com.streambundle.v43.SiteAccess;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.*;
import kotlin.Unit;
import kotlin.coroutines.*;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import okhttp3.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public final class QuickSearch {
    private static final ExecutorService WORK = Executors.newFixedThreadPool(8, task -> daemon(task, "streambundle-search"));
    private static final ScheduledExecutorService TIMER = Executors.newSingleThreadScheduledExecutor(task -> daemon(task, "streambundle-search-timer"));
    private static final Map<String, List<?>> RECENT = Collections.synchronizedMap(new LinkedHashMap<String,List<?>>(32, .75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<String,List<?>> entry) { return size() > 240; }
    });
    private QuickSearch() {}

    private static Thread daemon(Runnable task, String name) {
        Thread thread = new Thread(task, name);
        thread.setDaemon(true);
        return thread;
    }

    static String host(String url) {
        HttpUrl address = HttpUrl.parse(url);
        return address == null ? "" : address.host().replaceFirst("^www\\.", "");
    }

    public static boolean supports(Object provider) {
        if (!(provider instanceof MainAPI)) return false;
        switch (host(((MainAPI) provider).getMainUrl())) {
            case "sickjunk.com": case "hurtsex.com": case "pornvideos.rs": case "youjizz.com": return true;
            default: return false;
        }
    }

    public static Object run(MainAPI provider, String query, Continuation<Object> end) {
        String term = query == null ? "" : query.trim();
        if (term.isEmpty()) return Collections.emptyList();
        State state = new State(provider, end);
        state.deadline = TIMER.schedule(state::expire, 4800, TimeUnit.MILLISECONDS);
        WORK.execute(() -> state.begin(term));
        return state.result.getOrThrow();
    }

    private static final class State {
        final MainAPI provider;
        final Continuation<Object> end;
        final SafeContinuation<Object> result;
        final List<Call> calls = new ArrayList<>();
        ScheduledFuture<?> deadline;
        boolean finished;
        int pending;
        State(MainAPI provider, Continuation<Object> end) {
            this.provider = provider;
            this.end = end;
            result = new SafeContinuation<>(end);
        }
        void begin(String input) {
            String language = SearchAndPosters.target(provider, input);
            String english = language.equals("en") ? SearchAndPosters.local(input, "en") : "";
            if (language.equals("en") && english.isEmpty()) english = BundleTranslation.translate(input, "en");
            String term = english.isEmpty() ? input : english;
            List<Request> requests = routes(provider.getMainUrl(), term);
            synchronized (this) {
                if (finished) return;
                pending = requests.size() + 1;
            }
            for (Request request : requests) send(request);
            Continuation<Object> callback = new Continuation<Object>() {
                public CoroutineContext getContext() { return end.getContext(); }
                public void resumeWith(Object value) {
                    if (value instanceof List) complete((List<?>) value);
                    else complete(Collections.emptyList());
                }
            };
            try {
                Object value = SearchLimit.run(provider, term, callback);
                if (value != IntrinsicsKt.getCOROUTINE_SUSPENDED()) callback.resumeWith(value);
            } catch (Exception | LinkageError ignored) {
                complete(Collections.emptyList());
            }
        }
        void send(Request request) {
            try {
                OkHttpClient.Builder client = MainActivityKt.getApp().getBaseClient().newBuilder()
                    .callTimeout(3100, TimeUnit.MILLISECONDS);
                if (host(provider.getMainUrl()).equals("sickjunk.com")) {
                    try {
                        Interceptor interceptor = SiteAccess.interceptor(request.url().toString());
                        if (interceptor != null) client.addInterceptor(interceptor);
                    } catch (RuntimeException | LinkageError ignored) {}
                }
                Call call = client.build().newCall(request);
                synchronized (this) {
                    if (finished) return;
                    calls.add(call);
                }
                call.enqueue(new Callback() {
                    public void onFailure(Call ignored, IOException error) { complete(Collections.emptyList()); }
                    public void onResponse(Call ignored, Response response) {
                        List<?> cards = Collections.emptyList();
                        try (Response reply = response) {
                            if (reply.isSuccessful() && reply.body() != null) {
                                cards = parse(provider, reply.request().url(), reply.peekBody(1500000).string());
                            }
                        } catch (Exception | LinkageError ignoredError) {}
                        complete(cards);
                    }
                });
            } catch (RuntimeException | LinkageError ignored) {
                complete(Collections.emptyList());
            }
        }
        synchronized void complete(List<?> values) {
            if (finished) return;
            pending--;
            List<Object> allowed = new ArrayList<>();
            for (Object value : values) {
                if (value instanceof MovieSearchResponse && !BundleMetadata.blocked(value)) allowed.add(value);
            }
            if (!allowed.isEmpty()) finish(allowed);
            else if (pending == 0) finish(Collections.emptyList());
        }
        synchronized void expire() { if (!finished) finish(Collections.emptyList()); }
        void finish(List<?> values) {
            finished = true;
            deadline.cancel(false);
            for (Call call : calls) call.cancel();
            remember(provider, values);
            result.resumeWith(values);
        }
    }

    static List<Request> routes(String base, String query) {
        HttpUrl origin = HttpUrl.parse(base);
        if (origin == null) return Collections.emptyList();
        HttpUrl form = origin.newBuilder().encodedPath("/search").query(null).build();
        HttpUrl slash = origin.newBuilder().encodedPath("/search/").query(null).build();
        List<Request> result = new ArrayList<>();
        switch (host(base)) {
            case "sickjunk.com":
                result.add(request(slash.newBuilder().addQueryParameter("q", query).build(), base).build());
                result.add(request(slash.newBuilder().addPathSegment(query.replace(' ', '-')).addPathSegment("").build(), base).build());
                break;
            case "hurtsex.com":
                result.add(request(form, base).post(new FormBody.Builder().add("q", query).build()).build());
                result.add(request(form.newBuilder().addQueryParameter("q", query).build(), base).build());
                break;
            case "pornvideos.rs":
                result.add(request(slash.newBuilder().addQueryParameter("q", query).build(), base).build());
                result.add(request(slash.newBuilder().addPathSegment(query.replace(' ', '-')).addPathSegment("").build(), base).build());
                break;
            case "youjizz.com":
                result.add(request(form.newBuilder().addQueryParameter("q", query).build(), base).build());
                result.add(request(slash.newBuilder().addPathSegment(query.replace(' ', '-') + "-1.html").build(), base).build());
                break;
            default: break;
        }
        return result;
    }

    private static Request.Builder request(HttpUrl url, String base) {
        return new Request.Builder().url(url).header("User-Agent", com.streambundle.v48.ResolveMedia.UA).header("Referer", base);
    }

    private static List<?> parse(MainAPI provider, HttpUrl effective, String html) {
        String domain = host(provider.getMainUrl());
        if (!domain.equals(host(effective.toString())) || effective.encodedPath().equals("/") ||
            !effective.encodedPath().contains("search")) return Collections.emptyList();
        Document page = Jsoup.parse(html, effective.toString());
        com.streambundle.SearchGuard.clean(page);
        Map<String, MovieSearchResponse> cards = new LinkedHashMap<>();
        for (Element a : page.select("a[href]")) {
            if (cards.size() >= 60) break;
            if (a.closest("header,footer,nav,aside,.related,.recommendations,.advertisement") != null) continue;
            String url = a.absUrl("href");
            HttpUrl video = HttpUrl.parse(url);
            if (video == null || !domain.equals(host(url)) ||
                !video.encodedPath().matches("(?i)^/(?:videos?|watch|view|play)/[^/]+.*")) continue;
            String key = BundleMetadata.key(url);
            if (cards.containsKey(key)) continue;
            Element image = a.selectFirst("img");
            Element container = a.closest("article,.item,.video-item,.video-card,.video,.thumb,.video-thumb");
            if (image == null && container != null) image = container.selectFirst("img");
            String name = a.attr("title").trim();
            if (name.isEmpty() && image != null) name = image.attr("alt").trim();
            if (name.isEmpty()) name = a.text().trim();
            if (name.isEmpty() && container != null) {
                Element heading = container.selectFirst(".title,.video-title,h2,h3");
                if (heading != null) name = heading.text().trim();
            }
            if (name.isEmpty() || name.matches("[0-9: ]+")) continue;
            String thumbnail = PosterSupport.picture(a, effective.toString());
            if (thumbnail.isEmpty() && image != null) thumbnail = PosterSupport.picture(image, effective.toString());
            final String poster = thumbnail;
            MovieSearchResponse card = DetailMetadata.searchCard(provider, name, url, TvType.Movie, false, item -> {
                MovieSearchResponse movie = (MovieSearchResponse) item;
                if (!poster.isEmpty()) {
                    movie.setPosterUrl(poster);
                    String referer = PosterSupport.referer(effective.toString(), poster);
                    movie.setPosterHeaders(Collections.singletonMap("Referer", referer));
                }
                return Unit.INSTANCE;
            }, 0, null);
            cards.put(key, card);
        }
        if (!cards.isEmpty()) BundleMetadata.document(page);
        return new ArrayList<>(cards.values());
    }

    public static void remember(Object provider, List<?> list) {
        if (!(provider instanceof MainAPI) || list.size() < 2) return;
        String name = ((MainAPI) provider).getName();
        List<?> cards = new ArrayList<>(list.subList(0, Math.min(list.size(), 48)));
        synchronized (RECENT) {
            for (Object item : cards) {
                String url = BundleMetadata.string(BundleMetadata.get(item, "Url"));
                if (!url.isEmpty()) RECENT.put(name + "\n" + BundleMetadata.key(url), cards);
            }
        }
    }

    public static void recommendations(Object provider, String url, Object value) {
        if (!(provider instanceof MainAPI) || value == null) return;
        Object existing = BundleMetadata.get(value, "Recommendations");
        List<?> source = existing instanceof List && !((List<?>) existing).isEmpty()
            ? (List<?>) existing : RECENT.get(((MainAPI) provider).getName() + "\n" + BundleMetadata.key(url));
        if (source == null) return;
        source = com.streambundle.MetadataDisplay.recommendations(source, value);
        List<Object> filtered = new ArrayList<>();
        for (Object item : source) {
            String candidate = BundleMetadata.string(BundleMetadata.get(item, "Url"));
            if (!candidate.isEmpty() && !BundleMetadata.key(candidate).equals(BundleMetadata.key(url))
                && !BundleMetadata.blocked(item)) filtered.add(item);
            if (filtered.size() == 20) break;
        }
        BundleMetadata.set(value, "Recommendations", List.class, filtered);
    }
}
