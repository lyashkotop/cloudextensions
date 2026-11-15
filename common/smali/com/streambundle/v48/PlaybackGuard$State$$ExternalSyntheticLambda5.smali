.class public final synthetic Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/streambundle/v48/PlaybackGuard$State;

.field public final synthetic f$1:Lcom/lagradost/cloudstream3/utils/ExtractorLink;


# direct methods
.method public synthetic constructor <init>(Lcom/streambundle/v48/PlaybackGuard$State;Lcom/lagradost/cloudstream3/utils/ExtractorLink;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;->f$0:Lcom/streambundle/v48/PlaybackGuard$State;

    iput-object p2, p0, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;->f$1:Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;->f$0:Lcom/streambundle/v48/PlaybackGuard$State;

    iget-object v1, p0, Lcom/streambundle/v48/PlaybackGuard$State$$ExternalSyntheticLambda5;->f$1:Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    invoke-virtual {v0, v1}, Lcom/streambundle/v48/PlaybackGuard$State;->lambda$6$com-streambundle-v48-PlaybackGuard$State(Lcom/lagradost/cloudstream3/utils/ExtractorLink;)V

    return-void
.end method
