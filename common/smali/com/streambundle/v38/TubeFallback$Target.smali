.class final Lcom/streambundle/v38/TubeFallback$Target;
.super Ljava/lang/Object;
.source "TubeFallback.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/TubeFallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Target"
.end annotation


# instance fields
.field final depth:I

.field final referer:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 4

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput-object p1, p0, Lcom/streambundle/v38/TubeFallback$Target;->url:Ljava/lang/String;

    .line 147
    iput-object p2, p0, Lcom/streambundle/v38/TubeFallback$Target;->referer:Ljava/lang/String;

    .line 148
    iput p3, p0, Lcom/streambundle/v38/TubeFallback$Target;->depth:I

    .line 149
    return-void
.end method
