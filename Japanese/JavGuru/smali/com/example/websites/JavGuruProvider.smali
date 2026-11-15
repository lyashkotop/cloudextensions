.class public final Lcom/example/websites/JavGuruProvider;
.super Lcom/example/websites/WebVideoProvider;


# direct methods
.method public constructor <init>()V
    .registers 10

    move-object v0, p0

    const-string v1, "javguru"

    const-string v2, "https://jav.guru"

    const-string v3, "12. JAVGuru"

    const-string v4, "ja"

    const-string v5, "/"

    const-string v6, ".column, .thumbnail"

    const-string v7, ".imgg a[href], .related-title a[href], a[href]"

    const-string v8, ".grid1 h2 a, .related-title a, .tits"

    invoke-direct/range {v0 .. v8}, Lcom/example/websites/WebVideoProvider;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public linksOriginal48(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 7

    invoke-static/range {p4 .. p4}, Lcom/streambundle/Unified;->links(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;

    move-result-object p4

    invoke-static {p1, p3, p4, p5}, Lcom/videobundle/fixes/JavGuruLinks;->load(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public loadLinks(Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 6

    invoke-static/range {p0 .. p5}, Lcom/streambundle/v48/LinkGuard;->load(Ljava/lang/Object;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
