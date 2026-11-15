.class public Lcom/streambundlehtml/nodes/FormElement;
.super Lcom/streambundlehtml/nodes/Element;
.source "FormElement.java"


# instance fields
.field private final elements:Lcom/streambundlehtml/select/Elements;


# direct methods
.method public constructor <init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 5
    .param p1, "tag"    # Lcom/streambundlehtml/parser/Tag;
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "attributes"    # Lcom/streambundlehtml/nodes/Attributes;

    .line 28
    invoke-direct {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Element;-><init>(Lcom/streambundlehtml/parser/Tag;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 18
    new-instance v0, Lcom/streambundlehtml/select/Elements;

    invoke-direct {v0}, Lcom/streambundlehtml/select/Elements;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/nodes/FormElement;->elements:Lcom/streambundlehtml/select/Elements;

    .line 29
    return-void
.end method


# virtual methods
.method public addElement(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/nodes/FormElement;
    .registers 3
    .param p1, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 45
    iget-object v0, p0, Lcom/streambundlehtml/nodes/FormElement;->elements:Lcom/streambundlehtml/select/Elements;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/select/Elements;->add(Ljava/lang/Object;)Z

    .line 46
    return-object p0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Element;
    .registers 2

    .line 17
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/FormElement;->clone()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v0

    return-object v0
.end method

.method public clone()Lcom/streambundlehtml/nodes/FormElement;
    .registers 2

    .line 123
    invoke-super {p0}, Lcom/streambundlehtml/nodes/Element;->clone()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/FormElement;

    return-object v0
.end method

.method public bridge synthetic clone()Lcom/streambundlehtml/nodes/Node;
    .registers 2

    .line 17
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/FormElement;->clone()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/FormElement;->clone()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v0

    return-object v0
.end method

.method public elements()Lcom/streambundlehtml/select/Elements;
    .registers 2

    .line 36
    iget-object v0, p0, Lcom/streambundlehtml/nodes/FormElement;->elements:Lcom/streambundlehtml/select/Elements;

    return-object v0
.end method

.method public formData()Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/streambundlehtml/Connection$KeyVal;",
            ">;"
        }
    .end annotation

    .line 84
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/streambundlehtml/Connection$KeyVal;>;"
    iget-object v1, p0, Lcom/streambundlehtml/nodes/FormElement;->elements:Lcom/streambundlehtml/select/Elements;

    invoke-virtual {v1}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_cc

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/streambundlehtml/nodes/Element;

    .line 88
    .local v2, "el":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->tag()Lcom/streambundlehtml/parser/Tag;

    move-result-object v3

    invoke-virtual {v3}, Lcom/streambundlehtml/parser/Tag;->isFormSubmittable()Z

    move-result v3

    if-nez v3, :cond_22

    goto :goto_b

    .line 89
    :cond_22
    const-string v3, "disabled"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2b

    goto :goto_b

    .line 90
    :cond_2b
    const-string v3, "name"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 91
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-nez v4, :cond_38

    goto :goto_b

    .line 92
    :cond_38
    const-string v4, "type"

    invoke-virtual {v2, v4}, Lcom/streambundlehtml/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 94
    .local v4, "type":Ljava/lang/String;
    const-string v5, "button"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_47

    goto :goto_b

    .line 96
    :cond_47
    const-string v5, "select"

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_8d

    .line 97
    const-string v5, "option[selected]"

    invoke-virtual {v2, v5}, Lcom/streambundlehtml/nodes/Element;->select(Ljava/lang/String;)Lcom/streambundlehtml/select/Elements;

    move-result-object v5

    .line 98
    .local v5, "options":Lcom/streambundlehtml/select/Elements;
    const/4 v6, 0x0

    .line 99
    .local v6, "set":Z
    invoke-virtual {v5}, Lcom/streambundlehtml/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_5e
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_77

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/streambundlehtml/nodes/Element;

    .line 100
    .local v8, "option":Lcom/streambundlehtml/nodes/Element;
    invoke-virtual {v8}, Lcom/streambundlehtml/nodes/Element;->val()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    const/4 v6, 0x1

    .line 102
    .end local v8    # "option":Lcom/streambundlehtml/nodes/Element;
    goto :goto_5e

    .line 103
    :cond_77
    if-nez v6, :cond_8c

    .line 104
    const-string v7, "option"

    invoke-virtual {v2, v7}, Lcom/streambundlehtml/nodes/Element;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v7

    .line 105
    .local v7, "option":Lcom/streambundlehtml/nodes/Element;
    if-eqz v7, :cond_8c

    .line 106
    invoke-virtual {v7}, Lcom/streambundlehtml/nodes/Element;->val()Ljava/lang/String;

    move-result-object v8

    invoke-static {v3, v8}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 108
    .end local v5    # "options":Lcom/streambundlehtml/select/Elements;
    .end local v6    # "set":Z
    .end local v7    # "option":Lcom/streambundlehtml/nodes/Element;
    :cond_8c
    goto :goto_ca

    :cond_8d
    const-string v5, "checkbox"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a9

    const-string v5, "radio"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_a9

    .line 115
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->val()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_ca

    .line 110
    :cond_a9
    const-string v5, "checked"

    invoke-virtual {v2, v5}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_ca

    .line 111
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->val()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_c0

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Element;->val()Ljava/lang/String;

    move-result-object v5

    goto :goto_c2

    :cond_c0
    const-string v5, "on"

    .line 112
    .local v5, "val":Ljava/lang/String;
    :goto_c2
    invoke-static {v3, v5}, Lcom/streambundlehtml/helper/HttpConnection$KeyVal;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/helper/HttpConnection$KeyVal;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    .end local v5    # "val":Ljava/lang/String;
    nop

    .line 117
    .end local v2    # "el":Lcom/streambundlehtml/nodes/Element;
    .end local v3    # "name":Ljava/lang/String;
    .end local v4    # "type":Ljava/lang/String;
    :cond_ca
    :goto_ca
    goto/16 :goto_b

    .line 118
    :cond_cc
    return-object v0
.end method

.method protected removeChild(Lcom/streambundlehtml/nodes/Node;)V
    .registers 3
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Node;

    .line 51
    invoke-super {p0, p1}, Lcom/streambundlehtml/nodes/Element;->removeChild(Lcom/streambundlehtml/nodes/Node;)V

    .line 52
    iget-object v0, p0, Lcom/streambundlehtml/nodes/FormElement;->elements:Lcom/streambundlehtml/select/Elements;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/select/Elements;->remove(Ljava/lang/Object;)Z

    .line 53
    return-void
.end method

.method public submit()Lcom/streambundlehtml/Connection;
    .registers 7

    .line 66
    const-string v0, "action"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/FormElement;->hasAttr(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/nodes/FormElement;->absUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_11

    :cond_d
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/FormElement;->baseUri()Ljava/lang/String;

    move-result-object v0

    .line 67
    .local v0, "action":Ljava/lang/String;
    :goto_11
    const-string v1, "Could not determine a form action URL for submit. Ensure you set a base URI when parsing."

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    const-string v1, "method"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/FormElement;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "POST"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_27

    .line 69
    sget-object v1, Lcom/streambundlehtml/Connection$Method;->POST:Lcom/streambundlehtml/Connection$Method;

    goto :goto_29

    :cond_27
    sget-object v1, Lcom/streambundlehtml/Connection$Method;->GET:Lcom/streambundlehtml/Connection$Method;

    .line 71
    .local v1, "method":Lcom/streambundlehtml/Connection$Method;
    :goto_29
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/FormElement;->ownerDocument()Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 72
    .local v2, "owner":Lcom/streambundlehtml/nodes/Document;
    if-eqz v2, :cond_38

    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->connection()Lcom/streambundlehtml/Connection;

    move-result-object v3

    invoke-interface {v3}, Lcom/streambundlehtml/Connection;->newRequest()Lcom/streambundlehtml/Connection;

    move-result-object v3

    goto :goto_3c

    :cond_38
    invoke-static {}, Lcom/streambundlehtml/Jsoup;->newSession()Lcom/streambundlehtml/Connection;

    move-result-object v3

    .line 73
    .local v3, "connection":Lcom/streambundlehtml/Connection;
    :goto_3c
    invoke-interface {v3, v0}, Lcom/streambundlehtml/Connection;->url(Ljava/lang/String;)Lcom/streambundlehtml/Connection;

    move-result-object v4

    .line 74
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/FormElement;->formData()Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Lcom/streambundlehtml/Connection;->data(Ljava/util/Collection;)Lcom/streambundlehtml/Connection;

    move-result-object v4

    .line 75
    invoke-interface {v4, v1}, Lcom/streambundlehtml/Connection;->method(Lcom/streambundlehtml/Connection$Method;)Lcom/streambundlehtml/Connection;

    move-result-object v4

    .line 73
    return-object v4
.end method
