#### 问题描述

通过Mqtt协议传输过大的消息至Thingsboard时，会导致连接被强制杀死，导致重连，消息过大主要有以下几个限制：

1、协议层限制，Mqtt最大控制报文（含payload）不得超过268435455bytes（256m），限制无法修改
2、配置限制，配置文件中定义消息payload不得超过65536bytes（64k），可通过修改NETTY_MAX_PAYLOAD_SIZE大小扩大限制
3、消息队列限制，使用**微服务架构**进行部署时，如果transport消息无法正常写入消息中间件，判断为异常，中断相关Mqtt连接，需要通过扩展消息队列配置进行修改


#### TIPS
- [Mqtt协议控制报文格式](https://blog.mcxiaoke.com/mqtt/mqtt/02-ControlPacketFormat.html)
- 配置项`max_payload_size: "${NETTY_MAX_PAYLOAD_SIZE:65536}"`
