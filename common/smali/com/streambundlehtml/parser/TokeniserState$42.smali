.class final enum Lcom/streambundlehtml/parser/TokeniserState$42;
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

    .line 887
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 889
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 890
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_2c

    .line 901
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 902
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 903
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$42;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_2a

    .line 897
    :sswitch_13
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 898
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$42;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 899
    goto :goto_2a

    .line 892
    :sswitch_1c
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/streambundlehtml/parser/Token$Tag;->selfClosing:Z

    .line 893
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 894
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$42;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 895
    nop

    .line 905
    :goto_2a
    return-void

    nop

    :sswitch_data_2c
    .sparse-switch
        0x3e -> :sswitch_1c
        0xffff -> :sswitch_13
    .end sparse-switch
.end method
