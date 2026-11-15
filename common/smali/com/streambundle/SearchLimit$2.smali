.class Lcom/streambundle/SearchLimit$2;
.super Ljava/lang/Object;
.source "SearchLimit.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/streambundle/SearchLimit;->run(Ljava/lang/Object;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$affected:Z

.field private final synthetic val$provider:Ljava/lang/Object;

.field private final synthetic val$state:Lcom/streambundle/SearchLimit$State;


# direct methods
.method constructor <init>(Lcom/streambundle/SearchLimit$State;ZLjava/lang/Object;)V
    .registers 4

    .line 20
    iput-object p1, p0, Lcom/streambundle/SearchLimit$2;->val$state:Lcom/streambundle/SearchLimit$State;

    iput-boolean p2, p0, Lcom/streambundle/SearchLimit$2;->val$affected:Z

    iput-object p3, p0, Lcom/streambundle/SearchLimit$2;->val$provider:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .line 21
    iget-object v0, p0, Lcom/streambundle/SearchLimit$2;->val$state:Lcom/streambundle/SearchLimit$State;

    iget-boolean v1, p0, Lcom/streambundle/SearchLimit$2;->val$affected:Z

    if-eqz v1, :cond_12

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "\u0421\u0430\u0439\u0442 \u043d\u0435 \u043e\u0442\u0432\u0435\u0442\u0438\u043b \u0437\u0430 30 \u0441\u0435\u043a\u0443\u043d\u0434. \u041f\u0440\u043e\u0432\u0435\u0440\u044c\u0442\u0435 \u0434\u043e\u0441\u0442\u0443\u043f \u043a \u043d\u0435\u043c\u0443 \u0432\u043e \u0432\u0441\u0442\u0440\u043e\u0435\u043d\u043d\u043e\u043c \u0431\u0440\u0430\u0443\u0437\u0435\u0440\u0435 Cloudstream."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lkotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_18

    :cond_12
    iget-object v1, p0, Lcom/streambundle/SearchLimit$2;->val$provider:Ljava/lang/Object;

    invoke-static {v1}, Lcom/streambundle/SearchLimit;->empty(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    :goto_18
    invoke-virtual {v0, v1}, Lcom/streambundle/SearchLimit$State;->complete(Ljava/lang/Object;)V

    .line 22
    return-void
.end method
