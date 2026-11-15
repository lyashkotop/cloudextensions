.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$17;
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

    .line 1497
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1499
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    const-string v1, "select"

    if-eqz v0, :cond_26

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InSelectTableEnd:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 1500
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1501
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1502
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    .line 1503
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 1504
    :cond_26
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_5a

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InSelectTableEnd:[Ljava/lang/String;

    invoke-static {v0, v2}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 1505
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1506
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_58

    .line 1507
    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1508
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    .line 1509
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 1511
    :cond_58
    const/4 v0, 0x0

    return v0

    .line 1513
    :cond_5a
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$17;->InSelect:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v0

    return v0
.end method
