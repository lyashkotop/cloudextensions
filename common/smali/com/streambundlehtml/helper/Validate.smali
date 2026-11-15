.class public final Lcom/streambundlehtml/helper/Validate;
.super Ljava/lang/Object;
.source "Validate.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ensureNotNull(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 53
    if-eqz p0, :cond_3

    .line 55
    return-object p0

    .line 54
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const-string v1, "Object must not be null"

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static varargs ensureNotNull(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 68
    if-eqz p0, :cond_3

    .line 70
    return-object p0

    .line 69
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static fail(Ljava/lang/String;)V
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .line 183
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static varargs fail(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 4
    .param p0, "msg"    # Ljava/lang/String;
    .param p1, "args"    # [Ljava/lang/Object;

    .line 193
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isFalse(Z)V
    .registers 3
    .param p0, "val"    # Z

    .line 100
    if-nez p0, :cond_3

    .line 102
    return-void

    .line 101
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const-string v1, "Must be false"

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isFalse(ZLjava/lang/String;)V
    .registers 3
    .param p0, "val"    # Z
    .param p1, "msg"    # Ljava/lang/String;

    .line 111
    if-nez p0, :cond_3

    .line 113
    return-void

    .line 112
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isTrue(Z)V
    .registers 3
    .param p0, "val"    # Z

    .line 79
    if-eqz p0, :cond_3

    .line 81
    return-void

    .line 80
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const-string v1, "Must be true"

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static isTrue(ZLjava/lang/String;)V
    .registers 3
    .param p0, "val"    # Z
    .param p1, "msg"    # Ljava/lang/String;

    .line 90
    if-eqz p0, :cond_3

    .line 92
    return-void

    .line 91
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static noNullElements([Ljava/lang/Object;)V
    .registers 2
    .param p0, "objects"    # [Ljava/lang/Object;

    .line 121
    const-string v0, "Array must not contain any null objects"

    invoke-static {p0, v0}, Lcom/streambundlehtml/helper/Validate;->noNullElements([Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    return-void
.end method

.method public static noNullElements([Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p0, "objects"    # [Ljava/lang/Object;
    .param p1, "msg"    # Ljava/lang/String;

    .line 131
    array-length v0, p0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_11

    aget-object v2, p0, v1

    .line 132
    .local v2, "obj":Ljava/lang/Object;
    if-eqz v2, :cond_b

    .line 131
    .end local v2    # "obj":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 133
    .restart local v2    # "obj":Ljava/lang/Object;
    :cond_b
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    .end local v2    # "obj":Ljava/lang/Object;
    :cond_11
    return-void
.end method

.method public static notEmpty(Ljava/lang/String;)V
    .registers 3
    .param p0, "string"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 142
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_9

    .line 144
    return-void

    .line 143
    :cond_9
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const-string v1, "String must not be empty"

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmpty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p0, "string"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "msg"    # Ljava/lang/String;

    .line 164
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_9

    .line 166
    return-void

    .line 165
    :cond_9
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notEmptyParam(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .param p0, "string"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "param"    # Ljava/lang/String;

    .line 153
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_9

    .line 155
    return-void

    .line 154
    :cond_9
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "The \'%s\' parameter must not be empty."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notNull(Ljava/lang/Object;)V
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    if-eqz p0, :cond_3

    .line 20
    return-void

    .line 19
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const-string v1, "Object must not be null"

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notNull(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "msg"    # Ljava/lang/String;

    .line 41
    if-eqz p0, :cond_3

    .line 43
    return-void

    .line 42
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static notNullParam(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 5
    .param p0, "obj"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "param"    # Ljava/lang/String;

    .line 30
    if-eqz p0, :cond_3

    .line 32
    return-void

    .line 31
    :cond_3
    new-instance v0, Lcom/streambundlehtml/helper/ValidationException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const-string v2, "The parameter \'%s\' must not be null."

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/helper/ValidationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static wtf(Ljava/lang/String;)V
    .registers 2
    .param p0, "msg"    # Ljava/lang/String;

    .line 174
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
