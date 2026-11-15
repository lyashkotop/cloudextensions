.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;
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

    .line 980
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method


# virtual methods
.method anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 5
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1079
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1080
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 1081
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 1082
    const/4 v1, 0x0

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->setFosterInserts(Z)V

    .line 1083
    return v0
.end method

.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 11
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 982
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isCharacter()Z

    move-result v0

    if-eqz v0, :cond_26

    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElement()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableFoster:[Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_26

    .line 983
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->newPendingTableCharacters()V

    .line 984
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 985
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InTableText:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 986
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0

    .line 987
    :cond_26
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isComment()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_35

    .line 988
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    .line 989
    return v1

    .line 990
    :cond_35
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isDoctype()Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_40

    .line 991
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 992
    return v2

    .line 993
    :cond_40
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isStartTag()Z

    move-result v0

    const-string v3, "template"

    const-string v4, "table"

    if-eqz v0, :cond_135

    .line 994
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 995
    .local v0, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v5

    .line 996
    .local v5, "name":Ljava/lang/String;
    const-string v6, "caption"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6a

    .line 997
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 998
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertMarkerToFormattingElements()V

    .line 999
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1000
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InCaption:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_12e

    .line 1001
    :cond_6a
    const-string v6, "colgroup"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7f

    .line 1002
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 1003
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1004
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_12e

    .line 1005
    :cond_7f
    const-string v7, "col"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_92

    .line 1006
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 1007
    invoke-virtual {p2, v6}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 1008
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1009
    :cond_92
    sget-object v6, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableToBody:[Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a7

    .line 1010
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 1011
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1012
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    goto/16 :goto_12e

    .line 1013
    :cond_a7
    sget-object v6, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableAddBody:[Ljava/lang/String;

    invoke-static {v5, v6}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_bc

    .line 1014
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->clearStackToTableContext()V

    .line 1015
    const-string v1, "tbody"

    invoke-virtual {p2, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->processStartTag(Ljava/lang/String;)Z

    .line 1016
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1017
    :cond_bc
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_de

    .line 1018
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1019
    invoke-virtual {p2, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_cc

    .line 1020
    return v2

    .line 1022
    :cond_cc
    invoke-virtual {p2, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1023
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    move-result v2

    if-nez v2, :cond_d9

    .line 1025
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1026
    return v1

    .line 1028
    :cond_d9
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    move-result v1

    return v1

    .line 1030
    :cond_de
    sget-object v4, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableToHead:[Ljava/lang/String;

    invoke-static {v5, v4}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_ed

    .line 1031
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v1

    return v1

    .line 1032
    :cond_ed
    const-string v4, "input"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_114

    .line 1033
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->hasAttributes()Z

    move-result v2

    if-eqz v2, :cond_10f

    iget-object v2, v0, Lcom/streambundlehtml/parser/Token$StartTag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    const-string v3, "type"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "hidden"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10f

    .line 1036
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    goto :goto_12e

    .line 1034
    :cond_10f
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1038
    :cond_114
    const-string v4, "form"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_130

    .line 1039
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1040
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->getFormElement()Lcom/streambundlehtml/nodes/FormElement;

    move-result-object v4

    if-nez v4, :cond_12f

    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->onStack(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_12f

    .line 1043
    invoke-virtual {p2, v0, v2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertForm(Lcom/streambundlehtml/parser/Token$StartTag;ZZ)Lcom/streambundlehtml/nodes/FormElement;

    .line 1048
    :goto_12e
    return v1

    .line 1041
    :cond_12f
    return v2

    .line 1046
    :cond_130
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1049
    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    .end local v5    # "name":Ljava/lang/String;
    :cond_135
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEndTag()Z

    move-result v0

    if-eqz v0, :cond_177

    .line 1050
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 1051
    .local v0, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v5

    .line 1053
    .restart local v5    # "name":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_15a

    .line 1054
    invoke-virtual {p2, v5}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->inTableScope(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_153

    .line 1055
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1056
    return v2

    .line 1058
    :cond_153
    invoke-virtual {p2, v4}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->popStackToClose(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    .line 1059
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->resetInsertionMode()Z

    goto :goto_171

    .line 1061
    :cond_15a
    sget-object v4, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;->InTableEndErr:[Ljava/lang/String;

    invoke-static {v5, v4}, Lcom/streambundlehtml/internal/StringUtil;->inSorted(Ljava/lang/String;[Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_166

    .line 1062
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1063
    return v2

    .line 1064
    :cond_166
    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_172

    .line 1065
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 1069
    :goto_171
    return v1

    .line 1067
    :cond_172
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1070
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v5    # "name":Ljava/lang/String;
    :cond_177
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->isEOF()Z

    move-result v0

    if-eqz v0, :cond_189

    .line 1071
    const-string v0, "html"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_188

    .line 1072
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1073
    :cond_188
    return v1

    .line 1075
    :cond_189
    invoke-virtual {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0
.end method
