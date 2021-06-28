#### 环境准备

- release-3.2分支源码，可参考[编译](../编译/编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`transport`文件夹。

#### 分析

通过名称可以得知，与协议相关。

`pom.xml`基础分析

```
<modules>
  <module>http</module>
  <module>mqtt</module>
  <module>coap</module>
</modules>
```

transport包含`http`、`mqtt`、`coap`子工程。

- coap

  `pom.xml`基础分析

  ```
  <dependencies>
    <dependency>
    <groupId>com.iiot.common.transport</groupId>
    <artifactId>coap</artifactId>
    </dependency>
    <dependency>
    <groupId>com.iiot.common</groupId>
    <artifactId>queue</artifactId>
    </dependency>
    ......
  </dependencies>
  ```

  内部依赖：`coap`、`queue`，外部核心依赖：`spring-boot-starter-web`(Spring boot Web)、`winsw`（windows服务打包）、`spring-boot-starter-test`(Spring boot test)、`junit`，使用插件编译多操作系统下的安装包。

- http
  与coap类似，内部依赖为`http`、`queue`

- mqtt
  与coap类似，内部依赖为`mqtt`、`queue`

#### 结论
通过分析，可以得出以下结论：
- 该工程用于编译多操作系统下transport的安装包

#### TIPS

- 使用这几个工程，可以进行微服务架构下transport层的开发和调试。