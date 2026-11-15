new-instance v0, Lcom/example/websites/JavGuruProvider;

    invoke-direct {v0}, Lcom/example/websites/JavGuruProvider;-><init>()V

    const-string v1, "JAVGuru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ja"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V
