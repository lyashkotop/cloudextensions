package com.streambundle.v48;

import com.lagradost.cloudstream3.MainAPI;
import com.lagradost.cloudstream3.utils.ExtractorLink;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.*;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.SafeContinuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function1;

public final class PlaybackGuard {
    private static final ExecutorService WORK = Executors.newFixedThreadPool(8, task -> thread(task, "streambundle-playback"));
    private static final ScheduledThreadPoolExecutor TIMER = new ScheduledThreadPoolExecutor(1,
        task -> thread(task, "streambundle-playback-timer"));

    static { TIMER.setRemoveOnCancelPolicy(true); }

    private PlaybackGuard() {}

    private static Thread thread(Runnable task, String name) {
        Thread result = new Thread(task, name);
        result.setDaemon(true);
        return result;
    }

    public static Object load(Object provider, String data, boolean casting, Function1 subtitles,
                              Function1 callback, Continuation<Object> continuation) {
        State state = new State(provider, data, casting, subtitles, callback, continuation);
        state.start();
        return state.result.getOrThrow();
    }

    private static final class State implements Continuation<Object> {
        final Object provider;
        final String data;
        final String name;
        final boolean casting;
        final Function1 subtitles;
        final Function1 callback;
        final Continuation<Object> completion;
        final SafeContinuation<Object> result;
        final Set<String> pendingUrls = new HashSet<>();
        final Set<String> emitted = new HashSet<>();
        boolean originalDone;
        boolean backupStarted;
        boolean backupDone;
        boolean done;
        int pending;
        Throwable error;
        ScheduledFuture<?> delay;
        ScheduledFuture<?> deadline;
        Future<?> backup;

        State(Object provider, String data, boolean casting, Function1 subtitles,
              Function1 callback, Continuation<Object> completion) {
            this.provider = provider;
            this.data = data;
            this.name = provider instanceof MainAPI ? ((MainAPI) provider).getName() : provider.getClass().getSimpleName();
            this.casting = casting;
            this.subtitles = subtitles;
            this.callback = callback;
            this.completion = completion;
            this.result = new SafeContinuation<>(completion);
        }

        void start() {
            deadline = TIMER.schedule(this::expire, 22, TimeUnit.SECONDS);
            delay = TIMER.schedule(this::startBackup, 2800, TimeUnit.MILLISECONDS);
            WORK.execute(this::original);
        }

        private void original() {
            try {
                Function1<ExtractorLink, Unit> emit = this::accept;
                Object value = provider.getClass().getMethod("linksOriginal48", String.class, Boolean.TYPE,
                    Function1.class, Function1.class, Continuation.class)
                    .invoke(provider, data, casting, subtitles, emit, this);
                if (value != IntrinsicsKt.getCOROUTINE_SUSPENDED()) resumeWith(value);
            } catch (Throwable failure) {
                if (failure instanceof InvocationTargetException && failure.getCause() != null) failure = failure.getCause();
                resumeWith(ResultKt.createFailure(failure));
            }
        }

        public CoroutineContext getContext() { return completion.getContext(); }

        @Override
        public synchronized void resumeWith(Object value) {
            if (done) return;
            try {
                ResultKt.throwOnFailure(value);
            } catch (CancellationException cancelled) {
                finish(value);
                return;
            } catch (Throwable failure) {
                error = failure;
            }
            originalDone = true;
            checkDone();
        }

        private synchronized void startBackup() {
            if (done || backupStarted || !emitted.isEmpty()) return;
            backupStarted = true;
            backup = WORK.submit(() -> {
                Throwable failure = null;
                try {
                    PlaybackFallback.resolve(name, data, this::accept);
                } catch (Throwable rejected) {
                    failure = rejected;
                }
                backupFinished(failure);
            });
        }

        private synchronized void backupFinished(Throwable failure) {
            if (done) return;
            if (failure != null) error = failure;
            backupDone = true;
            checkDone();
        }

        private synchronized Unit accept(ExtractorLink link) {
            if (done || link == null || ResolveMedia.unwanted(link.getUrl())) return Unit.INSTANCE;
            String key = link.getUrl() + "\n" + link.getType() + "\n" + link.getQuality();
            if (!pendingUrls.add(key)) return Unit.INSTANCE;
            pending++;
            WORK.execute(() -> {
                try {
                    for (ExtractorLink option : PlaybackLinks.normalize(link)) emit(option);
                } finally {
                    processed();
                }
            });
            return Unit.INSTANCE;
        }

        private synchronized void emit(ExtractorLink option) {
            if (!done && emitted.add(option.getUrl() + "\n" + option.getQuality())) callback.invoke(option);
        }

        private synchronized void processed() {
            pending--;
            if (!done) checkDone();
        }

        private void checkDone() {
            if (pending > 0) return;
            if (!emitted.isEmpty()) {
                if (originalDone && (!backupStarted || backupDone)) finish(Boolean.TRUE);
                return;
            }
            if (originalDone && !backupStarted) startBackup();
            if (originalDone && backupDone) {
                Throwable problem = error instanceof IOException ? error : new IOException(name + ": сайт не вернул доступную видеоссылку", error);
                finish(ResultKt.createFailure(problem));
            }
        }

        private synchronized void expire() {
            if (!done) finish(!emitted.isEmpty() ? Boolean.TRUE :
                ResultKt.createFailure(new IOException(name + ": истекло время ожидания видеоссылок")));
        }

        private void finish(Object value) {
            done = true;
            if (deadline != null) deadline.cancel(false);
            if (delay != null) delay.cancel(false);
            if (backup != null && !backupDone) backup.cancel(true);
            result.resumeWith(value);
        }
    }
}
