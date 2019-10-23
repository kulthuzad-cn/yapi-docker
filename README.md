# yapi 接口管理工具

## 手动设置admin权限
1.链接 mongodb 数据库 yapi 库
2.修改user表中对应用户项的`role`字段(默认为`member`)为`admin`给予用户管理员权限

## 数据卷挂载位置
#### 配置文件
`/{configPath}/config.json:/app/config.json`

#### 日志文件
`/${logPath}/log:/app/log`

## 存在的问题
> 因为有的时候 mongodb 下的 mongo.lock 文件在 移除容器时为删除导致 再次启动出现数据库访问异常 需要启动前手动删除该文件

## 版本更新
0.11 版本开始支持初始化用户（不需要手动设置admin用户）
