.class abstract Lcom/streambundlehtml/parser/Token$Tag;
.super Lcom/streambundlehtml/parser/Token;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Tag"
.end annotation


# static fields
.field private static final MaxAttributes:I = 0x200


# instance fields
.field private final attrName:Ljava/lang/StringBuilder;

.field private attrNameS:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final attrValue:Ljava/lang/StringBuilder;

.field private attrValueS:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field attributes:Lcom/streambundlehtml/nodes/Attributes;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private hasAttrName:Z

.field private hasAttrValue:Z

.field private hasEmptyAttrValue:Z

.field protected normalName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field selfClosing:Z

.field protected tagName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 3

    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/Token;-><init>(Lcom/streambundlehtml/parser/Token$1;)V

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    .line 109
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrName:Z

    .line 111
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    .line 113
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrValue:Z

    .line 114
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasEmptyAttrValue:Z

    .line 116
    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->selfClosing:Z

    return-void
.end method

.method private ensureAttrName()V
    .registers 3

    .line 271
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrName:Z

    .line 273
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    if-eqz v0, :cond_11

    .line 274
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    .line 277
    :cond_11
    return-void
.end method

.method private ensureAttrValue()V
    .registers 3

    .line 280
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrValue:Z

    .line 282
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    if-eqz v0, :cond_11

    .line 283
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    .line 286
    :cond_11
    return-void
.end method


# virtual methods
.method final appendAttributeName(C)V
    .registers 3
    .param p1, "append"    # C

    .line 236
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;->ensureAttrName()V

    .line 237
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    return-void
.end method

.method final appendAttributeName(Ljava/lang/String;)V
    .registers 4
    .param p1, "append"    # Ljava/lang/String;

    .line 225
    const/4 v0, 0x0

    const v1, 0xfffd

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 227
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;->ensureAttrName()V

    .line 228
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_16

    .line 229
    iput-object p1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    goto :goto_1b

    .line 231
    :cond_16
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    :goto_1b
    return-void
.end method

.method final appendAttributeValue(C)V
    .registers 3
    .param p1, "append"    # C

    .line 250
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;->ensureAttrValue()V

    .line 251
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 252
    return-void
.end method

.method final appendAttributeValue(Ljava/lang/String;)V
    .registers 3
    .param p1, "append"    # Ljava/lang/String;

    .line 241
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;->ensureAttrValue()V

    .line 242
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_e

    .line 243
    iput-object p1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    goto :goto_13

    .line 245
    :cond_e
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 247
    :goto_13
    return-void
.end method

.method final appendAttributeValue([C)V
    .registers 3
    .param p1, "append"    # [C

    .line 255
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;->ensureAttrValue()V

    .line 256
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    .line 257
    return-void
.end method

.method final appendAttributeValue([I)V
    .registers 6
    .param p1, "appendCodepoints"    # [I

    .line 260
    invoke-direct {p0}, Lcom/streambundlehtml/parser/Token$Tag;->ensureAttrValue()V

    .line 261
    array-length v0, p1

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_11

    aget v2, p1, v1

    .line 262
    .local v2, "codepoint":I
    iget-object v3, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 261
    .end local v2    # "codepoint":I
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 264
    :cond_11
    return-void
.end method

.method final appendTagName(C)V
    .registers 3
    .param p1, "append"    # C

    .line 220
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method final appendTagName(Ljava/lang/String;)V
    .registers 4
    .param p1, "append"    # Ljava/lang/String;

    .line 214
    const/4 v0, 0x0

    const v1, 0xfffd

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p1

    .line 215
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    if-nez v0, :cond_e

    move-object v0, p1

    goto :goto_14

    :cond_e
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_14
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 216
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundlehtml/parser/ParseSettings;->normalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->normalName:Ljava/lang/String;

    .line 217
    return-void
.end method

.method final finaliseTag()V
    .registers 2

    .line 181
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrName:Z

    if-eqz v0, :cond_7

    .line 182
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$Tag;->newAttribute()V

    .line 184
    :cond_7
    return-void
.end method

.method final hasAttribute(Ljava/lang/String;)Z
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .line 176
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v0, p1}, Lcom/streambundlehtml/nodes/Attributes;->hasKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method final hasAttributes()Z
    .registers 2

    .line 172
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method final isSelfClosing()Z
    .registers 2

    .line 208
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->selfClosing:Z

    return v0
.end method

.method final name(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Tag;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .line 202
    iput-object p1, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 203
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundlehtml/parser/ParseSettings;->normalName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->normalName:Ljava/lang/String;

    .line 204
    return-object p0
.end method

.method final name()Ljava/lang/String;
    .registers 2

    .line 188
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    goto :goto_f

    :cond_e
    const/4 v0, 0x1

    :goto_f
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isFalse(Z)V

    .line 189
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    return-object v0
.end method

.method final newAttribute()V
    .registers 4

    .line 142
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    if-nez v0, :cond_b

    .line 143
    new-instance v0, Lcom/streambundlehtml/nodes/Attributes;

    invoke-direct {v0}, Lcom/streambundlehtml/nodes/Attributes;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 145
    :cond_b
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrName:Z

    if-eqz v0, :cond_57

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Attributes;->size()I

    move-result v0

    const/16 v1, 0x200

    if-ge v0, v1, :cond_57

    .line 147
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-lez v0, :cond_28

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_2a

    :cond_28
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    .line 148
    .local v0, "name":Ljava/lang/String;
    :goto_2a
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_57

    .line 151
    iget-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrValue:Z

    if-eqz v1, :cond_4a

    .line 152
    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_47

    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_49

    :cond_47
    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    .local v1, "value":Ljava/lang/String;
    :goto_49
    goto :goto_52

    .line 153
    .end local v1    # "value":Ljava/lang/String;
    :cond_4a
    iget-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasEmptyAttrValue:Z

    if-eqz v1, :cond_51

    .line 154
    const-string v1, ""

    .restart local v1    # "value":Ljava/lang/String;
    goto :goto_52

    .line 156
    .end local v1    # "value":Ljava/lang/String;
    :cond_51
    const/4 v1, 0x0

    .line 158
    .restart local v1    # "value":Ljava/lang/String;
    :goto_52
    iget-object v2, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    invoke-virtual {v2, v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attributes;

    .line 161
    .end local v0    # "name":Ljava/lang/String;
    .end local v1    # "value":Ljava/lang/String;
    :cond_57
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 162
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    .line 163
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrName:Z

    .line 165
    iget-object v2, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/streambundlehtml/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 166
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    .line 167
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrValue:Z

    .line 168
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasEmptyAttrValue:Z

    .line 169
    return-void
.end method

.method final normalName()Ljava/lang/String;
    .registers 2

    .line 194
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->normalName:Ljava/lang/String;

    return-object v0
.end method

.method reset()Lcom/streambundlehtml/parser/Token$Tag;
    .registers 4

    .line 121
    invoke-super {p0}, Lcom/streambundlehtml/parser/Token;->reset()Lcom/streambundlehtml/parser/Token;

    .line 122
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    .line 123
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->normalName:Ljava/lang/String;

    .line 124
    iget-object v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrName:Ljava/lang/StringBuilder;

    invoke-static {v1}, Lcom/streambundlehtml/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 125
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrNameS:Ljava/lang/String;

    .line 126
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrName:Z

    .line 127
    iget-object v2, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValue:Ljava/lang/StringBuilder;

    invoke-static {v2}, Lcom/streambundlehtml/parser/Token$Tag;->reset(Ljava/lang/StringBuilder;)V

    .line 128
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attrValueS:Ljava/lang/String;

    .line 129
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasEmptyAttrValue:Z

    .line 130
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasAttrValue:Z

    .line 131
    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Token$Tag;->selfClosing:Z

    .line 132
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->attributes:Lcom/streambundlehtml/nodes/Attributes;

    .line 133
    return-object p0
.end method

.method bridge synthetic reset()Lcom/streambundlehtml/parser/Token;
    .registers 2

    .line 103
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$Tag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    return-object v0
.end method

.method final setEmptyAttributeValue()V
    .registers 2

    .line 267
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->hasEmptyAttrValue:Z

    .line 268
    return-void
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method final toStringName()Ljava/lang/String;
    .registers 2

    .line 198
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Tag;->tagName:Ljava/lang/String;

    goto :goto_9

    :cond_7
    const-string v0, "[unset]"

    :goto_9
    return-object v0
.end method
