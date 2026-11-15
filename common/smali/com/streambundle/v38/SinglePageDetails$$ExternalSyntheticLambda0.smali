.class public final synthetic Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic f$0:Ljava/lang/String;

.field public final synthetic f$1:Ljava/util/Map;

.field public final synthetic f$2:J

.field public final synthetic f$3:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/Map;JLjava/util/List;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iput-object p2, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map;

    iput-wide p3, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$2:J

    iput-object p5, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$3:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    .line 0
    iget-object v0, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$0:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$1:Ljava/util/Map;

    iget-wide v2, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$2:J

    iget-object v4, p0, Lcom/streambundle/v38/SinglePageDetails$$ExternalSyntheticLambda0;->f$3:Ljava/util/List;

    move-object v5, p1

    move-object v6, p2

    invoke-static/range {v0 .. v6}, Lcom/streambundle/v38/SinglePageDetails;->lambda$0(Ljava/lang/String;Ljava/util/Map;JLjava/util/List;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
