.class public Lcom/streambundlehtml/select/QueryParser;
.super Ljava/lang/Object;
.source "QueryParser.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final AttributeEvals:[Ljava/lang/String;

.field private static final NTH_AB:Ljava/util/regex/Pattern;

.field private static final NTH_B:Ljava/util/regex/Pattern;

.field private static final combinators:[C


# instance fields
.field private final evals:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/streambundlehtml/select/Evaluator;",
            ">;"
        }
    .end annotation
.end field

.field private final query:Ljava/lang/String;

.field private final tq:Lcom/streambundlehtml/parser/TokenQueue;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .line 17
    nop

    .line 18
    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_2e

    sput-object v0, Lcom/streambundlehtml/select/QueryParser;->combinators:[C

    .line 19
    const-string v5, "*="

    const-string v6, "~="

    const-string v1, "="

    const-string v2, "!="

    const-string v3, "^="

    const-string v4, "$="

    filled-new-array/range {v1 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/select/QueryParser;->AttributeEvals:[Ljava/lang/String;

    .line 317
    const-string v0, "(([+-])?(\\d+)?)n(\\s*([+-])?\\s*\\d+)?"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/select/QueryParser;->NTH_AB:Ljava/util/regex/Pattern;

    .line 318
    const-string v0, "([+-])?(\\d+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/select/QueryParser;->NTH_B:Ljava/util/regex/Pattern;

    return-void

    nop

    :array_2e
    .array-data 2
        0x2cs
        0x3es
        0x2bs
        0x7es
        0x20s
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "query"    # Ljava/lang/String;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    .line 30
    invoke-static {p1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 31
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/streambundlehtml/select/QueryParser;->query:Ljava/lang/String;

    .line 33
    new-instance v0, Lcom/streambundlehtml/parser/TokenQueue;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    .line 34
    return-void
.end method

.method private allElements()V
    .registers 3

    .line 300
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$AllElements;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$AllElements;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    return-void
.end method

.method private byAttribute()V
    .registers 9

    .line 266
    new-instance v0, Lcom/streambundlehtml/parser/TokenQueue;

    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v2, 0x5b

    const/16 v3, 0x5d

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;-><init>(Ljava/lang/String;)V

    .line 267
    .local v0, "cq":Lcom/streambundlehtml/parser/TokenQueue;
    sget-object v1, Lcom/streambundlehtml/select/QueryParser;->AttributeEvals:[Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->consumeToAny([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 268
    .local v1, "key":Ljava/lang/String;
    invoke-static {v1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 269
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeWhitespace()Z

    .line 271
    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_46

    .line 272
    const-string v2, "^"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3a

    .line 273
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v4, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Lcom/streambundlehtml/select/Evaluator$AttributeStarting;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d4

    .line 275
    :cond_3a
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$Attribute;

    invoke-direct {v3, v1}, Lcom/streambundlehtml/select/Evaluator$Attribute;-><init>(Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d4

    .line 277
    :cond_46
    const-string v2, "="

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 278
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValue;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_d4

    .line 280
    :cond_5e
    const-string v2, "!="

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_75

    .line 281
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueNot;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueNot;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d4

    .line 283
    :cond_75
    const-string v2, "^="

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8c

    .line 284
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueStarting;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueStarting;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d4

    .line 286
    :cond_8c
    const-string v2, "$="

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a3

    .line 287
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueEnding;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueEnding;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d4

    .line 289
    :cond_a3
    const-string v2, "*="

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_ba

    .line 290
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueContaining;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueContaining;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_d4

    .line 292
    :cond_ba
    const-string v2, "~="

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d5

    .line 293
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v3, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-direct {v3, v1, v4}, Lcom/streambundlehtml/select/Evaluator$AttributeWithValueMatching;-><init>(Ljava/lang/String;Ljava/util/regex/Pattern;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    :goto_d4
    return-void

    .line 295
    :cond_d5
    new-instance v2, Lcom/streambundlehtml/select/Selector$SelectorParseException;

    iget-object v4, p0, Lcom/streambundlehtml/select/QueryParser;->query:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v4, v6, v7

    aput-object v5, v6, v3

    const-string v3, "Could not parse attribute query \'%s\': unexpected token at \'%s\'"

    invoke-direct {v2, v3, v6}, Lcom/streambundlehtml/select/Selector$SelectorParseException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v2
.end method

.method private byClass()V
    .registers 5

    .line 237
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeCssIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 238
    .local v0, "className":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 239
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v2, Lcom/streambundlehtml/select/Evaluator$Class;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/streambundlehtml/select/Evaluator$Class;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 240
    return-void
.end method

.method private byId()V
    .registers 4

    .line 231
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeCssIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 232
    .local v0, "id":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 233
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v2, Lcom/streambundlehtml/select/Evaluator$Id;

    invoke-direct {v2, v0}, Lcom/streambundlehtml/select/Evaluator$Id;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    return-void
.end method

.method private byTag()V
    .registers 10

    .line 246
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeElementSelector()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 247
    .local v0, "tagName":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;)V

    .line 250
    const-string v1, "*|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const-string v3, ":"

    if-eqz v2, :cond_3d

    .line 251
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 252
    .local v4, "plainTag":Ljava/lang/String;
    iget-object v5, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v6, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    new-array v2, v2, [Lcom/streambundlehtml/select/Evaluator;

    new-instance v7, Lcom/streambundlehtml/select/Evaluator$Tag;

    invoke-direct {v7, v4}, Lcom/streambundlehtml/select/Evaluator$Tag;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x0

    aput-object v7, v2, v8

    new-instance v7, Lcom/streambundlehtml/select/Evaluator$TagEndsWith;

    .line 254
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v7, v1}, Lcom/streambundlehtml/select/Evaluator$TagEndsWith;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x1

    aput-object v7, v2, v1

    invoke-direct {v6, v2}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;-><init>([Lcom/streambundlehtml/select/Evaluator;)V

    .line 252
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 256
    .end local v4    # "plainTag":Ljava/lang/String;
    goto :goto_53

    .line 258
    :cond_3d
    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_49

    .line 259
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 261
    :cond_49
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v2, Lcom/streambundlehtml/select/Evaluator$Tag;

    invoke-direct {v2, v0}, Lcom/streambundlehtml/select/Evaluator$Tag;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 263
    :goto_53
    return-void
.end method

.method private combinator(C)V
    .registers 12
    .param p1, "combinator"    # C

    .line 85
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeWhitespace()Z

    .line 86
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->consumeSubQuery()Ljava/lang/String;

    move-result-object v0

    .line 90
    .local v0, "subQuery":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v1

    .line 91
    .local v1, "newEval":Lcom/streambundlehtml/select/Evaluator;
    const/4 v2, 0x0

    .line 93
    .local v2, "replaceRightMost":Z
    iget-object v3, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v3, v5, :cond_33

    .line 94
    iget-object v3, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/streambundlehtml/select/Evaluator;

    move-object v6, v3

    .line 96
    .local v3, "rootEval":Lcom/streambundlehtml/select/Evaluator;
    .local v6, "currentEval":Lcom/streambundlehtml/select/Evaluator;
    instance-of v7, v3, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    if-eqz v7, :cond_3b

    const/16 v7, 0x2c

    if-eq p1, v7, :cond_3b

    .line 97
    move-object v7, v6

    check-cast v7, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    invoke-virtual {v7}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->rightMostEvaluator()Lcom/streambundlehtml/select/Evaluator;

    move-result-object v6

    .line 98
    nop

    .line 99
    const/4 v2, 0x1

    goto :goto_3b

    .line 103
    .end local v3    # "rootEval":Lcom/streambundlehtml/select/Evaluator;
    .end local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    :cond_33
    new-instance v3, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    iget-object v6, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-direct {v3, v6}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>(Ljava/util/Collection;)V

    move-object v6, v3

    .line 105
    .restart local v3    # "rootEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    :cond_3b
    :goto_3b
    iget-object v7, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->clear()V

    .line 108
    const/4 v7, 0x2

    sparse-switch p1, :sswitch_data_be

    .line 133
    new-instance v7, Lcom/streambundlehtml/select/Selector$SelectorParseException;

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v8

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v8, v5, v4

    const-string v4, "Unknown combinator \'%s\'"

    invoke-direct {v7, v4, v5}, Lcom/streambundlehtml/select/Selector$SelectorParseException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v7

    .line 119
    :sswitch_54
    new-instance v8, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    new-array v7, v7, [Lcom/streambundlehtml/select/Evaluator;

    new-instance v9, Lcom/streambundlehtml/select/StructuralEvaluator$PreviousSibling;

    invoke-direct {v9, v6}, Lcom/streambundlehtml/select/StructuralEvaluator$PreviousSibling;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    aput-object v9, v7, v4

    aput-object v1, v7, v5

    invoke-direct {v8, v7}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>([Lcom/streambundlehtml/select/Evaluator;)V

    .line 120
    .end local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .local v8, "currentEval":Lcom/streambundlehtml/select/Evaluator;
    goto :goto_ad

    .line 110
    .end local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    :sswitch_65
    new-instance v8, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    new-array v7, v7, [Lcom/streambundlehtml/select/Evaluator;

    new-instance v9, Lcom/streambundlehtml/select/StructuralEvaluator$ImmediateParent;

    invoke-direct {v9, v6}, Lcom/streambundlehtml/select/StructuralEvaluator$ImmediateParent;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    aput-object v9, v7, v4

    aput-object v1, v7, v5

    invoke-direct {v8, v7}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>([Lcom/streambundlehtml/select/Evaluator;)V

    .line 111
    .end local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    goto :goto_ad

    .line 123
    .end local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    :sswitch_76
    instance-of v4, v6, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    if-eqz v4, :cond_7e

    .line 124
    move-object v4, v6

    check-cast v4, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    .local v4, "or":Lcom/streambundlehtml/select/CombiningEvaluator$Or;
    goto :goto_86

    .line 126
    .end local v4    # "or":Lcom/streambundlehtml/select/CombiningEvaluator$Or;
    :cond_7e
    new-instance v4, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    invoke-direct {v4}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;-><init>()V

    .line 127
    .restart local v4    # "or":Lcom/streambundlehtml/select/CombiningEvaluator$Or;
    invoke-virtual {v4, v6}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->add(Lcom/streambundlehtml/select/Evaluator;)V

    .line 129
    :goto_86
    invoke-virtual {v4, v1}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->add(Lcom/streambundlehtml/select/Evaluator;)V

    .line 130
    move-object v8, v4

    .line 131
    .end local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    goto :goto_ad

    .line 116
    .end local v4    # "or":Lcom/streambundlehtml/select/CombiningEvaluator$Or;
    .end local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    :sswitch_8b
    new-instance v8, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    new-array v7, v7, [Lcom/streambundlehtml/select/Evaluator;

    new-instance v9, Lcom/streambundlehtml/select/StructuralEvaluator$ImmediatePreviousSibling;

    invoke-direct {v9, v6}, Lcom/streambundlehtml/select/StructuralEvaluator$ImmediatePreviousSibling;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    aput-object v9, v7, v4

    aput-object v1, v7, v5

    invoke-direct {v8, v7}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>([Lcom/streambundlehtml/select/Evaluator;)V

    .line 117
    .end local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    goto :goto_ad

    .line 113
    .end local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    :sswitch_9c
    new-instance v8, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    new-array v7, v7, [Lcom/streambundlehtml/select/Evaluator;

    new-instance v9, Lcom/streambundlehtml/select/StructuralEvaluator$Parent;

    invoke-direct {v9, v6}, Lcom/streambundlehtml/select/StructuralEvaluator$Parent;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    aput-object v9, v7, v4

    aput-object v1, v7, v5

    invoke-direct {v8, v7}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>([Lcom/streambundlehtml/select/Evaluator;)V

    .line 114
    .end local v6    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    .restart local v8    # "currentEval":Lcom/streambundlehtml/select/Evaluator;
    nop

    .line 136
    :goto_ad
    if-eqz v2, :cond_b6

    .line 137
    move-object v4, v3

    check-cast v4, Lcom/streambundlehtml/select/CombiningEvaluator$Or;

    invoke-virtual {v4, v8}, Lcom/streambundlehtml/select/CombiningEvaluator$Or;->replaceRightMostEvaluator(Lcom/streambundlehtml/select/Evaluator;)V

    goto :goto_b7

    .line 138
    :cond_b6
    move-object v3, v8

    .line 139
    :goto_b7
    iget-object v4, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 140
    return-void

    nop

    :sswitch_data_be
    .sparse-switch
        0x20 -> :sswitch_9c
        0x2b -> :sswitch_8b
        0x2c -> :sswitch_76
        0x3e -> :sswitch_65
        0x7e -> :sswitch_54
    .end sparse-switch
.end method

.method private consumeIndex()I
    .registers 4

    .line 354
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "indexS":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->isNumeric(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "Index must be numeric"

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->isTrue(ZLjava/lang/String;)V

    .line 356
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method private consumeSubQuery()Ljava/lang/String;
    .registers 6

    .line 143
    invoke-static {}, Lcom/streambundlehtml/internal/StringUtil;->borrowBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 144
    .local v0, "sq":Ljava/lang/StringBuilder;
    :goto_4
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_71

    .line 145
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v2, "("

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 146
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v3, 0x28

    const/16 v4, 0x29

    invoke-virtual {v2, v3, v4}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 147
    :cond_2e
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v2, "["

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_50

    .line 148
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v3, 0x5b

    const/16 v4, 0x5d

    invoke-virtual {v2, v3, v4}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 149
    :cond_50
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    sget-object v2, Lcom/streambundlehtml/select/QueryParser;->combinators:[C

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchesAny([C)Z

    move-result v1

    if-eqz v1, :cond_67

    .line 150
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_61

    .line 151
    goto :goto_71

    .line 153
    :cond_61
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    goto :goto_4

    .line 155
    :cond_67
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 157
    :cond_71
    :goto_71
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->releaseBuilder(Ljava/lang/StringBuilder;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private contains(Z)V
    .registers 6
    .param p1, "own"    # Z

    .line 369
    if-eqz p1, :cond_5

    const-string v0, ":containsOwn"

    goto :goto_7

    :cond_5
    const-string v0, ":contains"

    .line 370
    .local v0, "query":Ljava/lang/String;
    :goto_7
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 371
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v2, 0x28

    const/16 v3, 0x29

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/parser/TokenQueue;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 372
    .local v1, "searchText":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(text) query must not be empty"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    if-eqz p1, :cond_3a

    .line 374
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$ContainsOwnText;

    invoke-direct {v3, v1}, Lcom/streambundlehtml/select/Evaluator$ContainsOwnText;-><init>(Ljava/lang/String;)V

    goto :goto_3f

    .line 375
    :cond_3a
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$ContainsText;

    invoke-direct {v3, v1}, Lcom/streambundlehtml/select/Evaluator$ContainsText;-><init>(Ljava/lang/String;)V

    .line 373
    :goto_3f
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    return-void
.end method

.method private containsData()V
    .registers 4

    .line 390
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":containsData"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 391
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v1, 0x28

    const/16 v2, 0x29

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/parser/TokenQueue;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 392
    .local v0, "searchText":Ljava/lang/String;
    const-string v1, ":containsData(text) query must not be empty"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 393
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v2, Lcom/streambundlehtml/select/Evaluator$ContainsData;

    invoke-direct {v2, v0}, Lcom/streambundlehtml/select/Evaluator$ContainsData;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 394
    return-void
.end method

.method private containsWholeText(Z)V
    .registers 6
    .param p1, "own"    # Z

    .line 379
    if-eqz p1, :cond_5

    const-string v0, ":containsWholeOwnText"

    goto :goto_7

    :cond_5
    const-string v0, ":containsWholeText"

    .line 380
    .local v0, "query":Ljava/lang/String;
    :goto_7
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 381
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v2, 0x28

    const/16 v3, 0x29

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundlehtml/parser/TokenQueue;->unescape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 382
    .local v1, "searchText":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(text) query must not be empty"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 383
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    if-eqz p1, :cond_3a

    .line 384
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$ContainsWholeOwnText;

    invoke-direct {v3, v1}, Lcom/streambundlehtml/select/Evaluator$ContainsWholeOwnText;-><init>(Ljava/lang/String;)V

    goto :goto_3f

    .line 385
    :cond_3a
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$ContainsWholeText;

    invoke-direct {v3, v1}, Lcom/streambundlehtml/select/Evaluator$ContainsWholeText;-><init>(Ljava/lang/String;)V

    .line 383
    :goto_3f
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 386
    return-void
.end method

.method private cssNthChild(ZZ)V
    .registers 12
    .param p1, "backwards"    # Z
    .param p2, "ofType"    # Z

    .line 321
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->chompTo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundlehtml/internal/Normalizer;->normalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 322
    .local v0, "argS":Ljava/lang/String;
    sget-object v1, Lcom/streambundlehtml/select/QueryParser;->NTH_AB:Ljava/util/regex/Pattern;

    invoke-virtual {v1, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 323
    .local v1, "mAB":Ljava/util/regex/Matcher;
    sget-object v2, Lcom/streambundlehtml/select/QueryParser;->NTH_B:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    .line 325
    .local v2, "mB":Ljava/util/regex/Matcher;
    const-string v3, "odd"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 326
    const/4 v3, 0x2

    .line 327
    .local v3, "a":I
    const/4 v4, 0x1

    .local v4, "b":I
    goto :goto_75

    .line 328
    .end local v3    # "a":I
    .end local v4    # "b":I
    :cond_23
    const-string v3, "even"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    .line 329
    const/4 v3, 0x2

    .line 330
    .restart local v3    # "a":I
    const/4 v4, 0x0

    .restart local v4    # "b":I
    goto :goto_75

    .line 331
    .end local v3    # "a":I
    .end local v4    # "b":I
    :cond_2e
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    const/4 v4, 0x0

    const-string v5, ""

    const-string v6, "^\\+"

    const/4 v7, 0x1

    if-eqz v3, :cond_62

    .line 332
    const/4 v3, 0x3

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4d

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    :cond_4d
    move v3, v7

    .line 333
    .restart local v3    # "a":I
    const/4 v7, 0x4

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_61

    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .restart local v4    # "b":I
    :cond_61
    goto :goto_75

    .line 334
    .end local v3    # "a":I
    .end local v4    # "b":I
    :cond_62
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_a7

    .line 335
    const/4 v3, 0x0

    .line 336
    .restart local v3    # "a":I
    invoke-virtual {v2}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v6, v5}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 340
    .restart local v4    # "b":I
    :goto_75
    if-eqz p2, :cond_8f

    .line 341
    if-eqz p1, :cond_84

    .line 342
    iget-object v5, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v6, Lcom/streambundlehtml/select/Evaluator$IsNthLastOfType;

    invoke-direct {v6, v3, v4}, Lcom/streambundlehtml/select/Evaluator$IsNthLastOfType;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a6

    .line 344
    :cond_84
    iget-object v5, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v6, Lcom/streambundlehtml/select/Evaluator$IsNthOfType;

    invoke-direct {v6, v3, v4}, Lcom/streambundlehtml/select/Evaluator$IsNthOfType;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a6

    .line 346
    :cond_8f
    if-eqz p1, :cond_9c

    .line 347
    iget-object v5, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v6, Lcom/streambundlehtml/select/Evaluator$IsNthLastChild;

    invoke-direct {v6, v3, v4}, Lcom/streambundlehtml/select/Evaluator$IsNthLastChild;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_a6

    .line 349
    :cond_9c
    iget-object v5, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v6, Lcom/streambundlehtml/select/Evaluator$IsNthChild;

    invoke-direct {v6, v3, v4}, Lcom/streambundlehtml/select/Evaluator$IsNthChild;-><init>(II)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 351
    :goto_a6
    return-void

    .line 338
    .end local v3    # "a":I
    .end local v4    # "b":I
    :cond_a7
    new-instance v3, Lcom/streambundlehtml/select/Selector$SelectorParseException;

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v0, v5, v4

    const-string v4, "Could not parse nth-index \'%s\': unexpected format"

    invoke-direct {v3, v4, v5}, Lcom/streambundlehtml/select/Selector$SelectorParseException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v3
.end method

.method private findElements()V
    .registers 7

    .line 161
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, "#"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    .line 162
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->byId()V

    goto/16 :goto_239

    .line 163
    :cond_f
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, "."

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 164
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->byClass()V

    goto/16 :goto_239

    .line 165
    :cond_1e
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->matchesWord()Z

    move-result v0

    if-nez v0, :cond_236

    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, "*|"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_236

    .line 167
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, "["

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 168
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->byAttribute()V

    goto/16 :goto_239

    .line 169
    :cond_3f
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4e

    .line 170
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->allElements()V

    goto/16 :goto_239

    .line 171
    :cond_4e
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":lt("

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5d

    .line 172
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->indexLessThan()V

    goto/16 :goto_239

    .line 173
    :cond_5d
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":gt("

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6c

    .line 174
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->indexGreaterThan()V

    goto/16 :goto_239

    .line 175
    :cond_6c
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":eq("

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 176
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->indexEquals()V

    goto/16 :goto_239

    .line 177
    :cond_7b
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":has("

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8a

    .line 178
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->has()V

    goto/16 :goto_239

    .line 179
    :cond_8a
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":contains("

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_9a

    .line 180
    invoke-direct {p0, v1}, Lcom/streambundlehtml/select/QueryParser;->contains(Z)V

    goto/16 :goto_239

    .line 181
    :cond_9a
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v2, ":containsOwn("

    invoke-virtual {v0, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_aa

    .line 182
    invoke-direct {p0, v2}, Lcom/streambundlehtml/select/QueryParser;->contains(Z)V

    goto/16 :goto_239

    .line 183
    :cond_aa
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":containsWholeText("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b9

    .line 184
    invoke-direct {p0, v1}, Lcom/streambundlehtml/select/QueryParser;->containsWholeText(Z)V

    goto/16 :goto_239

    .line 185
    :cond_b9
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":containsWholeOwnText("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_c8

    .line 186
    invoke-direct {p0, v2}, Lcom/streambundlehtml/select/QueryParser;->containsWholeText(Z)V

    goto/16 :goto_239

    .line 187
    :cond_c8
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":containsData("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d7

    .line 188
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->containsData()V

    goto/16 :goto_239

    .line 189
    :cond_d7
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":matches("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e6

    .line 190
    invoke-direct {p0, v1}, Lcom/streambundlehtml/select/QueryParser;->matches(Z)V

    goto/16 :goto_239

    .line 191
    :cond_e6
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":matchesOwn("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f5

    .line 192
    invoke-direct {p0, v2}, Lcom/streambundlehtml/select/QueryParser;->matches(Z)V

    goto/16 :goto_239

    .line 193
    :cond_f5
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":matchesWholeText("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_104

    .line 194
    invoke-direct {p0, v1}, Lcom/streambundlehtml/select/QueryParser;->matchesWholeText(Z)V

    goto/16 :goto_239

    .line 195
    :cond_104
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":matchesWholeOwnText("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_113

    .line 196
    invoke-direct {p0, v2}, Lcom/streambundlehtml/select/QueryParser;->matchesWholeText(Z)V

    goto/16 :goto_239

    .line 197
    :cond_113
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":not("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_122

    .line 198
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->not()V

    goto/16 :goto_239

    .line 199
    :cond_122
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":nth-child("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_131

    .line 200
    invoke-direct {p0, v1, v1}, Lcom/streambundlehtml/select/QueryParser;->cssNthChild(ZZ)V

    goto/16 :goto_239

    .line 201
    :cond_131
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":nth-last-child("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_140

    .line 202
    invoke-direct {p0, v2, v1}, Lcom/streambundlehtml/select/QueryParser;->cssNthChild(ZZ)V

    goto/16 :goto_239

    .line 203
    :cond_140
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":nth-of-type("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_14f

    .line 204
    invoke-direct {p0, v1, v2}, Lcom/streambundlehtml/select/QueryParser;->cssNthChild(ZZ)V

    goto/16 :goto_239

    .line 205
    :cond_14f
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":nth-last-of-type("

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15e

    .line 206
    invoke-direct {p0, v2, v2}, Lcom/streambundlehtml/select/QueryParser;->cssNthChild(ZZ)V

    goto/16 :goto_239

    .line 207
    :cond_15e
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":first-child"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_174

    .line 208
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsFirstChild;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsFirstChild;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_239

    .line 209
    :cond_174
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":last-child"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18a

    .line 210
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsLastChild;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsLastChild;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_239

    .line 211
    :cond_18a
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":first-of-type"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1a0

    .line 212
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsFirstOfType;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsFirstOfType;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_239

    .line 213
    :cond_1a0
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":last-of-type"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1b6

    .line 214
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsLastOfType;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsLastOfType;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_239

    .line 215
    :cond_1b6
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":only-child"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1cb

    .line 216
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsOnlyChild;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsOnlyChild;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_239

    .line 217
    :cond_1cb
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":only-of-type"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e0

    .line 218
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsOnlyOfType;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsOnlyOfType;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_239

    .line 219
    :cond_1e0
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":empty"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f5

    .line 220
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsEmpty;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsEmpty;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_239

    .line 221
    :cond_1f5
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":root"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20a

    .line 222
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IsRoot;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$IsRoot;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_239

    .line 223
    :cond_20a
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v3, ":matchText"

    invoke-virtual {v0, v3}, Lcom/streambundlehtml/parser/TokenQueue;->matchChomp(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_21f

    .line 224
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$MatchText;

    invoke-direct {v1}, Lcom/streambundlehtml/select/Evaluator$MatchText;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_239

    .line 226
    :cond_21f
    new-instance v0, Lcom/streambundlehtml/select/Selector$SelectorParseException;

    iget-object v3, p0, Lcom/streambundlehtml/select/QueryParser;->query:Ljava/lang/String;

    iget-object v4, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v4}, Lcom/streambundlehtml/parser/TokenQueue;->remainder()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    aput-object v3, v5, v1

    aput-object v4, v5, v2

    const-string v1, "Could not parse query \'%s\': unexpected token at \'%s\'"

    invoke-direct {v0, v1, v5}, Lcom/streambundlehtml/select/Selector$SelectorParseException;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    throw v0

    .line 166
    :cond_236
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->byTag()V

    .line 228
    :goto_239
    return-void
.end method

.method private has()V
    .registers 5

    .line 361
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":has"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 362
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v1, 0x28

    const/16 v2, 0x29

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v0

    .line 363
    .local v0, "subQuery":Ljava/lang/String;
    const-string v1, ":has(selector) sub-select must not be empty"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v2, Lcom/streambundlehtml/select/StructuralEvaluator$Has;

    invoke-static {v0}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/streambundlehtml/select/StructuralEvaluator$Has;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 365
    return-void
.end method

.method private indexEquals()V
    .registers 4

    .line 313
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IndexEquals;

    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->consumeIndex()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/streambundlehtml/select/Evaluator$IndexEquals;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 314
    return-void
.end method

.method private indexGreaterThan()V
    .registers 4

    .line 309
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IndexGreaterThan;

    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->consumeIndex()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/streambundlehtml/select/Evaluator$IndexGreaterThan;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 310
    return-void
.end method

.method private indexLessThan()V
    .registers 4

    .line 305
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/Evaluator$IndexLessThan;

    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->consumeIndex()I

    move-result v2

    invoke-direct {v1, v2}, Lcom/streambundlehtml/select/Evaluator$IndexLessThan;-><init>(I)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    return-void
.end method

.method private matches(Z)V
    .registers 7
    .param p1, "own"    # Z

    .line 398
    if-eqz p1, :cond_5

    const-string v0, ":matchesOwn"

    goto :goto_7

    :cond_5
    const-string v0, ":matches"

    .line 399
    .local v0, "query":Ljava/lang/String;
    :goto_7
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 400
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v2, 0x28

    const/16 v3, 0x29

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v1

    .line 401
    .local v1, "regex":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(regex) query must not be empty"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 403
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    if-eqz p1, :cond_3a

    .line 404
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$MatchesOwn;

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/streambundlehtml/select/Evaluator$MatchesOwn;-><init>(Ljava/util/regex/Pattern;)V

    goto :goto_43

    .line 405
    :cond_3a
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$Matches;

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/streambundlehtml/select/Evaluator$Matches;-><init>(Ljava/util/regex/Pattern;)V

    .line 403
    :goto_43
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 406
    return-void
.end method

.method private matchesWholeText(Z)V
    .registers 7
    .param p1, "own"    # Z

    .line 410
    if-eqz p1, :cond_5

    const-string v0, ":matchesWholeOwnText"

    goto :goto_7

    :cond_5
    const-string v0, ":matchesWholeText"

    .line 411
    .local v0, "query":Ljava/lang/String;
    :goto_7
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 412
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v2, 0x28

    const/16 v3, 0x29

    invoke-virtual {v1, v2, v3}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v1

    .line 413
    .local v1, "regex":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "(regex) query must not be empty"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 415
    iget-object v2, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    if-eqz p1, :cond_3a

    .line 416
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$MatchesWholeOwnText;

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/streambundlehtml/select/Evaluator$MatchesWholeOwnText;-><init>(Ljava/util/regex/Pattern;)V

    goto :goto_43

    .line 417
    :cond_3a
    new-instance v3, Lcom/streambundlehtml/select/Evaluator$MatchesWholeText;

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/streambundlehtml/select/Evaluator$MatchesWholeText;-><init>(Ljava/util/regex/Pattern;)V

    .line 415
    :goto_43
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 418
    return-void
.end method

.method private not()V
    .registers 5

    .line 422
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const-string v1, ":not"

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume(Ljava/lang/String;)V

    .line 423
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    const/16 v1, 0x28

    const/16 v2, 0x29

    invoke-virtual {v0, v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->chompBalanced(CC)Ljava/lang/String;

    move-result-object v0

    .line 424
    .local v0, "subQuery":Ljava/lang/String;
    const-string v1, ":not(selector) subselect must not be empty"

    invoke-static {v0, v1}, Lcom/streambundlehtml/helper/Validate;->notEmpty(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v2, Lcom/streambundlehtml/select/StructuralEvaluator$Not;

    invoke-static {v0}, Lcom/streambundlehtml/select/QueryParser;->parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/streambundlehtml/select/StructuralEvaluator$Not;-><init>(Lcom/streambundlehtml/select/Evaluator;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 427
    return-void
.end method

.method public static parse(Ljava/lang/String;)Lcom/streambundlehtml/select/Evaluator;
    .registers 4
    .param p0, "query"    # Ljava/lang/String;

    .line 44
    :try_start_0
    new-instance v0, Lcom/streambundlehtml/select/QueryParser;

    invoke-direct {v0, p0}, Lcom/streambundlehtml/select/QueryParser;-><init>(Ljava/lang/String;)V

    .line 45
    .local v0, "p":Lcom/streambundlehtml/select/QueryParser;
    invoke-virtual {v0}, Lcom/streambundlehtml/select/QueryParser;->parse()Lcom/streambundlehtml/select/Evaluator;

    move-result-object v1
    :try_end_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_9} :catch_a

    return-object v1

    .line 46
    .end local v0    # "p":Lcom/streambundlehtml/select/QueryParser;
    :catch_a
    move-exception v0

    .line 47
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lcom/streambundlehtml/select/Selector$SelectorParseException;

    invoke-virtual {v0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/streambundlehtml/select/Selector$SelectorParseException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method parse()Lcom/streambundlehtml/select/Evaluator;
    .registers 4

    .line 56
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeWhitespace()Z

    .line 58
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    sget-object v1, Lcom/streambundlehtml/select/QueryParser;->combinators:[C

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/TokenQueue;->matchesAny([C)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 59
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    new-instance v1, Lcom/streambundlehtml/select/StructuralEvaluator$Root;

    invoke-direct {v1}, Lcom/streambundlehtml/select/StructuralEvaluator$Root;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    move-result v0

    invoke-direct {p0, v0}, Lcom/streambundlehtml/select/QueryParser;->combinator(C)V

    goto :goto_26

    .line 62
    :cond_23
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->findElements()V

    .line 65
    :goto_26
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_54

    .line 67
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/TokenQueue;->consumeWhitespace()Z

    move-result v0

    .line 69
    .local v0, "seenWhite":Z
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    sget-object v2, Lcom/streambundlehtml/select/QueryParser;->combinators:[C

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/parser/TokenQueue;->matchesAny([C)Z

    move-result v1

    if-eqz v1, :cond_48

    .line 70
    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->tq:Lcom/streambundlehtml/parser/TokenQueue;

    invoke-virtual {v1}, Lcom/streambundlehtml/parser/TokenQueue;->consume()C

    move-result v1

    invoke-direct {p0, v1}, Lcom/streambundlehtml/select/QueryParser;->combinator(C)V

    goto :goto_53

    .line 71
    :cond_48
    if-eqz v0, :cond_50

    .line 72
    const/16 v1, 0x20

    invoke-direct {p0, v1}, Lcom/streambundlehtml/select/QueryParser;->combinator(C)V

    goto :goto_53

    .line 74
    :cond_50
    invoke-direct {p0}, Lcom/streambundlehtml/select/QueryParser;->findElements()V

    .line 76
    .end local v0    # "seenWhite":Z
    :goto_53
    goto :goto_26

    .line 78
    :cond_54
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_67

    .line 79
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/select/Evaluator;

    return-object v0

    .line 81
    :cond_67
    new-instance v0, Lcom/streambundlehtml/select/CombiningEvaluator$And;

    iget-object v1, p0, Lcom/streambundlehtml/select/QueryParser;->evals:Ljava/util/List;

    invoke-direct {v0, v1}, Lcom/streambundlehtml/select/CombiningEvaluator$And;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 431
    iget-object v0, p0, Lcom/streambundlehtml/select/QueryParser;->query:Ljava/lang/String;

    return-object v0
.end method
