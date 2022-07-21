#### 环境准备

- release-3.2分支源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)



#### 分析

通过名称可以得知，与UI（User Interface，主要指前端）相关。

`pom.xml`基础分析

```
<plugins>
  <plugin>
    <groupId>com.github.eirslett</groupId>
    <artifactId>frontend-maven-plugin</artifactId>
    <version>1.7.5</version>
    <configuration>
      <installDirectory>target</installDirectory>
      <workingDirectory>${basedir}</workingDirectory>
    </configuration>
    <executions>
    <execution>
    	<id>install node and npm</id>
      <goals>
        <goal>install-node-and-yarn</goal>
      </goals>
      <configuration>
        <nodeVersion>v12.16.1</nodeVersion>
        <yarnVersion>v1.22.4</yarnVersion>
      </configuration>
    </execution>
    ....
  </plugin>
</plugins>
```

使用插件下载nodejs和yarn（nodejs包管理器），同时提供插件进行编译、运行和打包，可以继续查看 `package.json` 分析该工程依赖，暂不展开

#### 结论
通过分析，可以得出以下结论：

- 该工程是前端工程

#### TIPS

- 使用该工程，可以进行前端开发和调试。
