.class public Lcom/streambundlehtml/nodes/Attribute;
.super Ljava/lang/Object;
.source "Attribute.java"

# interfaces
.implements Ljava/util/Map$Entry;
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;",
        "Ljava/lang/Cloneable;"
    }
.end annotation


# static fields
.field private static final booleanAttributes:[Ljava/lang/String;

.field private static final htmlKeyReplace:Ljava/util/regex/Pattern;

.field private static final htmlKeyValid:Ljava/util/regex/Pattern;

.field private static final xmlKeyReplace:Ljava/util/regex/Pattern;

.field private static final xmlKeyValid:Ljava/util/regex/Pattern;


# instance fields
.field private key:Ljava/lang/String;

.field parent:Lcom/streambundlehtml/nodes/Attributes;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private val:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 31

    .line 19
    const-string v29, "truespeed"

    const-string v30, "typemustmatch"

    const-string v1, "allowfullscreen"

    const-string v2, "async"

    const-string v3, "autofocus"

    const-string v4, "checked"

    const-string v5, "compact"

    const-string v6, "declare"

    const-string v7, "default"

    const-string v8, "defer"

    const-string v9, "disabled"

    const-string v10, "formnovalidate"

    const-string v11, "hidden"

    const-string v12, "inert"

    const-string v13, "ismap"

    const-string v14, "itemscope"

    const-string v15, "multiple"

    const-string v16, "muted"

    const-string v17, "nohref"

    const-string v18, "noresize"

    const-string v19, "noshade"

    const-string v20, "novalidate"

    const-string v21, "nowrap"

    const-string v22, "open"

    const-string v23, "readonly"

    const-string v24, "required"

    const-string v25, "reversed"

    const-string v26, "seamless"

    const-string v27, "selected"

    const-string v28, "sortable"

    filled-new-array/range {v1 .. v30}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Attribute;->booleanAttributes:[Ljava/lang/String;

    .line 150
    const-string v0, "[a-zA-Z_:][-a-zA-Z0-9_:.]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Attribute;->xmlKeyValid:Ljava/util/regex/Pattern;

    .line 151
    const-string v0, "[^-a-zA-Z0-9_:.]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Attribute;->xmlKeyReplace:Ljava/util/regex/Pattern;

    .line 152
    const-string v0, "[^\\x00-\\x1f\\x7f-\\x9f \"\'/=]+"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Attribute;->htmlKeyValid:Ljava/util/regex/Pattern;

    .line 153
    const-string v0, "[\\x00-\\x1f\\x7f-\\x9f \"\'/=]"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/nodes/Attribute;->htmlKeyReplace:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 37
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "val"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "parent"    # Lcom/streambundlehtml/nodes/Attributes;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 48
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 49
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 50
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    .line 51
    iput-object p2, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    .line 52
    iput-object p3, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    .line 53
    return-void
.end method

.method public static createFromEncoded(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Attribute;
    .registers 5
    .param p0, "unencodedKey"    # Ljava/lang/String;
    .param p1, "encodedValue"    # Ljava/lang/String;

    .line 184
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/streambundlehtml/nodes/Entities;->unescape(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "value":Ljava/lang/String;
    new-instance v1, Lcom/streambundlehtml/nodes/Attribute;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lcom/streambundlehtml/nodes/Attribute;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Attributes;)V

    return-object v1
.end method

.method public static getValidKey(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;)Ljava/lang/String;
    .registers 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "syntax"    # Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 157
    sget-object v0, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->xml:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    const/4 v1, 0x0

    const-string v2, ""

    if-ne p1, v0, :cond_2b

    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->xmlKeyValid:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_2b

    .line 158
    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->xmlKeyReplace:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 159
    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->xmlKeyValid:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_2a

    move-object v1, p0

    :cond_2a
    return-object v1

    .line 161
    :cond_2b
    sget-object v0, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->html:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    if-ne p1, v0, :cond_53

    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->htmlKeyValid:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-nez v0, :cond_53

    .line 162
    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->htmlKeyReplace:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 163
    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->htmlKeyValid:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    if-eqz v0, :cond_52

    move-object v1, p0

    :cond_52
    return-object v1

    .line 165
    :cond_53
    return-object p0
.end method

.method protected static html(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "accum"    # Ljava/lang/Appendable;
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    invoke-virtual {p3}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/streambundlehtml/nodes/Attribute;->getValidKey(Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;)Ljava/lang/String;

    move-result-object p0

    .line 136
    if-nez p0, :cond_b

    return-void

    .line 137
    :cond_b
    invoke-static {p0, p1, p2, p3}, Lcom/streambundlehtml/nodes/Attribute;->htmlNoValidate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 138
    return-void
.end method

.method static htmlNoValidate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 12
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "accum"    # Ljava/lang/Appendable;
    .param p3, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 142
    invoke-interface {p2, p0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 143
    invoke-static {p0, p1, p3}, Lcom/streambundlehtml/nodes/Attribute;->shouldCollapseAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z

    move-result v0

    if-nez v0, :cond_21

    .line 144
    const-string v0, "=\""

    invoke-interface {p2, v0}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 145
    invoke-static {p1}, Lcom/streambundlehtml/nodes/Attributes;->checkNotNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object v1, p2

    move-object v3, p3

    .end local p2    # "accum":Ljava/lang/Appendable;
    .end local p3    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .local v1, "accum":Ljava/lang/Appendable;
    .local v3, "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    invoke-static/range {v1 .. v7}, Lcom/streambundlehtml/nodes/Entities;->escape(Ljava/lang/Appendable;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;ZZZZ)V

    .line 146
    const/16 p2, 0x22

    invoke-interface {v1, p2}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;

    goto :goto_23

    .line 143
    .end local v1    # "accum":Ljava/lang/Appendable;
    .end local v3    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local p2    # "accum":Ljava/lang/Appendable;
    .restart local p3    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :cond_21
    move-object v1, p2

    move-object v3, p3

    .line 148
    .end local p2    # "accum":Ljava/lang/Appendable;
    .end local p3    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .restart local v1    # "accum":Ljava/lang/Appendable;
    .restart local v3    # "out":Lcom/streambundlehtml/nodes/Document$OutputSettings;
    :goto_23
    return-void
.end method

.method public static isBooleanAttribute(Ljava/lang/String;)Z
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .line 217
    sget-object v0, Lcom/streambundlehtml/nodes/Attribute;->booleanAttributes:[Ljava/lang/String;

    invoke-static {p0}, Lcom/streambundlehtml/internal/Normalizer;->lowerCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0
.end method

.method protected static isDataAttribute(Ljava/lang/String;)Z
    .registers 3
    .param p0, "key"    # Ljava/lang/String;

    .line 193
    const-string v0, "data-"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_14

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le v1, v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method protected static shouldCollapseAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z
    .registers 5
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "val"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 208
    nop

    .line 209
    invoke-virtual {p2}, Lcom/streambundlehtml/nodes/Document$OutputSettings;->syntax()Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    move-result-object v0

    sget-object v1, Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;->html:Lcom/streambundlehtml/nodes/Document$OutputSettings$Syntax;

    if-ne v0, v1, :cond_1f

    if-eqz p1, :cond_1d

    .line 210
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17

    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    :cond_17
    invoke-static {p0}, Lcom/streambundlehtml/nodes/Attribute;->isBooleanAttribute(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f

    :cond_1d
    const/4 v0, 0x1

    goto :goto_20

    :cond_1f
    const/4 v0, 0x0

    .line 208
    :goto_20
    return v0
.end method


# virtual methods
.method public clone()Lcom/streambundlehtml/nodes/Attribute;
    .registers 3

    .line 239
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/nodes/Attribute;
    :try_end_6
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_6} :catch_7

    return-object v0

    .line 240
    :catch_7
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 18
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attribute;->clone()Lcom/streambundlehtml/nodes/Attribute;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .param p1, "o"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 222
    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    .line 223
    :cond_4
    const/4 v1, 0x0

    if-eqz p1, :cond_3b

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_3b

    .line 224
    move-object v2, p1

    check-cast v2, Lcom/streambundlehtml/nodes/Attribute;

    .line 225
    .local v2, "attribute":Lcom/streambundlehtml/nodes/Attribute;
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    if-eqz v3, :cond_23

    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    iget-object v4, v2, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    goto :goto_27

    :cond_23
    iget-object v3, v2, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    if-eqz v3, :cond_28

    :goto_27
    return v1

    .line 226
    :cond_28
    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    if-eqz v3, :cond_35

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    iget-object v1, v2, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_3a

    :cond_35
    iget-object v3, v2, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    if-eqz v3, :cond_3a

    const/4 v0, 0x0

    :cond_3a
    :goto_3a
    return v0

    .line 223
    .end local v2    # "attribute":Lcom/streambundlehtml/nodes/Attribute;
    :cond_3b
    return v1
.end method

.method public bridge synthetic getKey()Ljava/lang/Object;
    .registers 2

    .line 18
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attribute;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .line 61
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .registers 2

    .line 18
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .registers 2

    .line 86
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attributes;->checkNotNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hasDeclaredValue()Z
    .registers 2

    .line 94
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public hashCode()I
    .registers 5

    .line 231
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    .line 232
    .local v0, "result":I
    :goto_d
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    if-eqz v3, :cond_19

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_19
    add-int/2addr v2, v1

    .line 233
    .end local v0    # "result":I
    .local v2, "result":I
    return v2
.end method

.method public html()Ljava/lang/String;
    .registers 4

    .line 120
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 123
    .local v0, "sb":Ljava/lang/StringBuilder;
    :try_start_4
    new-instance v1, Lcom/streambundlehtml/nodes/Document;

    const-string v2, ""

    invoke-direct {v1, v2}, Lcom/streambundlehtml/nodes/Document;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Document;->outputSettings()Lcom/streambundlehtml/nodes/Document$OutputSettings;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/nodes/Attribute;->html(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_12} :catch_18

    .line 126
    nop

    .line 127
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 124
    :catch_18
    move-exception v1

    .line 125
    .local v1, "exception":Ljava/io/IOException;
    new-instance v2, Lcom/streambundlehtml/SerializationException;

    invoke-direct {v2, v1}, Lcom/streambundlehtml/SerializationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method protected html(Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V
    .registers 5
    .param p1, "accum"    # Ljava/lang/Appendable;
    .param p2, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 131
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    invoke-static {v0, v1, p1, p2}, Lcom/streambundlehtml/nodes/Attribute;->html(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Appendable;Lcom/streambundlehtml/nodes/Document$OutputSettings;)V

    .line 132
    return-void
.end method

.method protected isDataAttribute()Z
    .registers 2

    .line 189
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attribute;->isDataAttribute(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public setKey(Ljava/lang/String;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;

    .line 69
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notNull(Ljava/lang/Object;)V

    .line 70
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 71
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 72
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v0, :cond_1f

    .line 73
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v0

    .line 74
    .local v0, "i":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1f

    .line 75
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v1, v1, Lcom/streambundlehtml/nodes/Attributes;->keys:[Ljava/lang/String;

    aput-object p1, v1, v0

    .line 77
    .end local v0    # "i":I
    :cond_1f
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/streambundlehtml/nodes/Attribute;->setValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "val"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 103
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    .line 104
    .local v0, "oldVal":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    if-eqz v1, :cond_1f

    .line 105
    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/nodes/Attributes;->indexOfKey(Ljava/lang/String;)I

    move-result v1

    .line 106
    .local v1, "i":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1f

    .line 107
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v3, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/nodes/Attributes;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 108
    iget-object v2, p0, Lcom/streambundlehtml/nodes/Attribute;->parent:Lcom/streambundlehtml/nodes/Attributes;

    iget-object v2, v2, Lcom/streambundlehtml/nodes/Attributes;->vals:[Ljava/lang/Object;

    aput-object p1, v2, v1

    .line 111
    .end local v1    # "i":I
    :cond_1f
    iput-object p1, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    .line 112
    invoke-static {v0}, Lcom/streambundlehtml/nodes/Attributes;->checkNotNull(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected final shouldCollapseAttribute(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z
    .registers 4
    .param p1, "out"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 203
    iget-object v0, p0, Lcom/streambundlehtml/nodes/Attribute;->key:Ljava/lang/String;

    iget-object v1, p0, Lcom/streambundlehtml/nodes/Attribute;->val:Ljava/lang/String;

    invoke-static {v0, v1, p1}, Lcom/streambundlehtml/nodes/Attribute;->shouldCollapseAttribute(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/nodes/Document$OutputSettings;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 174
    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Attribute;->html()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
