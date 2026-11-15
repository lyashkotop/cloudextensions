.class Lcom/streambundle/PosterPatch$Choice;
.super Ljava/lang/Object;
.source "PosterPatch.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundle/PosterPatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Choice"
.end annotation


# instance fields
.field score:I

.field url:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .registers 2

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/streambundle/PosterPatch$Choice;->url:Ljava/lang/String;

    const/16 v0, -0x2710

    iput v0, p0, Lcom/streambundle/PosterPatch$Choice;->score:I

    return-void
.end method


# virtual methods
.method add(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;I)V
    .registers 8

    .line 14
    invoke-static {p2, p3}, Lcom/streambundle/PosterPatch;->absolute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/streambundle/PosterPatch;->valid(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_99

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "class"

    invoke-static {p1, v0}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, " "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "alt"

    invoke-static {p1, v0}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p3, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p3

    const-string v0, ".*(?:emoji|flag|tag-ico|avatar|logo|language).*"

    invoke-virtual {p3, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_99

    const-string v0, "width"

    invoke-static {p1, v0}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/streambundle/PosterPatch;->number(Ljava/lang/String;)I

    move-result v0

    const-string v1, "height"

    invoke-static {p1, v1}, Lcom/streambundle/PosterPatch;->attr(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/streambundle/PosterPatch;->number(Ljava/lang/String;)I

    move-result p1

    const/16 v1, 0x64

    if-lez v0, :cond_55

    if-lt v0, v1, :cond_99

    :cond_55
    if-lez p1, :cond_5b

    const/16 v2, 0x41

    if-lt p1, v2, :cond_99

    :cond_5b
    const/16 v2, 0xc8

    if-lt v0, v2, :cond_61

    add-int/lit8 p4, p4, 0x23

    :cond_61
    if-lt p1, v1, :cond_65

    add-int/lit8 p4, p4, 0x14

    :cond_65
    const-string p1, "video-img"

    invoke-virtual {p3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_76

    const-string p1, "first-image"

    invoke-virtual {p3, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_76

    goto :goto_78

    :cond_76
    add-int/lit8 p4, p4, 0x46

    :goto_78
    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p2, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    const-string p3, "videos_screenshots"

    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_8f

    const-string p3, "wp-content/uploads"

    invoke-virtual {p1, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_8f

    goto :goto_91

    :cond_8f
    add-int/lit8 p4, p4, 0x28

    :goto_91
    iget p1, p0, Lcom/streambundle/PosterPatch$Choice;->score:I

    if-le p4, p1, :cond_99

    iput p4, p0, Lcom/streambundle/PosterPatch$Choice;->score:I

    iput-object p2, p0, Lcom/streambundle/PosterPatch$Choice;->url:Ljava/lang/String;

    :cond_99
    return-void
.end method
