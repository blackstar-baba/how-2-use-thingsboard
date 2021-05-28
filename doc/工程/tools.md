#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`tools`文件夹。

#### 分析

通过名称可以得知，该工程主要是一些工具。

`pom.xml`基础分析

```
<dependencies>
  <dependency>
  <groupId>org.thingsboard.common</groupId>
  <artifactId>data</artifactId>
  </dependency>
  <dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-web</artifactId>
  </dependency>
  ......
</dependencies>      
```

内部依赖：`data`， 外部依赖：`spring-boot-starter-web`（Spring boot web）、`mqttv3`（mqtt客户端）、`guava`（Google基础工具）、`cassandra-driver-core`（Cassandra驱动）、`commons-io`（Apache IO工具）

结构分析
```
.
├── pom.xml
├── src
│   └── main
│       ├── java
│       ├── python
│       └── shell
```
除了Java相关文件，还有python、shell。

Java文件夹下有一个`Readme.txt`文件,内容如下

```
# Description:
This tool used for migrating ThingsBoard into hybrid mode from Postgres.
   
Performance of this tool depends on disk type and instance type (mostly on CPU resources).
But in general here are few benchmarks:
1. Creating Dump of the postgres ts_kv table -> 100GB = 90 minutes
```

介绍此工具用于将Thingsboard从postgres迁移到混合模式。

#### 结论

通过分析，可以得出以下结论：
- 该子工程主要是一些工具，辅助Thingsboard运行

#### TIPS

- 官方网址提供的一些脚本存在此工程中，比如[自签名证书生成](https://thingsboard.io/docs/user-guide/mqtt-over-ssl/#self-signed-certificate-generation)