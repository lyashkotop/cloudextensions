.class public final synthetic Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# static fields
.field public static final synthetic INSTANCE:Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;

    invoke-direct {v0}, Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;-><init>()V

    sput-object v0, Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;->INSTANCE:Lcom/lagradost/-$$Lambda$MissavSearch$YXkVj7JKbf5dRRsSukpL49dopxk;

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

    invoke-static {p1}, Lcom/lagradost/MissavSearch;->lambda$YXkVj7JKbf5dRRsSukpL49dopxk(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method
