.class public final synthetic Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Lokhttp3/HttpUrl;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lokhttp3/HttpUrl;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;->f$1:Lokhttp3/HttpUrl;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundle/v38/QuickSearch$$ExternalSyntheticLambda0;->f$1:Lokhttp3/HttpUrl;

    invoke-static {v0, v1, p1}, Lcom/streambundle/v38/QuickSearch;->lambda$4(Ljava/lang/String;Lokhttp3/HttpUrl;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
