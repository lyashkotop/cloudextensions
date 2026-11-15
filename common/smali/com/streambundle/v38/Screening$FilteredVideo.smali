.class final Lcom/streambundle/v38/Screening$FilteredVideo;
.super Ljava/lang/IllegalStateException;
.source "Screening.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/v38/Screening;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FilteredVideo"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 2

    .line 53
    const-string v0, "\u0412\u0438\u0434\u0435\u043e \u0441\u043a\u0440\u044b\u0442\u043e \u0444\u0438\u043b\u044c\u0442\u0440\u043e\u043c \u043a\u0430\u0442\u0435\u0433\u043e\u0440\u0438\u0439"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    return-void
.end method
