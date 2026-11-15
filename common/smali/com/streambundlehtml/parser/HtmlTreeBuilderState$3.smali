.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$3;
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

    .line 75
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 7
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 77
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 78
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    goto :goto_6b

    .line 79
    :cond_e
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isComment()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 80
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    goto :goto_6b

    .line 81
    :cond_1c
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isDoctype()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_27

    .line 82
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 83
    return v1

    .line 84
    :cond_27
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    if-eqz v0, :cond_44

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    const-string v2, "html"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 85
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$3;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 86
    :cond_44
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    const-string v2, "head"

    if-eqz v0, :cond_6d

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d

    .line 87
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    .line 88
    .local v0, "head":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setHeadElement(Lcom/streambundlehtml/nodes/Element;)V

    .line 89
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$3;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 90
    .end local v0    # "head":Lcom/streambundlehtml/nodes/Element;
    nop

    .line 100
    :goto_6b
    const/4 v0, 0x1

    return v0

    .line 90
    :cond_6d
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_8b

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->BeforeHtmlToHead:[Ljava/lang/String;

    invoke-static {v0, v3}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8b

    .line 91
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 92
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 93
    :cond_8b
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_95

    .line 94
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 95
    return v1

    .line 97
    :cond_95
    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 98
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method
