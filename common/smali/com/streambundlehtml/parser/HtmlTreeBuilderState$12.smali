.class final enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;
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

    .line 1153
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V

    return-void
.end method

.method private anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 4
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1213
    const-string v0, "colgroup"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_d

    .line 1214
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1215
    const/4 v0, 0x0

    return v0

    .line 1217
    :cond_d
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 1218
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1219
    invoke-virtual {p2, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;)Z

    .line 1220
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
    .registers 11
    .param p1, "t"    # Lcom/streambundlehtml/parser/Token;
    .param p2, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1155
    # invokes: Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    invoke-static {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->access$100(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_f

    .line 1156
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Character;)V

    .line 1157
    return v1

    .line 1159
    :cond_f
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$25;->$SwitchMap$org$jsoup$parser$Token$TokenType:[I

    iget-object v2, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/Token$TokenType;->ordinal()I

    move-result v2

    aget v0, v0, v2

    const-string v2, "template"

    const-string v3, "html"

    const/4 v4, -0x1

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_c6

    .line 1207
    :pswitch_22
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 1202
    :pswitch_27
    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 1203
    return v1

    .line 1205
    :cond_2e
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v0

    return v0

    .line 1182
    :pswitch_33
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asEndTag()Lcom/streambundlehtml/parser/Token$EndTag;

    move-result-object v0

    .line 1183
    .local v0, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v3

    .line 1184
    .local v3, "name":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_d6

    goto :goto_54

    :sswitch_43
    const-string v2, "colgroup"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_54

    const/4 v4, 0x0

    goto :goto_54

    :sswitch_4d
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_54

    const/4 v4, 0x1

    :cond_54
    :goto_54
    packed-switch v4, :pswitch_data_e0

    .line 1198
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1195
    :pswitch_5c
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 1196
    goto :goto_75

    .line 1186
    :pswitch_62
    invoke-virtual {p2, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->currentElementIs(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_6c

    .line 1187
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1188
    return v5

    .line 1190
    :cond_6c
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->pop()Lcom/streambundlehtml/nodes/Element;

    .line 1191
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1193
    nop

    .line 1200
    :goto_75
    goto :goto_c5

    .line 1167
    .end local v0    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    .end local v3    # "name":Ljava/lang/String;
    :pswitch_76
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asStartTag()Lcom/streambundlehtml/parser/Token$StartTag;

    move-result-object v0

    .line 1168
    .local v0, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->normalName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->hashCode()I

    move-result v7

    sparse-switch v7, :sswitch_data_e8

    goto :goto_9f

    :sswitch_86
    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9f

    const/4 v4, 0x0

    goto :goto_9f

    :sswitch_8e
    const-string v2, "col"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9f

    const/4 v4, 0x1

    goto :goto_9f

    :sswitch_98
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9f

    const/4 v4, 0x2

    :cond_9f
    :goto_9f
    packed-switch v4, :pswitch_data_f6

    .line 1178
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->anythingElse(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z

    move-result v1

    return v1

    .line 1175
    :pswitch_a7
    sget-object v2, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    .line 1176
    goto :goto_b1

    .line 1172
    :pswitch_ad
    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insertEmpty(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1173
    nop

    .line 1180
    :goto_b1
    goto :goto_c5

    .line 1170
    :pswitch_b2
    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p2, p1, v1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)Z

    move-result v1

    return v1

    .line 1164
    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    :pswitch_b9
    invoke-virtual {p2, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->error(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1165
    goto :goto_c5

    .line 1161
    :pswitch_bd
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Token;->asComment()Lcom/streambundlehtml/parser/Token$Comment;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$Comment;)V

    .line 1162
    nop

    .line 1209
    :goto_c5
    return v1

    :pswitch_data_c6
    .packed-switch 0x1
        :pswitch_bd
        :pswitch_b9
        :pswitch_76
        :pswitch_33
        :pswitch_22
        :pswitch_27
    .end packed-switch

    :sswitch_data_d6
    .sparse-switch
        -0x4ec53386 -> :sswitch_4d
        -0x25eb9b01 -> :sswitch_43
    .end sparse-switch

    :pswitch_data_e0
    .packed-switch 0x0
        :pswitch_62
        :pswitch_5c
    .end packed-switch

    :sswitch_data_e8
    .sparse-switch
        -0x4ec53386 -> :sswitch_98
        0x18180 -> :sswitch_8e
        0x3107ab -> :sswitch_86
    .end sparse-switch

    :pswitch_data_f6
    .packed-switch 0x0
        :pswitch_b2
        :pswitch_ad
        :pswitch_a7
    .end packed-switch
.end method
