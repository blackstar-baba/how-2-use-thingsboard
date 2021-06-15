#### 介绍

Thingsboard中Java各种并发类的使用技巧。

#### 技巧

##### 线程池（Executors）
- FixedThreadPool
```
//AbstractBufferedRateExecutor 84
this.dispatcherExecutor = Executors.newFixedThreadPool(dispatcherThreads, ThingsBoardThreadFactory.forName("nosql-dispatcher"));
```
- WorkStealingPool
```
//AbstractBufferedRateExecutor 85
this.callbackExecutor = Executors.newWorkStealingPool(callbackThreads);
```
- SingleThreadScheduledExecutor
```
//AbstractBufferedRateExecutor 86
this.timeoutExecutor = Executors.newSingleThreadScheduledExecutor(ThingsBoardThreadFactory.forName("nosql-timeout"));
```
- CachedThreadPool
```
//TbServiceBusProducerTemplate 52
executorService = Executors.newCachedThreadPool();
```

##### 重入锁（ReentrantLock）

##### ConcurrentHashMap（并发HashMap）


##### ConcurrentSkipListMap（并发跳表）

