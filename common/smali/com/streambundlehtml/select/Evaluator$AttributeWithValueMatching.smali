.class public final Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AttributeWithValueMatching"
.end annotation


# instance fields
.field key:Ljava/lang/String;

.field pattern:Ljava/util/regex/Pattern;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/regex/Pattern;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "pattern"    # Ljava/util/regex/Pattern;

    .line 284
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 285
    invoke-static {p1}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->key:Ljava/lang/String;

    .line 286
    iput-object p2, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->pattern:Ljava/util/regex/Pattern;

    .line 287
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 5
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 291
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->key:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->pattern:Ljava/util/regex/Pattern;

    iget-object v1, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->key:Ljava/lang/String;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    :goto_1d
    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .line 296
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->key:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v1}, Ljava/util/regex/Pattern;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    const-string v0, "[%s~=%s]"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
