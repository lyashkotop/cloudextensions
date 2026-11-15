import com.streambundle.SourceTiming;
import org.jsoup.Jsoup;

public final class SourceTimingTest {
    private static int checks;
    private static void expect(String input, String result) {
        checks++;
        if (!SourceTiming.parse(input).equals(result)) throw new AssertionError("Duration parse mismatch: " + input);
    }
    public static void main(String[] args) {
        expect("205", "03:25"); expect("205.5", "03:25.5");
        expect("PT3M25S", "03:25"); expect("PT1H2M3.25S", "1:02:03.25");
        expect("P1DT1H", "25:00:00"); expect("02:03", "02:03");
        expect("1:02:03", "1:02:03"); expect("1:60:03", ""); expect("03:99", "");
        expect("0", ""); expect("-1", ""); expect("3 min", ""); expect(null, "");
        String url = "https://example.test/exact-source";
        SourceTiming.record(Jsoup.parse("<div itemscope itemtype='https://schema.org/VideoObject'><meta itemprop='duration' content='PT4M6S'></div><div class='related'><meta itemprop='duration' content='PT9H'></div>", url), null);
        if (!SourceTiming.label(url).equals("04:06")) throw new AssertionError("Wrong scoped duration");
        System.out.println("PASS " + (checks + 1) + " exact source-duration checks");
    }
}
