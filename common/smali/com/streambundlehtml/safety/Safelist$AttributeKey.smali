.class Lcom/streambundlehtml/safety/Safelist$AttributeKey;
.super Lcom/streambundlehtml/safety/Safelist$TypedValue;
.source "Safelist.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/safety/Safelist;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "AttributeKey"
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/String;

    .line 624
    invoke-direct {p0, p1}, Lcom/streambundlehtml/safety/Safelist$TypedValue;-><init>(Ljava/lang/String;)V

    .line 625
    return-void
.end method

.method static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/safety/Safelist$AttributeKey;
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .line 628
    new-instance v0, Lcom/streambundlehtml/safety/Safelist$AttributeKey;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/safety/Safelist$AttributeKey;-><init>(Ljava/lang/String;)V

    return-object v0
.end method
