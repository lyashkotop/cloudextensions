new-instance v1, Lcom/lagradost/CatalogSite;

    const/4 v2, 0x1

    const-string v3, "PornVideos.rs"

    const-string v4, "https://www.pornvideos.rs"

    invoke-direct {v1, v2, v3, v4}, Lcom/lagradost/CatalogSite;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/lagradost/VideoHubProvider;

    invoke-direct {v0, v1}, Lcom/lagradost/VideoHubProvider;-><init>(Lcom/lagradost/CatalogSite;)V

    const-string v1, "PornVideos.rs"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V
