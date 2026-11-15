.class public final Lcom/streambundlehtml/select/Evaluator$Attribute;
.super Lcom/streambundlehtml/select/Evaluator;
.source "Evaluator.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/select/Evaluator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Attribute"
.end annotation


# instance fields
.field private final key:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "key"    # Ljava/lang/String;

    .line 133
    invoke-direct {p0}, Lcom/streambundlehtml/select/Evaluator;-><init>()V

    .line 134
    iput-object p1, p0, Lcom/streambundlehtml/select/Evaluator$Attribute;->key:Ljava/lang/String;

    .line 135
    return-void
.end method


# virtual methods
.method public matches(Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)Z
    .registers 4
    .param p1, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p2, "element"    # Lcom/streambundlehtml/nodes/Element;

    .line 139
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$Attribute;->key:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 144
    iget-object v0, p0, Lcom/streambundlehtml/select/Evaluator$Attribute;->key:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "[%s]"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
