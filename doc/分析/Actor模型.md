#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)


#### 描述

Thingsboard数据处理部分规则引擎使用了Actor模型，早期版本2.x使用`Akka`框架实现，3.x为自行实现




##### Actor模型
开始分析之前，有必要先了解下Actor模型，维基百科的定义如下：

演员模型推崇的哲学是“一切皆是演员”，这与[面向对象编程](https://zh.wikipedia.org/wiki/面向对象编程)的“一切皆是对象”类似。
演员是一个运算实体，响应接收到的消息，相互间是[并发](https://zh.wikipedia.org/wiki/并发计算)的：
- 发送有限数量的消息给其他演员；
- 创建有限数量的新演员；
- 指定接收到下一个消息时要用到的行为。
![Actor Model](../../image/ActorModel.png)


##### 流程
分为两个阶段：  
1. 类初始化，方法为：`initActorSystem`
```
log.info("Initializing actor system.");
actorContext.setActorService(this);
TbActorSystemSettings settings = new TbActorSystemSettings(actorThroughput, schedulerPoolSize, maxActorInitAttempts);
//新建DefaultTbActorSystem对象
system = new DefaultTbActorSystem(settings);
//创建线程池用于后续异步处理消息
system.createDispatcher(APP_DISPATCHER_NAME, initDispatcherExecutor(APP_DISPATCHER_NAME, appDispatcherSize));
system.createDispatcher(TENANT_DISPATCHER_NAME, initDispatcherExecutor(TENANT_DISPATCHER_NAME, tenantDispatcherSize));
system.createDispatcher(DEVICE_DISPATCHER_NAME, initDispatcherExecutor(DEVICE_DISPATCHER_NAME, deviceDispatcherSize));
system.createDispatcher(RULE_DISPATCHER_NAME, initDispatcherExecutor(RULE_DISPATCHER_NAME, ruleDispatcherSize));

actorContext.setActorSystem(system);
//创建整个Actor模型的根，也是消息进入规则引擎的入口
appActor = system.createRootActor(APP_DISPATCHER_NAME, new AppActor.ActorCreator(actorContext));
actorContext.setAppActor(appActor);
//创建状态Actor，也是消息进入规则引擎的入口
TbActorRef statsActor = system.createRootActor(TENANT_DISPATCHER_NAME, new StatsActor.ActorCreator(actorContext, "StatsActor"));
actorContext.setStatsActor(statsActor);

log.info("Actor system initialized.");
```

2. 应用准备完成，方法为`onApplicationEvent`
```
log.info("Received application ready event. Sending application init message to actor system");
//给顶层AppActor发送消息AppInitMsg
appActor.tellWithHighPriority(new AppInitMsg());
```




#### TIPS

- Actor模型 [wiki](https://en.wikipedia.org/wiki/Actor_model)















