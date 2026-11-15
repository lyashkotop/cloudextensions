.class public final synthetic Lcom/lagradost/-$$Lambda$VideoHubProvider$Mx_BiALXllB5AfarFDzd1M3XhmY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lorg/json/JSONArray;


# direct methods
.method public synthetic constructor <init>(Lorg/json/JSONArray;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$Mx_BiALXllB5AfarFDzd1M3XhmY;->f$0:Lorg/json/JSONArray;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iget-object v0, p0, Lcom/lagradost/-$$Lambda$VideoHubProvider$Mx_BiALXllB5AfarFDzd1M3XhmY;->f$0:Lorg/json/JSONArray;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, p1}, Lcom/lagradost/VideoHubProvider;->lambda$Mx_BiALXllB5AfarFDzd1M3XhmY(Lorg/json/JSONArray;I)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
