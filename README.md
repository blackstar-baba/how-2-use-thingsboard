### Thingsboard全家桶
包含 基础入门、源码分析、二次开发和扩展阅读
- 基础入门（基于3.2）
- 源码分析（基于3.2）
- 二次开发（基于3.3）
- 答疑解惑（不限）

### 准备
- Jdk，11+（因3.2.2版本需要11），用于编译运行
- Maven，3.6.0+，不强制需要，某些IDE也自带
- IDE，推荐Idea，查看代码和运行
- Html5浏览器，推荐使用Chorme，用于页面操作
- 容器引擎，推荐使用Docker，用于初始化环境，比如PG数据库
- Mqtt客户端，推荐使用MqttBox，用于模拟时序数据

### 基础入门
#### 编译
- 编译 [入口](doc/编译/编译.md) 适用于版本3.2及以上

#### 运行
- 运行 [入口](doc/运行/运行.md) 适用于版本3.2及以上

#### 调试
- 后端 [入口](doc/调试/后端.md) 适用于版本3.2及以上
- 前端 [入口](doc/调试/前端.md) 适用于版本3.2及以上

#### 使用
-  权限体系 [入口](doc/使用/权限体系.md) 适用于版本3.2及以上
-  设备
	-  普通设备  [入口](doc/使用/普通设备.md) 适用于版本3.2及以上
	-  智能网关  [入口 ](doc/使用/智能网关.md)适用于版本3.2及以上
-  资产 [入口](doc/使用/资产.md) 适用于版本3.2及以上
-  规则引擎 [入口](doc/使用/规则引擎.md) 适用于版本3.2及以上
-  部件 [入口](doc/使用/部件.md) 适用于版本3.2及以上
-  仪表盘 [入口](doc/使用/仪表盘.md) 适用于版本3.2及以上
-  示例 [入口 ](doc/使用/示例.md)适用于版本3.2及以上

#### 部署
- 单片 [入口](doc/部署/单片.md) 适用于版本3.2及以上
- 微服务 [入口](doc/部署/微服务.md) 适用于版本3.2及以上

#### 最佳实践
- 高可用集群 [入口](doc/最佳实践/高可用集群.md) 适用于版本3.2及以上

### 源码分析
- 工程结构
  - 整体 [入口](doc/工程/整体.md)
  - application  [入口](doc/工程/application.md)
  - common  [入口](doc/工程/common.md)
  - dao  [入口](doc/工程/dao.md)
  - docker  [入口](doc/工程/docker.md)
  - ~~k8s分析~~（官方已不再推荐使用此包，抽取到新的github工程 [thingsboard-ce-k8s](https://github.com/thingsboard/thingsboard-ce-k8s)）
  - msa  [入口](doc/工程/msa.md)
  - netty-mqtt  [入口](doc/工程/netty-mqtt.md)
  - packaging  [入口](doc/工程/packaging.md)
  - rest-client  [入口](doc/工程/rest-client.md)
  - rule-engine  [入口](doc/工程/rule-engine.md)
  - tools  [入口](doc/工程/tools.md)
  - transport  [入口](doc/工程/transport.md)
  - ui-ngx  [入口](doc/工程/ui-ngx.md)
- MVC分层 [入口](doc/分析/MVC分层.md)
- 系统权限 [入口](doc/分析/系统权限.md)
- 设备连接 [入口](doc/分析/设备连接.md)
- 数据传输 [入口](doc/分析/数据传输.md)
- 数据处理
  - 规则引擎 [入口](doc/分析/规则引擎.md)
- 设备控制 [入口](doc/分析/设备控制.md)
- 前端  [入口](doc/分析/前端.md) 适用于版本3.2及以上

### 二次开发

Fork主工程，基于release-3.3分支进行开发，个人前端开发经验有限，欢迎熟悉Angular的前端同学加入。

- 白标 [入口](doc/二次开发/白标.md)
- 仪表盘组件扩展 [普通组件](doc/二次开发/组件扩展.md) [3D组件](doc/二次开发/3D组件扩展.md)
- 规则节点扩展 [系统命令节点](doc/二次开发/系统命令节点.md) [企业微信节点](doc/二次开发/企业微信节点.md)
- 定时任务 `开发中`
- 组织机构树 `开发中`
- Influxdb支持
- 边缘计算
- 用户停用激活
- 租户停用激活
- 汉化增强`持续进行中`

#### 工程
- **地址**：https://github.com/CodeIsBeatiful/thingsboard，分支3.3-x

#### 示例
- **DEMO地址**：http://blackstar-baba.com:9090/

### 答疑解惑 
- 清单 [入口](doc/答疑解惑/README.md)


### TIPS

- 录屏：https://space.bilibili.com/696589672/channel/index
- 镜像：https://gitee.com/blackstar-baba/how-2-use-thingsboard
- 翻墙：https://shadow-flys.us/auth/register?code=bT56

