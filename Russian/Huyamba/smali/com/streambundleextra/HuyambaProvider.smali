.class public final Lcom/streambundleextra/HuyambaProvider;
.super Lcom/streambundleextra/VideoBundleSite;
.source "HuyambaProvider.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "32. Huyamba"

    const-string v1, "https://ru.huyamba.name"

    invoke-direct {p0, v0, v1}, Lcom/streambundleextra/VideoBundleSite;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ru"

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundleSite;->setLang(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public searchOriginal(Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4

    invoke-static/range {p0 .. p2}, Lcom/streambundleextra/HuyambaSupport;->search(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
