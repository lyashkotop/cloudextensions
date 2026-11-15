.class Lcom/streambundlehtml/internal/StringUtil$1;
.super Ljava/lang/ThreadLocal;
.source "StringUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/internal/StringUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Ljava/util/Stack<",
        "Ljava/lang/StringBuilder;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 338
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .registers 2

    .line 338
    invoke-virtual {p0}, Lcom/streambundlehtml/internal/StringUtil$1;->initialValue()Ljava/util/Stack;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/util/Stack;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Stack<",
            "Ljava/lang/StringBuilder;",
            ">;"
        }
    .end annotation

    .line 341
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    return-object v0
.end method
