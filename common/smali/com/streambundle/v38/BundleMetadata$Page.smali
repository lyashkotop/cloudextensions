.class final Lcom/streambundle/v38/BundleMetadata$Page;
.super Ljava/lang/Object;
.source "BundleMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/BundleMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Page"
.end annotation


# instance fields
.field available:Z

.field description:Ljava/lang/String;

.field ownCategories:Ljava/lang/String;

.field poster:Ljava/lang/String;

.field site:Ljava/lang/String;

.field siteDescription:Ljava/lang/String;

.field siteKeywords:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field title:Ljava/lang/String;

.field videoPage:Z


# direct methods
.method private constructor <init>()V
    .registers 3

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->title:Ljava/lang/String;

    .line 31
    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->poster:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->description:Ljava/lang/String;

    .line 33
    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->ownCategories:Ljava/lang/String;

    .line 34
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v1

    iput-object v1, p0, Lcom/streambundle/v38/BundleMetadata$Page;->siteKeywords:Ljava/util/Set;

    .line 35
    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->siteDescription:Ljava/lang/String;

    .line 37
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/streambundle/v38/BundleMetadata$Page;->available:Z

    .line 38
    iput-object v0, p0, Lcom/streambundle/v38/BundleMetadata$Page;->site:Ljava/lang/String;

    .line 29
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundle/v38/BundleMetadata$Page;)V
    .registers 2

    .line 29
    invoke-direct {p0}, Lcom/streambundle/v38/BundleMetadata$Page;-><init>()V

    return-void
.end method
