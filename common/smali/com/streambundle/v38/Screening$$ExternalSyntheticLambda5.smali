.class public final synthetic Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/streambundle/v38/Screening$Operation;


# instance fields
.field public final synthetic f$0:Ljava/lang/Object;

.field public final synthetic f$1:I

.field public final synthetic f$2:Lcom/lagradost/cloudstream3/MainPageRequest;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;ILcom/lagradost/cloudstream3/MainPageRequest;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;->f$0:Ljava/lang/Object;

    iput p2, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;->f$1:I

    iput-object p3, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;->f$2:Lcom/lagradost/cloudstream3/MainPageRequest;

    return-void
.end method


# virtual methods
.method public final call(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 5

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;->f$0:Ljava/lang/Object;

    iget v1, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;->f$1:I

    iget-object v2, p0, Lcom/streambundle/v38/Screening$$ExternalSyntheticLambda5;->f$2:Lcom/lagradost/cloudstream3/MainPageRequest;

    invoke-static {v0, v1, v2, p1}, Lcom/streambundle/v38/Screening;->lambda$3(Ljava/lang/Object;ILcom/lagradost/cloudstream3/MainPageRequest;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
