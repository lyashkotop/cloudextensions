new-instance v0, Lcom/streambundleextra/BoundHubProvider;

    invoke-direct {v0}, Lcom/streambundleextra/BoundHubProvider;-><init>()V

    const-string v1, "BoundHub"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V
