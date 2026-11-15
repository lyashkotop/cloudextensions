.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$1;
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

    .line 20
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 9
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 22
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    .line 23
    return v1

    .line 24
    :cond_8
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isComment()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 25
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    goto :goto_5d

    .line 26
    :cond_16
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isDoctype()Z

    move-result v0

    if-eqz v0, :cond_5e

    .line 29
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asDoctype()Lcom/streambundlehtml/parser/Token$Doctype;

    move-result-object v0

    .line 30
    .local v0, "d":Lcom/streambundlehtml/parser/Token$Doctype;
    new-instance v2, Lcom/streambundlehtml/nodes/DocumentType;

    iget-object v3, p2, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->settings:Lcom/streambundlehtml/parser/ParseSettings;

    .line 31
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/parser/ParseSettings;->normalizeTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->getPublicIdentifier()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->getSystemIdentifier()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v3, v4, v5}, Lcom/streambundlehtml/nodes/DocumentType;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .local v2, "doctype":Lcom/streambundlehtml/nodes/DocumentType;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->getPubSysKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/DocumentType;->setPubSysKey(Ljava/lang/String;)V

    .line 33
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/streambundlehtml/nodes/Document;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 34
    invoke-virtual {p2, v2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onNodeInserted(Lcom/streambundlehtml/nodes/Node;Lcom/streambundlehtml/parser/Token;)V

    .line 35
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->isForceQuirks()Z

    move-result v3

    if-eqz v3, :cond_57

    .line 36
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v3

    sget-object v4, Lcom/streambundlehtml/nodes/Document$QuirksMode;->quirks:Lcom/streambundlehtml/nodes/Document$QuirksMode;

    invoke-virtual {v3, v4}, Lcom/streambundlehtml/nodes/Document;->quirksMode(Lcom/streambundlehtml/nodes/Document$QuirksMode;)Lcom/streambundlehtml/nodes/Document;

    .line 37
    :cond_57
    sget-object v3, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$1;->BeforeHtml:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 38
    .end local v0    # "d":Lcom/streambundlehtml/parser/Token$Doctype;
    .end local v2    # "doctype":Lcom/streambundlehtml/nodes/DocumentType;
    nop

    .line 43
    :goto_5d
    return v1

    .line 40
    :cond_5e
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$1;->BeforeHtml:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 41
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method
