.class public final Lcom/streambundle/v38/BundleSettings;
.super Ljava/lang/Object;
.source "BundleSettings.java"


# static fields
.field public static final BLOCKED_CATEGORIES:[Ljava/lang/String;

.field public static volatile HIDE_BLOCKED_CATEGORIES:Z

.field private static final RUSSIAN_HOSTS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 63

    .line 8
    const/4 v0, 0x1

    sput-boolean v0, Lcom/streambundle/v38/BundleSettings;->HIDE_BLOCKED_CATEGORIES:Z

    .line 10
    nop

    .line 11
    nop

    .line 12
    nop

    .line 13
    nop

    .line 14
    nop

    .line 15
    nop

    .line 16
    nop

    .line 17
    nop

    .line 18
    nop

    .line 19
    nop

    .line 20
    nop

    .line 21
    const-string v61, "\u043f\u0435\u0433\u0433\u0438\u043d\u0433"

    const-string v62, "\u043f\u0435\u0433\u0438\u043d\u0433"

    const-string v1, "gay"

    const-string v2, "gays"

    const-string v3, "gaysex"

    const-string v4, "gay sex"

    const-string v5, "homosexual"

    const-string v6, "homosexuals"

    const-string v7, "homosexuality"

    const-string v8, "male on male"

    const-string v9, "man on man"

    const-string v10, "male male"

    const-string v11, "m/m"

    const-string v12, "transgender"

    const-string v13, "transgenders"

    const-string v14, "transsexual"

    const-string v15, "transsexuals"

    const-string v16, "shemale"

    const-string v17, "shemales"

    const-string v18, "ladyboy"

    const-string v19, "ladyboys"

    const-string v20, "lady boy"

    const-string v21, "futanari"

    const-string v22, "femboy"

    const-string v23, "femboys"

    const-string v24, "sissy"

    const-string v25, "sissies"

    const-string v26, "femdom"

    const-string v27, "female domination"

    const-string v28, "dominatrix"

    const-string v29, "pegging"

    const-string v30, "\u0433\u0435\u0439"

    const-string v31, "\u0433\u0435\u0438"

    const-string v32, "\u0433\u0435\u0435\u0432"

    const-string v33, "\u0433\u0435\u044f\u043c\u0438"

    const-string v34, "\u0433\u0435\u0439\u0441\u043a\u0438\u0439"

    const-string v35, "\u0433\u0435\u0439\u0441\u043a\u043e\u0435"

    const-string v36, "\u0433\u0435\u0439\u0441\u043a\u0438\u0435"

    const-string v37, "\u0433\u043e\u043c\u043e\u0441\u0435\u043a\u0441\u0443\u0430\u043b"

    const-string v38, "\u0433\u043e\u043c\u043e\u0441\u0435\u043a\u0441\u0443\u0430\u043b\u044b"

    const-string v39, "\u0433\u043e\u043c\u043e\u0441\u0435\u043a\u0441\u0443\u0430\u043b\u044c\u043d\u044b\u0439"

    const-string v40, "\u0433\u043e\u043c\u043e\u0441\u0435\u043a\u0441\u0443\u0430\u043b\u044c\u043d\u043e\u0435"

    const-string v41, "\u0433\u043e\u043c\u043e\u0441\u0435\u043a\u0441\u0443\u0430\u043b\u044c\u043d\u043e\u0441\u0442\u044c"

    const-string v42, "\u0442\u0440\u0430\u043d\u0441\u0433\u0435\u043d\u0434\u0435\u0440"

    const-string v43, "\u0442\u0440\u0430\u043d\u0441\u0433\u0435\u043d\u0434\u0435\u0440\u044b"

    const-string v44, "\u0442\u0440\u0430\u043d\u0441\u0433\u0435\u043d\u0434\u0435\u0440\u043d\u044b\u0439"

    const-string v45, "\u0442\u0440\u0430\u043d\u0441\u0441\u0435\u043a\u0441\u0443\u0430\u043b"

    const-string v46, "\u0442\u0440\u0430\u043d\u0441\u0441\u0435\u043a\u0441\u0443\u0430\u043b\u044b"

    const-string v47, "\u0442\u0440\u0430\u043d\u0441\u0441\u0435\u043a\u0441\u0443\u0430\u043b\u044c\u043d\u044b\u0439"

    const-string v48, "\u0448\u0438\u043c\u0435\u0439\u043b"

    const-string v49, "\u0448\u0438\u043c\u0435\u0439\u043b\u044b"

    const-string v50, "\u043b\u0435\u0434\u0438\u0431\u043e\u0439"

    const-string v51, "\u043b\u0435\u0434\u0438\u0431\u043e\u0438"

    const-string v52, "\u0444\u0443\u0442\u0430\u043d\u0430\u0440\u0438"

    const-string v53, "\u0444\u0435\u043c\u0431\u043e\u0439"

    const-string v54, "\u0444\u0435\u043c\u0431\u043e\u0438"

    const-string v55, "\u0441\u0438\u0441\u0441\u0438"

    const-string v56, "\u0444\u0435\u043c\u0434\u043e\u043c"

    const-string v57, "\u0444\u0435\u043c \u0434\u043e\u043c"

    const-string v58, "\u0436\u0435\u043d\u0441\u043a\u043e\u0435 \u0434\u043e\u043c\u0438\u043d\u0438\u0440\u043e\u0432\u0430\u043d\u0438\u0435"

    const-string v59, "\u0434\u043e\u043c\u0438\u043d\u0430"

    const-string v60, "\u0434\u043e\u043c\u0438\u043d\u0430\u0442\u0440\u0438\u043a\u0441"

    filled-new-array/range {v1 .. v62}, [Ljava/lang/String;

    move-result-object v0

    .line 10
    sput-object v0, Lcom/streambundle/v38/BundleSettings;->BLOCKED_CATEGORIES:[Ljava/lang/String;

    .line 23
    nop

    .line 24
    nop

    .line 25
    const-string v7, "huyamba.name"

    const-string v8, "huyamba.mobi"

    const-string v1, "1ebalka.ru.actor"

    const-string v2, "semyana.com"

    const-string v3, "strip2.co"

    const-string v4, "vpoisk.xyz"

    const-string v5, "perdol.net"

    const-string v6, "prostoporno.dev"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    .line 23
    sput-object v0, Lcom/streambundle/v38/BundleSettings;->RUSSIAN_HOSTS:[Ljava/lang/String;

    .line 26
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static isRussianSource(Ljava/lang/Object;)Z
    .registers 8

    .line 32
    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "getMainUrl"

    new-array v3, v0, [Ljava/lang/Class;

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 33
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p0
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1f} :catch_53

    .line 34
    nop

    .line 37
    if-nez p0, :cond_23

    return v0

    .line 38
    :cond_23
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 39
    sget-object v1, Lcom/streambundle/v38/BundleSettings;->RUSSIAN_HOSTS:[Ljava/lang/String;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_2d
    if-lt v3, v2, :cond_30

    .line 41
    return v0

    .line 39
    :cond_30
    aget-object v4, v1, v3

    .line 40
    invoke-virtual {p0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_51

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "."

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4e

    goto :goto_51

    .line 39
    :cond_4e
    add-int/lit8 v3, v3, 0x1

    goto :goto_2d

    .line 40
    :cond_51
    :goto_51
    const/4 p0, 0x1

    return p0

    .line 34
    :catch_53
    move-exception p0

    .line 35
    return v0
.end method

.method public static translationTarget(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 45
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    const-string v0, "\\s+"

    const-string v1, " "

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 46
    const-string v0, "[\u0410-\u042f\u0430-\u044f\u0401\u0451]+(?:[-\'][\u0410-\u042f\u0430-\u044f\u0401\u0451]+)*"

    invoke-virtual {p1, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    const-string p0, "en"

    return-object p0

    .line 47
    :cond_17
    nop

    .line 48
    invoke-static {p0}, Lcom/streambundle/v38/BundleSettings;->isRussianSource(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_46

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "[A-Za-z]+(?:[-\'][A-Za-z]+)*"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "(?: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, ")?"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_46

    const-string p0, "ru"

    return-object p0

    .line 49
    :cond_46
    const-string p0, ""

    return-object p0
.end method
