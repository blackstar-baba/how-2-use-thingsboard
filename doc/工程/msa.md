#### 环境准备

- release-3.2分支源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`msa`文件夹。

#### 分析
`pom.xml`基础分析

```
<modules>
  <module>tb</module>
  <module>js-executor</module>
  <module>web-ui</module>
  <module>tb-node</module>
  <module>transport</module>
  <module>black-box-tests</module>
</modules>
```

msa包含`tb`、`js-executor`、`web-ui`、`tb-node`、`transport`、`black-box-tests`子工程。

- black-box-tests（黑盒测试）
  `pom.xml`基础分析
  
  ```
  <dependencies>
    <dependency>
    <groupId>org.testcontainers</groupId>
    <artifactId>testcontainers</artifactId>
    <version>${testcontainers.version}</version>
    </dependency>
    <dependency>
    <groupId>org.zeroturnaround</groupId>
    <artifactId>zt-exec</artifactId>
    <version>${zeroturnaround.version}</version>
    </dependency>
    ......
  </dependencies>
  ```
  
  内部依赖：`netty-mqtt`、`tools`、`rest-client`，外部核心依赖：`testcontainers`(容器测试)、`zt-exec`（命令执行）、`java-WebSocket`（websocket支持）、`httpclient`（http客户端）、`guava`（Google工具类）、`gson`（json序列化与反序列化）、`logback`
  
- js-executor（js脚本执行器）
  `pom.xml`基础分析
  
  ```
  <dependencies>
    <dependency>
    <groupId>com.sun.winsw</groupId>
    <artifactId>winsw</artifactId>
    <classifier>bin</classifier>
    <type>exe</type>
    <scope>provided</scope>
    </dependency>
  </dependencies>
  .......
  ```
  
  外部依赖：`winsw`（windows服务打包），使用插件下载nodejs和yarn（nodejs包管理器），同时提供插件进行相关镜像的编译、标记和推送，可以继续查看`yarn.lock`分析该工程依赖，暂不展开。
  
- tb
  `pom.xml`基础分析

  ```
  <dependency>
    <groupId>org.thingsboard</groupId>
    <artifactId>application</artifactId>
    <version>${project.version}</version>
    <classifier>deb</classifier>
    <type>deb</type>
    <scope>provided</scope>
  </dependency>
  ```

  内部依赖：`application`deb包，通过插件进行和此包相关镜像的编译、标记和推送。

- tb-node
  与`tb`子工程类似
  
- transport
  `pom.xml`基础分析
  
  ```
  <modules>
    <module>mqtt</module>
    <module>http</module>
    <module>coap</module>
  </modules>
  ```
  `transport`包含`mqtt`、`http`、`coap`3个子工程
  
- transport/coap
  `pom.xml`基础分析
  ```
  <dependencies>
    <dependency>
    <groupId>org.thingsboard.transport</groupId>
    <artifactId>coap</artifactId>
    <version>${project.version}</version>
    <classifier>deb</classifier>
    <type>deb</type>
    <scope>provided</scope>
    </dependency>
  </dependencies>
  ```
  
  内部依赖：`coap`deb包，通过插件进行和此包相关镜像的编译、标记和推送。
  
- transport/http
  与`transport/coap`类似，内部依赖：`http`deb包，通过插件进行和此包相关镜像的编译、标记和推送。
  
- transport/mqtt
  与`transport/coap`类似，内部依赖：`mqtt`deb包，通过插件进行和此包相关镜像的编译、标记和推送。
  
- web-ui
  与`js-executor`子工程类似

#### 结论
通过分析，可以得出以下结论：

- msa子工程主要包含一些与Docker镜像编译、标记和推送的过程，官方提供微服务集群容器化部署，应该与这个子工程相关。

#### TIPS

- msa全名含义：MicroServices  Architecture，关于此架构的官方文档[msa](https://thingsboard.io/docs/reference/msa/)
- 官方文档[如何编译镜像](https://thingsboard.io/docs/user-guide/install/building-from-source/#build-local-docker-images)