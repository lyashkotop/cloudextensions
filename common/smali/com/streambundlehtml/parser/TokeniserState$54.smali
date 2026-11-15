.class final enum Lcom/streambundlehtml/parser/TokeniserState$54;
.super Lcom/streambundlehtml/parser/TokeniserState;
.source "TokeniserState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/parser/TokeniserState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4010
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .registers 4

    .line 1196
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 1198
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_17

    .line 1199
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1200
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v0, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1201
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1202
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$54;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1203
    return-void

    .line 1205
    :cond_17
    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_6a

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAny([C)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 1206
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    goto :goto_68

    .line 1207
    :cond_27
    const/16 v0, 0x3e

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matches(C)Z

    move-result v0

    if-eqz v0, :cond_38

    .line 1208
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitDoctypePending()V

    .line 1209
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$54;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_68

    .line 1210
    :cond_38
    const-string v0, "PUBLIC"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsumeIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 1211
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-object v0, v1, Lcom/streambundlehtml/parser/Token$Doctype;->pubSysKey:Ljava/lang/String;

    .line 1212
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$54;->AfterDoctypePublicKeyword:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_68

    .line 1213
    :cond_4a
    const-string v0, "SYSTEM"

    invoke-virtual {p2, v0}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsumeIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5c

    .line 1214
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-object v0, v1, Lcom/streambundlehtml/parser/Token$Doctype;->pubSysKey:Ljava/lang/String;

    .line 1215
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$54;->AfterDoctypeSystemKeyword:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_68

    .line 1217
    :cond_5c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1218
    iget-object v0, p1, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    iput-boolean v1, v0, Lcom/streambundlehtml/parser/Token$Doctype;->forceQuirks:Z

    .line 1219
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState$54;->BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1222
    :goto_68
    return-void

    nop

    :array_6a
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
    .end array-data
.end method
