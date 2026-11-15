.class public final synthetic Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final synthetic INSTANCE:Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;

    invoke-direct {v0}, Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;-><init>()V

    sput-object v0, Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;->INSTANCE:Lcom/lagradost/-$$Lambda$MediaParser$5UkvAMpJGMr4AeHOwaKufsKrkWE;

    return-void
.end method

.method private synthetic constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    check-cast p1, Lorg/jsoup/nodes/Element;

    invoke-static {p1}, Lcom/lagradost/MediaParser;->lambda$5UkvAMpJGMr4AeHOwaKufsKrkWE(Lorg/jsoup/nodes/Element;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
