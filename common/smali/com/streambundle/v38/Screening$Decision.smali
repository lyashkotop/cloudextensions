.class final Lcom/streambundle/v38/Screening$Decision;
.super Ljava/lang/Object;
.source "Screening.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/Screening;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Decision"
.end annotation


# instance fields
.field final allowed:Z

.field final time:J


# direct methods
.method constructor <init>(Z)V
    .registers 4

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/streambundle/v38/Screening$Decision;->time:J

    .line 59
    iput-boolean p1, p0, Lcom/streambundle/v38/Screening$Decision;->allowed:Z

    return-void
.end method
