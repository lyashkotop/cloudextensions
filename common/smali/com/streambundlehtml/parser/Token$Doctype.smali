.class final Lcom/streambundlehtml/parser/Token$Doctype;
.super Lcom/streambundlehtml/parser/Token;
.source "Token.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/Token;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Doctype"
.end annotation


# instance fields
.field forceQuirks:Z

.field final name:Ljava/lang/StringBuilder;

.field pubSysKey:Ljava/lang/String;

.field final publicIdentifier:Ljava/lang/StringBuilder;

.field final systemIdentifier:Ljava/lang/StringBuilder;


# direct methods
.method constructor <init>()V
    .registers 3

    .line 62
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/parser/Token;-><init>(Lcom/streambundlehtml/parser/Token$1;)V

    .line 56
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v1, p0, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    .line 57
    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->pubSysKey:Ljava/lang/String;

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->publicIdentifier:Ljava/lang/StringBuilder;

    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->systemIdentifier:Ljava/lang/StringBuilder;

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 63
    sget-object v0, Lcom/streambundlehtml/parser/Token$TokenType;->Doctype:Lcom/streambundlehtml/parser/Token$TokenType;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    .line 64
    return-void
.end method


# virtual methods
.method getName()Ljava/lang/String;
    .registers 2

    .line 78
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getPubSysKey()Ljava/lang/String;
    .registers 2

    .line 82
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->pubSysKey:Ljava/lang/String;

    return-object v0
.end method

.method getPublicIdentifier()Ljava/lang/String;
    .registers 2

    .line 86
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->publicIdentifier:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSystemIdentifier()Ljava/lang/String;
    .registers 2

    .line 90
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->systemIdentifier:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isForceQuirks()Z
    .registers 2

    .line 94
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    return v0
.end method

.method reset()Lcom/streambundlehtml/parser/Token;
    .registers 2

    .line 68
    invoke-super {p0}, Lcom/streambundlehtml/parser/Token;->reset()Lcom/streambundlehtml/parser/Token;

    .line 69
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->name:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->reset(Ljava/lang/StringBuilder;)V

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->pubSysKey:Ljava/lang/String;

    .line 71
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->publicIdentifier:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->reset(Ljava/lang/StringBuilder;)V

    .line 72
    iget-object v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->systemIdentifier:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->reset(Ljava/lang/StringBuilder;)V

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 74
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<!doctype "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token$Doctype;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
