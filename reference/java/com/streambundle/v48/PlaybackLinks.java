package com.streambundle.v48;

import com.lagradost.cloudstream3.MainActivityKt;
import com.lagradost.cloudstream3.utils.ExtractorApiKt;
import com.lagradost.cloudstream3.utils.ExtractorLink;
import com.lagradost.cloudstream3.utils.ExtractorLinkType;
import com.streambundle.v43.SiteAccess;
import java.lang.reflect.Constructor;
import java.net.ProtocolException;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import okhttp3.*;

public final class PlaybackLinks {
    private static final int MANIFEST_BYTES = 512 * 1024;
    private static final int MP4_BYTES = 256 * 1024;
    private static final Pattern LABEL = Pattern.compile("(?i)(?<![0-9])(144|240|288|360|480|540|576|720|1080|1440|2160|4320)(?:p(?=$|[^a-z])|(?=$|[^0-9]))");
    private static final Pattern URL_LABEL = Pattern.compile("(?i)(?:^|[/_.=&-])(144|240|288|360|480|540|576|720|1080|1440|2160|4320)(?:p(?=$|[^a-z])|(?=$|[/_.&#?-]))");
    private static final Pattern RESOLUTION = Pattern.compile("(?i)^(\\d{2,5})x(\\d{2,5})$");
    private static final Pattern ATTRIBUTE = Pattern.compile("(?:^|,)([A-Z0-9-]+)=(\"[^\"]*\"|[^,]*)");
    private static final Set<Integer> KNOWN = new HashSet<>(Arrays.asList(144, 240, 288, 360, 480, 540, 576, 720, 1080, 1440, 2160, 4320));

    private PlaybackLinks() {}

    static int height(String label, String url) {
        String value = label == null ? "" : label.trim();
        if (value.matches("(?i)4k")) return 2160;
        if (value.matches("(?i)8k")) return 4320;
        Matcher resolution = RESOLUTION.matcher(value);
        if (resolution.matches()) return Integer.parseInt(resolution.group(2));
        Matcher declared = LABEL.matcher(value);
        if (declared.find()) return Integer.parseInt(declared.group(1));
        HttpUrl address = url == null ? null : HttpUrl.parse(url);
        if (address == null) return 0;
        for (String key : Arrays.asList("quality", "height", "resolution", "res")) {
            String parameter = address.queryParameter(key);
            if (parameter != null && parameter.matches("(?i)[0-9]{2,4}p?")) {
                int candidate = Integer.parseInt(parameter.replaceAll("(?i)p$", ""));
                if (KNOWN.contains(candidate)) return candidate;
            }
        }
        Matcher inPath = URL_LABEL.matcher(address.encodedPath());
        return inPath.find() ? Integer.parseInt(inPath.group(1)) : 0;
    }

    static OkHttpClient client(String url, long timeout) {
        OkHttpClient base = MainActivityKt.getApp().getBaseClient();
        OkHttpClient.Builder client = base.newBuilder().callTimeout(Math.max(1, timeout), TimeUnit.MILLISECONDS);
        try {
            Interceptor access = SiteAccess.interceptor(url);
            if (access != null && !base.interceptors().contains(access)) client.addInterceptor(access);
        } catch (RuntimeException | LinkageError ignored) {
            // The base client is still usable when a site-specific interceptor is unavailable.
        }
        return client.build();
    }

    static Request.Builder request(String url, String referer, Map<String, String> headers) {
        Request.Builder builder = new Request.Builder().url(url).header("User-Agent", ResolveMedia.UA);
        if (headers != null) {
            for (Map.Entry<String, String> entry : headers.entrySet()) {
                if (entry.getKey() != null && entry.getValue() != null && !entry.getKey().equalsIgnoreCase("Range")) {
                    builder.header(entry.getKey(), entry.getValue());
                }
            }
        }
        if (referer != null && !referer.isEmpty() && builder.build().header("Referer") == null) {
            builder.header("Referer", referer);
        }
        return builder;
    }

    public static ExtractorLink verified(ExtractorLink link) {
        if (link.getClass() != ExtractorLink.class || ResolveMedia.unwanted(link.getUrl())) {
            return link.getClass() == ExtractorLink.class ? null : link;
        }
        try {
            OkHttpClient client = client(link.getUrl(), 1900);
            Request.Builder request = request(link.getUrl(), link.getReferer(), link.getHeaders());
            try (Response reply = PlaybackFallback.fetch(client, request, true)) {
                if (!reply.isSuccessful() || reply.body() == null || ResolveMedia.unwanted(reply.request().url().toString())) return null;
                byte[] prefix = reply.peekBody(512).bytes();
                if (!ResolveMedia.validMedia(prefix) && !isManifest(prefix)) return null;
                Map<String, String> headers = new LinkedHashMap<>(link.getHeaders());
                String cookie = reply.request().header("Cookie");
                if (cookie != null) headers.put("Cookie", cookie);
                String address = reply.request().url().toString();
                if (address.equals(link.getUrl()) && headers.equals(link.getHeaders())) return link;
                return create(link.getSource(), link.getName(), address, link.getReferer(), link.getQuality(),
                    link.getType(), headers, link, Collections.emptyList());
            }
        } catch (Exception | LinkageError unavailable) {
            return null;
        }
    }

    static ExtractorLink create(String source, String label, String url, String referer,
                                int quality, ExtractorLinkType type, Map<String, String> headers,
                                ExtractorLink original, List<Object> audio) throws Exception {
        Object result = ExtractorApiKt.newExtractorLink(source, label, url, type, (link, continuation) -> {
            ExtractorLink output = (ExtractorLink) link;
            output.setReferer(referer == null ? "" : referer);
            output.setQuality(quality);
            output.setHeaders(headers == null ? Collections.emptyMap() : headers);
            if (original != null) {
                copyField(original, output, "ExtractorData", String.class);
                copyField(original, output, "AudioTracks", List.class);
            }
            if (!audio.isEmpty()) setAudio(output, audio);
            return Unit.INSTANCE;
        }, new Continuation<Object>() {
            public CoroutineContext getContext() { return EmptyCoroutineContext.INSTANCE; }
            public void resumeWith(Object value) {}
        });
        if (result instanceof ExtractorLink) return (ExtractorLink) result;
        throw new ProtocolException("Cloudstream did not create a video link");
    }

    private static boolean isManifest(byte[] prefix) {
        String text = new String(prefix, java.nio.charset.StandardCharsets.UTF_8).replace("\uFEFF", "").trim();
        return text.startsWith("#EXTM3U") || text.matches("(?s)^(?:<\\?xml[^>]*>\\s*)?<MPD(?:\\s|>).*");
    }

    private static void copyField(ExtractorLink from, ExtractorLink to, String field, Class<?> type) {
        try {
            Object value = from.getClass().getMethod("get" + field).invoke(from);
            to.getClass().getMethod("set" + field, type).invoke(to, value);
        } catch (ReflectiveOperationException ignored) {
            // Older Cloudstream versions expose fewer link fields.
        }
    }

    private static void setAudio(ExtractorLink link, List<Object> audio) {
        try {
            link.getClass().getMethod("setAudioTracks", List.class).invoke(link, audio);
        } catch (ReflectiveOperationException error) {
            throw new IllegalStateException(error);
        }
    }

    private static boolean supportsSeparateAudio(ExtractorLink original) {
        try {
            original.getClass().getMethod("setAudioTracks", List.class);
            return true;
        } catch (NoSuchMethodException unavailable) {
            return false;
        }
    }

    private static Object audioTrack(String url, Map<String, String> headers, Map<String, String> attributes)
            throws ReflectiveOperationException {
        Class<?> type = Class.forName("com.lagradost.cloudstream3.AudioFile");
        try {
            Constructor<?> old = type.getConstructor(String.class, Map.class);
            return old.newInstance(url, headers);
        } catch (NoSuchMethodException unavailable) {
            Constructor<?> current = type.getConstructor(String.class, String.class, String.class, Map.class);
            return current.newInstance(attributes.getOrDefault("LANGUAGE", "und"), url, attributes.get("NAME"), headers);
        }
    }

    static List<ExtractorLink> normalize(ExtractorLink original) {
        if (original.getClass() != ExtractorLink.class) return Collections.singletonList(original);
        String url = original.getUrl();
        HttpUrl address = HttpUrl.parse(url);
        if (address == null) return Collections.singletonList(original);
        ExtractorLinkType type = original.getType();
        boolean hls = type == ExtractorLinkType.M3U8 || address.encodedPath().toLowerCase(Locale.ROOT).contains(".m3u8");
        int quality = KNOWN.contains(original.getQuality()) ? original.getQuality() : height(original.getName(), url);
        if (hls) {
            quality = 0;
            try {
                List<ExtractorLink> variants = hls(original);
                if (!variants.isEmpty()) return variants;
                quality = KNOWN.contains(original.getQuality()) ? original.getQuality() : height(original.getName(), url);
            } catch (Exception | LinkageError ignored) {
                // Preserve the original master if fetching or expanding it fails.
            }
        } else if (type == ExtractorLinkType.VIDEO && quality == 0 && address.encodedPath().toLowerCase(Locale.ROOT).endsWith(".mp4")) {
            quality = mp4Height(original);
        }
        try {
            String label = quality > 0 ? quality + "p" : hls ? "" : "Оригинал";
            return Collections.singletonList(create(original.getSource(), label, url, original.getReferer(),
                quality > 0 ? quality : hls ? 0 : 400, hls ? ExtractorLinkType.M3U8 : type,
                original.getHeaders(), original, Collections.emptyList()));
        } catch (Exception | LinkageError ignored) {
            return Collections.singletonList(original);
        }
    }

    private static List<ExtractorLink> hls(ExtractorLink original) throws Exception {
        String url = original.getUrl();
        String referer = original.getReferer();
        Map<String, String> headers = original.getHeaders();
        try (Response reply = client(url, 2100).newCall(request(url, referer, headers).build()).execute()) {
            if (!reply.isSuccessful() || reply.body() == null) return Collections.emptyList();
            String manifest = reply.peekBody(MANIFEST_BYTES).string().trim();
            if (manifest.startsWith("\uFEFF")) manifest = manifest.substring(1);
            if (!manifest.startsWith("#EXTM3U") || !manifest.contains("#EXT-X-STREAM-INF:")) return Collections.emptyList();
            HttpUrl master = reply.request().url();
            Map<String, String> streamHeaders = new LinkedHashMap<>(headers == null ? Collections.emptyMap() : headers);
            String cookie = reply.request().header("Cookie");
            if (cookie != null) streamHeaders.put("Cookie", cookie);
            Map<String, Map<String, String>> audioGroups = new LinkedHashMap<>();
            Map<Integer, ExtractorLink> variants = new TreeMap<>(Collections.reverseOrder());
            boolean keepMaster = false;
            String[] lines = manifest.split("\\r?\\n");
            for (String raw : lines) {
                String line = raw.trim();
                if (!line.startsWith("#EXT-X-MEDIA:")) continue;
                Map<String, String> fields = attributes(line);
                if (!"AUDIO".equals(fields.get("TYPE")) || !fields.containsKey("URI")) continue;
                String group = fields.get("GROUP-ID");
                if (group == null) continue;
                if (!audioGroups.containsKey(group) || "YES".equals(fields.get("DEFAULT"))) {
                    audioGroups.put(group, fields);
                }
            }

            Map<String, String> info = null;
            for (String raw : lines) {
                String line = raw.trim();
                if (line.startsWith("#EXT-X-STREAM-INF:")) {
                    info = attributes(line);
                } else if (!line.isEmpty() && !line.startsWith("#") && info != null) {
                    HttpUrl child = master.resolve(line);
                    if (child != null && !ResolveMedia.unwanted(child.toString())) {
                        Matcher dimensions = RESOLUTION.matcher(info.getOrDefault("RESOLUTION", ""));
                        int height = dimensions.matches() ? Integer.parseInt(dimensions.group(2)) : height(info.get("NAME"), child.toString());
                        Map<String, String> audio = audioGroups.get(info.get("AUDIO"));
                        List<Object> tracks = Collections.emptyList();
                        if (audio != null && supportsSeparateAudio(original)) {
                            HttpUrl audioUrl = master.resolve(audio.get("URI"));
                            if (audioUrl != null) {
                                try {
                                    tracks = Collections.singletonList(audioTrack(audioUrl.toString(), streamHeaders, audio));
                                } catch (ReflectiveOperationException ignored) {
                                    // An older client still plays this variant through the master.
                                }
                            }
                        }
                        if (height == 0 || (audio != null && tracks.isEmpty())) {
                            keepMaster = true;
                        } else if (!variants.containsKey(height)) {
                            variants.put(height, create(original.getSource(), height + "p", child.toString(),
                                referer, height, ExtractorLinkType.M3U8, streamHeaders, original, tracks));
                            keepMaster |= info.containsKey("SUBTITLES") || (info.containsKey("CLOSED-CAPTIONS") && !"NONE".equals(info.get("CLOSED-CAPTIONS")));
                        }
                    }
                    info = null;
                }
            }
            List<ExtractorLink> result = new ArrayList<>(variants.values());
            if (keepMaster && !result.isEmpty()) {
                result.add(create(original.getSource(), "", master.toString(), referer, 0, ExtractorLinkType.M3U8,
                    streamHeaders, original, Collections.emptyList()));
            }
            return result;
        }
    }

    private static Map<String, String> attributes(String line) {
        Map<String, String> fields = new LinkedHashMap<>();
        Matcher matcher = ATTRIBUTE.matcher(line.substring(line.indexOf(':') + 1));
        while (matcher.find()) {
            String value = matcher.group(2);
            if (value.startsWith("\"") && value.endsWith("\"")) value = value.substring(1, value.length() - 1);
            fields.put(matcher.group(1), value);
        }
        return fields;
    }

    private static int mp4Height(ExtractorLink link) {
        Request.Builder request = request(link.getUrl(), link.getReferer(), link.getHeaders());
        OkHttpClient client = client(link.getUrl(), 1300);
        try (Response reply = client.newCall(request.header("Range", "bytes=0-" + (MP4_BYTES - 1)).build()).execute()) {
            if (!reply.isSuccessful() || reply.body() == null) return 0;
            byte[] bytes = reply.peekBody(MP4_BYTES).bytes();
            int height = mp4Height(bytes);
            if (height > 0 || reply.code() != 206 || !ResolveMedia.validMedia(bytes)) return height;
        } catch (Exception ignored) {
            return 0;
        }
        try (Response reply = client.newCall(request.header("Range", "bytes=-" + MP4_BYTES).build()).execute()) {
            if (reply.code() != 206 || reply.body() == null) return 0;
            return mp4Height(reply.peekBody(MP4_BYTES).bytes());
        } catch (Exception ignored) {
            return 0;
        }
    }

    static int mp4Height(byte[] data) {
        int result = 0;
        for (int offset = 4; offset + 8 <= data.length; offset++) {
            if (data[offset] != 't' || data[offset + 1] != 'k' || data[offset + 2] != 'h' || data[offset + 3] != 'd') continue;
            int length = integer(data, offset - 4);
            int end = offset - 4 + length;
            if ((length != 92 && length != 104) || end > data.length) continue;
            int width = integer(data, end - 8) >>> 16;
            int height = integer(data, end - 4) >>> 16;
            if (width >= 64 && width <= 16384 && height >= 64 && height <= 16384) {
                result = Math.max(result, height);
            }
        }
        return result;
    }

    private static int integer(byte[] data, int offset) {
        return (data[offset] & 255) << 24 | (data[offset + 1] & 255) << 16 |
            (data[offset + 2] & 255) << 8 | (data[offset + 3] & 255);
    }
}
