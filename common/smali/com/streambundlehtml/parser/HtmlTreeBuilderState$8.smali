.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$8;
.super Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
.source "HtmlTreeBuilderState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .line 961
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 964
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isCharacter()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 965
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    goto :goto_36

    .line 966
    :cond_e
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEOF()Z

    move-result v0

    if-eqz v0, :cond_26

    .line 967
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 969
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 970
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->originalState()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 971
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 972
    :cond_26
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 974
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 975
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->originalState()Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 977
    :cond_36
    :goto_36
    const/4 v0, 0x1

    return v0
.end method
