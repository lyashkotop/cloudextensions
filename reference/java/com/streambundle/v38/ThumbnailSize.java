package com.streambundle.v38;

public final class ThumbnailSize {
    private ThumbnailSize() {}
    public static String choose(String srcset, String base) {
        if (srcset.isEmpty() || srcset.startsWith("data:")) return "";
        double best = Double.MAX_VALUE;
        String result = "";
        for (String candidate : srcset.split(",")) {
            String[] parts = candidate.trim().split("\\s+");
            String url = BundleMetadata.absolute(base, parts[0]);
            if (!PosterSupport.valid(url)) continue;
            double size = 360;
            if (parts.length > 1 && parts[1].length() > 1) {
                try {
                    String descriptor = parts[1];
                    size = Double.parseDouble(descriptor.substring(0, descriptor.length() - 1));
                    if (descriptor.endsWith("x")) size *= 360;
                } catch (NumberFormatException ignored) {}
            }
            if (size <= 0 || Double.isNaN(size) || Double.isInfinite(size)) continue;
            double score = size >= 320 ? size - 320 : 1000 + 320 - size;
            if (score < best) {
                best = score;
                result = url;
            }
        }
        return result;
    }
}
