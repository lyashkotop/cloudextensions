.class abstract enum Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
.super Ljava/lang/Enum;
.source "HtmlTreeBuilderState.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/streambundlehtml/parser/HtmlTreeBuilderState$Constants;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/streambundlehtml/parser/HtmlTreeBuilderState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum AfterAfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum AfterAfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum AfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum AfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum AfterHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum BeforeHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum BeforeHtml:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum ForeignContent:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InCaption:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InCell:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InHeadNoscript:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InSelect:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InSelectInTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InTableText:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum Initial:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field public static final enum Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

.field private static final nullString:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 3

    .line 19
    const/16 v0, 0x18

    new-array v0, v0, [Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Initial:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->BeforeHtml:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->BeforeHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InHeadNoscript:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTableText:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InCaption:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InCell:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InSelect:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InSelectInTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterAfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterAfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->ForeignContent:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 4

    .line 20
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$1;

    const-string v1, "Initial"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Initial:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 46
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$2;

    const-string v1, "BeforeHtml"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->BeforeHtml:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 75
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$3;

    const-string v1, "BeforeHead"

    const/4 v3, 0x2

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->BeforeHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 103
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;

    const-string v1, "InHead"

    const/4 v3, 0x3

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 192
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$5;

    const-string v1, "InHeadNoscript"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InHeadNoscript:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 224
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;

    const-string v1, "AfterHead"

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterHead:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 279
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;

    const-string v1, "InBody"

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 961
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$8;

    const-string v1, "Text"

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 980
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;

    const-string v1, "InTable"

    const/16 v3, 0x8

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$9;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1086
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$10;

    const-string v1, "InTableText"

    const/16 v3, 0x9

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$10;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTableText:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1120
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$11;

    const-string v1, "InCaption"

    const/16 v3, 0xa

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$11;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InCaption:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1153
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;

    const-string v1, "InColumnGroup"

    const/16 v3, 0xb

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$12;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InColumnGroup:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1223
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;

    const-string v1, "InTableBody"

    const/16 v3, 0xc

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$13;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTableBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1283
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;

    const-string v1, "InRow"

    const/16 v3, 0xd

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$14;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InRow:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1345
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;

    const-string v1, "InCell"

    const/16 v3, 0xe

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$15;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InCell:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1401
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;

    const-string v1, "InSelect"

    const/16 v3, 0xf

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$16;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InSelect:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1497
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$17;

    const-string v1, "InSelectInTable"

    const/16 v3, 0x10

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$17;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InSelectInTable:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1517
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;

    const-string v1, "InTemplate"

    const/16 v3, 0x11

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$18;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InTemplate:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1586
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$19;

    const-string v1, "AfterBody"

    const/16 v3, 0x12

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$19;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1615
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$20;

    const-string v1, "InFrameset"

    const/16 v3, 0x13

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$20;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->InFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1663
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$21;

    const-string v1, "AfterFrameset"

    const/16 v3, 0x14

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$21;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1687
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$22;

    const-string v1, "AfterAfterBody"

    const/16 v3, 0x15

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$22;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterAfterBody:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1705
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$23;

    const-string v1, "AfterAfterFrameset"

    const/16 v3, 0x16

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$23;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->AfterAfterFrameset:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1722
    new-instance v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$24;

    const-string v1, "ForeignContent"

    const/16 v3, 0x17

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState$24;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->ForeignContent:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 19
    invoke-static {}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->$values()[Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->$VALUES:[Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    .line 1729
    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/streambundlehtml/parser/HtmlTreeBuilderState$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/streambundlehtml/parser/HtmlTreeBuilderState$1;

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$100(Lcom/streambundlehtml/parser/Token;)Z
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Token;

    .line 19
    invoke-static {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Lcom/streambundlehtml/parser/Token;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Token$StartTag;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 19
    invoke-static {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRcData(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    return-void
.end method

.method static synthetic access$300(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Token$StartTag;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 19
    invoke-static {p0, p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->handleRawtext(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V

    return-void
.end method

.method static synthetic access$400()Ljava/lang/String;
    .registers 1

    .line 19
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->nullString:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Ljava/lang/String;)Z
    .registers 2
    .param p0, "x0"    # Ljava/lang/String;

    .line 19
    invoke-static {p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->isWhitespace(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static handleRawtext(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    .registers 4
    .param p0, "startTag"    # Lcom/streambundlehtml/parser/Token$StartTag;
    .param p1, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1753
    iget-object v0, p1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1754
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 1755
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1756
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1757
    return-void
.end method

.method private static handleRcData(Lcom/streambundlehtml/parser/Token$StartTag;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)V
    .registers 4
    .param p0, "startTag"    # Lcom/streambundlehtml/parser/Token$StartTag;
    .param p1, "tb"    # Lcom/streambundlehtml/parser/HtmlTreeBuilder;

    .line 1746
    iget-object v0, p1, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->tokeniser:Lcom/streambundlehtml/parser/Tokeniser;

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1747
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->markInsertionMode()V

    .line 1748
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->Text:Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {p1, v0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->transition(Lcom/streambundlehtml/parser/HtmlTreeBuilderState;)V

    .line 1749
    invoke-virtual {p1, p0}, Lcom/streambundlehtml/parser/HtmlTreeBuilder;->insert(Lcom/streambundlehtml/parser/Token$StartTag;)Lcom/streambundlehtml/nodes/Element;

    .line 1750
    return-void
.end method

.method private static isWhitespace(Lcom/streambundlehtml/parser/Token;)Z
    .registers 3
    .param p0, "t"    # Lcom/streambundlehtml/parser/Token;

    .line 1734
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token;->isCharacter()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1735
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Token;->asCharacter()Lcom/streambundlehtml/parser/Token$Character;

    move-result-object v0

    invoke-virtual {v0}, Lcom/streambundlehtml/parser/Token$Character;->getData()Ljava/lang/String;

    move-result-object v0

    .line 1736
    .local v0, "data":Ljava/lang/String;
    invoke-static {v0}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v1

    return v1

    .line 1738
    .end local v0    # "data":Ljava/lang/String;
    :cond_13
    const/4 v0, 0x0

    return v0
.end method

.method private static isWhitespace(Ljava/lang/String;)Z
    .registers 2
    .param p0, "data"    # Ljava/lang/String;

    .line 1742
    invoke-static {p0}, Lcom/streambundlehtml/internal/StringUtil;->isBlank(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 19
    const-class v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    return-object v0
.end method

.method public static values()[Lcom/streambundlehtml/parser/HtmlTreeBuilderState;
    .registers 1

    .line 19
    sget-object v0, Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->$VALUES:[Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    invoke-virtual {v0}, [Lcom/streambundlehtml/parser/HtmlTreeBuilderState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/parser/HtmlTreeBuilderState;

    return-object v0
.end method


# virtual methods
.method abstract process(Lcom/streambundlehtml/parser/Token;Lcom/streambundlehtml/parser/HtmlTreeBuilder;)Z
.end method
