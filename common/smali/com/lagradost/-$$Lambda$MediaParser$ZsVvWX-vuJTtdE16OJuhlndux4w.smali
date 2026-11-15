.class public final synthetic Lcom/lagradost/-$$Lambda$MediaParser$ZsVvWX-vuJTtdE16OJuhlndux4w;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/-$$Lambda$MediaParser$ZsVvWX-vuJTtdE16OJuhlndux4w;->f$0:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lcom/lagradost/-$$Lambda$MediaParser$ZsVvWX-vuJTtdE16OJuhlndux4w;->f$0:Ljava/lang/String;

    check-cast p1, Lkotlin/text/MatchResult;

    invoke-static {v0, p1}, Lcom/lagradost/MediaParser;->lambda$ZsVvWX-vuJTtdE16OJuhlndux4w(Ljava/lang/String;Lkotlin/text/MatchResult;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
