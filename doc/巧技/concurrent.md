#### 介绍

Thingsboard中Java各种并发类的使用技巧。

#### 技巧

##### 线程池（Executors）
- FixedThreadPool
```
//AbstractBufferedRateExecutor 84
//用于并发处理时序数据查询（读取和写入）任务，使用固定个数线程从任务队列中获取任务并异步执行
this.dispatcherExecutor = Executors.newFixedThreadPool(dispatcherThreads, ThingsBoardThreadFactory.forName("nosql-dispatcher"));

```

- SingleThreadScheduledExecutor
```
//AbstractBufferedRateExecutor 86
//用于检查时序数据查询（读取和写入）任务是否超时，使用单个线程异步判断任务是否超时
this.timeoutExecutor = Executors.newSingleThreadScheduledExecutor(ThingsBoardThreadFactory.forName("nosql-timeout"));

```
- WorkStealingPool
```
//AbstractBufferedRateExecutor 85
//用于处理时序数据查询（读取和写入）超时结果，使用固定个数线程处理超时结果，设置回调，线程可偷取其他线程任务，防止某些线程处理缓慢导致后续任务阻塞。
this.callbackExecutor = Executors.newWorkStealingPool(callbackThreads);

```
- CachedThreadPool
```
//TbServiceBusProducerTemplate 53
//用于处理异步发送消息到服务总线的结果，使用可变个数线程处理完成结果设置回调
executorService = Executors.newCachedThreadPool();

```

##### 重入锁（ReentrantLock）

##### ConcurrentHashMap（并发HashMap）


##### ConcurrentSkipListMap（并发跳表）

