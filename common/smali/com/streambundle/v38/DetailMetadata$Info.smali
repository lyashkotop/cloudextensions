.class final Lcom/streambundle/v38/DetailMetadata$Info;
.super Ljava/lang/Object;
.source "DetailMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/DetailMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Info"
.end annotation


# instance fields
.field final description:Ljava/lang/String;

.field final descriptionDeclared:Z

.field final tags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final tagsDeclared:Z

.field final title:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 334
    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/streambundle/v38/DetailMetadata$Info;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;ZZ)V

    .line 335
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;ZZ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;ZZ)V"
        }
    .end annotation

    .line 336
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 337
    iput-boolean p4, p0, Lcom/streambundle/v38/DetailMetadata$Info;->descriptionDeclared:Z

    .line 338
    iput-boolean p5, p0, Lcom/streambundle/v38/DetailMetadata$Info;->tagsDeclared:Z

    .line 339
    iput-object p1, p0, Lcom/streambundle/v38/DetailMetadata$Info;->title:Ljava/lang/String;

    .line 340
    iput-object p2, p0, Lcom/streambundle/v38/DetailMetadata$Info;->description:Ljava/lang/String;

    .line 341
    iput-object p3, p0, Lcom/streambundle/v38/DetailMetadata$Info;->tags:Ljava/util/Set;

    .line 342
    return-void
.end method
