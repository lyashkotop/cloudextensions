.class public final synthetic Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:I

.field public final synthetic f$2:Ljava/util/Map;

.field public final synthetic f$3:Lcom/lagradost/cloudstream3/utils/ExtractorLink;

.field public final synthetic f$4:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;ILjava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput p2, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$1:I

    iput-object p3, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$2:Ljava/util/Map;

    iput-object p4, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$3:Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    iput-object p5, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$4:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    .line 0
    iget-object v0, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget v1, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$1:I

    iget-object v2, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$2:Ljava/util/Map;

    iget-object v3, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$3:Lcom/lagradost/cloudstream3/utils/ExtractorLink;

    iget-object v4, p0, Lcom/streambundle/v48/PlaybackLinks$$ExternalSyntheticLambda0;->f$4:Ljava/util/List;

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Lcom/streambundle/v48/PlaybackLinks;->lambda$0(Ljava/lang/String;ILjava/util/Map;Lcom/lagradost/cloudstream3/utils/ExtractorLink;Ljava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
