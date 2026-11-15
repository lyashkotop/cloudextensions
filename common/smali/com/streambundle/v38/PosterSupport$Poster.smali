.class final Lcom/streambundle/v38/PosterSupport$Poster;
.super Ljava/lang/Object;
.source "PosterSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/PosterSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Poster"
.end annotation


# instance fields
.field final headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final page:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/streambundle/v38/PosterSupport$Poster;->url:Ljava/lang/String;

    .line 35
    iput-object p2, p0, Lcom/streambundle/v38/PosterSupport$Poster;->page:Ljava/lang/String;

    .line 36
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1, p3}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    iput-object p1, p0, Lcom/streambundle/v38/PosterSupport$Poster;->headers:Ljava/util/Map;

    .line 37
    return-void
.end method
