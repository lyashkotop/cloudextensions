.class final Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;
.super Ljava/lang/Object;
.source "Cleaner.java"

# interfaces
.implements Lcom/streambundlehtml/select/NodeVisitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/streambundlehtml/safety/Cleaner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "CleaningVisitor"
.end annotation


# instance fields
.field private destination:Lcom/streambundlehtml/nodes/Element;

.field private numDiscarded:I

.field private final root:Lcom/streambundlehtml/nodes/Element;

.field final synthetic this$0:Lcom/streambundlehtml/safety/Cleaner;


# direct methods
.method private constructor <init>(Lcom/streambundlehtml/safety/Cleaner;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V
    .registers 4
    .param p2, "root"    # Lcom/streambundlehtml/nodes/Element;
    .param p3, "destination"    # Lcom/streambundlehtml/nodes/Element;

    .line 134
    iput-object p1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->this$0:Lcom/streambundlehtml/safety/Cleaner;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    const/4 p1, 0x0

    iput p1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    .line 135
    iput-object p2, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->root:Lcom/streambundlehtml/nodes/Element;

    .line 136
    iput-object p3, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    .line 137
    return-void
.end method

.method synthetic constructor <init>(Lcom/streambundlehtml/safety/Cleaner;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/safety/Cleaner$1;)V
    .registers 5
    .param p1, "x0"    # Lcom/streambundlehtml/safety/Cleaner;
    .param p2, "x1"    # Lcom/streambundlehtml/nodes/Element;
    .param p3, "x2"    # Lcom/streambundlehtml/nodes/Element;
    .param p4, "x3"    # Lcom/streambundlehtml/safety/Cleaner$1;

    .line 129
    invoke-direct {p0, p1, p2, p3}, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;-><init>(Lcom/streambundlehtml/safety/Cleaner;Lcom/streambundlehtml/nodes/Element;Lcom/streambundlehtml/nodes/Element;)V

    return-void
.end method

.method static synthetic access$300(Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;)I
    .registers 2
    .param p0, "x0"    # Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;

    .line 129
    iget v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    return v0
.end method


# virtual methods
.method public head(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 8
    .param p1, "source"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 140
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_3b

    .line 141
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/Element;

    .line 143
    .local v0, "sourceEl":Lcom/streambundlehtml/nodes/Element;
    iget-object v1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->this$0:Lcom/streambundlehtml/safety/Cleaner;

    # getter for: Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;
    invoke-static {v1}, Lcom/streambundlehtml/safety/Cleaner;->access$000(Lcom/streambundlehtml/safety/Cleaner;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v1

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->normalName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/streambundlehtml/safety/Safelist;->isSafeTag(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 144
    iget-object v1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->this$0:Lcom/streambundlehtml/safety/Cleaner;

    # invokes: Lcom/streambundlehtml/safety/Cleaner;->createSafeElement(Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/safety/Cleaner$ElementMeta;
    invoke-static {v1, v0}, Lcom/streambundlehtml/safety/Cleaner;->access$100(Lcom/streambundlehtml/safety/Cleaner;Lcom/streambundlehtml/nodes/Element;)Lcom/streambundlehtml/safety/Cleaner$ElementMeta;

    move-result-object v1

    .line 145
    .local v1, "meta":Lcom/streambundlehtml/safety/Cleaner$ElementMeta;
    iget-object v2, v1, Lcom/streambundlehtml/safety/Cleaner$ElementMeta;->el:Lcom/streambundlehtml/nodes/Element;

    .line 146
    .local v2, "destChild":Lcom/streambundlehtml/nodes/Element;
    iget-object v3, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v3, v2}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 148
    iget v3, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    iget v4, v1, Lcom/streambundlehtml/safety/Cleaner$ElementMeta;->numAttribsDiscarded:I

    add-int/2addr v3, v4

    iput v3, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    .line 149
    iput-object v2, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    .end local v1    # "meta":Lcom/streambundlehtml/safety/Cleaner$ElementMeta;
    .end local v2    # "destChild":Lcom/streambundlehtml/nodes/Element;
    goto :goto_39

    .line 150
    :cond_2e
    iget-object v1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->root:Lcom/streambundlehtml/nodes/Element;

    if-eq p1, v1, :cond_39

    .line 151
    iget v1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    goto :goto_3a

    .line 150
    :cond_39
    :goto_39
    nop

    .line 153
    .end local v0    # "sourceEl":Lcom/streambundlehtml/nodes/Element;
    :goto_3a
    goto :goto_81

    :cond_3b
    instance-of v0, p1, Lcom/streambundlehtml/nodes/TextNode;

    if-eqz v0, :cond_51

    .line 154
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/TextNode;

    .line 155
    .local v0, "sourceText":Lcom/streambundlehtml/nodes/TextNode;
    new-instance v1, Lcom/streambundlehtml/nodes/TextNode;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/TextNode;->getWholeText()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/streambundlehtml/nodes/TextNode;-><init>(Ljava/lang/String;)V

    .line 156
    .local v1, "destText":Lcom/streambundlehtml/nodes/TextNode;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 157
    .end local v0    # "sourceText":Lcom/streambundlehtml/nodes/TextNode;
    .end local v1    # "destText":Lcom/streambundlehtml/nodes/TextNode;
    goto :goto_81

    :cond_51
    instance-of v0, p1, Lcom/streambundlehtml/nodes/DataNode;

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->this$0:Lcom/streambundlehtml/safety/Cleaner;

    # getter for: Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;
    invoke-static {v0}, Lcom/streambundlehtml/safety/Cleaner;->access$000(Lcom/streambundlehtml/safety/Cleaner;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Node;->parent()Lcom/streambundlehtml/nodes/Node;

    move-result-object v1

    invoke-virtual {v1}, Lcom/streambundlehtml/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/safety/Safelist;->isSafeTag(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7b

    .line 158
    move-object v0, p1

    check-cast v0, Lcom/streambundlehtml/nodes/DataNode;

    .line 159
    .local v0, "sourceData":Lcom/streambundlehtml/nodes/DataNode;
    new-instance v1, Lcom/streambundlehtml/nodes/DataNode;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/DataNode;->getWholeData()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/streambundlehtml/nodes/DataNode;-><init>(Ljava/lang/String;)V

    .line 160
    .local v1, "destData":Lcom/streambundlehtml/nodes/DataNode;
    iget-object v2, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v2, v1}, Lcom/streambundlehtml/nodes/Element;->appendChild(Lcom/streambundlehtml/nodes/Node;)Lcom/streambundlehtml/nodes/Element;

    .line 161
    .end local v0    # "sourceData":Lcom/streambundlehtml/nodes/DataNode;
    .end local v1    # "destData":Lcom/streambundlehtml/nodes/DataNode;
    goto :goto_81

    .line 162
    :cond_7b
    iget v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->numDiscarded:I

    .line 164
    :goto_81
    return-void
.end method

.method public tail(Lcom/streambundlehtml/nodes/Node;I)V
    .registers 5
    .param p1, "source"    # Lcom/streambundlehtml/nodes/Node;
    .param p2, "depth"    # I

    .line 167
    instance-of v0, p1, Lcom/streambundlehtml/nodes/Element;

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->this$0:Lcom/streambundlehtml/safety/Cleaner;

    # getter for: Lcom/streambundlehtml/safety/Cleaner;->safelist:Lcom/streambundlehtml/safety/Safelist;
    invoke-static {v0}, Lcom/streambundlehtml/safety/Cleaner;->access$000(Lcom/streambundlehtml/safety/Cleaner;)Lcom/streambundlehtml/safety/Safelist;

    move-result-object v0

    invoke-virtual {p1}, Lcom/streambundlehtml/nodes/Node;->nodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/streambundlehtml/safety/Safelist;->isSafeTag(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    .line 168
    iget-object v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    invoke-virtual {v0}, Lcom/streambundlehtml/nodes/Element;->parent()Lcom/streambundlehtml/nodes/Element;

    move-result-object v0

    iput-object v0, p0, Lcom/streambundlehtml/safety/Cleaner$CleaningVisitor;->destination:Lcom/streambundlehtml/nodes/Element;

    .line 170
    :cond_1c
    return-void
.end method
