#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea



#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)



#### 分析
整体工程为maven父子工程，因此application也是maven工程，对`pom.xml`进行基础的分析
##### pom

- denpendencies

  ```
  <dependencies>
          <dependency>
              <groupId>io.netty</groupId>
              <artifactId>netty-transport-native-epoll</artifactId>
              <version>${netty.version}</version>
              <!-- Explicitly bring in the linux classifier, test may fail on 32-bit linux -->
              <classifier>linux-x86_64</classifier>
          </dependency>
          ....
  </dependencies>      
  ```

  一些基础的依赖，有`netty`、`spring-boot-start-web`、`common`、`rule-engine`、`transport`、`dao`、`pa ho`、`jwt`等等，大体可以分为两类：外部依赖和自身依赖（依赖其他子工程），最核心的依赖是**`spring-boot-start-web`**，通过此依赖，可以得出application是一个**基于Spring boot的Web工程**。

- build
  ```
  <build>
        <finalName>${pkg.name}-${project.version}</finalName>
        <resources>
            <resource>
                <directory>${project.basedir}/src/main/resources</directory>
            </resource>
        </resources>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
            </plugin>
        </plugins>
  </build>
  ```
  一些编译插件
  
- repositories

  ```
  <repositories>
          <repository>
              <id>jenkins</id>
              <name>Jenkins Repository</name>
              <url>https://repo.jenkins-ci.org/releases</url>
              <snapshots>
                  <enabled>false</enabled>
              </snapshots>
          </repository>
  </repositories>
  ```
  依赖仓库`jenkins`,可能有一些特殊依赖需要从jenkins仓库中获取。

##### 结构
maven工程的约定为`src/main/java`存放源码,`src/main/resource`存放资源文件，因此主要关注这两个包下的内容
- `src/main/java`
  //todo

- `src/main/resource`
  //todo
  
- `其他`
  //todo

#### 结果
通过分析，可以得出以下结果：

- //todo


#### TIPS
- Thingsboard官方 [Building from sources](https://thingsboard.io/docs/user-guide/install/building-from-source/)，提示从`application/target`中copy，因此application是一个核心入口。
- Spring官方[Building an Application with Spring Boot](https://spring.io/guides/gs/spring-boot/)，介绍了如何使用`spring-boot-starter-web`完成一个基本应用。



