.class final Lcom/streambundle/v38/Screening$ProbeContext;
.super Lkotlin/coroutines/AbstractCoroutineContextElement;
.source "Screening.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/Screening;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ProbeContext"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .line 37
    # getter for: Lcom/streambundle/v38/Screening;->PROBE_KEY:Lcom/streambundle/v38/Screening$ProbeKey;
    invoke-static {}, Lcom/streambundle/v38/Screening;->access$0()Lcom/streambundle/v38/Screening$ProbeKey;

    move-result-object v0

    invoke-direct {p0, v0}, Lkotlin/coroutines/AbstractCoroutineContextElement;-><init>(Lkotlin/coroutines/CoroutineContext$Key;)V

    return-void
.end method
