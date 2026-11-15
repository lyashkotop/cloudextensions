.class public Lcom/streambundlehtml/nodes/Entities;
.super Ljava/lang/Object;
.source "Entities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/nodes/Entities$EscapeMode;,
        Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    }
.end annotation


# static fields
.field private static final DefaultOutput:Lcom/streambundlehtml/nodes/Document$OutputSettings;

.field private static final codeDelims:[C

.field static final codepointRadix:I = 0x24

.field private static final empty:I = -0x1

.field private static final emptyName:Ljava/lang/String; = ""

.field private static final multipoints:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 27
    const/4 v0, 0x2

    new-array v0, v0, [C

    fill-array-data v0, :array_18

    sput-object v0, Lcom/streambundlehtml/nodes/Entities;->codeDelims:[C

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/streambundlehtml/nodes/Entities;->multipoints:Ljava/util/HashMap;

    .line 29
    new-instance v0, Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-direct {v0}, Lcom/streambundlehtml/nodes/Document$OutputSettings;-><init>()V

    sput-object v0, Lcom/streambundlehtml/nodes/Entities;->DefaultOutput:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    return-void

    nop

    :array_18
    .array-data 2
        0x2cs
        0x3bs
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    return-void
.end method

.method static synthetic access$000(Lcom/streambundlehtml/nodes/Entities$EscapeMode;Ljava/lang/String;I)V
    .registers 3
    .param p0, "x0"    # Lcom/streambundlehtml/nodes/Entities$EscapeMode;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # I

    .line 23
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/nodes/Entities;->load(Lcom/streambundlehtml/nodes/Entities$EscapeMode;Ljava/lang/String;I)V

    return-void
.end method

.method private static appendEncoded(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Entities$EscapeMode;I)V
    .registers 7
    .param p0, "accum"    # Ljava/lang/Appendable;
    .param p1, "escapeMode"    # Lcom/streambundlehtml/nodes/Entities$EscapeMode;
    .param p2, "codePoint"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 255
    invoke-virtual {p1, p2}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->nameForCodepoint(I)Ljava/lang/String;

    move-result-object v0

    .line 256
    .local v0, "name":Ljava/lang/String;
    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/16 v2, 0x3b

    if-nez v1, :cond_1c

    .line 257
    const/16 v1, 0x26

    invoke-interface {p0, v1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_2d

    .line 259
    :cond_1c
    const-string v1, "&#x"

    invoke-interface {p0, v1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 260
    :goto_2d
    return-void
.end method

.method private static canEncode(Lcom/streambundlehtml/nodes/Entities$CoreCharset;CLjava/nio/charset/CharsetEncoder;)Z
    .registers 5
    .param p0, "charset"    # Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    .param p1, "c"    # C
    .param p2, "fallback"    # Ljava/nio/charset/CharsetEncoder;

    .line 298
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$1;->$SwitchMap$org$jsoup$nodes$Entities$CoreCharset:[I

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Entities$CoreCharset;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_18

    .line 304
    invoke-virtual {p2, p1}, Ljava/nio/charset/CharsetEncoder;->canEncode(C)Z

    move-result v0

    return v0

    .line 302
    :pswitch_11
    return v1

    .line 300
    :pswitch_12
    const/16 v0, 0x80

    if-lt p1, v0, :cond_17

    const/4 v1, 0x0

    :cond_17
    return v1

    :pswitch_data_18
    .packed-switch 0x1
        :pswitch_12
        :pswitch_11
    .end packed-switch
.end method

.method public static codepointsForName(Ljava/lang/String;[I)I
    .registers 7
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "codepoints"    # [I

    .line 119
    sget-object v0, Lcom/streambundlehtml/nodes/Entities;->multipoints:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 120
    .local v0, "val":Ljava/lang/String;
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1a

    .line 121
    invoke-virtual {v0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    aput v3, p1, v2

    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/String;->codePointAt(I)I

    move-result v2

    aput v2, p1, v1

    .line 123
    const/4 v1, 0x2

    return v1

    .line 125
    :cond_1a
    sget-object v3, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->extended:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    invoke-virtual {v3, p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codepointForName(Ljava/lang/String;)I

    move-result v3

    .line 126
    .local v3, "codepoint":I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_26

    .line 127
    aput v3, p1, v2

    .line 128
    return v1

    .line 130
    :cond_26
    return v2
.end method

.method public static escape(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "string"    # Ljava/lang/String;

    .line 160
    sget-object v0, Lcom/streambundlehtml/nodes/Entities;->DefaultOutput:Lcom/streambundlehtml/nodes/Document$OutputSettings;

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Entities;->escape(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static escape(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;)Ljava/lang/String;
    .registers 10
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 141
    if-nez p0, :cond_5

    .line 142
    const-string v0, ""

    return-object v0

    .line 143
    :cond_5
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 145
    .local v1, "accum":Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    move-object v3, p1

    .end local p0    # "string":Ljava/lang/String;
    .end local p1    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .local v2, "string":Ljava/lang/String;
    .local v3, "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :try_start_f
    invoke-static/range {v1 .. v7}, Lcom/streambundlehtml/nodes/Entities;->escape(Ljava/lang/Appendable;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;ZZZZ)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_12} :catch_18

    .line 148
    nop

    .line 149
    invoke-static {v1}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 146
    :catch_18
    move-exception v0

    move-object p0, v0

    .line 147
    .local p0, "e":Ljava/io/IOException;
    new-instance p1, Lcom/streambundlehtml/SerializationException;

    invoke-direct {p1, p0}, Lcom/streambundlehtml/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method static escape(Ljava/lang/Appendable;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;ZZZZ)V
    .registers 19
    .param p0, "accum"    # Ljava/lang/Appendable;
    .param p1, "string"    # Ljava/lang/String;
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .param p3, "inAttribute"    # Z
    .param p4, "normaliseWhite"    # Z
    .param p5, "stripLeadingWhite"    # Z
    .param p6, "trimTrailing"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    const/4 v0, 0x0

    .line 168
    .local v0, "lastWasWhite":Z
    const/4 v1, 0x0

    .line 169
    .local v1, "reachedNonWhite":Z
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->escapeMode()Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    move-result-object v2

    .line 170
    .local v2, "escapeMode":Lcom/streambundlehtml/nodes/Entities$EscapeMode;
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->encoder()Ljava/nio/charset/CharsetEncoder;

    move-result-object v3

    .line 171
    .local v3, "encoder":Ljava/nio/charset/CharsetEncoder;
    iget-object v4, p2, Lcom/streambundlehtml/nodes/Document$OutputSettings;->coreCharset:Lcom/streambundlehtml/nodes/Entities$CoreCharset;

    .line 172
    .local v4, "coreCharset":Lcom/streambundlehtml/nodes/Entities$CoreCharset;
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    .line 175
    .local v5, "length":I
    const/4 v6, 0x0

    .line 176
    .local v6, "skipped":Z
    const/4 v7, 0x0

    .local v7, "offset":I
    :goto_12
    if-ge v7, v5, :cond_bf

    .line 177
    invoke-virtual {p1, v7}, Ljava/lang/String;->codePointAt(I)I

    move-result v8

    .line 179
    .local v8, "codePoint":I
    const/16 v9, 0x20

    if-eqz p4, :cond_3f

    .line 180
    invoke-static {v8}, Lcom/streambundlehtml/internal/StringUtil;->isWhitespace(I)Z

    move-result v10

    if-eqz v10, :cond_37

    .line 181
    if-eqz p5, :cond_28

    if-nez v1, :cond_28

    goto/16 :goto_b8

    .line 182
    :cond_28
    if-eqz v0, :cond_2c

    goto/16 :goto_b8

    .line 183
    :cond_2c
    if-eqz p6, :cond_31

    .line 184
    const/4 v6, 0x1

    .line 185
    goto/16 :goto_b8

    .line 187
    :cond_31
    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 188
    const/4 v0, 0x1

    .line 189
    goto/16 :goto_b8

    .line 191
    :cond_37
    const/4 v0, 0x0

    .line 192
    const/4 v1, 0x1

    .line 193
    if-eqz v6, :cond_3f

    .line 194
    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 195
    const/4 v6, 0x0

    .line 200
    :cond_3f
    const/high16 v10, 0x10000

    if-ge v8, v10, :cond_a2

    .line 201
    int-to-char v10, v8

    .line 203
    .local v10, "c":C
    sparse-switch v10, :sswitch_data_c0

    .line 239
    if-lt v10, v9, :cond_9e

    invoke-static {v4, v10, v3}, Lcom/streambundlehtml/nodes/Entities;->canEncode(Lcom/streambundlehtml/nodes/Entities$CoreCharset;CLjava/nio/charset/CharsetEncoder;)Z

    move-result v9

    if-nez v9, :cond_9a

    goto :goto_9e

    .line 208
    :sswitch_50
    sget-object v9, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->xhtml:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    if-eq v2, v9, :cond_5a

    .line 209
    const-string v9, "&nbsp;"

    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_a1

    .line 211
    :cond_5a
    const-string v9, "&#xa0;"

    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 212
    goto :goto_a1

    .line 221
    :sswitch_60
    if-nez p3, :cond_68

    .line 222
    const-string v9, "&gt;"

    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_a1

    .line 224
    :cond_68
    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 225
    goto :goto_a1

    .line 215
    :sswitch_6c
    if-eqz p3, :cond_7e

    sget-object v9, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->xhtml:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    if-eq v2, v9, :cond_7e

    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v9

    sget-object v11, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->xml:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    if-eq v9, v11, :cond_7e

    .line 218
    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 219
    goto :goto_a1

    .line 216
    :cond_7e
    const-string v9, "&lt;"

    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_a1

    .line 205
    :sswitch_84
    const-string v9, "&amp;"

    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 206
    goto :goto_a1

    .line 227
    :sswitch_8a
    if-eqz p3, :cond_92

    .line 228
    const-string v9, "&quot;"

    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_a1

    .line 230
    :cond_92
    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 231
    goto :goto_a1

    .line 236
    :sswitch_96
    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    .line 237
    goto :goto_a1

    .line 242
    :cond_9a
    invoke-interface {p0, v10}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_a1

    .line 240
    :cond_9e
    :goto_9e
    invoke-static {p0, v2, v8}, Lcom/streambundlehtml/nodes/Entities;->appendEncoded(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Entities$EscapeMode;I)V

    .line 244
    .end local v10    # "c":C
    :goto_a1
    goto :goto_b8

    .line 245
    :cond_a2
    new-instance v9, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Character;->toChars(I)[C

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/String;-><init>([C)V

    .line 246
    .local v9, "c":Ljava/lang/String;
    invoke-virtual {v3, v9}, Ljava/nio/charset/CharsetEncoder;->canEncode(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_b5

    .line 247
    invoke-interface {p0, v9}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    goto :goto_b8

    .line 249
    :cond_b5
    invoke-static {p0, v2, v8}, Lcom/streambundlehtml/nodes/Entities;->appendEncoded(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Entities$EscapeMode;I)V

    .line 176
    .end local v9    # "c":Ljava/lang/String;
    :goto_b8
    invoke-static {v8}, Ljava/lang/Character;->charCount(I)I

    move-result v9

    add-int/2addr v7, v9

    goto/16 :goto_12

    .line 252
    .end local v7    # "offset":I
    .end local v8    # "codePoint":I
    :cond_bf
    return-void

    :sswitch_data_c0
    .sparse-switch
        0x9 -> :sswitch_96
        0xa -> :sswitch_96
        0xd -> :sswitch_96
        0x22 -> :sswitch_8a
        0x26 -> :sswitch_84
        0x3c -> :sswitch_6c
        0x3e -> :sswitch_60
        0xa0 -> :sswitch_50
    .end sparse-switch
.end method

.method public static getByName(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p0, "name"    # Ljava/lang/String;

    .line 109
    sget-object v0, Lcom/streambundlehtml/nodes/Entities;->multipoints:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 110
    .local v0, "val":Ljava/lang/String;
    if-eqz v0, :cond_b

    .line 111
    return-object v0

    .line 112
    :cond_b
    sget-object v1, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->extended:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    invoke-virtual {v1, p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codepointForName(Ljava/lang/String;)I

    move-result v1

    .line 113
    .local v1, "codepoint":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_20

    .line 114
    new-instance v2, Ljava/lang/String;

    filled-new-array {v1}, [I

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Ljava/lang/String;-><init>([III)V

    return-object v2

    .line 115
    :cond_20
    const-string v2, ""

    return-object v2
.end method

.method public static isBaseNamedEntity(Ljava/lang/String;)Z
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .line 99
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->base:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    invoke-virtual {v0, p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codepointForName(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public static isNamedEntity(Ljava/lang/String;)Z
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .line 88
    sget-object v0, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->extended:Lcom/streambundlehtml/nodes/Entities$EscapeMode;

    invoke-virtual {v0, p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codepointForName(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method private static load(Lcom/streambundlehtml/nodes/Entities$EscapeMode;Ljava/lang/String;I)V
    .registers 16
    .param p0, "e"    # Lcom/streambundlehtml/nodes/Entities$EscapeMode;
    .param p1, "pointsData"    # Ljava/lang/String;
    .param p2, "size"    # I

    .line 321
    new-array v0, p2, [Ljava/lang/String;

    # setter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->nameKeys:[Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$102(Lcom/streambundlehtml/nodes/Entities$EscapeMode;[Ljava/lang/String;)[Ljava/lang/String;

    .line 322
    new-array v0, p2, [I

    # setter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codeVals:[I
    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$202(Lcom/streambundlehtml/nodes/Entities$EscapeMode;[I)[I

    .line 323
    new-array v0, p2, [I

    # setter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codeKeys:[I
    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$302(Lcom/streambundlehtml/nodes/Entities$EscapeMode;[I)[I

    .line 324
    new-array v0, p2, [Ljava/lang/String;

    # setter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->nameVals:[Ljava/lang/String;
    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$402(Lcom/streambundlehtml/nodes/Entities$EscapeMode;[Ljava/lang/String;)[Ljava/lang/String;

    .line 326
    const/4 v0, 0x0

    .line 327
    .local v0, "i":I
    new-instance v1, Lcom/streambundlehtml/parser/CharacterReader;

    invoke-direct {v1, p1}, Lcom/streambundlehtml/parser/CharacterReader;-><init>(Ljava/lang/String;)V

    .line 329
    .local v1, "reader":Lcom/streambundlehtml/parser/CharacterReader;
    :goto_1a
    :try_start_1a
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_8b

    .line 332
    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v2

    .line 333
    .local v2, "name":Ljava/lang/String;
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 334
    sget-object v4, Lcom/streambundlehtml/nodes/Entities;->codeDelims:[C

    invoke-virtual {v1, v4}, Lcom/streambundlehtml/parser/CharacterReader;->consumeToAny([C)Ljava/lang/String;

    move-result-object v4

    const/16 v5, 0x24

    invoke-static {v4, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v4

    .line 335
    .local v4, "cp1":I
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v6

    .line 336
    .local v6, "codeDelim":C
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 338
    const/16 v7, 0x2c

    if-ne v6, v7, :cond_4f

    .line 339
    const/16 v7, 0x3b

    invoke-virtual {v1, v7}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v7

    .line 340
    .local v7, "cp2":I
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    goto :goto_50

    .line 342
    .end local v7    # "cp2":I
    :cond_4f
    const/4 v7, -0x1

    .line 344
    .restart local v7    # "cp2":I
    :goto_50
    const/16 v8, 0x26

    invoke-virtual {v1, v8}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v8

    .line 345
    .local v8, "indexS":Ljava/lang/String;
    invoke-static {v8, v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v5

    .line 346
    .local v5, "index":I
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 348
    # getter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->nameKeys:[Ljava/lang/String;
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$100(Lcom/streambundlehtml/nodes/Entities$EscapeMode;)[Ljava/lang/String;

    move-result-object v9

    aput-object v2, v9, v0

    .line 349
    # getter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codeVals:[I
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$200(Lcom/streambundlehtml/nodes/Entities$EscapeMode;)[I

    move-result-object v9

    aput v4, v9, v0

    .line 350
    # getter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->codeKeys:[I
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$300(Lcom/streambundlehtml/nodes/Entities$EscapeMode;)[I

    move-result-object v9

    aput v4, v9, v5

    .line 351
    # getter for: Lcom/streambundlehtml/nodes/Entities$EscapeMode;->nameVals:[Ljava/lang/String;
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Entities$EscapeMode;->access$400(Lcom/streambundlehtml/nodes/Entities$EscapeMode;)[Ljava/lang/String;

    move-result-object v9

    aput-object v2, v9, v5

    .line 353
    const/4 v9, -0x1

    if-eq v7, v9, :cond_87

    .line 354
    sget-object v9, Lcom/streambundlehtml/nodes/Entities;->multipoints:Ljava/util/HashMap;

    new-instance v10, Ljava/lang/String;

    filled-new-array {v4, v7}, [I

    move-result-object v11

    const/4 v12, 0x2

    invoke-direct {v10, v11, v3, v12}, Ljava/lang/String;-><init>([III)V

    invoke-virtual {v9, v2, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    :cond_87
    nop

    .end local v2    # "name":Ljava/lang/String;
    .end local v4    # "cp1":I
    .end local v5    # "index":I
    .end local v6    # "codeDelim":C
    .end local v7    # "cp2":I
    .end local v8    # "indexS":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    .line 357
    goto :goto_1a

    .line 359
    :cond_8b
    if-ne v0, p2, :cond_8e

    const/4 v3, 0x1

    :cond_8e
    const-string v2, "Unexpected count of entities loaded"

    invoke-static {v3, v2}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V
    :try_end_93
    .catchall {:try_start_1a .. :try_end_93} :catchall_98

    .line 361
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->close()V

    .line 362
    nop

    .line 363
    return-void

    .line 361
    :catchall_98
    move-exception v2

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->close()V

    .line 362
    throw v2
.end method

.method public static unescape(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "string"    # Ljava/lang/String;

    .line 269
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Entities;->unescape(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static unescape(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 3
    .param p0, "string"    # Ljava/lang/String;
    .param p1, "strict"    # Z

    .line 280
    invoke-static {p0, p1}, Lcom/streambundlehtml/parser/Parser;->unescapeEntities(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
