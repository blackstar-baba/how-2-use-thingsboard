#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`packaging`文件夹。

#### 分析
该工程没有`pom.xml`，通过结构分析，3层结构如下：

```
.
├── java
│   ├── assembly
│   │   └── windows.xml
│   ├── build.gradle
│   ├── filters
│   │   ├── unix.properties
│   │   └── windows.properties
│   └── scripts
│       ├── control
│       ├── install
│       └── windows
└── js
    ├── assembly
    │   └── windows.xml
    ├── build.gradle
    ├── filters
    │   ├── unix.properties
    │   └── windows.properties
    └── scripts
        ├── control
        ├── init
        └── windows
```

主要是一些脚本、配置文件，猜测用于编译多种环境（`unix`、`windows`）的安装包

##### 

#### 结论
通过分析，可以得出以下结论：

-  该工程用于编译打包，其他工程编译打包时依赖此工程。

#### TIPS

- 从[官方部署文档](https://thingsboard.io/docs/user-guide/install/installation-options/)可以得知，Thingsboard支持在Ubuntu、Centos、Windows、Raspberry Pi 操作系统中直接部署