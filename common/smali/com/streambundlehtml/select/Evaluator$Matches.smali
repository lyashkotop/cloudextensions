.class public final Lcom/streambundlehtml/select/Evaluator$Matches;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Matches"
.end annotation


# instance fields
.field private final pattern:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/util/regex/Pattern;)V
    .registers 2
    .param p1, "pattern"    # Ljava/util/regex/Pattern;

    .line 778
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 779
    iput-object p1, p0, Lcom/streambundlehtml/select/Evaluator$Matches;->pattern:Ljava/util/regex/Pattern;

    .line 780
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 784
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$Matches;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Element;->text()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 785
    .local v0, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    return v1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 790
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$Matches;->pattern:Ljava/util/regex/Pattern;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, ":matches(%s)"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
