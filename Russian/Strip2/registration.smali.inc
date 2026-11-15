new-instance v0, Lcom/example/websites/Strip2Provider;

    invoke-direct {v0}, Lcom/example/websites/Strip2Provider;-><init>()V

    const-string v1, "Strip2"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V
