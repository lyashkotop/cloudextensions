.class public final Lcom/streambundle/SourceTiming;
.super Ljava/lang/Object;
.source "SourceTiming.java"


# static fields
.field private static final ISO:Ljava/util/regex/Pattern;

.field private static final TIMES:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 13
    new-instance v0, Lcom/streambundle/SourceTiming$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x40

    invoke-direct {v0, v3, v1, v2}, Lcom/streambundle/SourceTiming$1;-><init>(IFZ)V

    .line 12
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/streambundle/SourceTiming;->TIMES:Ljava/util/Map;

    .line 16
    const-string v0, "(?i)^P(?:(\\d+)D)?T(?:(\\d+)H)?(?:(\\d+)M)?(?:(\\d+(?:\\.\\d+)?)S)?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/streambundle/SourceTiming;->ISO:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static key(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    .line 21
    :try_start_0
    const-string v0, "com.streambundle.v38.BundleMetadata"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "key"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_1f
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1f} :catch_22
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_1f} :catch_20

    return-object v0

    .line 22
    :catch_20
    move-exception v0

    goto :goto_23

    :catch_22
    move-exception v0

    :goto_23
    return-object p0
.end method

.method public static label(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 60
    sget-object v0, Lcom/streambundle/SourceTiming;->TIMES:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundle/SourceTiming;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_10

    const-string p0, ""

    :cond_10
    return-object p0
.end method

.method private static number(Ljava/lang/String;)Ljava/math/BigDecimal;
    .registers 2

    .line 24
    if-nez p0, :cond_5

    sget-object p0, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    goto :goto_b

    :cond_5
    new-instance v0, Ljava/math/BigDecimal;

    invoke-direct {v0, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    move-object p0, v0

    :goto_b
    return-object p0
.end method

.method public static parse(Ljava/lang/String;)Ljava/lang/String;
    .registers 14

    .line 26
    const-string v0, ""

    if-nez p0, :cond_5

    return-object v0

    .line 27
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 30
    :try_start_9
    const-string v1, "[0-9]+(?:\\.[0-9]+)?"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x2

    const-wide/16 v3, 0x3c

    const/16 v5, 0x3c

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v1, :cond_1f

    new-instance v1, Ljava/math/BigDecimal;

    invoke-direct {v1, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    goto/16 :goto_d8

    .line 32
    :cond_1f
    sget-object v1, Lcom/streambundle/SourceTiming;->ISO:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v8

    const/16 v9, 0xe10

    const/4 v10, 0x3

    if-eqz v8, :cond_7b

    .line 34
    invoke-virtual {v1, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/streambundle/SourceTiming;->number(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object p0

    new-instance v8, Ljava/math/BigDecimal;

    const v11, 0x15180

    invoke-direct {v8, v11}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {p0, v8}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    .line 35
    invoke-virtual {v1, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/streambundle/SourceTiming;->number(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v8

    new-instance v11, Ljava/math/BigDecimal;

    invoke-direct {v11, v9}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v8, v11}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {p0, v8}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    .line 36
    invoke-virtual {v1, v10}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/streambundle/SourceTiming;->number(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v8

    new-instance v9, Ljava/math/BigDecimal;

    invoke-direct {v9, v5}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v8, v9}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {p0, v8}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    const/4 v8, 0x4

    invoke-virtual {v1, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/SourceTiming;->number(Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 34
    nop

    .line 37
    goto :goto_d8

    .line 38
    :cond_7b
    const-string v1, "(?:[0-9]+:)?[0-9]{1,2}:[0-9]{2}(?:\\.[0-9]+)?"

    invoke-virtual {p0, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_84

    return-object v0

    .line 39
    :cond_84
    const-string v1, ":"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 40
    new-instance v1, Ljava/math/BigDecimal;

    array-length v8, p0

    sub-int/2addr v8, v7

    aget-object v8, p0, v8

    invoke-direct {v1, v8}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    .line 41
    array-length v8, p0

    sub-int/2addr v8, v2

    aget-object v8, p0, v8

    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v11

    .line 42
    new-instance v8, Ljava/math/BigDecimal;

    invoke-direct {v8, v5}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v1, v8}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v8

    if-gez v8, :cond_166

    array-length v8, p0

    if-ne v8, v10, :cond_af

    cmp-long v8, v11, v3

    if-ltz v8, :cond_af

    goto/16 :goto_166

    .line 43
    :cond_af
    new-instance v8, Ljava/math/BigDecimal;

    invoke-direct {v8, v11, v12}, Ljava/math/BigDecimal;-><init>(J)V

    new-instance v11, Ljava/math/BigDecimal;

    invoke-direct {v11, v5}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v8, v11}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 44
    array-length v8, p0

    if-ne v8, v10, :cond_d8

    new-instance v8, Ljava/math/BigDecimal;

    aget-object p0, p0, v6

    invoke-direct {v8, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/math/BigDecimal;

    invoke-direct {p0, v9}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v8, p0}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 47
    :cond_d8
    :goto_d8
    invoke-virtual {v1}, Ljava/math/BigDecimal;->signum()I

    move-result p0

    if-gtz p0, :cond_df

    return-object v0

    .line 48
    :cond_df
    sget-object p0, Ljava/math/RoundingMode;->DOWN:Ljava/math/RoundingMode;

    invoke-virtual {v1, v6, p0}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->longValueExact()J

    move-result-wide v8

    .line 49
    new-instance p0, Ljava/math/BigDecimal;

    invoke-direct {p0, v5}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v1, p0}, Ljava/math/BigDecimal;->remainder(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->stripTrailingZeros()Ljava/math/BigDecimal;

    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object v1

    .line 51
    sget-object v5, Ljava/math/BigDecimal;->TEN:Ljava/math/BigDecimal;

    invoke-virtual {p0, v5}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result p0

    if-gez p0, :cond_111

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v5, "0"

    invoke-direct {p0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 52
    :cond_111
    const-wide/16 v10, 0xe10

    cmp-long p0, v8, v10

    if-ltz p0, :cond_143

    new-instance p0, Ljava/lang/StringBuilder;

    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v12, "%d:%02d:"

    new-array v2, v2, [Ljava/lang/Object;

    div-long v10, v8, v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v2, v6

    div-long/2addr v8, v3

    rem-long/2addr v8, v3

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v5, v12, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_165

    .line 53
    :cond_143
    new-instance p0, Ljava/lang/StringBuilder;

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    const-string v5, "%02d:"

    new-array v7, v7, [Ljava/lang/Object;

    div-long/2addr v8, v3

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v7, v6

    invoke-static {v2, v5, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_165
    .catch Ljava/lang/ArithmeticException; {:try_start_9 .. :try_end_165} :catch_169
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_165} :catch_167

    .line 52
    :goto_165
    return-object p0

    .line 42
    :cond_166
    :goto_166
    return-object v0

    .line 54
    :catch_167
    move-exception p0

    goto :goto_16a

    :catch_169
    move-exception p0

    :goto_16a
    return-object v0
.end method

.method public static record(Lorg/jsoup/nodes/Document;Lorg/json/JSONObject;)V
    .registers 5

    .line 62
    if-eqz p1, :cond_24

    const-string v0, "duration"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/streambundle/SourceTiming;->parse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_24

    .line 63
    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/streambundle/SourceTiming;->remember(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 65
    :cond_24
    const-string p1, "[itemscope][itemtype*=VideoObject] [itemprop=duration],meta[property=video:duration],meta[property=og:video:duration],meta[property=og:duration],meta[itemprop=duration]"

    invoke-virtual {p0, p1}, Lorg/jsoup/nodes/Document;->select(Ljava/lang/String;)Lorg/jsoup/select/Elements;

    move-result-object p1

    invoke-virtual {p1}, Lorg/jsoup/select/Elements;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2e
    :goto_2e
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_35

    .line 70
    return-void

    .line 65
    :cond_35
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jsoup/nodes/Element;

    .line 66
    const-string v1, "aside,nav,footer,.related,.recommendations"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->closest(Ljava/lang/String;)Lorg/jsoup/nodes/Element;

    move-result-object v1

    if-eqz v1, :cond_44

    goto :goto_2e

    .line 67
    :cond_44
    const-string v1, "content"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_51

    :goto_4c
    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->attr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_5e

    :cond_51
    const-string v1, "datetime"

    invoke-virtual {v0, v1}, Lorg/jsoup/nodes/Element;->hasAttr(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5a

    goto :goto_4c

    :cond_5a
    invoke-virtual {v0}, Lorg/jsoup/nodes/Element;->text()Ljava/lang/String;

    move-result-object v0

    .line 68
    :goto_5e
    invoke-static {v0}, Lcom/streambundle/SourceTiming;->parse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2e

    invoke-virtual {p0}, Lorg/jsoup/nodes/Document;->baseUri()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lcom/streambundle/SourceTiming;->remember(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static remember(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 57
    invoke-static {p1}, Lcom/streambundle/SourceTiming;->parse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 58
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_13

    sget-object v0, Lcom/streambundle/SourceTiming;->TIMES:Ljava/util/Map;

    invoke-static {p0}, Lcom/streambundle/SourceTiming;->key(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    :cond_13
    return-void
.end method
