package com.streambundle.v38;

import java.util.*;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/** Neutral markup uses the same field layout observed on the real Semyana page. */
public final class MetadataSourceSelectionTest {
    public static void main(String[] args) {
        String url = "https://example.test/video/canonical";
        String title = "Complete coastal walking route";
        Document listing = Jsoup.parse("<article class='video-card'><a href='" + url + "' title='" + title + "'><img alt='" + title + "'></a></article>", "https://example.test/");
        DetailMetadata.collect(listing);
        String html = "<title>" + title + " - Site brand</title><meta name='description' content='Generic SEO promotion unrelated to this video'>"
            + "<meta property='video:tag' content='для'><meta property='video:tag' content='ра'>"
            + "<div itemscope itemtype='https://schema.org/VideoObject'><meta itemprop='name' content='Alternative translated source title'>"
            + "<meta itemprop='description' content=''><meta itemprop='duration' content='PT4M5S'>"
            + "<h1 class='video-page-title'>Alternative translated source title</h1>"
            + "<div class='video-taxonomy'><div class='tax-tags'><a>Coastal walks</a><a>City routes</a></div></div></div>";
        DetailMetadata.collectVideo(Jsoup.parse(html, url), true);
        DetailMetadataRegressionTest.TestLoadResponse result = new DetailMetadataRegressionTest.TestLoadResponse();
        result.url = url;
        result.name = title;
        result.plot = "Generic SEO promotion unrelated to this video";
        result.tags = new ArrayList<>(Arrays.asList("для", "ра"));
        DetailMetadata.enrich(result);
        if (!result.name.equals(title)) throw new AssertionError("Chosen listing title changed on open");
        if (!result.tags.equals(Arrays.asList("Coastal walks", "City routes"))) throw new AssertionError("Head word fragments substituted for scoped source labels");
        if (!result.plot.isEmpty()) throw new AssertionError("Exact time missing or SEO used as narrative");
        String emptyTaxonomy = html.replace("<a>Coastal walks</a><a>City routes</a>", "");
        DetailMetadata.collectVideo(Jsoup.parse(emptyTaxonomy, url), true);
        result.tags = new ArrayList<>(Arrays.asList("для", "ра"));
        DetailMetadata.enrich(result);
        if (!result.tags.isEmpty()) throw new AssertionError("Explicitly empty taxonomy repopulated from junk head tags");
        System.out.println("PASS 4 source-field selection regression checks");
    }
}
