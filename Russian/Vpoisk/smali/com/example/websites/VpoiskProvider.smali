.class public final Lcom/example/websites/VpoiskProvider;
.super Lcom/example/websites/WebVideoProvider;


# direct methods
.method public constructor <init>()V
    .registers 10

    move-object v0, p0

    const-string v1, "vpoisk"

    const-string v2, "https://m.vpoisk.xyz"

    const-string v3, "13. Vpoisk"

    const-string v4, "ru"

    const-string v5, "/"

    const-string v6, ".tuba"

    const-string v7, "a.title[href]"

    const-string v8, ".title"

    invoke-direct/range {v0 .. v8}, Lcom/example/websites/WebVideoProvider;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
