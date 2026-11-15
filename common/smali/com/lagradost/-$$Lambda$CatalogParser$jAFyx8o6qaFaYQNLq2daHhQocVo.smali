.class public final synthetic Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lorg/jsoup/nodes/Element;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lorg/jsoup/nodes/Element;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;->f$1:Lorg/jsoup/nodes/Element;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/lagradost/-$$Lambda$CatalogParser$jAFyx8o6qaFaYQNLq2daHhQocVo;->f$1:Lorg/jsoup/nodes/Element;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/lagradost/CatalogParser;->lambda$jAFyx8o6qaFaYQNLq2daHhQocVo(Ljava/lang/String;Lorg/jsoup/nodes/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
