.class final Lcom/streambundle/v48/PlaybackFallback$Target;
.super Ljava/lang/Object;
.source "PlaybackFallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v48/PlaybackFallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Target"
.end annotation


# instance fields
.field final depth:I

.field final media:Z

.field final quality:I

.field final referer:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;IIZ)V
    .registers 6

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 166
    iput-object p1, p0, Lcom/streambundle/v48/PlaybackFallback$Target;->url:Ljava/lang/String;

    .line 167
    iput-object p2, p0, Lcom/streambundle/v48/PlaybackFallback$Target;->referer:Ljava/lang/String;

    .line 168
    iput p3, p0, Lcom/streambundle/v48/PlaybackFallback$Target;->depth:I

    .line 169
    iput p4, p0, Lcom/streambundle/v48/PlaybackFallback$Target;->quality:I

    .line 170
    iput-boolean p5, p0, Lcom/streambundle/v48/PlaybackFallback$Target;->media:Z

    .line 171
    return-void
.end method
