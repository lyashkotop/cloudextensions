.class public final Lcom/streambundleextra/LinkResolver;
.super Ljava/lang/Object;
.source "LinkResolver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundleextra/LinkResolver$State;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static load(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 11

    .line 9
    new-instance v0, Lcom/streambundleextra/LinkResolver$State;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/streambundleextra/LinkResolver$State;-><init>(Lcom/streambundleextra/VideoBundleSite;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)V

    invoke-virtual {v0}, Lcom/streambundleextra/LinkResolver$State;->start()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
