package com.streambundle;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.*;
import java.util.regex.*;
import org.jsoup.nodes.*;
import org.json.JSONObject;

/** Exact source duration only; never converts a rounded application minute field. */
public final class SourceTiming {
    private static final Map<String, String> TIMES = Collections.synchronizedMap(
        new LinkedHashMap<String, String>(64, .75f, true) {
            protected boolean removeEldestEntry(Map.Entry<String, String> e) { return size() > 1536; }
        });
    private static final Pattern ISO = Pattern.compile("(?i)^P(?:(\\d+)D)?T(?:(\\d+)H)?(?:(\\d+)M)?(?:(\\d+(?:\\.\\d+)?)S)?$");
    private SourceTiming() {}

    private static String key(String url) {
        try {
            return (String) Class.forName("com.streambundle.v38.BundleMetadata").getMethod("key", String.class).invoke(null, url);
        } catch (ReflectiveOperationException | RuntimeException ignored) { return url; }
    }
    private static BigDecimal number(String s) { return s == null ? BigDecimal.ZERO : new BigDecimal(s); }
    public static String parse(String raw) {
        if (raw == null) return "";
        String value = raw.trim();
        try {
            BigDecimal seconds;
            if (value.matches("[0-9]+(?:\\.[0-9]+)?")) seconds = new BigDecimal(value);
            else {
                Matcher m = ISO.matcher(value);
                if (m.matches()) {
                    seconds = number(m.group(1)).multiply(new BigDecimal(86400))
                        .add(number(m.group(2)).multiply(new BigDecimal(3600)))
                        .add(number(m.group(3)).multiply(new BigDecimal(60))).add(number(m.group(4)));
                } else {
                    if (!value.matches("(?:[0-9]+:)?[0-9]{1,2}:[0-9]{2}(?:\\.[0-9]+)?")) return "";
                    String[] p = value.split(":");
                    BigDecimal last = new BigDecimal(p[p.length - 1]);
                    long minutes = Long.parseLong(p[p.length - 2]);
                    if (last.compareTo(new BigDecimal(60)) >= 0 || (p.length == 3 && minutes >= 60)) return "";
                    seconds = last.add(new BigDecimal(minutes).multiply(new BigDecimal(60)));
                    if (p.length == 3) seconds = seconds.add(new BigDecimal(p[0]).multiply(new BigDecimal(3600)));
                }
            }
            if (seconds.signum() <= 0) return "";
            long whole = seconds.setScale(0, RoundingMode.DOWN).longValueExact();
            BigDecimal remainder = seconds.remainder(new BigDecimal(60)).stripTrailingZeros();
            String tail = remainder.toPlainString();
            if (remainder.compareTo(BigDecimal.TEN) < 0) tail = "0" + tail;
            return whole >= 3600 ? String.format(Locale.ROOT, "%d:%02d:", whole / 3600, whole / 60 % 60) + tail
                : String.format(Locale.ROOT, "%02d:", whole / 60) + tail;
        } catch (ArithmeticException | NumberFormatException ignored) { return ""; }
    }
    public static void remember(String url, String raw) {
        String label = parse(raw);
        if (!label.isEmpty()) TIMES.put(key(url), label);
    }
    public static String label(String url) { String v = TIMES.get(key(url)); return v == null ? "" : v; }
    public static void record(Document page, JSONObject video) {
        if (video != null && video.has("duration") && !parse(video.optString("duration")).isEmpty()) {
            remember(page.baseUri(), video.optString("duration")); return;
        }
        for (Element el : page.select("[itemscope][itemtype*=VideoObject] [itemprop=duration],meta[property=video:duration],meta[property=og:video:duration],meta[property=og:duration],meta[itemprop=duration]")) {
            if (el.closest("aside,nav,footer,.related,.recommendations") != null) continue;
            String value = el.hasAttr("content") ? el.attr("content") : el.hasAttr("datetime") ? el.attr("datetime") : el.text();
            if (!parse(value).isEmpty()) { remember(page.baseUri(), value); return; }
        }
    }
}
