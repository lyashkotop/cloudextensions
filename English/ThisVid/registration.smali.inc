new-instance v0, Lcom/streambundleextra/ThisVidProvider;

    invoke-direct {v0}, Lcom/streambundleextra/ThisVidProvider;-><init>()V

    const-string v1, "ThisVid"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "en"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V
