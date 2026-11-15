.class public Lcom/streambundlehtml/Jsoup;
.super Ljava/lang/Object;
.source "Jsoup.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clean(Ljava/lang/String;Lcom/streambundlehtml/safety/Safelist;)Ljava/lang/String;
    .registers 3
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "safelist"    # Lcom/streambundlehtml/safety/Safelist;

    .line 317
    const-string v0, ""

    invoke-static {p0, v0, p1}, Lcom/streambundlehtml/Jsoup;->clean(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/safety/Safelist;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static clean(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/safety/Safelist;)Ljava/lang/String;
    .registers 7
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;
    .param p2, "safelist"    # Lcom/streambundlehtml/safety/Safelist;

    .line 280
    invoke-static {p0, p1}, Lcom/streambundlehtml/Jsoup;->parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 281
    .local v0, "dirty":Lcom/streambundlehtml/nodes/Document;
    new-instance v1, Lcom/streambundlehtml/safety/Cleaner;

    invoke-direct {v1, p2}, Lcom/streambundlehtml/safety/Cleaner;-><init>(Lcom/streambundlehtml/safety/Safelist;)V

    .line 282
    .local v1, "cleaner":Lcom/streambundlehtml/safety/Cleaner;
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/safety/Cleaner;->clean(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 283
    .local v2, "clean":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->html()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static clean(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/safety/Safelist;Lcom/streambundlehtml/nodes/Document$OutputSettings;)Ljava/lang/String;
    .registers 8
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;
    .param p2, "safelist"    # Lcom/streambundlehtml/safety/Safelist;
    .param p3, "outputSettings"    # Lcom/streambundlehtml/nodes/Document$OutputSettings;

    .line 335
    invoke-static {p0, p1}, Lcom/streambundlehtml/Jsoup;->parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    .line 336
    .local v0, "dirty":Lcom/streambundlehtml/nodes/Document;
    new-instance v1, Lcom/streambundlehtml/safety/Cleaner;

    invoke-direct {v1, p2}, Lcom/streambundlehtml/safety/Cleaner;-><init>(Lcom/streambundlehtml/safety/Safelist;)V

    .line 337
    .local v1, "cleaner":Lcom/streambundlehtml/safety/Cleaner;
    invoke-virtual {v1, v0}, Lcom/streambundlehtml/safety/Cleaner;->clean(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v2

    .line 338
    .local v2, "clean":Lcom/streambundlehtml/nodes/Document;
    invoke-virtual {v2, p3}, Lcom/streambundlehtml/nodes/Document;->outputSettings(Lcom/streambundlehtml/nodes/Document$OutputSettings;)Lcom/streambundlehtml/nodes/Document;

    .line 339
    invoke-virtual {v2}, Lcom/streambundlehtml/nodes/Document;->body()Lcom/streambundlehtml/nodes/Element;

    move-result-object v3

    invoke-virtual {v3}, Lcom/streambundlehtml/nodes/Element;->html()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static connect(Ljava/lang/String;)Lcom/streambundlehtml/Connection;
    .registers 2
    .param p0, "url"    # Ljava/lang/String;

    .line 94
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->connect(Ljava/lang/String;)Lcom/streambundlehtml/Connection;

    move-result-object v0

    return-object v0
.end method

.method public static isValid(Ljava/lang/String;Lcom/streambundlehtml/safety/Safelist;)Z
    .registers 3
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "safelist"    # Lcom/streambundlehtml/safety/Safelist;

    .line 364
    new-instance v0, Lcom/streambundlehtml/safety/Cleaner;

    invoke-direct {v0, p1}, Lcom/streambundlehtml/safety/Cleaner;-><init>(Lcom/streambundlehtml/safety/Safelist;)V

    invoke-virtual {v0, p0}, Lcom/streambundlehtml/safety/Cleaner;->isValidBodyHtml(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static newSession()Lcom/streambundlehtml/Connection;
    .registers 1

    .line 121
    new-instance v0, Lcom/streambundlehtml/helper/HttpConnection;

    invoke-direct {v0}, Lcom/streambundlehtml/helper/HttpConnection;-><init>()V

    return-object v0
.end method

.method public static parse(Ljava/io/File;)Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 168
    const/4 v0, 0x0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/streambundlehtml/helper/DataUtil;->load(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/File;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .param p0, "file"    # Ljava/io/File;
    .param p1, "charsetName"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/streambundlehtml/helper/DataUtil;->load(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "charsetName"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 136
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/helper/DataUtil;->load(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .param p1, "charsetName"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 185
    invoke-static {p0, p1, p2, p3}, Lcom/streambundlehtml/helper/DataUtil;->load(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p0, "in"    # Ljava/io/InputStream;
        .annotation runtime Ljavax/annotation/WillClose;
        .end annotation
    .end param
    .param p1, "charsetName"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "baseUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 200
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/helper/DataUtil;->load(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;
    .registers 5
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "charsetName"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "baseUri"    # Ljava/lang/String;
    .param p3, "parser"    # Lcom/streambundlehtml/parser/Parser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 217
    invoke-static {p0, p1, p2, p3}, Lcom/streambundlehtml/helper/DataUtil;->load(Ljava/io/InputStream;Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 2
    .param p0, "html"    # Ljava/lang/String;

    .line 77
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/streambundlehtml/parser/Parser;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .param p0, "html"    # Ljava/lang/String;
    .param p1, "parser"    # Lcom/streambundlehtml/parser/Parser;

    .line 64
    const-string v0, ""

    invoke-virtual {p1, p0, v0}, Lcom/streambundlehtml/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .param p0, "html"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 36
    invoke-static {p0, p1}, Lcom/streambundlehtml/parser/Parser;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/lang/String;Ljava/lang/String;Lcom/streambundlehtml/parser/Parser;)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p0, "html"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;
    .param p2, "parser"    # Lcom/streambundlehtml/parser/Parser;

    .line 50
    invoke-virtual {p2, p0, p1}, Lcom/streambundlehtml/parser/Parser;->parseInput(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parse(Ljava/net/URL;I)Lcom/streambundlehtml/nodes/Document;
    .registers 4
    .param p0, "url"    # Ljava/net/URL;
    .param p1, "timeoutMillis"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 263
    invoke-static {p0}, Lcom/streambundlehtml/helper/HttpConnection;->connect(Ljava/net/URL;)Lcom/streambundlehtml/Connection;

    move-result-object v0

    .line 264
    .local v0, "con":Lcom/streambundlehtml/Connection;
    invoke-interface {v0, p1}, Lcom/streambundlehtml/Connection;->timeout(I)Lcom/streambundlehtml/Connection;

    .line 265
    invoke-interface {v0}, Lcom/streambundlehtml/Connection;->get()Lcom/streambundlehtml/nodes/Document;

    move-result-object v1

    return-object v1
.end method

.method public static parseBodyFragment(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 2
    .param p0, "bodyHtml"    # Ljava/lang/String;

    .line 242
    const-string v0, ""

    invoke-static {p0, v0}, Lcom/streambundlehtml/parser/Parser;->parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method

.method public static parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;
    .registers 3
    .param p0, "bodyHtml"    # Ljava/lang/String;
    .param p1, "baseUri"    # Ljava/lang/String;

    .line 230
    invoke-static {p0, p1}, Lcom/streambundlehtml/parser/Parser;->parseBodyFragment(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object v0

    return-object v0
.end method
