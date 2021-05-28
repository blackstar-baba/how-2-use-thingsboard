#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`rest-client`文件夹。

#### 分析
通过名称可以得知，该子工程是Restful风格的客户端

`pom.xml`基础分析

```
<dependencies>
  <dependency>
  <groupId>org.thingsboard.common</groupId>
  <artifactId>data</artifactId>
  </dependency>
  <dependency>
  <groupId>org.springframework</groupId>
  <artifactId>spring-web</artifactId>
  </dependency>
</dependencies>
```

内部依赖：`data`，外部依赖：`spring-web`（Spring web）

#### 结论
通过分析，可以得出以下结论：

- 该工程使用Spring Web相关基础类，完成一个Resftul客户端。

#### TIPS

无。