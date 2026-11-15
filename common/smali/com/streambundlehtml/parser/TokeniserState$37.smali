.class final enum Lcom/streambundlehtml/parser/TokeniserState$37;
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

    .line 693
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V

    return-void
.end method


# virtual methods
.method read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
    .registers 6
    .param p1, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p2, "r"    # Lcom/streambundlehtml/parser/CharacterReader;

    .line 695
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 696
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_5e

    .line 737
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 738
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_5d

    .line 720
    :sswitch_10
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->eofError(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 721
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 722
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 723
    goto :goto_5d

    .line 725
    :sswitch_1c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 726
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 727
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 728
    goto :goto_5d

    .line 732
    :sswitch_28
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 733
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 734
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 735
    goto :goto_5d

    .line 712
    :sswitch_36
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->AttributeValue_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 713
    goto :goto_5d

    .line 708
    :sswitch_3c
    invoke-virtual {p2}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 709
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 710
    goto :goto_5d

    .line 705
    :sswitch_45
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->AttributeValue_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 706
    goto :goto_5d

    .line 703
    :sswitch_4b
    goto :goto_5d

    .line 715
    :sswitch_4c
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 716
    iget-object v1, p1, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    const v2, 0xfffd

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/Token$Tag;->appendAttributeValue(C)V

    .line 717
    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState$37;->AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 718
    nop

    .line 740
    :goto_5d
    return-void

    :sswitch_data_5e
    .sparse-switch
        0x0 -> :sswitch_4c
        0x9 -> :sswitch_4b
        0xa -> :sswitch_4b
        0xc -> :sswitch_4b
        0xd -> :sswitch_4b
        0x20 -> :sswitch_4b
        0x22 -> :sswitch_45
        0x26 -> :sswitch_3c
        0x27 -> :sswitch_36
        0x3c -> :sswitch_28
        0x3d -> :sswitch_28
        0x3e -> :sswitch_1c
        0x60 -> :sswitch_28
        0xffff -> :sswitch_10
    .end sparse-switch
.end method
