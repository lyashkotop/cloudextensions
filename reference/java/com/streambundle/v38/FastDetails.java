package com.streambundle.v38;

import java.util.List;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;

public final class FastDetails {
    private FastDetails() {}

    public static void remember(Object response) {}
    public static void warm(Object provider, List<?> results) {}

    public static Object open(Object provider, String url, Continuation<Object> completion) throws Throwable {
        Continuation<Object> callback = new Continuation<Object>() {
            @Override public CoroutineContext getContext() {
                return completion.getContext();
            }

            @Override public void resumeWith(Object result) {
                enrich(provider, url, result);
                completion.resumeWith(result);
            }
        };
        Object result = Screening.invoke(provider, "detailUnscreened",
            new Class<?>[]{String.class, Continuation.class}, url, callback);
        if (result != IntrinsicsKt.getCOROUTINE_SUSPENDED()) enrich(provider, url, result);
        return result;
    }

    private static void enrich(Object provider, String url, Object result) {
        if (!(result instanceof com.lagradost.cloudstream3.LoadResponse)) return;
        SearchAndPosters.reusePoster(result);
        DetailMetadata.enrich(result);
        QuickSearch.recommendations(provider, url, result);
    }
}
