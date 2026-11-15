.class final Lcom/streambundle/v48/ResolveMedia$Target;
.super Ljava/lang/Object;
.source "ResolveMedia.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v48/ResolveMedia;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Target"
.end annotation


# instance fields
.field final depth:I

.field final ref:Ljava/lang/String;

.field final url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .registers 4

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v48/ResolveMedia$Target;->url:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundle/v48/ResolveMedia$Target;->ref:Ljava/lang/String;

    iput p3, p0, Lcom/streambundle/v48/ResolveMedia$Target;->depth:I

    return-void
.end method
