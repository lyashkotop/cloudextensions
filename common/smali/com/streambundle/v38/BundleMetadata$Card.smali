.class final Lcom/streambundle/v38/BundleMetadata$Card;
.super Ljava/lang/Object;
.source "BundleMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/BundleMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Card"
.end annotation


# instance fields
.field headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field poster:Ljava/lang/String;

.field title:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const-string v0, ""

    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Card;->title:Ljava/lang/String;

    .line 26
    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Card;->poster:Ljava/lang/String;

    .line 27
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Card;->headers:Ljava/util/Map;

    .line 24
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundle/v38/BundleMetadata$Card;)V
    .registers 2

    .line 24
    invoke-direct {p0}, Lcom/streambundle/v38/BundleMetadata$Card;-><init>()V

    return-void
.end method
