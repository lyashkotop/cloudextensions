new-instance v0, Lcom/example/ebalka/EbalkaProvider;

    invoke-direct {v0}, Lcom/example/ebalka/EbalkaProvider;-><init>()V

    const-string v1, "Ebalka"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setName(Ljava/lang/String;)V

    const-string v1, "ru"

    invoke-virtual {v0, v1}, Lcom/lagradost/cloudstream3/MainAPI;->setLang(Ljava/lang/String;)V
