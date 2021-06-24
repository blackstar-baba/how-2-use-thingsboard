#### 问题描述
使用同一套认证使用多个Mqtt客户端连接Thingsboard时，发现Mqtt客户端会依次断开连接。

#### 解决方法
Thingsboard默认限制单个设备连接数为1，在配置文件中调整`ACTORS_MAX_CONCURRENT_SESSION_PER_DEVICE`的大小即可。

#### TIPS
- 配置项`max_concurrent_sessions_per_device: "${ACTORS_MAX_CONCURRENT_SESSION_PER_DEVICE:1}"`
