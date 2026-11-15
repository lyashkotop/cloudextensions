.class public final Lcom/streambundleextra/YouJizzProvider;
.super Lcom/streambundleextra/VideoBundleSite;
.source "YouJizzProvider.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "31. YouJizz"

    const-string v1, "https://www.youjizz.com"

    invoke-direct {p0, v0, v1}, Lcom/streambundleextra/VideoBundleSite;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "en"

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundleSite;->setLang(Ljava/lang/String;)V

    return-void
.end method
