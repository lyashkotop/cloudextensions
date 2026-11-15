.class public final Lcom/streambundleextra/ExtractorBridge;
.super Ljava/lang/Object;
.source "ExtractorBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundleextra/ExtractorBridge$State;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static finish(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 13

    .line 14
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move-object v5, p5

    invoke-static/range {v0 .. v6}, Lcom/streambundleextra/ExtractorBridge;->finish(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/coroutines/Continuation;Lcom/streambundleextra/VideoBundleSite;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static finish(Lcom/streambundlehtml/nodes/Document;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/coroutines/Continuation;Lcom/streambundleextra/VideoBundleSite;)Ljava/lang/Object;
    .registers 19

    .line 17
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 18
    const-string v1, "iframe[src], iframe[data-src], .player a[href], .video-player a[href]"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_58

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 19
    const-string v3, "data-src"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2b

    const-string v3, "src"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2c

    :cond_2b
    goto :goto_2e

    :cond_2c
    const-string v3, "href"

    :goto_2e
    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 20
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/streambundleextra/MediaFix;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 21
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_57

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_57

    invoke-static {v2}, Lcom/streambundleextra/MediaFix;->isDirect(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_57

    const-string v3, "(?i).*(?:doubleclick|trafficjunky|exoclick|tsyndicate|googletagmanager|ads\\.).*"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_57

    invoke-virtual {v0, v2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 22
    :cond_57
    goto :goto_f

    .line 23
    :cond_58
    new-instance v4, Lcom/streambundleextra/ExtractorBridge$State;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v6, p1

    move-object v7, p2

    move-object v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p6

    invoke-direct/range {v4 .. v11}, Lcom/streambundleextra/ExtractorBridge$State;-><init>(Ljava/util/List;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;ZLkotlin/coroutines/Continuation;Lcom/streambundleextra/VideoBundleSite;)V

    const/4 p0, 0x0

    invoke-virtual {v4, p0}, Lcom/streambundleextra/ExtractorBridge$State;->advance(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
