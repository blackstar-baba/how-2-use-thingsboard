#### 环境准备

- release-3.2分支源码，可参考[编译](编译.md)获取源码
- IDE Idea或Eclipse，本文使用Idea


#### 准备

使用Idea打开源码工程。

![工程结构](../../image/工程结构.png)

双击`docker`文件夹。

#### 分析
docker文件夹没有任何pom，但从文件夹名称来看，主要和镜像相关。
##### 结构

```
.
├── README.md
├── compose-utils.sh
├── docker-compose.cassandra.yml
├── docker-compose.postgres.volumes.yml
├── docker-compose.postgres.yml
├── docker-compose.yml
├── docker-install-tb.sh
├── docker-remove-services.sh
├── docker-start-services.sh
├── docker-stop-services.sh
├── docker-update-service.sh
├── docker-upgrade-tb.sh
├── haproxy
│   └── config
│       └── haproxy.cfg
├── kafka.env
├── tb-coap-transport.env
├── tb-http-transport.env
├── tb-js-executor.env
├── tb-mqtt-transport.env
├── tb-node
│   └── conf
│       ├── cps.conf
│       └── logback.xml
├── tb-node.cassandra.env
├── tb-node.env
├── tb-node.postgres.env
├── tb-transports
│   ├── coap
│   │   └── conf
│   │       ├── logback.xml
│   │       └── tb-coap-transport.conf
│   ├── http
│   │   └── conf
│   │       ├── logback.xml
│   │       └── tb-http-transport.conf
│   └── mqtt
│       └── conf
│           ├── logback.xml
│           └── tb-mqtt-transport.conf
└── tb-web-ui.env

```

通过Readme文件可以知道，当前文件夹的内容主要用于以微服务的方式启动cps。

#### TIPS

- 可参考前作[微服务部署](../部署/微服务.md)获取更细节的使用方式
- 官方使用文档[docker-compose-up](https://thingsboard.io/docs/user-guide/install/cluster/docker-compose-setup/)

