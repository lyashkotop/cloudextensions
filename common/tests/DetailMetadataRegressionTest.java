package com.streambundle.v38;

import java.lang.reflect.*;
import java.util.*;

/** Executes the edited DetailMetadata source; Android adapter methods are test doubles. */
public final class DetailMetadataRegressionTest {
    public static final class TestLoadResponse {
        String url = "https://example.test/video/retained-tags";
        String name = "Short…";
        String plot = "";
        List<String> tags = new ArrayList<>(Arrays.asList("Coast", "Walking"));
        public String getUrl() { return url; }
        public String getName() { return name; }
        public void setName(String n) { name = n; }
        public String getPlot() { return plot; }
        public void setPlot(String p) { plot = p; }
        public List<String> getTags() { return tags; }
        public void setTags(List<String> t) { tags = t; }
        public Integer getDuration() { return 3; }
    }
    public static void main(String[] args) throws Exception {
        Class<?> info = Class.forName("com.streambundle.v38.DetailMetadata$Info");
        Constructor<?> make = info.getDeclaredConstructor(String.class, String.class, Set.class);
        make.setAccessible(true);
        Field field = DetailMetadata.class.getDeclaredField("VIDEO");
        field.setAccessible(true);
        Map pages = (Map) field.get(null);
        TestLoadResponse response = new TestLoadResponse();
        String fullTitle = String.join(" ", Collections.nCopies(100, "Complete source title"));
        String source = "The source describes a walking route along the coast.";
        pages.put(response.url, make.newInstance(fullTitle, source, new LinkedHashSet<>(Arrays.asList("Coast", "Walking"))));
        com.streambundle.SourceTiming.remember(response.url, "PT3M5S");
        DetailMetadata.enrich(response);
        if (!response.tags.equals(Arrays.asList("Coast", "Walking"))) throw new AssertionError("Source-provided labels lost");
        if (!response.name.equals(fullTitle)) throw new AssertionError("Full title clipped");
        if (!response.plot.endsWith(source)) throw new AssertionError("Source description lost");
        if (!response.plot.startsWith("Длительность: 03:05\n\n")) throw new AssertionError("Missing metadata header");
        String once = response.plot;
        DetailMetadata.enrich(response);
        if (!response.plot.equals(once)) throw new AssertionError("Repeated enrichment duplicates header");
        pages.put(response.url, make.newInstance(fullTitle, source, new LinkedHashSet<>(Arrays.asList("trail-running"))));
        DetailMetadata.enrich(response);
        if (!response.tags.equals(Arrays.asList("trail-running"))) throw new AssertionError("Source tag spelling changed");
        response.tags.clear();
        pages.put(response.url, make.newInstance(fullTitle, "", Collections.emptySet()));
        response.plot = "";
        DetailMetadata.enrich(response);
        if (!response.tags.isEmpty()) throw new AssertionError("Tags manufactured");
        if (!response.plot.equals("Длительность: 03:05")) throw new AssertionError("Unknown description should not be fabricated");
        System.out.println("PASS 8 DetailMetadata regression checks; Android adapters substituted, no provider runtime claims.");
    }
}
