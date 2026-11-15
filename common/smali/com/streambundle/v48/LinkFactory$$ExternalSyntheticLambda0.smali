.class public final synthetic Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/util/Map;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ILjava/util/Map;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput p2, p0, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;->f$2:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    .line 0
    iget-object v0, p0, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget v1, p0, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Lcom/streambundle/v48/LinkFactory$$ExternalSyntheticLambda0;->f$2:Ljava/util/Map;

    invoke-static {v0, v1, v2, p1, p2}, Lcom/streambundle/v48/LinkFactory;->lambda$0(Ljava/lang/String;ILjava/util/Map;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
