#### 环境准备

- release-3.3分支源码

#### 描述

利用JPA@Lob注解+数据类型oid，存储大文件到Postgresql数据库pg_largeobject表中。

```
select * from thingsboard.pg_catalog.pg_largeobject
```

#### 分析

#### TIPS

- JPA Postgres大对象处理https://www.cxymm.net/article/weixin_30539835/98190592

