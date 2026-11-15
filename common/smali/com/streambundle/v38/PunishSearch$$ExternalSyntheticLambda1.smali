.class public final synthetic Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Lorg/jsoup/nodes/Document;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/nodes/Document;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;->f$2:Lorg/jsoup/nodes/Document;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundle/v38/PunishSearch$$ExternalSyntheticLambda1;->f$2:Lorg/jsoup/nodes/Document;

    check-cast p1, Lcom/lagradost/cloudstream3/MovieSearchResponse;

    invoke-static {v0, v1, v2, p1}, Lcom/streambundle/v38/PunishSearch;->lambda$1(Ljava/lang/String;Ljava/lang/String;Lorg/jsoup/nodes/Document;Lcom/lagradost/cloudstream3/MovieSearchResponse;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method
