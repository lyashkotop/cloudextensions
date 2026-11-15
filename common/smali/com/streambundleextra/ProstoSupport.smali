.class public final Lcom/streambundleextra/ProstoSupport;
.super Ljava/lang/Object;
.source "ProstoSupport.java"


# direct methods
.method public static results(Lcom/streambundlehtml/nodes/Document;)Lcom/streambundlehtml/nodes/Document;
    .registers 5

    invoke-virtual {p0}, Lcom/streambundlehtml/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v1

    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v2, "prostoporno.dev"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    const-string v1, ".search-result__page .thumbs_list"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/nodes/Document;->selectFirst(Ljava/lang/String;)Lcom/streambundlehtml/nodes/Element;

    move-result-object v1

    const-string v2, ""

    if-eqz v1, :cond_22

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Element;->outerHtml()Ljava/lang/String;

    move-result-object v2

    :cond_22
    invoke-static {v2, v0}, Lcom/streambundlehtml/Jsoup;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/streambundlehtml/nodes/Document;

    move-result-object p0

    :cond_26
    return-object p0
.end method
