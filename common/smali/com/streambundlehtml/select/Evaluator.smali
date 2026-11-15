.class public abstract Lcom/streambundlehtml/select/Evaluator;
.super Ljava/lang/Object;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/select/Evaluator$MatchText;,
        Lcom/streambundlehtml/select/Evaluator$MatchesWholeOwnText;,
        Lcom/streambundlehtml/select/Evaluator$MatchesWholeText;,
        Lcom/streambundlehtml/select/Evaluator$MatchesOwn;,
        Lcom/streambundlehtml/select/Evaluator$Matches;,
        Lcom/streambundlehtml/select/Evaluator$ContainsOwnText;,
        Lcom/streambundlehtml/select/Evaluator$ContainsData;,
        Lcom/streambundlehtml/select/Evaluator$ContainsWholeOwnText;,
        Lcom/streambundlehtml/select/Evaluator$ContainsWholeText;,
        Lcom/streambundlehtml/select/Evaluator$ContainsText;,
        Lcom/streambundlehtml/select/Evaluator$IndexEvaluator;,
        Lcom/streambundlehtml/select/Evaluator$IsEmpty;,
        Lcom/streambundlehtml/select/Evaluator$IsOnlyOfType;,
        Lcom/streambundlehtml/select/Evaluator$IsOnlyChild;,
        Lcom/streambundlehtml/select/Evaluator$IsRoot;,
        Lcom/streambundlehtml/select/Evaluator$IsFirstChild;,
        Lcom/streambundlehtml/select/Evaluator$IsNthLastOfType;,
        Lcom/streambundlehtml/select/Evaluator$IsNthOfType;,
        Lcom/streambundlehtml/select/Evaluator$IsNthLastChild;,
        Lcom/streambundlehtml/select/Evaluator$IsNthChild;,
        Lcom/streambundlehtml/select/Evaluator$CssNthEvaluator;,
        Lcom/streambundlehtml/select/Evaluator$IsLastOfType;,
        Lcom/streambundlehtml/select/Evaluator$IsFirstOfType;,
        Lcom/streambundlehtml/select/Evaluator$IsLastChild;,
        Lcom/streambundlehtml/select/Evaluator$IndexEquals;,
        Lcom/streambundlehtml/select/Evaluator$IndexGreaterThan;,
        Lcom/streambundlehtml/select/Evaluator$IndexLessThan;,
        Lcom/streambundlehtml/select/Evaluator$AllElements;,
        Lcom/streambundlehtml/select/Evaluator$AttributeKeyPair;,
        Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;,
        Lcom/streambundlehtml/select/Evaluator$AttributeWithValueContaining;,
        Lcom/streambundlehtml/select/Evaluator$AttributeWithValueEnding;,
        Lcom/streambundlehtml/select/Evaluator$AttributeWithValueStarting;,
        Lcom/streambundlehtml/select/Evaluator$AttributeWithValueNot;,
        Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;,
        Lcom/streambundlehtml/select/Evaluator$AttributeStarting;,
        Lcom/streambundlehtml/select/Evaluator$Attribute;,
        Lcom/streambundlehtml/select/Evaluator$Class;,
        Lcom/streambundlehtml/select/Evaluator$Id;,
        Lcom/streambundlehtml/select/Evaluator$TagEndsWith;,
        Lcom/streambundlehtml/select/Evaluator$Tag;
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method


# virtual methods
.method public abstract matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
.end method
