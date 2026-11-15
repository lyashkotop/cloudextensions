.class public final Lcom/streambundleextra/PerdolProvider;
.super Lcom/streambundleextra/VideoBundleSite;
.source "PerdolProvider.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    const-string v0, "29. Perdol.net"

    const-string v1, "https://b.perdol.net"

    invoke-direct {p0, v0, v1}, Lcom/streambundleextra/VideoBundleSite;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ru"

    invoke-virtual {p0, v0}, Lcom/streambundleextra/VideoBundleSite;->setLang(Ljava/lang/String;)V

    return-void
.end method
