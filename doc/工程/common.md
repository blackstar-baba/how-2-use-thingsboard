#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`common`文件夹。


#### 分析
common也是maven工程，对`pom.xml`进行基础的分析

- modules

  ```
  <modules>
    <module>data</module>
    <module>util</module>
    <module>message</module>
    <module>actor</module>
    <module>queue</module>
    <module>transport</module>
    <module>dao-api</module>
    <module>stats</module>
  </modules>
  ```
  说明modules也是个父工程，包含`data`、`util`、`message`、`actor`、`queue`、`transport`、`dao-api`、`stats`几个子工程,接下来分析子工程：
  
- actor
  pom分析如下：
  ```
  <dependencies>
    <dependency>
    <groupId>org.thingsboard.common</groupId>
    <artifactId>util</artifactId>
    </dependency>
    <dependency>
    <groupId>org.thingsboard.common</groupId>
    <artifactId>message</artifactId>
    </dependency>
    ......
  </dependencies>
  ```
  主要是内部依赖和外部依赖，内部依赖：`util`、`message`，外部依赖主要是`slf4j`（门面日志）、`logback`（日志框架）、`junit（单元测试）`
  
- dao-api
  pom分析如下：
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
    <dependency>
    <groupId>com.google.guava</groupId>
    <artifactId>guava</artifactId>
    </dependency>
    ......
  </dependencies>  
  ```
  
  主要是内部依赖和外部依赖，内部依赖：`data`、`message`，外部有`guava`（google基础类库）、`javax.annotation-api`（java注解支持）、`json-schema-validator（json结构检查）`、`java-driver-core`（Cassandra驱动）、`jackson-databind`（json序列化与反序列化）、`spring-boot-autoconfigure`（spring-boot注解支持）、`metrics-jmx`（实时监控类库）、`slf4j`、`logback`、`junit`。
  
- data

  pom分析如下：

  ```
  <dependencies>
    <dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    </dependency>
    <dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>log4j-over-slf4j</artifactId>
    </dependency>
  	......
  </dependencies>          
  ```

  主要是内部依赖和外部依赖，内部依赖：`protobuf-dynamic`,外部依赖：`java-driver-core`、`jackson-databind`、`slf4j`、`logback`、`junit`。

- message

  //todo

- queue

- stats

- transport

- util

##### pom

##### 结构

#### 结果
通过分析，可以得出以下结果：


#### TIPS



