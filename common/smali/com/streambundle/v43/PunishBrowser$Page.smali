.class final Lcom/streambundle/v43/PunishBrowser$Page;
.super Ljava/lang/Object;
.source "PunishBrowser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v43/PunishBrowser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Page"
.end annotation


# instance fields
.field final html:Ljava/lang/String;

.field final time:J

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/streambundle/v43/PunishBrowser$Page;->time:J

    iput-object p1, p0, Lcom/streambundle/v43/PunishBrowser$Page;->url:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundle/v43/PunishBrowser$Page;->html:Ljava/lang/String;

    return-void
.end method
