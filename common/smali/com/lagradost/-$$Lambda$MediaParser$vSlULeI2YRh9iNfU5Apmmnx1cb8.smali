.class public final synthetic Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final synthetic INSTANCE:Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;

    invoke-direct {v0}, Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;-><init>()V

    sput-object v0, Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;->INSTANCE:Lcom/lagradost/-$$Lambda$MediaParser$vSlULeI2YRh9iNfU5Apmmnx1cb8;

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

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Lcom/lagradost/MediaParser;->lambda$vSlULeI2YRh9iNfU5Apmmnx1cb8(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
