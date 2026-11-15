.class final Lcom/videobundle/fixes/MetadataSupport$Entry;
.super Ljava/lang/Object;
.source "MetadataSupport.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/videobundle/fixes/MetadataSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Entry"
.end annotation


# instance fields
.field final doc:Lorg/jsoup/nodes/Document;

.field final expires:J


# direct methods
.method constructor <init>(Lorg/jsoup/nodes/Document;)V
    .registers 6

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lorg/jsoup/nodes/Document;->clone()Lorg/jsoup/nodes/Document;

    move-result-object p1

    iput-object p1, p0, Lcom/videobundle/fixes/MetadataSupport$Entry;->doc:Lorg/jsoup/nodes/Document;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide v2, 0x4a817c800L

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/videobundle/fixes/MetadataSupport$Entry;->expires:J

    return-void
.end method
