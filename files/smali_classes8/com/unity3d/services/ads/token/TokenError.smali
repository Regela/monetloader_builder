.class public final enum Lcom/unity3d/services/ads/token/TokenError;
.super Ljava/lang/Enum;
.source "TokenError.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/unity3d/services/ads/token/TokenError;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/unity3d/services/ads/token/TokenError;

.field public static final enum JSON_EXCEPTION:Lcom/unity3d/services/ads/token/TokenError;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 4
    new-instance v0, Lcom/unity3d/services/ads/token/TokenError;

    const-string v1, "JSON_EXCEPTION"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/unity3d/services/ads/token/TokenError;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/unity3d/services/ads/token/TokenError;->JSON_EXCEPTION:Lcom/unity3d/services/ads/token/TokenError;

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/unity3d/services/ads/token/TokenError;

    aput-object v0, v1, v2

    .line 3
    sput-object v1, Lcom/unity3d/services/ads/token/TokenError;->$VALUES:[Lcom/unity3d/services/ads/token/TokenError;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/unity3d/services/ads/token/TokenError;
    .registers 2

    .line 3
    const-class v0, Lcom/unity3d/services/ads/token/TokenError;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/ads/token/TokenError;

    return-object p0
.end method

.method public static values()[Lcom/unity3d/services/ads/token/TokenError;
    .registers 1

    .line 3
    sget-object v0, Lcom/unity3d/services/ads/token/TokenError;->$VALUES:[Lcom/unity3d/services/ads/token/TokenError;

    invoke-virtual {v0}, [Lcom/unity3d/services/ads/token/TokenError;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/unity3d/services/ads/token/TokenError;

    return-object v0
.end method
