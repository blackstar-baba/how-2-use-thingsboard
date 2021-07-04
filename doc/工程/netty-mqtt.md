#### 环境准备

- release-3.2分支源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`netty-mqtt`文件夹。

#### 分析
通过名称可以得知，该子工程是可能是使用netty实现mqtt协议的客户端或服务端

`pom.xml`基础分析

```
<dependencies>
  <dependency>
  <groupId>io.netty</groupId>
  <artifactId>netty-codec-mqtt</artifactId>
  </dependency>
  <dependency>
  <groupId>io.netty</groupId>
  <artifactId>netty-handler</artifactId>
  </dependency>
  ......
</dependencies>        
```

外部依赖：`netty`（网络框架）、`jsr305`（代码检查支持）、`guava`（google基础工具类库）

#### 结论
通过分析，可以得出以下结论：

- 该工程使用netty实现了mqtt客户端或服务端

#### TIPS

- [netty](https://netty.io/)是Java基础网络框架，很多中间件比如Flink、Spark、Cassandra都使用了它。

