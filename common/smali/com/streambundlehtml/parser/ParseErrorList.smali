.class public Lcom/streambundlehtml/parser/ParseErrorList;
.super Ljava/util/ArrayList;
.source "ParseErrorList.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/streambundlehtml/parser/ParseError;",
        ">;"
    }
.end annotation


# static fields
.field private static final INITIAL_CAPACITY:I = 0x10


# instance fields
.field private final initialCapacity:I

.field private final maxSize:I


# direct methods
.method constructor <init>(II)V
    .registers 3
    .param p1, "initialCapacity"    # I
    .param p2, "maxSize"    # I

    .line 16
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(I)V

    .line 17
    iput p1, p0, Lcom/streambundlehtml/parser/ParseErrorList;->initialCapacity:I

    .line 18
    iput p2, p0, Lcom/streambundlehtml/parser/ParseErrorList;->maxSize:I

    .line 19
    return-void
.end method

.method constructor <init>(Lcom/streambundlehtml/parser/ParseErrorList;)V
    .registers 4
    .param p1, "copy"    # Lcom/streambundlehtml/parser/ParseErrorList;

    .line 26
    iget v0, p1, Lcom/streambundlehtml/parser/ParseErrorList;->initialCapacity:I

    iget v1, p1, Lcom/streambundlehtml/parser/ParseErrorList;->maxSize:I

    invoke-direct {p0, v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;-><init>(II)V

    .line 27
    return-void
.end method

.method public static noTracking()Lcom/streambundlehtml/parser/ParseErrorList;
    .registers 2

    .line 38
    new-instance v0, Lcom/streambundlehtml/parser/ParseErrorList;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/streambundlehtml/parser/ParseErrorList;-><init>(II)V

    return-object v0
.end method

.method public static tracking(I)Lcom/streambundlehtml/parser/ParseErrorList;
    .registers 3
    .param p0, "maxSize"    # I

    .line 42
    new-instance v0, Lcom/streambundlehtml/parser/ParseErrorList;

    const/16 v1, 0x10

    invoke-direct {v0, v1, p0}, Lcom/streambundlehtml/parser/ParseErrorList;-><init>(II)V

    return-object v0
.end method


# virtual methods
.method canAddError()Z
    .registers 3

    .line 30
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/ParseErrorList;->size()I

    move-result v0

    iget v1, p0, Lcom/streambundlehtml/parser/ParseErrorList;->maxSize:I

    if-ge v0, v1, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public clone()Ljava/lang/Object;
    .registers 2

    .line 48
    invoke-super {p0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getMaxSize()I
    .registers 2

    .line 34
    iget v0, p0, Lcom/streambundlehtml/parser/ParseErrorList;->maxSize:I

    return v0
.end method
