.class final Lcom/streambundlehtml/parser/Tokeniser;
.super Ljava/lang/Object;
.source "Tokeniser.java"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final Unset:I = -0x1

.field private static final notCharRefCharsSorted:[C

.field static final replacementChar:C = '\ufffd'

.field static final win1252Extensions:[I

.field static final win1252ExtensionsStart:I = 0x80


# instance fields
.field charPending:Lcom/streambundlehtml/parser/Token$Character;

.field private charStartPos:I

.field private final charsBuilder:Ljava/lang/StringBuilder;

.field private charsString:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final codepointHolder:[I

.field commentPending:Lcom/streambundlehtml/parser/Token$Comment;

.field dataBuffer:Ljava/lang/StringBuilder;

.field doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

.field private emitPending:Lcom/streambundlehtml/parser/Token;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field endPending:Lcom/streambundlehtml/parser/Token$EndTag;

.field private final errors:Lcom/streambundlehtml/parser/ParseErrorList;

.field private isEmitPending:Z

.field private lastStartCloseSeq:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private lastStartTag:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private markupStartPos:I

.field private final multipointHolder:[I

.field private final reader:Lcom/streambundlehtml/parser/CharacterReader;

.field startPending:Lcom/streambundlehtml/parser/Token$StartTag;

.field private state:Lcom/streambundlehtml/parser/TokeniserState;

.field tagPending:Lcom/streambundlehtml/parser/Token$Tag;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 13
    nop

    .line 15
    const/4 v0, 0x7

    new-array v0, v0, [C

    fill-array-data v0, :array_18

    sput-object v0, Lcom/streambundlehtml/parser/Tokeniser;->notCharRefCharsSorted:[C

    .line 20
    const/16 v0, 0x20

    new-array v0, v0, [I

    fill-array-data v0, :array_24

    sput-object v0, Lcom/streambundlehtml/parser/Tokeniser;->win1252Extensions:[I

    .line 30
    sget-object v0, Lcom/streambundlehtml/parser/Tokeniser;->notCharRefCharsSorted:[C

    invoke-static {v0}, Ljava/util/Arrays;->sort([C)V

    .line 31
    return-void

    :array_18
    .array-data 2
        0x9s
        0xas
        0xds
        0xcs
        0x20s
        0x3cs
        0x26s
    .end array-data

    nop

    :array_24
    .array-data 4
        0x20ac
        0x81
        0x201a
        0x192
        0x201e
        0x2026
        0x2020
        0x2021
        0x2c6
        0x2030
        0x160
        0x2039
        0x152
        0x8d
        0x17d
        0x8f
        0x90
        0x2018
        0x2019
        0x201c
        0x201d
        0x2022
        0x2013
        0x2014
        0x2dc
        0x2122
        0x161
        0x203a
        0x153
        0x9d
        0x17e
        0x178
    .end array-data
.end method

.method constructor <init>(Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/ParseErrorList;)V
    .registers 5
    .param p1, "reader"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "errors"    # Lcom/streambundlehtml/parser/ParseErrorList;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->state:Lcom/streambundlehtml/parser/TokeniserState;

    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->emitPending:Lcom/streambundlehtml/parser/Token;

    .line 38
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->isEmitPending:Z

    .line 39
    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    .line 40
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x400

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    .line 43
    new-instance v0, Lcom/streambundlehtml/parser/Token$StartTag;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$StartTag;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->startPending:Lcom/streambundlehtml/parser/Token$StartTag;

    .line 44
    new-instance v0, Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EndTag;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->endPending:Lcom/streambundlehtml/parser/Token$EndTag;

    .line 45
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->startPending:Lcom/streambundlehtml/parser/Token$StartTag;

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    .line 46
    new-instance v0, Lcom/streambundlehtml/parser/Token$Character;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$Character;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    .line 47
    new-instance v0, Lcom/streambundlehtml/parser/Token$Doctype;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$Doctype;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    .line 48
    new-instance v0, Lcom/streambundlehtml/parser/Token$Comment;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$Comment;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    .line 177
    const/4 v0, 0x1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->codepointHolder:[I

    .line 178
    const/4 v0, 0x2

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->multipointHolder:[I

    .line 56
    iput-object p1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    .line 57
    iput-object p2, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    .line 58
    return-void
.end method

.method private varargs characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 8
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 318
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 319
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid character reference: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 320
    :cond_2b
    return-void
.end method


# virtual methods
.method advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 3
    .param p1, "newState"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 173
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 174
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 175
    return-void
.end method

.method appropriateEndTagName()Ljava/lang/String;
    .registers 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 297
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    return-object v0
.end method

.method appropriateEndTagSeq()Ljava/lang/String;
    .registers 3

    .line 302
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartCloseSeq:Ljava/lang/String;

    if-nez v0, :cond_1b

    .line 303
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "</"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartCloseSeq:Ljava/lang/String;

    .line 304
    :cond_1b
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartCloseSeq:Ljava/lang/String;

    return-object v0
.end method

.method consumeCharacterReference(Ljava/lang/Character;Z)[I
    .registers 13
    .param p1, "additionalAllowedCharacter"    # Ljava/lang/Character;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "inAttribute"    # Z
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 180
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    .line 181
    return-object v1

    .line 182
    :cond_a
    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/lang/Character;->charValue()C

    move-result v0

    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v2

    if-ne v0, v2, :cond_19

    .line 183
    return-object v1

    .line 184
    :cond_19
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    sget-object v2, Lcom/streambundlehtml/parser/Tokeniser;->notCharRefCharsSorted:[C

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAnySorted([C)Z

    move-result v0

    if-eqz v0, :cond_24

    .line 185
    return-object v1

    .line 187
    :cond_24
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->codepointHolder:[I

    .line 188
    .local v0, "codeRef":[I
    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/CharacterReader;->mark()V

    .line 189
    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const-string v3, "#"

    invoke-virtual {v2, v3}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v2

    const-string v3, ";"

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_cf

    .line 190
    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const-string v6, "X"

    invoke-virtual {v2, v6}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsumeIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    .line 191
    .local v2, "isHexMode":Z
    iget-object v6, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    if-eqz v2, :cond_4a

    invoke-virtual {v6}, Lcom/streambundlehtml/parser/CharacterReader;->consumeHexSequence()Ljava/lang/String;

    move-result-object v6

    goto :goto_4e

    :cond_4a
    invoke-virtual {v6}, Lcom/streambundlehtml/parser/CharacterReader;->consumeDigitSequence()Ljava/lang/String;

    move-result-object v6

    .line 192
    .local v6, "numRef":Ljava/lang/String;
    :goto_4e
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_61

    .line 193
    const-string v3, "numeric reference with no numerals"

    new-array v4, v5, [Ljava/lang/Object;

    invoke-direct {p0, v3, v4}, Lcom/streambundlehtml/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 194
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v3}, Lcom/streambundlehtml/parser/CharacterReader;->rewindToMark()V

    .line 195
    return-object v1

    .line 198
    :cond_61
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->unmark()V

    .line 199
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_77

    .line 200
    new-array v1, v4, [Ljava/lang/Object;

    aput-object v6, v1, v5

    const-string v3, "missing semicolon on [&#%s]"

    invoke-direct {p0, v3, v1}, Lcom/streambundlehtml/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 201
    :cond_77
    const/4 v1, -0x1

    .line 203
    .local v1, "charval":I
    if-eqz v2, :cond_7d

    const/16 v3, 0x10

    goto :goto_7f

    :cond_7d
    const/16 v3, 0xa

    .line 204
    .local v3, "base":I
    :goto_7f
    :try_start_7f
    invoke-static {v6, v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7
    :try_end_87
    .catch Ljava/lang/NumberFormatException; {:try_start_7f .. :try_end_87} :catch_89

    move v1, v7

    .line 206
    .end local v3    # "base":I
    goto :goto_8a

    .line 205
    :catch_89
    move-exception v3

    .line 207
    :goto_8a
    const/4 v3, -0x1

    if-eq v1, v3, :cond_bc

    const v3, 0xd800

    if-lt v1, v3, :cond_97

    const v3, 0xdfff

    if-le v1, v3, :cond_bc

    :cond_97
    const v3, 0x10ffff

    if-gt v1, v3, :cond_bc

    .line 212
    const/16 v3, 0x80

    if-lt v1, v3, :cond_b9

    sget-object v7, Lcom/streambundlehtml/parser/Tokeniser;->win1252Extensions:[I

    array-length v7, v7

    add-int/2addr v7, v3

    if-ge v1, v7, :cond_b9

    .line 213
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v3, v4, v5

    const-string v3, "character [%s] is not a valid unicode code point"

    invoke-direct {p0, v3, v4}, Lcom/streambundlehtml/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 214
    sget-object v3, Lcom/streambundlehtml/parser/Tokeniser;->win1252Extensions:[I

    add-int/lit8 v4, v1, -0x80

    aget v1, v3, v4

    .line 219
    :cond_b9
    aput v1, v0, v5

    goto :goto_ce

    .line 208
    :cond_bc
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-array v4, v4, [Ljava/lang/Object;

    aput-object v3, v4, v5

    const-string v3, "character [%s] outside of valid range"

    invoke-direct {p0, v3, v4}, Lcom/streambundlehtml/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 209
    const v3, 0xfffd

    aput v3, v0, v5

    .line 221
    :goto_ce
    return-object v0

    .line 224
    .end local v1    # "charval":I
    .end local v2    # "isHexMode":Z
    .end local v6    # "numRef":Ljava/lang/String;
    :cond_cf
    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeLetterThenDigitSequence()Ljava/lang/String;

    move-result-object v2

    .line 225
    .local v2, "nameRef":Ljava/lang/String;
    iget-object v6, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const/16 v7, 0x3b

    invoke-virtual {v6, v7}, Lcom/streambundlehtml/parser/CharacterReader;->matches(C)Z

    move-result v6

    .line 227
    .local v6, "looksLegit":Z
    invoke-static {v2}, Lcom/streambundlehtml/nodes/Entities;->isBaseNamedEntity(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_ed

    invoke-static {v2}, Lcom/streambundlehtml/nodes/Entities;->isNamedEntity(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_eb

    if-nez v6, :cond_ed

    :cond_eb
    const/4 v7, 0x0

    goto :goto_ee

    :cond_ed
    const/4 v7, 0x1

    .line 229
    .local v7, "found":Z
    :goto_ee
    if-nez v7, :cond_101

    .line 230
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v3}, Lcom/streambundlehtml/parser/CharacterReader;->rewindToMark()V

    .line 231
    if-eqz v6, :cond_100

    .line 232
    new-array v3, v4, [Ljava/lang/Object;

    aput-object v2, v3, v5

    const-string v4, "invalid named reference [%s]"

    invoke-direct {p0, v4, v3}, Lcom/streambundlehtml/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 233
    :cond_100
    return-object v1

    .line 235
    :cond_101
    if-eqz p2, :cond_127

    iget-object v8, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v8}, Lcom/streambundlehtml/parser/CharacterReader;->matchesLetter()Z

    move-result v8

    if-nez v8, :cond_121

    iget-object v8, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v8}, Lcom/streambundlehtml/parser/CharacterReader;->matchesDigit()Z

    move-result v8

    if-nez v8, :cond_121

    iget-object v8, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const/4 v9, 0x3

    new-array v9, v9, [C

    fill-array-data v9, :array_16c

    invoke-virtual {v8, v9}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAny([C)Z

    move-result v8

    if-eqz v8, :cond_127

    .line 237
    :cond_121
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v3}, Lcom/streambundlehtml/parser/CharacterReader;->rewindToMark()V

    .line 238
    return-object v1

    .line 241
    :cond_127
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->unmark()V

    .line 242
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/CharacterReader;->matchConsume(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_13d

    .line 243
    new-array v1, v4, [Ljava/lang/Object;

    aput-object v2, v1, v5

    const-string v3, "missing semicolon on [&%s]"

    invoke-direct {p0, v3, v1}, Lcom/streambundlehtml/parser/Tokeniser;->characterReferenceError(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 244
    :cond_13d
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->multipointHolder:[I

    invoke-static {v2, v1}, Lcom/streambundlehtml/nodes/Entities;->codepointsForName(Ljava/lang/String;[I)I

    move-result v1

    .line 245
    .local v1, "numChars":I
    if-ne v1, v4, :cond_14c

    .line 246
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->multipointHolder:[I

    aget v3, v3, v5

    aput v3, v0, v5

    .line 247
    return-object v0

    .line 248
    :cond_14c
    const/4 v3, 0x2

    if-ne v1, v3, :cond_152

    .line 249
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->multipointHolder:[I

    return-object v3

    .line 251
    :cond_152
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected characters returned for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/streambundlehtml/helper/Validate;->fail(Ljava/lang/String;)V

    .line 252
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->multipointHolder:[I

    return-object v3

    nop

    :array_16c
    .array-data 2
        0x3ds
        0x2ds
        0x5fs
    .end array-data
.end method

.method createBogusCommentPending()V
    .registers 3

    .line 276
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Comment;->reset()Lcom/streambundlehtml/parser/Token;

    .line 277
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/streambundlehtml/parser/Token$Comment;->bogus:Z

    .line 278
    return-void
.end method

.method createCommentPending()V
    .registers 2

    .line 268
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Comment;->reset()Lcom/streambundlehtml/parser/Token;

    .line 269
    return-void
.end method

.method createDoctypePending()V
    .registers 2

    .line 281
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Doctype;->reset()Lcom/streambundlehtml/parser/Token;

    .line 282
    return-void
.end method

.method createTagPending(Z)Lcom/streambundlehtml/parser/Token$Tag;
    .registers 3
    .param p1, "start"    # Z

    .line 258
    if-eqz p1, :cond_9

    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->startPending:Lcom/streambundlehtml/parser/Token$StartTag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$StartTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    goto :goto_f

    :cond_9
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->endPending:Lcom/streambundlehtml/parser/Token$EndTag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$EndTag;->reset()Lcom/streambundlehtml/parser/Token$Tag;

    move-result-object v0

    :goto_f
    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    .line 259
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    return-object v0
.end method

.method createTempBuffer()V
    .registers 2

    .line 289
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-static {v0}, Lcom/streambundlehtml/parser/Token;->reset(Ljava/lang/StringBuilder;)V

    .line 290
    return-void
.end method

.method currentNodeInHtmlNS()Z
    .registers 2

    .line 334
    const/4 v0, 0x1

    return v0
.end method

.method emit(C)V
    .registers 4
    .param p1, "c"    # C

    .line 134
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 135
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    goto :goto_1f

    .line 137
    :cond_b
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_1a

    .line 138
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    :cond_1a
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 142
    :goto_1f
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Character;->startPos(I)V

    .line 143
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Character;->endPos(I)V

    .line 144
    return-void
.end method

.method emit(Lcom/streambundlehtml/parser/Token;)V
    .registers 6
    .param p1, "token"    # Lcom/streambundlehtml/parser/Token;

    .line 85
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->isEmitPending:Z

    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->isFalse(Z)V

    .line 87
    iput-object p1, p0, Lcom/streambundlehtml/parser/Tokeniser;->emitPending:Lcom/streambundlehtml/parser/Token;

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->isEmitPending:Z

    .line 89
    iget v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->markupStartPos:I

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Token;->startPos(I)V

    .line 90
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/streambundlehtml/parser/Token;->endPos(I)V

    .line 91
    const/4 v1, -0x1

    iput v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    .line 93
    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v2, Lcom/streambundlehtml/parser/Token$TokenType;->StartTag:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v1, v2, :cond_2c

    .line 94
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/parser/Token$StartTag;

    .line 95
    .local v0, "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    iget-object v1, v0, Lcom/streambundlehtml/parser/Token$StartTag;->tagName:Ljava/lang/String;

    iput-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    .line 96
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartCloseSeq:Ljava/lang/String;

    .end local v0    # "startTag":Lcom/streambundlehtml/parser/Token$StartTag;
    goto :goto_4a

    .line 97
    :cond_2c
    iget-object v1, p1, Lcom/streambundlehtml/parser/Token;->type:Lcom/streambundlehtml/parser/Token$TokenType;

    sget-object v2, Lcom/streambundlehtml/parser/Token$TokenType;->EndTag:Lcom/streambundlehtml/parser/Token$TokenType;

    if-ne v1, v2, :cond_4a

    .line 98
    move-object v1, p1

    check-cast v1, Lcom/streambundlehtml/parser/Token$EndTag;

    .line 99
    .local v1, "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$EndTag;->hasAttributes()Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 100
    invoke-virtual {v1}, Lcom/streambundlehtml/parser/Token$EndTag;->normalName()Ljava/lang/String;

    move-result-object v2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v2, v0, v3

    const-string v2, "Attributes incorrectly present on end tag [/%s]"

    invoke-virtual {p0, v2, v0}, Lcom/streambundlehtml/parser/Tokeniser;->error(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_4b

    .line 97
    .end local v1    # "endTag":Lcom/streambundlehtml/parser/Token$EndTag;
    :cond_4a
    :goto_4a
    nop

    .line 102
    :cond_4b
    :goto_4b
    return-void
.end method

.method emit(Ljava/lang/String;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/String;

    .line 107
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    if-nez v0, :cond_7

    .line 108
    iput-object p1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    goto :goto_1b

    .line 110
    :cond_7
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_16

    .line 111
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    :cond_16
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    :goto_1b
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Character;->startPos(I)V

    .line 116
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Character;->endPos(I)V

    .line 117
    return-void
.end method

.method emit(Ljava/lang/StringBuilder;)V
    .registers 4
    .param p1, "str"    # Ljava/lang/StringBuilder;

    .line 121
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    if-nez v0, :cond_b

    .line 122
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    goto :goto_1f

    .line 124
    :cond_b
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-nez v0, :cond_1a

    .line 125
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    :cond_1a
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 129
    :goto_1f
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Character;->startPos(I)V

    .line 130
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Token$Character;->endPos(I)V

    .line 131
    return-void
.end method

.method emit([C)V
    .registers 3
    .param p1, "chars"    # [C

    .line 147
    invoke-static {p1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 148
    return-void
.end method

.method emit([I)V
    .registers 5
    .param p1, "codepoints"    # [I

    .line 151
    new-instance v0, Ljava/lang/String;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-direct {v0, p1, v1, v2}, Ljava/lang/String;-><init>([III)V

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 152
    return-void
.end method

.method emitCommentPending()V
    .registers 2

    .line 272
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->commentPending:Lcom/streambundlehtml/parser/Token$Comment;

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 273
    return-void
.end method

.method emitDoctypePending()V
    .registers 2

    .line 285
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->doctypePending:Lcom/streambundlehtml/parser/Token$Doctype;

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 286
    return-void
.end method

.method emitTagPending()V
    .registers 2

    .line 263
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Tag;->finaliseTag()V

    .line 264
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 265
    return-void
.end method

.method eofError(Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 7
    .param p1, "state"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 313
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 314
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const-string v4, "Unexpectedly reached end of file (EOF) in input state [%s]"

    invoke-direct {v1, v2, v4, v3}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 315
    :cond_1c
    return-void
.end method

.method error(Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 8
    .param p1, "state"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 308
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 309
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v3}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const/4 v3, 0x1

    aput-object p1, v4, v3

    const-string v3, "Unexpected character \'%s\' in input state [%s]"

    invoke-direct {v1, v2, v3, v4}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 310
    :cond_29
    return-void
.end method

.method error(Ljava/lang/String;)V
    .registers 5
    .param p1, "errorMsg"    # Ljava/lang/String;

    .line 323
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 324
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-direct {v1, v2, p1}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 325
    :cond_14
    return-void
.end method

.method varargs error(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 6
    .param p1, "errorMsg"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .line 328
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/ParseErrorList;->canAddError()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 329
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->errors:Lcom/streambundlehtml/parser/ParseErrorList;

    new-instance v1, Lcom/streambundlehtml/parser/ParseError;

    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-direct {v1, v2, p1, p2}, Lcom/streambundlehtml/parser/ParseError;-><init>(Lcom/streambundlehtml/parser/CharacterReader;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/ParseErrorList;->add(Ljava/lang/Object;)Z

    .line 330
    :cond_14
    return-void
.end method

.method getState()Lcom/streambundlehtml/parser/TokeniserState;
    .registers 2

    .line 155
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->state:Lcom/streambundlehtml/parser/TokeniserState;

    return-object v0
.end method

.method isAppropriateEndTagToken()Z
    .registers 3

    .line 293
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Tag;->name()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->lastStartTag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    goto :goto_15

    :cond_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method read()Lcom/streambundlehtml/parser/Token;
    .registers 6

    .line 61
    nop

    :goto_1
    iget-boolean v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->isEmitPending:Z

    if-nez v0, :cond_d

    .line 62
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->state:Lcom/streambundlehtml/parser/TokeniserState;

    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v0, p0, v1}, Lcom/streambundlehtml/parser/TokeniserState;->read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V

    goto :goto_1

    .line 66
    :cond_d
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsBuilder:Ljava/lang/StringBuilder;

    .line 67
    .local v0, "cb":Ljava/lang/StringBuilder;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_2b

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 69
    .local v1, "str":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 70
    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    invoke-virtual {v3, v1}, Lcom/streambundlehtml/parser/Token$Character;->data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v3

    .line 71
    .local v3, "token":Lcom/streambundlehtml/parser/Token;
    iput-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    .line 72
    return-object v3

    .line 73
    .end local v1    # "str":Ljava/lang/String;
    .end local v3    # "token":Lcom/streambundlehtml/parser/Token;
    :cond_2b
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    if-eqz v1, :cond_3a

    .line 74
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->charPending:Lcom/streambundlehtml/parser/Token$Character;

    iget-object v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/streambundlehtml/parser/Token$Character;->data(Ljava/lang/String;)Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v1

    .line 75
    .local v1, "token":Lcom/streambundlehtml/parser/Token;
    iput-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->charsString:Ljava/lang/String;

    .line 76
    return-object v1

    .line 78
    .end local v1    # "token":Lcom/streambundlehtml/parser/Token;
    :cond_3a
    iput-boolean v3, p0, Lcom/streambundlehtml/parser/Tokeniser;->isEmitPending:Z

    .line 79
    nop

    .line 80
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->emitPending:Lcom/streambundlehtml/parser/Token;

    return-object v1
.end method

.method transition(Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 4
    .param p1, "newState"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 160
    sget-object v0, Lcom/streambundlehtml/parser/Tokeniser$1;->$SwitchMap$org$jsoup$parser$TokeniserState:[I

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/TokeniserState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_26

    goto :goto_23

    .line 165
    :pswitch_c
    iget v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_23

    .line 166
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v0

    iput v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->charStartPos:I

    goto :goto_23

    .line 162
    :pswitch_1a
    iget-object v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/CharacterReader;->pos()I

    move-result v0

    iput v0, p0, Lcom/streambundlehtml/parser/Tokeniser;->markupStartPos:I

    .line 163
    nop

    .line 169
    :cond_23
    :goto_23
    iput-object p1, p0, Lcom/streambundlehtml/parser/Tokeniser;->state:Lcom/streambundlehtml/parser/TokeniserState;

    .line 170
    return-void

    :pswitch_data_26
    .packed-switch 0x1
        :pswitch_1a
        :pswitch_c
    .end packed-switch
.end method

.method unescapeEntities(Z)Ljava/lang/String;
    .registers 6
    .param p1, "inAttribute"    # Z

    .line 345
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 346
    .local v0, "builder":Ljava/lang/StringBuilder;
    :cond_4
    :goto_4
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_43

    .line 347
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    const/16 v2, 0x26

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/CharacterReader;->consumeTo(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/CharacterReader;->matches(C)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 349
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->reader:Lcom/streambundlehtml/parser/CharacterReader;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    .line 350
    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1}, Lcom/streambundlehtml/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[I

    move-result-object v1

    .line 351
    .local v1, "c":[I
    if-eqz v1, :cond_3f

    array-length v3, v1

    if-eqz v3, :cond_3f

    .line 354
    const/4 v2, 0x0

    aget v2, v1, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    .line 355
    array-length v2, v1

    const/4 v3, 0x2

    if-ne v2, v3, :cond_42

    .line 356
    const/4 v2, 0x1

    aget v2, v1, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    goto :goto_42

    .line 352
    :cond_3f
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 359
    .end local v1    # "c":[I
    :cond_42
    :goto_42
    goto :goto_4

    .line 361
    :cond_43
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
