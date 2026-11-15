.class Lcom/videobundle/fixes/JavGuruLinks$Worker$1;
.super Ljava/lang/Object;
.source "JavGuruLinks.java"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/videobundle/fixes/JavGuruLinks$Worker;->extract(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/Object;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/videobundle/fixes/JavGuruLinks$Worker;


# direct methods
.method constructor <init>(Lcom/videobundle/fixes/JavGuruLinks$Worker;)V
    .registers 2

    .line 34
    iput-object p1, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker$1;->this$1:Lcom/videobundle/fixes/JavGuruLinks$Worker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 34
    iget-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker$1;->this$1:Lcom/videobundle/fixes/JavGuruLinks$Worker;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->emitted:Z

    iget-object v0, p0, Lcom/videobundle/fixes/JavGuruLinks$Worker$1;->this$1:Lcom/videobundle/fixes/JavGuruLinks$Worker;

    iget-object v0, v0, Lcom/videobundle/fixes/JavGuruLinks$Worker;->callback:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
