.class final Lcom/streambundle/Unified$Links;
.super Ljava/lang/Object;
.source "Unified.java"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/Unified;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Links"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lkotlin/jvm/functions/Function1<",
        "Ljava/lang/Object;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation


# instance fields
.field final processed:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final seen:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final target:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Object;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lkotlin/jvm/functions/Function1;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "Ljava/lang/Object;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 134
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 133
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/streambundle/Unified$Links;->seen:Ljava/util/Set;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/streambundle/Unified$Links;->processed:Ljava/util/Set;

    .line 134
    iput-object p1, p0, Lcom/streambundle/Unified$Links;->target:Lkotlin/jvm/functions/Function1;

    return-void
.end method


# virtual methods
.method emit(Ljava/lang/Object;)V
    .registers 5

    .line 135
    const-string v0, "Url"

    invoke-static {p1, v0}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_11

    return-void

    :cond_11
    iget-object v1, p0, Lcom/streambundle/Unified$Links;->seen:Ljava/util/Set;

    monitor-enter v1

    :try_start_14
    iget-object v2, p0, Lcom/streambundle/Unified$Links;->seen:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    monitor-exit v1

    return-void

    :cond_1e
    monitor-exit v1
    :try_end_1f
    .catchall {:try_start_14 .. :try_end_1f} :catchall_25

    iget-object v0, p0, Lcom/streambundle/Unified$Links;->target:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :catchall_25
    move-exception p1

    :try_start_26
    monitor-exit v1
    :try_end_27
    .catchall {:try_start_26 .. :try_end_27} :catchall_25

    throw p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 1
    move-object v0, p1

    check-cast v0, Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/streambundle/Unified$Links;->invoke(Ljava/lang/Object;)Lkotlin/Unit;

    move-result-object p1

    return-object p1
.end method

.method public invoke(Ljava/lang/Object;)Lkotlin/Unit;
    .registers 15

    .line 137
    const-string v0, "Url"

    invoke-static {p1, v0}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_18

    iget-object v0, p0, Lcom/streambundle/Unified$Links;->target:Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    :cond_18
    iget-object v1, p0, Lcom/streambundle/Unified$Links;->processed:Ljava/util/Set;

    monitor-enter v1

    :try_start_1b
    iget-object v2, p0, Lcom/streambundle/Unified$Links;->processed:Ljava/util/Set;

    invoke-interface {v2, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_27

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    monitor-exit v1

    return-object p1

    :cond_27
    monitor-exit v1
    :try_end_28
    .catchall {:try_start_1b .. :try_end_28} :catchall_148

    .line 138
    const-string v1, "Quality"

    invoke-static {p1, v1}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Ljava/lang/Number;

    const/4 v3, 0x0

    if-eqz v2, :cond_3a

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    goto :goto_3b

    :cond_3a
    const/4 v1, 0x0

    :goto_3b
    if-gtz v1, :cond_41

    invoke-static {v0}, Lcom/streambundle/Unified;->quality(Ljava/lang/String;)I

    move-result v1

    .line 139
    :cond_41
    const-string v2, "Name"

    invoke-static {p1, v2}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, ".m3u8"

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_68

    const-string v4, "M3U8"

    const-string v6, "Type"

    invoke-static {p1, v6}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_68

    const/4 v4, 0x0

    goto :goto_69

    :cond_68
    const/4 v4, 0x1

    .line 140
    :goto_69
    if-eqz v4, :cond_106

    if-gtz v1, :cond_106

    .line 141
    :try_start_6d
    const-string v6, "Headers"

    invoke-static {p1, v6}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Ljava/util/Map;

    if-eqz v7, :cond_7a

    check-cast v6, Ljava/util/Map;

    goto :goto_7b

    :cond_7a
    const/4 v6, 0x0

    :goto_7b
    const-string v7, "Referer"

    invoke-static {p1, v7}, Lcom/streambundle/Unified;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lcom/streambundle/Unified;->str(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v6, v7}, Lcom/streambundle/Unified;->fetch(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/streambundle/Unified;->variants(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v6

    .line 142
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_106

    .line 143
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    const/4 v7, 0x0

    :cond_98
    :goto_98
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-nez v8, :cond_bd

    .line 144
    if-eqz v7, :cond_106

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, " \u00b7 \u0410\u0432\u0442\u043e"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {p1, v0, v3, v5, v6}, Lcom/streambundle/Unified;->copy(Ljava/lang/Object;Ljava/lang/String;IZLjava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/streambundle/Unified$Links;->emit(Ljava/lang/Object;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 143
    :cond_bd
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    aget-object v9, v8, v5

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    aget-object v8, v8, v3

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v11, " \u00b7 "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    if-lez v9, :cond_f0

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-static {v9}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "p"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    goto :goto_f2

    :cond_f0
    const-string v11, "HLS"

    :goto_f2
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {p1, v8, v9, v5, v10}, Lcom/streambundle/Unified;->copy(Ljava/lang/Object;Ljava/lang/String;IZLjava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    if-eq v8, p1, :cond_98

    invoke-virtual {p0, v8}, Lcom/streambundle/Unified$Links;->emit(Ljava/lang/Object;)V
    :try_end_103
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_103} :catch_105

    const/4 v7, 0x1

    goto :goto_98

    .line 146
    :catch_105
    move-exception v3

    .line 148
    :cond_106
    if-lez v1, :cond_142

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v5, "p"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_142

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, " \u00b7 "

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "p"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v0, v1, v4, v2}, Lcom/streambundle/Unified;->copy(Ljava/lang/Object;Ljava/lang/String;IZLjava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    :cond_142
    invoke-virtual {p0, p1}, Lcom/streambundle/Unified$Links;->emit(Ljava/lang/Object;)V

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p1

    .line 137
    :catchall_148
    move-exception p1

    :try_start_149
    monitor-exit v1
    :try_end_14a
    .catchall {:try_start_149 .. :try_end_14a} :catchall_148

    throw p1
.end method
