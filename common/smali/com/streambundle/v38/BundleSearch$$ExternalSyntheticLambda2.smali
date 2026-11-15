.class public final synthetic Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/streambundle/v38/BundleSearch$Search;

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/streambundle/v38/BundleSearch$Search;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;->f$0:Lcom/streambundle/v38/BundleSearch$Search;

    iput-object p2, p0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;->f$2:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;->f$0:Lcom/streambundle/v38/BundleSearch$Search;

    iget-object v1, p0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/streambundle/v38/BundleSearch$$ExternalSyntheticLambda2;->f$2:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/streambundle/v38/BundleSearch;->lambda$2(Lcom/streambundle/v38/BundleSearch$Search;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
