.class public Lcom/unity3d/services/core/log/DeviceLog;
.super Ljava/lang/Object;
.source "DeviceLog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;
    }
.end annotation


# static fields
.field private static FORCE_DEBUG_LOG:Z = false

.field public static final LOGLEVEL_DEBUG:I = 0x8

.field private static final LOGLEVEL_ERROR:I = 0x1

.field public static final LOGLEVEL_INFO:I = 0x4

.field private static final LOGLEVEL_WARNING:I = 0x2

.field private static LOG_DEBUG:Z = true

.field private static LOG_ERROR:Z = true

.field private static LOG_INFO:Z = true

.field private static LOG_WARNING:Z = true

.field private static final MAX_DEBUG_MSG_LENGTH:I = 0xc00

.field private static final _deviceLogLevel:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;",
            "Lcom/unity3d/services/core/log/DeviceLogLevel;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/unity3d/services/core/log/DeviceLog;->_deviceLogLevel:Ljava/util/HashMap;

    .line 30
    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-nez v0, :cond_45

    .line 31
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog;->_deviceLogLevel:Ljava/util/HashMap;

    sget-object v1, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->INFO:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    new-instance v2, Lcom/unity3d/services/core/log/DeviceLogLevel;

    const-string v3, "i"

    invoke-direct {v2, v3}, Lcom/unity3d/services/core/log/DeviceLogLevel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog;->_deviceLogLevel:Ljava/util/HashMap;

    sget-object v1, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->DEBUG:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    new-instance v2, Lcom/unity3d/services/core/log/DeviceLogLevel;

    const-string v3, "d"

    invoke-direct {v2, v3}, Lcom/unity3d/services/core/log/DeviceLogLevel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog;->_deviceLogLevel:Ljava/util/HashMap;

    sget-object v1, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->WARNING:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    new-instance v2, Lcom/unity3d/services/core/log/DeviceLogLevel;

    const-string v3, "w"

    invoke-direct {v2, v3}, Lcom/unity3d/services/core/log/DeviceLogLevel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog;->_deviceLogLevel:Ljava/util/HashMap;

    sget-object v1, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->ERROR:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    new-instance v2, Lcom/unity3d/services/core/log/DeviceLogLevel;

    const-string v3, "e"

    invoke-direct {v2, v3}, Lcom/unity3d/services/core/log/DeviceLogLevel;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    :cond_45
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/local/tmp/UnityAdsForceDebugMode"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 38
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_55

    const/4 v0, 0x1

    .line 39
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->FORCE_DEBUG_LOG:Z

    :cond_55
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkMessage(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    if-eqz p0, :cond_8

    .line 176
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const-string p0, "DO NOT USE EMPTY MESSAGES, use DeviceLog.entered() instead"

    :cond_a
    return-object p0
.end method

.method private static createLogEntry(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)Lcom/unity3d/services/core/log/DeviceLogEntry;
    .registers 10

    .line 191
    const-class v0, Lcom/unity3d/services/core/log/DeviceLog;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 193
    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->getLogLevel(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;)Lcom/unity3d/services/core/log/DeviceLogLevel;

    move-result-object p0

    const/4 v2, 0x0

    if-eqz p0, :cond_49

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 200
    :goto_13
    array-length v5, v1

    if-ge v3, v5, :cond_3b

    .line 201
    aget-object v5, v1, v3

    .line 202
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_27

    const/4 v4, 0x1

    .line 205
    :cond_27
    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_38

    if-eqz v4, :cond_38

    goto :goto_3b

    :cond_38
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    .line 212
    :cond_3b
    :goto_3b
    array-length v0, v1

    if-ge v3, v0, :cond_41

    .line 213
    aget-object v0, v1, v3

    goto :goto_42

    :cond_41
    move-object v0, v2

    :goto_42
    if-eqz v0, :cond_49

    .line 217
    new-instance v2, Lcom/unity3d/services/core/log/DeviceLogEntry;

    invoke-direct {v2, p0, p1, v0}, Lcom/unity3d/services/core/log/DeviceLogEntry;-><init>(Lcom/unity3d/services/core/log/DeviceLogLevel;Ljava/lang/String;Ljava/lang/StackTraceElement;)V

    :cond_49
    return-object v2
.end method

.method public static debug(Ljava/lang/String;)V
    .registers 4

    .line 88
    sget-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    if-nez v0, :cond_9

    sget-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->FORCE_DEBUG_LOG:Z

    if-nez v0, :cond_9

    return-void

    .line 92
    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0xc00

    if-le v0, v1, :cond_29

    const/4 v0, 0x0

    .line 93
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0x7800

    if-ge v0, v2, :cond_28

    .line 96
    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V

    :cond_28
    return-void

    .line 102
    :cond_29
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->DEBUG:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->checkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/unity3d/services/core/log/DeviceLog;->write(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs debug(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 2

    .line 107
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V

    return-void
.end method

.method public static entered()V
    .registers 1

    const-string v0, "ENTERED METHOD"

    .line 75
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V

    return-void
.end method

.method public static error(Ljava/lang/String;)V
    .registers 2

    .line 120
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->ERROR:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->checkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/unity3d/services/core/log/DeviceLog;->write(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs error(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 2

    .line 140
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->error(Ljava/lang/String;)V

    return-void
.end method

.method public static exception(Ljava/lang/String;Ljava/lang/Exception;)V
    .registers 4

    const-string v0, ""

    if-eqz p0, :cond_13

    .line 126
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_13
    const-string p0, ": "

    if-eqz p1, :cond_2d

    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2d
    if-eqz p1, :cond_4f

    .line 131
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-eqz v1, :cond_4f

    .line 132
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 135
    :cond_4f
    sget-object p0, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->ERROR:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    invoke-static {p0, v0}, Lcom/unity3d/services/core/log/DeviceLog;->write(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)V

    return-void
.end method

.method private static getLogLevel(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;)Lcom/unity3d/services/core/log/DeviceLogLevel;
    .registers 2

    .line 187
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog;->_deviceLogLevel:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/unity3d/services/core/log/DeviceLogLevel;

    return-object p0
.end method

.method public static info(Ljava/lang/String;)V
    .registers 2

    .line 79
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->INFO:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->checkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/unity3d/services/core/log/DeviceLog;->write(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs info(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 2

    .line 84
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->info(Ljava/lang/String;)V

    return-void
.end method

.method public static setLogLevel(I)V
    .registers 4

    const/4 v0, 0x1

    const/16 v1, 0x8

    if-lt p0, v1, :cond_e

    .line 45
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_ERROR:Z

    .line 46
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_WARNING:Z

    .line 47
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_INFO:Z

    .line 48
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    goto :goto_3a

    :cond_e
    const/4 v1, 0x4

    const/4 v2, 0x0

    if-lt p0, v1, :cond_1b

    .line 50
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_ERROR:Z

    .line 51
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_WARNING:Z

    .line 52
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_INFO:Z

    .line 53
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    goto :goto_3a

    :cond_1b
    const/4 v1, 0x2

    if-lt p0, v1, :cond_27

    .line 55
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_ERROR:Z

    .line 56
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_WARNING:Z

    .line 57
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_INFO:Z

    .line 58
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    goto :goto_3a

    :cond_27
    if-lt p0, v0, :cond_32

    .line 60
    sput-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_ERROR:Z

    .line 61
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_WARNING:Z

    .line 62
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_INFO:Z

    .line 63
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    goto :goto_3a

    .line 65
    :cond_32
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_ERROR:Z

    .line 66
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_WARNING:Z

    .line 67
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_INFO:Z

    .line 68
    sput-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    :goto_3a
    return-void
.end method

.method public static warning(Ljava/lang/String;)V
    .registers 2

    .line 111
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->WARNING:Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->checkMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/unity3d/services/core/log/DeviceLog;->write(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs warning(Ljava/lang/String;[Ljava/lang/Object;)V
    .registers 2

    .line 116
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->warning(Ljava/lang/String;)V

    return-void
.end method

.method private static write(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)V
    .registers 5

    .line 146
    sget-object v0, Lcom/unity3d/services/core/log/DeviceLog$1;->$SwitchMap$com$unity3d$services$core$log$DeviceLog$UnityAdsLogLevel:[I

    invoke-virtual {p0}, Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1f

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1c

    const/4 v2, 0x3

    if-eq v0, v2, :cond_19

    const/4 v2, 0x4

    if-eq v0, v2, :cond_16

    const/4 v0, 0x1

    goto :goto_21

    .line 157
    :cond_16
    sget-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_ERROR:Z

    goto :goto_21

    .line 154
    :cond_19
    sget-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_WARNING:Z

    goto :goto_21

    .line 151
    :cond_1c
    sget-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_DEBUG:Z

    goto :goto_21

    .line 148
    :cond_1f
    sget-boolean v0, Lcom/unity3d/services/core/log/DeviceLog;->LOG_INFO:Z

    .line 163
    :goto_21
    sget-boolean v2, Lcom/unity3d/services/core/log/DeviceLog;->FORCE_DEBUG_LOG:Z

    if-eqz v2, :cond_26

    goto :goto_27

    :cond_26
    move v1, v0

    :goto_27
    if-eqz v1, :cond_30

    .line 168
    invoke-static {p0, p1}, Lcom/unity3d/services/core/log/DeviceLog;->createLogEntry(Lcom/unity3d/services/core/log/DeviceLog$UnityAdsLogLevel;Ljava/lang/String;)Lcom/unity3d/services/core/log/DeviceLogEntry;

    move-result-object p0

    .line 169
    invoke-static {p0}, Lcom/unity3d/services/core/log/DeviceLog;->writeToLog(Lcom/unity3d/services/core/log/DeviceLogEntry;)V

    :cond_30
    return-void
.end method

.method private static writeToLog(Lcom/unity3d/services/core/log/DeviceLogEntry;)V
    .registers 11

    const-string v0, "Writing to log failed!"

    const-string v1, "UnityAds"

    if-eqz p0, :cond_4a

    .line 227
    invoke-virtual {p0}, Lcom/unity3d/services/core/log/DeviceLogEntry;->getLogLevel()Lcom/unity3d/services/core/log/DeviceLogLevel;

    move-result-object v2

    if-eqz v2, :cond_4a

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x0

    .line 229
    :try_start_10
    const-class v6, Landroid/util/Log;

    invoke-virtual {p0}, Lcom/unity3d/services/core/log/DeviceLogEntry;->getLogLevel()Lcom/unity3d/services/core/log/DeviceLogLevel;

    move-result-object v7

    invoke-virtual {v7}, Lcom/unity3d/services/core/log/DeviceLogLevel;->getReceivingMethodName()Ljava/lang/String;

    move-result-object v7

    new-array v8, v4, [Ljava/lang/Class;

    const-class v9, Ljava/lang/String;

    aput-object v9, v8, v3

    const-class v9, Ljava/lang/String;

    aput-object v9, v8, v2

    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_28} :catch_29

    goto :goto_2e

    :catch_29
    move-exception v6

    .line 232
    invoke-static {v1, v0, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v6, v5

    :goto_2e
    if-eqz v6, :cond_4a

    :try_start_30
    new-array v4, v4, [Ljava/lang/Object;

    .line 237
    invoke-virtual {p0}, Lcom/unity3d/services/core/log/DeviceLogEntry;->getLogLevel()Lcom/unity3d/services/core/log/DeviceLogLevel;

    move-result-object v7

    invoke-virtual {v7}, Lcom/unity3d/services/core/log/DeviceLogLevel;->getLogTag()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v3

    invoke-virtual {p0}, Lcom/unity3d/services/core/log/DeviceLogEntry;->getParsedMessage()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v2

    invoke-virtual {v6, v5, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_45} :catch_46

    goto :goto_4a

    :catch_46
    move-exception p0

    .line 240
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_4a
    :goto_4a
    return-void
.end method
