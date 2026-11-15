package com.lagradost.nicehttp;

/** Type declaration for JVM reflection only. No network response is simulated. */
public class NiceResponse {
    public String getText() { throw new UnsupportedOperationException(); }
    public String getUrl() { throw new UnsupportedOperationException(); }
}
