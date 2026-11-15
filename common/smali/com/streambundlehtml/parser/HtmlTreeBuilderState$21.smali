.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$21;
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

    .line 1663
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1665
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 1666
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    goto/16 :goto_82

    .line 1667
    :cond_f
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isComment()Z

    move-result v0

    if-eqz v0, :cond_1d

    .line 1668
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    goto :goto_82

    .line 1669
    :cond_1d
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isDoctype()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_28

    .line 1670
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1671
    return v1

    .line 1672
    :cond_28
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    const-string v2, "html"

    if-eqz v0, :cond_45

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 1673
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$21;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0

    .line 1674
    :cond_45
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_5f

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 1675
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$21;->AfterAfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto :goto_82

    .line 1676
    :cond_5f
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    if-eqz v0, :cond_7c

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "noframes"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    .line 1677
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$21;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0

    .line 1678
    :cond_7c
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEOF()Z

    move-result v0

    if-eqz v0, :cond_84

    .line 1684
    :goto_82
    const/4 v0, 0x1

    return v0

    .line 1681
    :cond_84
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1682
    return v1
.end method
