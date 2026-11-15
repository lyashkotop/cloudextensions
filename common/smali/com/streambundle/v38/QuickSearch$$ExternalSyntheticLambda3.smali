.class public final synthetic Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/streambundle/v38/QuickSearch$State;


# direct methods
.method public synthetic constructor <init>(Lcom/streambundle/v38/QuickSearch$State;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda3;->f$0:Lcom/streambundle/v38/QuickSearch$State;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda3;->f$0:Lcom/streambundle/v38/QuickSearch$State;

    invoke-virtual {v0}, Lcom/streambundle/v38/QuickSearch$State;->expire()V

    return-void
.end method
