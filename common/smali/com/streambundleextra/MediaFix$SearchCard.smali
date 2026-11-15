.class final Lcom/streambundleextra/MediaFix$SearchCard;
.super Ljava/lang/Object;
.source "MediaFix.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundleextra/MediaFix;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SearchCard"
.end annotation


# instance fields
.field duration:J

.field poster:Ljava/lang/String;

.field title:Ljava/lang/String;

.field url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .registers 6

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundleextra/MediaFix$SearchCard;->url:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundleextra/MediaFix$SearchCard;->title:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundleextra/MediaFix$SearchCard;->poster:Ljava/lang/String;

    iput-wide p4, p0, Lcom/streambundleextra/MediaFix$SearchCard;->duration:J

    return-void
.end method
