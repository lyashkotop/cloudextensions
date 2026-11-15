.class final Lcom/streambundle/v38/ExtraPlayer$Target;
.super Ljava/lang/Object;
.source "ExtraPlayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/ExtraPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Target"
.end annotation


# instance fields
.field final depth:I

.field final media:Z

.field final referer:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ZI)V
    .registers 5

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p1, p0, Lcom/streambundle/v38/ExtraPlayer$Target;->url:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/streambundle/v38/ExtraPlayer$Target;->referer:Ljava/lang/String;

    .line 70
    iput-boolean p3, p0, Lcom/streambundle/v38/ExtraPlayer$Target;->media:Z

    .line 71
    iput p4, p0, Lcom/streambundle/v38/ExtraPlayer$Target;->depth:I

    .line 72
    return-void
.end method
