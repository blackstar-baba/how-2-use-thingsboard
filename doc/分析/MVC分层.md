#### 环境准备

- release-3.2分支源码

#### 描述

传统的MVC分为 `Model-View-Controller` 3层，用于解耦前后端，相关实现技术经过一定时间的发展逐渐专业化，于是有了前后端分离，其中`View`层通常由前端技术实现，比如AngularJs、Vue，`Controller`层由后端技术实现，比如Java、Go等，`Model`通常定义为通用数据交换格式，比如Json。 本文主要研究Thingsboard后端的分层结构。

#### 分析
以后端数据库为PG，创建设备为例，后端入口为`DeviceController`，核心流程为：
```
//DeviceController 119
//
Device savedDevice = checkNotNull(deviceService.saveDeviceWithAccessToken(device, accessToken));

//DeviceService 46
//
Device saveDeviceWithAccessToken(Device device, String accessToken);


//DeviceServiceImpl 172
//
return doSaveDevice(device, accessToken);

//DeviceServiceImpl 203
//
savedDevice = deviceDao.save(device.getTenantId(), device);

//DeviceDao 53
//
Device save(TenantId tenantId, Device device);

//JpaAbstractDao 65
//JpaDeviceDao
//DeviceRepository
entity = getCrudRepository().save(entity);









```

#### TIPS