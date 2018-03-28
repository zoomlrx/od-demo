# od-demo
订餐网站（测试）

这是一个模拟订餐的恶搞系统

因为是demo,所以有好多东西没有完善,

如用户输入信息格式,这一块就没有做,

代码也还没进行优化,

而且美化也做的不好,

可以注册登录,下单,查单.

涉及到的知识有Vue,nodejs(express),mySQl(mariadb),Mint-UI,服务器的搭建

因为是demo,所以有好多东西没有完善

# 成品网址
http://www.grayxi.com

您可以看一下

# vue-demo文件夹

这个文件夹里放的是和Vue相关的文件

# node-demo文件夹

这个文件夹方的是与后台相关的文件

# sql文件夹

这个文件夹里放的我做的数据库的sql文件


# 本地使用

使用的时候,分别进入到vue-demo与node-demo里
打开命令行工具(windows自带的powersell,git bash,cmd都行)
输入:

```
npm init
```

进行各种依赖和组件的安装

在vue-demo里输入命令


```
npm run build
```

编译一下该项目

把vue-demo里的dist文件夹,index.html这两个东西拷贝到node-demo里www这个文件夹里,

接下来把sql文件导入到本地的数据库

打开node-demo里的server.js文件进行端口的配置,与数据库的配置

```
//连接池,接收一堆请求,每次保持几十个连接,与数据库连接的相关信息
const db = mysql.createPool({host:'localhost',user:'root',password:'123456',database:'test'});

//配置服务器
var server = express();

//配置本地端口
server.listen(8080);
```
接下来启动node-demo里的server.js文件

```
node server.js
```
打开浏览器,输入localhost:8080

能出现登录页面,就是成功启动了

![image](https://github.com/zoomlrx/od-demo/blob/master/img/login.jpg?raw=true)
