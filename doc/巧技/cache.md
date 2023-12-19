#### 介绍

Thingsboard中关于Cacheable的使用技巧。

#### 技巧
在3.3版本中使用@Cacheable 和自定义cache，3.4中替换为事务缓存框架TbTransactionalCache。参考PR https://github.com/thingsboard/thingsboard/pull/6536 修复在竞争环境下的杂项缓存问题。



