.class abstract enum Lcom/streambundlehtml/parser/TokeniserState;
.super Ljava/lang/Enum;
.source "TokeniserState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/streambundlehtml/parser/TokeniserState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterAttributeValue_quoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterDoctypePublicKeyword:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AfterDoctypeSystemKeyword:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AttributeName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AttributeValue_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AttributeValue_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BeforeAttributeValue:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BeforeDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BeforeDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BeforeDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BetweenDoctypePublicAndSystemIdentifiers:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BogusComment:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CdataSection:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CharacterReferenceInData:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CharacterReferenceInRcdata:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum Comment:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CommentEnd:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CommentEndBang:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CommentEndDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CommentStart:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum CommentStartDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum Data:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum Doctype:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum DoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum DoctypePublicIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum DoctypePublicIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum DoctypeSystemIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum DoctypeSystemIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum EndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum MarkupDeclarationOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum PLAINTEXT:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum RCDATAEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum RCDATAEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum RawtextEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum RawtextEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum RawtextLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum RcdataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataDoubleEscapeEnd:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataDoubleEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataDoubleEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataDoubleEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataDoubleEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapeStartDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapedEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapedEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum ScriptDataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum TagName:Lcom/streambundlehtml/parser/TokeniserState;

.field public static final enum TagOpen:Lcom/streambundlehtml/parser/TokeniserState;

.field static final attributeNameCharsSorted:[C

.field static final attributeValueUnquoted:[C

.field private static final eof:C = '\uffff'

.field static final nullChar:C = '\u0000'

.field private static final replacementChar:C = '\ufffd'

.field private static final replacementStr:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/streambundlehtml/parser/TokeniserState;
    .registers 3

    .line 8
    const/16 v0, 0x43

    new-array v0, v0, [Lcom/streambundlehtml/parser/TokeniserState;

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CharacterReferenceInData:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CharacterReferenceInRcdata:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->PLAINTEXT:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->TagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->EndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->TagName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->RcdataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->RCDATAEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->RCDATAEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->RawtextLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->RawtextEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->RawtextEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x12

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x13

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapeStartDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x14

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x15

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x16

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x17

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x18

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x19

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapeEnd:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x20

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x21

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x22

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x23

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BeforeAttributeValue:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x24

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AttributeValue_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x25

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AttributeValue_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x26

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x27

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterAttributeValue_quoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x28

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x29

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BogusComment:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->MarkupDeclarationOpen:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CommentStart:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CommentStartDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x2e

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CommentEndDash:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x2f

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CommentEnd:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x30

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CommentEndBang:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x31

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->Doctype:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x32

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BeforeDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x33

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->DoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x34

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x35

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypePublicKeyword:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x36

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BeforeDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x37

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->DoctypePublicIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x38

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->DoctypePublicIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x39

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x3a

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BetweenDoctypePublicAndSystemIdentifiers:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x3b

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypeSystemKeyword:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x3c

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BeforeDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x3d

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->DoctypeSystemIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x3e

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->DoctypeSystemIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x3f

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x40

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x41

    aput-object v1, v0, v2

    sget-object v1, Lcom/streambundlehtml/parser/TokeniserState;->CdataSection:Lcom/streambundlehtml/parser/TokeniserState;

    const/16 v2, 0x42

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 5

    .line 9
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$1;

    const-string v1, "Data"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$1;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    .line 33
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$2;

    const-string v1, "CharacterReferenceInData"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$2;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CharacterReferenceInData:Lcom/streambundlehtml/parser/TokeniserState;

    .line 39
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$3;

    const-string v1, "Rcdata"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$3;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->Rcdata:Lcom/streambundlehtml/parser/TokeniserState;

    .line 64
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$4;

    const-string v1, "CharacterReferenceInRcdata"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$4;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CharacterReferenceInRcdata:Lcom/streambundlehtml/parser/TokeniserState;

    .line 69
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$5;

    const-string v1, "Rawtext"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$5;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->Rawtext:Lcom/streambundlehtml/parser/TokeniserState;

    .line 74
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$6;

    const-string v1, "ScriptData"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$6;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptData:Lcom/streambundlehtml/parser/TokeniserState;

    .line 79
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$7;

    const-string v1, "PLAINTEXT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$7;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->PLAINTEXT:Lcom/streambundlehtml/parser/TokeniserState;

    .line 97
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$8;

    const-string v1, "TagOpen"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$8;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->TagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 124
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$9;

    const-string v1, "EndTagOpen"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$9;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->EndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 144
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$10;

    const-string v1, "TagName"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$10;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->TagName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 183
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$11;

    const-string v1, "RcdataLessthanSign"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$11;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->RcdataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    .line 201
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$12;

    const-string v1, "RCDATAEndTagOpen"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/streambundlehtml/parser/TokeniserState$12;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->RCDATAEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 214
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$13;

    const-string v1, "RCDATAEndTagName"

    const/16 v3, 0xc

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/TokeniserState$13;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->RCDATAEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 261
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$14;

    const-string v1, "RawtextLessthanSign"

    const/16 v3, 0xd

    invoke-direct {v0, v1, v3}, Lcom/streambundlehtml/parser/TokeniserState$14;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->RawtextLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    .line 272
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$15;

    const-string v1, "RawtextEndTagOpen"

    const/16 v4, 0xe

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$15;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->RawtextEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 277
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$16;

    const-string v1, "RawtextEndTagName"

    const/16 v4, 0xf

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$16;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->RawtextEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 282
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$17;

    const-string v1, "ScriptDataLessthanSign"

    const/16 v4, 0x10

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$17;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    .line 305
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$18;

    const-string v1, "ScriptDataEndTagOpen"

    const/16 v4, 0x11

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$18;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 310
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$19;

    const-string v1, "ScriptDataEndTagName"

    const/16 v4, 0x12

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$19;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 315
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$20;

    const-string v1, "ScriptDataEscapeStart"

    const/16 v4, 0x13

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$20;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

    .line 325
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$21;

    const-string v1, "ScriptDataEscapeStartDash"

    const/16 v4, 0x14

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$21;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapeStartDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 335
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$22;

    const-string v1, "ScriptDataEscaped"

    const/16 v4, 0x15

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$22;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    .line 362
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$23;

    const-string v1, "ScriptDataEscapedDash"

    const/16 v4, 0x16

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$23;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 390
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$24;

    const-string v1, "ScriptDataEscapedDashDash"

    const/16 v4, 0x17

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$24;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 421
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$25;

    const-string v1, "ScriptDataEscapedLessthanSign"

    const/16 v4, 0x18

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$25;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    .line 438
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$26;

    const-string v1, "ScriptDataEscapedEndTagOpen"

    const/16 v4, 0x19

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$26;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedEndTagOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 451
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$27;

    const-string v1, "ScriptDataEscapedEndTagName"

    const/16 v4, 0x1a

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$27;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataEscapedEndTagName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 456
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$28;

    const-string v1, "ScriptDataDoubleEscapeStart"

    const/16 v4, 0x1b

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$28;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapeStart:Lcom/streambundlehtml/parser/TokeniserState;

    .line 461
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$29;

    const-string v1, "ScriptDataDoubleEscaped"

    const/16 v4, 0x1c

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$29;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscaped:Lcom/streambundlehtml/parser/TokeniserState;

    .line 488
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$30;

    const-string v1, "ScriptDataDoubleEscapedDash"

    const/16 v4, 0x1d

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$30;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapedDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 515
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$31;

    const-string v1, "ScriptDataDoubleEscapedDashDash"

    const/16 v4, 0x1e

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$31;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapedDashDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 545
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$32;

    const-string v1, "ScriptDataDoubleEscapedLessthanSign"

    const/16 v4, 0x1f

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$32;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapedLessthanSign:Lcom/streambundlehtml/parser/TokeniserState;

    .line 556
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$33;

    const-string v1, "ScriptDataDoubleEscapeEnd"

    const/16 v4, 0x20

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$33;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->ScriptDataDoubleEscapeEnd:Lcom/streambundlehtml/parser/TokeniserState;

    .line 561
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$34;

    const-string v1, "BeforeAttributeName"

    const/16 v4, 0x21

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$34;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 608
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$35;

    const-string v1, "AttributeName"

    const/16 v4, 0x22

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$35;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 648
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$36;

    const-string v1, "AfterAttributeName"

    const/16 v4, 0x23

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$36;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 693
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$37;

    const-string v1, "BeforeAttributeValue"

    const/16 v4, 0x24

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$37;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BeforeAttributeValue:Lcom/streambundlehtml/parser/TokeniserState;

    .line 742
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$38;

    const-string v1, "AttributeValue_doubleQuoted"

    const/16 v4, 0x25

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$38;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AttributeValue_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 775
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$39;

    const-string v1, "AttributeValue_singleQuoted"

    const/16 v4, 0x26

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$39;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AttributeValue_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 808
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$40;

    const-string v1, "AttributeValue_unquoted"

    const/16 v4, 0x27

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$40;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AttributeValue_unquoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 857
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$41;

    const-string v1, "AfterAttributeValue_quoted"

    const/16 v4, 0x28

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$41;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterAttributeValue_quoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 887
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$42;

    const-string v1, "SelfClosingStartTag"

    const/16 v4, 0x29

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$42;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    .line 907
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$43;

    const-string v1, "BogusComment"

    const/16 v4, 0x2a

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$43;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BogusComment:Lcom/streambundlehtml/parser/TokeniserState;

    .line 920
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$44;

    const-string v1, "MarkupDeclarationOpen"

    const/16 v4, 0x2b

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$44;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->MarkupDeclarationOpen:Lcom/streambundlehtml/parser/TokeniserState;

    .line 940
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$45;

    const-string v1, "CommentStart"

    const/16 v4, 0x2c

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$45;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CommentStart:Lcom/streambundlehtml/parser/TokeniserState;

    .line 968
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$46;

    const-string v1, "CommentStartDash"

    const/16 v4, 0x2d

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$46;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CommentStartDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 996
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$47;

    const-string v1, "Comment"

    const/16 v4, 0x2e

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$47;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->Comment:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1018
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$48;

    const-string v1, "CommentEndDash"

    const/16 v4, 0x2f

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$48;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CommentEndDash:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1041
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$49;

    const-string v1, "CommentEnd"

    const/16 v4, 0x30

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$49;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CommentEnd:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1071
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$50;

    const-string v1, "CommentEndBang"

    const/16 v4, 0x31

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$50;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CommentEndBang:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1099
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$51;

    const-string v1, "Doctype"

    const/16 v4, 0x32

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$51;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->Doctype:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1126
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$52;

    const-string v1, "BeforeDoctypeName"

    const/16 v4, 0x33

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$52;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BeforeDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1161
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$53;

    const-string v1, "DoctypeName"

    const/16 v4, 0x34

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$53;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->DoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1196
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$54;

    const-string v1, "AfterDoctypeName"

    const/16 v4, 0x35

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$54;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypeName:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1224
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$55;

    const-string v1, "AfterDoctypePublicKeyword"

    const/16 v4, 0x36

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$55;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypePublicKeyword:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1264
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$56;

    const-string v1, "BeforeDoctypePublicIdentifier"

    const/16 v4, 0x37

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$56;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BeforeDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1301
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$57;

    const-string v1, "DoctypePublicIdentifier_doubleQuoted"

    const/16 v4, 0x38

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$57;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->DoctypePublicIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1329
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$58;

    const-string v1, "DoctypePublicIdentifier_singleQuoted"

    const/16 v4, 0x39

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$58;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->DoctypePublicIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1357
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$59;

    const-string v1, "AfterDoctypePublicIdentifier"

    const/16 v4, 0x3a

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$59;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypePublicIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1395
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$60;

    const-string v1, "BetweenDoctypePublicAndSystemIdentifiers"

    const/16 v4, 0x3b

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$60;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BetweenDoctypePublicAndSystemIdentifiers:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1432
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$61;

    const-string v1, "AfterDoctypeSystemKeyword"

    const/16 v4, 0x3c

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$61;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypeSystemKeyword:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1472
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$62;

    const-string v1, "BeforeDoctypeSystemIdentifier"

    const/16 v4, 0x3d

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$62;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BeforeDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1509
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$63;

    const-string v1, "DoctypeSystemIdentifier_doubleQuoted"

    const/16 v4, 0x3e

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$63;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->DoctypeSystemIdentifier_doubleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1537
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$64;

    const-string v1, "DoctypeSystemIdentifier_singleQuoted"

    const/16 v4, 0x3f

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$64;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->DoctypeSystemIdentifier_singleQuoted:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1565
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$65;

    const-string v1, "AfterDoctypeSystemIdentifier"

    const/16 v4, 0x40

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$65;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->AfterDoctypeSystemIdentifier:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1592
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$66;

    const-string v1, "BogusDoctype"

    const/16 v4, 0x41

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$66;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->BogusDoctype:Lcom/streambundlehtml/parser/TokeniserState;

    .line 1610
    new-instance v0, Lcom/streambundlehtml/parser/TokeniserState$67;

    const-string v1, "CdataSection"

    const/16 v4, 0x42

    invoke-direct {v0, v1, v4}, Lcom/streambundlehtml/parser/TokeniserState$67;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->CdataSection:Lcom/streambundlehtml/parser/TokeniserState;

    .line 8
    invoke-static {}, Lcom/streambundlehtml/parser/TokeniserState;->$values()[Lcom/streambundlehtml/parser/TokeniserState;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->$VALUES:[Lcom/streambundlehtml/parser/TokeniserState;

    .line 1626
    new-array v0, v2, [C

    fill-array-data v0, :array_2f8

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->attributeNameCharsSorted:[C

    .line 1627
    new-array v0, v3, [C

    fill-array-data v0, :array_308

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->attributeValueUnquoted:[C

    .line 1630
    const v0, 0xfffd

    invoke-static {v0}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/streambundlehtml/parser/TokeniserState;->replacementStr:Ljava/lang/String;

    return-void

    nop

    :array_2f8
    .array-data 2
        0x9s
        0xas
        0xcs
        0xds
        0x20s
        0x22s
        0x27s
        0x2fs
        0x3cs
        0x3ds
        0x3es
    .end array-data

    nop

    :array_308
    .array-data 2
        0x0s
        0x9s
        0xas
        0xcs
        0xds
        0x20s
        0x22s
        0x26s
        0x27s
        0x3cs
        0x3ds
        0x3es
        0x60s
    .end array-data
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;ILcom/streambundlehtml/parser/TokeniserState$1;)V
    .registers 4
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # I
    .param p3, "x2"    # Lcom/streambundlehtml/parser/TokeniserState$1;

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/streambundlehtml/parser/TokeniserState;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$100(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 8
    invoke-static {p0, p1}, Lcom/streambundlehtml/parser/TokeniserState;->readCharRef(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/TokeniserState;)V

    return-void
.end method

.method static synthetic access$200(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 4
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "x2"    # Lcom/streambundlehtml/parser/TokeniserState;
    .param p3, "x3"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 8
    invoke-static {p0, p1, p2, p3}, Lcom/streambundlehtml/parser/TokeniserState;->readRawData(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V

    return-void
.end method

.method static synthetic access$300()Ljava/lang/String;
    .registers 1

    .line 8
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState;->replacementStr:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$400(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 4
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "x2"    # Lcom/streambundlehtml/parser/TokeniserState;
    .param p3, "x3"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 8
    invoke-static {p0, p1, p2, p3}, Lcom/streambundlehtml/parser/TokeniserState;->readEndTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V

    return-void
.end method

.method static synthetic access$500(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 3
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "x2"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 8
    invoke-static {p0, p1, p2}, Lcom/streambundlehtml/parser/TokeniserState;->handleDataEndTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;)V

    return-void
.end method

.method static synthetic access$600(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 4
    .param p0, "x0"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "x1"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "x2"    # Lcom/streambundlehtml/parser/TokeniserState;
    .param p3, "x3"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 8
    invoke-static {p0, p1, p2, p3}, Lcom/streambundlehtml/parser/TokeniserState;->handleDataDoubleEscapeTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V

    return-void
.end method

.method private static handleDataDoubleEscapeTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 7
    .param p0, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "r"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "primary"    # Lcom/streambundlehtml/parser/TokeniserState;
    .param p3, "fallback"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 1718
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->matchesLetter()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 1719
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->consumeLetterSequence()Ljava/lang/String;

    move-result-object v0

    .line 1720
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1721
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 1722
    return-void

    .line 1725
    .end local v0    # "name":Ljava/lang/String;
    :cond_13
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v0

    .line 1726
    .local v0, "c":C
    sparse-switch v0, :sswitch_data_3c

    .line 1741
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->unconsume()V

    .line 1742
    invoke-virtual {p0, p3}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_3a

    .line 1734
    :sswitch_21
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "script"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_33

    .line 1735
    invoke-virtual {p0, p2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_36

    .line 1737
    :cond_33
    invoke-virtual {p0, p3}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1738
    :goto_36
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 1739
    nop

    .line 1744
    :goto_3a
    return-void

    nop

    :sswitch_data_3c
    .sparse-switch
        0x9 -> :sswitch_21
        0xa -> :sswitch_21
        0xc -> :sswitch_21
        0xd -> :sswitch_21
        0x20 -> :sswitch_21
        0x2f -> :sswitch_21
        0x3e -> :sswitch_21
    .end sparse-switch
.end method

.method private static handleDataEndTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 6
    .param p0, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "r"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "elseTransition"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 1638
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->matchesLetter()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 1639
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->consumeLetterSequence()Ljava/lang/String;

    move-result-object v0

    .line 1640
    .local v0, "name":Ljava/lang/String;
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->tagPending:Lcom/streambundlehtml/parser/Token$Tag;

    invoke-virtual {v1, v0}, Lcom/streambundlehtml/parser/Token$Tag;->appendTagName(Ljava/lang/String;)V

    .line 1641
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1642
    return-void

    .line 1645
    .end local v0    # "name":Ljava/lang/String;
    :cond_15
    const/4 v0, 0x0

    .line 1646
    .local v0, "needsExitTransition":Z
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Tokeniser;->isAppropriateEndTagToken()Z

    move-result v1

    if-eqz v1, :cond_46

    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_46

    .line 1647
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->consume()C

    move-result v1

    .line 1648
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_58

    .line 1664
    iget-object v2, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1665
    const/4 v0, 0x1

    goto :goto_45

    .line 1660
    :sswitch_30
    invoke-virtual {p0}, Lcom/streambundlehtml/parser/Tokeniser;->emitTagPending()V

    .line 1661
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState;->Data:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1662
    goto :goto_45

    .line 1657
    :sswitch_39
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState;->SelfClosingStartTag:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1658
    goto :goto_45

    .line 1654
    :sswitch_3f
    sget-object v2, Lcom/streambundlehtml/parser/TokeniserState;->BeforeAttributeName:Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {p0, v2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1655
    nop

    .line 1667
    .end local v1    # "c":C
    :goto_45
    goto :goto_47

    .line 1668
    :cond_46
    const/4 v0, 0x1

    .line 1671
    :goto_47
    if-eqz v0, :cond_56

    .line 1672
    const-string v1, "</"

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 1673
    iget-object v1, p0, Lcom/streambundlehtml/parser/Tokeniser;->dataBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/StringBuilder;)V

    .line 1674
    invoke-virtual {p0, p2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1676
    :cond_56
    return-void

    nop

    :sswitch_data_58
    .sparse-switch
        0x9 -> :sswitch_3f
        0xa -> :sswitch_3f
        0xc -> :sswitch_3f
        0xd -> :sswitch_3f
        0x20 -> :sswitch_3f
        0x2f -> :sswitch_39
        0x3e -> :sswitch_30
    .end sparse-switch
.end method

.method private static readCharRef(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 4
    .param p0, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "advance"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 1699
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/streambundlehtml/parser/Tokeniser;->consumeCharacterReference(Ljava/lang/Character;Z)[I

    move-result-object v0

    .line 1700
    .local v0, "c":[I
    if-nez v0, :cond_e

    .line 1701
    const/16 v1, 0x26

    invoke-virtual {p0, v1}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    goto :goto_11

    .line 1703
    :cond_e
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit([I)V

    .line 1704
    :goto_11
    invoke-virtual {p0, p1}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1705
    return-void
.end method

.method private static readEndTag(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 5
    .param p0, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "r"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "a"    # Lcom/streambundlehtml/parser/TokeniserState;
    .param p3, "b"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 1708
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->matchesAsciiAlpha()Z

    move-result v0

    if-eqz v0, :cond_e

    .line 1709
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->createTagPending(Z)Lcom/streambundlehtml/parser/Token$Tag;

    .line 1710
    invoke-virtual {p0, p2}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    goto :goto_16

    .line 1712
    :cond_e
    const-string v0, "</"

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    .line 1713
    invoke-virtual {p0, p3}, Lcom/streambundlehtml/parser/Tokeniser;->transition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1715
    :goto_16
    return-void
.end method

.method private static readRawData(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;Lcom/streambundlehtml/parser/TokeniserState;Lcom/streambundlehtml/parser/TokeniserState;)V
    .registers 5
    .param p0, "t"    # Lcom/streambundlehtml/parser/Tokeniser;
    .param p1, "r"    # Lcom/streambundlehtml/parser/CharacterReader;
    .param p2, "current"    # Lcom/streambundlehtml/parser/TokeniserState;
    .param p3, "advance"    # Lcom/streambundlehtml/parser/TokeniserState;

    .line 1679
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->current()C

    move-result v0

    sparse-switch v0, :sswitch_data_2a

    .line 1692
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->consumeRawData()Ljava/lang/String;

    move-result-object v0

    .line 1693
    .local v0, "data":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Ljava/lang/String;)V

    goto :goto_29

    .line 1689
    .end local v0    # "data":Ljava/lang/String;
    :sswitch_f
    new-instance v0, Lcom/streambundlehtml/parser/Token$EOF;

    invoke-direct {v0}, Lcom/streambundlehtml/parser/Token$EOF;-><init>()V

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(Lcom/streambundlehtml/parser/Token;)V

    .line 1690
    goto :goto_29

    .line 1681
    :sswitch_18
    invoke-virtual {p0, p3}, Lcom/streambundlehtml/parser/Tokeniser;->advanceTransition(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1682
    goto :goto_29

    .line 1684
    :sswitch_1c
    invoke-virtual {p0, p2}, Lcom/streambundlehtml/parser/Tokeniser;->error(Lcom/streambundlehtml/parser/TokeniserState;)V

    .line 1685
    invoke-virtual {p1}, Lcom/streambundlehtml/parser/CharacterReader;->advance()V

    .line 1686
    const v0, 0xfffd

    invoke-virtual {p0, v0}, Lcom/streambundlehtml/parser/Tokeniser;->emit(C)V

    .line 1687
    nop

    .line 1696
    :goto_29
    return-void

    :sswitch_data_2a
    .sparse-switch
        0x0 -> :sswitch_1c
        0x3c -> :sswitch_18
        0xffff -> :sswitch_f
    .end sparse-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/streambundlehtml/parser/TokeniserState;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .line 8
    const-class v0, Lcom/streambundlehtml/parser/TokeniserState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/streambundlehtml/parser/TokeniserState;

    return-object v0
.end method

.method public static values()[Lcom/streambundlehtml/parser/TokeniserState;
    .registers 1

    .line 8
    sget-object v0, Lcom/streambundlehtml/parser/TokeniserState;->$VALUES:[Lcom/streambundlehtml/parser/TokeniserState;

    invoke-virtual {v0}, [Lcom/streambundlehtml/parser/TokeniserState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/streambundlehtml/parser/TokeniserState;

    return-object v0
.end method


# virtual methods
.method abstract read(Lcom/streambundlehtml/parser/Tokeniser;Lcom/streambundlehtml/parser/CharacterReader;)V
.end method
