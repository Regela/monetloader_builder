.class public Lcom/unity3d/services/core/cache/CacheThread;
.super Ljava/lang/Thread;
.source "CacheThread.java"


# static fields
.field public static final MSG_DOWNLOAD:I = 0x1

.field private static _connectTimeout:I = 0x0

.field private static _handler:Lcom/unity3d/services/core/cache/CacheThreadHandler; = null

.field private static _progressInterval:I = 0x0

.field private static _readTimeout:I = 0x0

.field private static _ready:Z = false

.field private static final _readyLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_readyLock:Ljava/lang/Object;

    const/16 v0, 0x7530

    .line 19
    sput v0, Lcom/unity3d/services/core/cache/CacheThread;->_connectTimeout:I

    .line 20
    sput v0, Lcom/unity3d/services/core/cache/CacheThread;->_readTimeout:I

    const/4 v0, 0x0

    .line 21
    sput v0, Lcom/unity3d/services/core/cache/CacheThread;->_progressInterval:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method public static cancel()V
    .registers 2

    .line 87
    sget-boolean v0, Lcom/unity3d/services/core/cache/CacheThread;->_ready:Z

    if-nez v0, :cond_5

    return-void

    .line 91
    :cond_5
    sget-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_handler:Lcom/unity3d/services/core/cache/CacheThreadHandler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/unity3d/services/core/cache/CacheThreadHandler;->removeMessages(I)V

    .line 92
    sget-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_handler:Lcom/unity3d/services/core/cache/CacheThreadHandler;

    invoke-virtual {v0, v1}, Lcom/unity3d/services/core/cache/CacheThreadHandler;->setCancelStatus(Z)V

    return-void
.end method

.method public static declared-synchronized download(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;Z)V"
        }
    .end annotation

    const-class v0, Lcom/unity3d/services/core/cache/CacheThread;

    monitor-enter v0

    .line 51
    :try_start_3
    sget-boolean v1, Lcom/unity3d/services/core/cache/CacheThread;->_ready:Z

    if-nez v1, :cond_a

    .line 52
    invoke-static {}, Lcom/unity3d/services/core/cache/CacheThread;->init()V

    .line 55
    :cond_a
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "source"

    .line 56
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "target"

    .line 57
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "connectTimeout"

    .line 58
    sget p1, Lcom/unity3d/services/core/cache/CacheThread;->_connectTimeout:I

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "readTimeout"

    .line 59
    sget p1, Lcom/unity3d/services/core/cache/CacheThread;->_readTimeout:I

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "progressInterval"

    .line 60
    sget p1, Lcom/unity3d/services/core/cache/CacheThread;->_progressInterval:I

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "append"

    .line 61
    invoke-virtual {v1, p0, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz p2, :cond_65

    .line 64
    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_3d
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_65

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 65
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    new-array p3, p3, [Ljava/lang/String;

    .line 66
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2, p3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/lang/String;

    invoke-virtual {v1, p1, p3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_3d

    .line 70
    :cond_65
    new-instance p0, Landroid/os/Message;

    invoke-direct {p0}, Landroid/os/Message;-><init>()V

    const/4 p1, 0x1

    .line 71
    iput p1, p0, Landroid/os/Message;->what:I

    .line 72
    invoke-virtual {p0, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 74
    sget-object p1, Lcom/unity3d/services/core/cache/CacheThread;->_handler:Lcom/unity3d/services/core/cache/CacheThreadHandler;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/unity3d/services/core/cache/CacheThreadHandler;->setCancelStatus(Z)V

    .line 75
    sget-object p1, Lcom/unity3d/services/core/cache/CacheThread;->_handler:Lcom/unity3d/services/core/cache/CacheThreadHandler;

    invoke-virtual {p1, p0}, Lcom/unity3d/services/core/cache/CacheThreadHandler;->sendMessage(Landroid/os/Message;)Z
    :try_end_7b
    .catchall {:try_start_3 .. :try_end_7b} :catchall_7d

    .line 76
    monitor-exit v0

    return-void

    :catchall_7d
    move-exception p0

    monitor-exit v0

    goto :goto_81

    :goto_80
    throw p0

    :goto_81
    goto :goto_80
.end method

.method public static getConnectTimeout()I
    .registers 1

    .line 112
    sget v0, Lcom/unity3d/services/core/cache/CacheThread;->_connectTimeout:I

    return v0
.end method

.method public static getProgressInterval()I
    .registers 1

    .line 100
    sget v0, Lcom/unity3d/services/core/cache/CacheThread;->_progressInterval:I

    return v0
.end method

.method public static getReadTimeout()I
    .registers 1

    .line 116
    sget v0, Lcom/unity3d/services/core/cache/CacheThread;->_readTimeout:I

    return v0
.end method

.method private static init()V
    .registers 2

    .line 24
    new-instance v0, Lcom/unity3d/services/core/cache/CacheThread;

    invoke-direct {v0}, Lcom/unity3d/services/core/cache/CacheThread;-><init>()V

    const-string v1, "UnityAdsCacheThread"

    .line 25
    invoke-virtual {v0, v1}, Lcom/unity3d/services/core/cache/CacheThread;->setName(Ljava/lang/String;)V

    .line 26
    invoke-virtual {v0}, Lcom/unity3d/services/core/cache/CacheThread;->start()V

    .line 28
    :goto_d
    sget-boolean v0, Lcom/unity3d/services/core/cache/CacheThread;->_ready:Z

    if-nez v0, :cond_24

    .line 30
    :try_start_11
    sget-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_readyLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_14
    .catch Ljava/lang/InterruptedException; {:try_start_11 .. :try_end_14} :catch_1e

    .line 31
    :try_start_14
    sget-object v1, Lcom/unity3d/services/core/cache/CacheThread;->_readyLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 32
    monitor-exit v0

    goto :goto_d

    :catchall_1b
    move-exception v1

    monitor-exit v0
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_1b

    :try_start_1d
    throw v1
    :try_end_1e
    .catch Ljava/lang/InterruptedException; {:try_start_1d .. :try_end_1e} :catch_1e

    :catch_1e
    const-string v0, "Couldn\'t synchronize thread"

    .line 34
    invoke-static {v0}, Lcom/unity3d/services/core/log/DeviceLog;->debug(Ljava/lang/String;)V

    goto :goto_d

    :cond_24
    return-void
.end method

.method public static isActive()Z
    .registers 1

    .line 79
    sget-boolean v0, Lcom/unity3d/services/core/cache/CacheThread;->_ready:Z

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 83
    :cond_6
    sget-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_handler:Lcom/unity3d/services/core/cache/CacheThreadHandler;

    invoke-virtual {v0}, Lcom/unity3d/services/core/cache/CacheThreadHandler;->isActive()Z

    move-result v0

    return v0
.end method

.method public static setConnectTimeout(I)V
    .registers 1

    .line 104
    sput p0, Lcom/unity3d/services/core/cache/CacheThread;->_connectTimeout:I

    return-void
.end method

.method public static setProgressInterval(I)V
    .registers 1

    .line 96
    sput p0, Lcom/unity3d/services/core/cache/CacheThread;->_progressInterval:I

    return-void
.end method

.method public static setReadTimeout(I)V
    .registers 1

    .line 108
    sput p0, Lcom/unity3d/services/core/cache/CacheThread;->_readTimeout:I

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 41
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 42
    new-instance v0, Lcom/unity3d/services/core/cache/CacheThreadHandler;

    invoke-direct {v0}, Lcom/unity3d/services/core/cache/CacheThreadHandler;-><init>()V

    sput-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_handler:Lcom/unity3d/services/core/cache/CacheThreadHandler;

    const/4 v0, 0x1

    .line 43
    sput-boolean v0, Lcom/unity3d/services/core/cache/CacheThread;->_ready:Z

    .line 44
    sget-object v0, Lcom/unity3d/services/core/cache/CacheThread;->_readyLock:Ljava/lang/Object;

    monitor-enter v0

    .line 45
    :try_start_10
    sget-object v1, Lcom/unity3d/services/core/cache/CacheThread;->_readyLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    .line 46
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_10 .. :try_end_16} :catchall_1a

    .line 47
    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void

    :catchall_1a
    move-exception v1

    .line 46
    :try_start_1b
    monitor-exit v0
    :try_end_1c
    .catchall {:try_start_1b .. :try_end_1c} :catchall_1a

    throw v1
.end method
