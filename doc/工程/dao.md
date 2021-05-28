#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`dao`文件夹。

#### 分析
对`pom.xml`进行基础分析
```
<dependencies>
  <dependency>
  <groupId>org.thingsboard.common</groupId>
  <artifactId>data</artifactId>
  </dependency>
  <dependency>
  <groupId>org.thingsboard.common</groupId>
  <artifactId>message</artifactId>
  </dependency>
  ......
</dependencies> 
```

内部依赖：`data`、`message`、`stats`、`dao-api`、`util`，外部核心依赖：`postgresql`（Postgresql驱动）、`jackson-databind`（Json序列化与反序列化）、`protobuf-java`（protobuf序列化与反序列化）`spring-tx`（Spring事务）、`java-driver-core`（Cassandra驱动）、`hsqldb`（Hsql驱动）、`jedis`（redis客户端）、`caffeine`（缓存）、`spring-boot-starter-data-jpa`（Spring JPA）、`slf4j`、`logback`、`junit`。

#### 结论
通过分析，可以得出以下结论：
- dao子工程主要用于数据持久化
- 使用JPA作为持久层框架
- 使用`postgresql`、`cassandra`、`hsql`三种数据源
- 使用`redis`、`caffeine`作为缓存框架


#### TIPS
- Hsqldb 在thingsboard单片版本镜像中有使用，但生产环境更推荐使用Postgresql、Postgresql+Cassandra、Postgresql+TimescaleDB，官方文档[数据源选择](https://thingsboard.io/docs/reference/#sql-vs-nosql-vs-hybrid-database-approach)
- 关于缓存，官方文档[缓存配置](https://thingsboard.io/docs/user-guide/install/config/)



