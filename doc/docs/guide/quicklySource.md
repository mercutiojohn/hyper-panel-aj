```
git clone https://gitee.com/anji-plus/report.git
cd report
sh build.sh
编译完成放在build文件夹 aj-report-xxxx.zip

unzip aj-report-xxxx.zip
cd aj-report-xxxx
vim conf/bootstrap.yml 修改数据库连接、上传下载地址、jwt令牌等信息
sh bin/start.sh

访问：http://serverip:9095
admin 123456
```

## 编译环境

请在Linux上先准备好maven、node.js、jdk <br>
如果在Win10上部署，还需要下载一个 Git 软件，软件名就是 [Git](https://git-scm.com/downloads) <br>
以下内容需要特别注意的地方会有对应提示。<br>

- [Apache Maven] 3.5 <br>
- [Node.js]
    - report1.5以下版本请使用 node<= V14
    - report1.5及以上版本请使用 node>= V16
- [Jdk] 1.8 <br>

## 版本问题

已知以下版本存在兼容性问题，请不要使用

- openJdk
- Jdk 1.7及以下/11及以上（jdk11部分版本有问题）
- Mysql 8.0（8.0.23/26版本没有问题，8.0.21版本存在问题）

## 克隆源码

git clone https://gitee.com/anji-plus/report.git <br>
![img9.png](../picture/quickly/img_9.png) <br>
**注**：不要下载发行版里面的 Source Code.zip <br>

## build

进入report目录，启动build.sh <br>
![img_4.png](../picture/quickly/img_4.png) <br>
编译完成后是放在当前目录下的build文件夹中：aj-report-xxxx.zip <br>

**注：** 如果Win10编译的话，如图用git执行sh build.sh就行了。Linux就直接去report目录下执行sh build.sh就行。 <br>
**特别注意：**
在Win10上用git执行build.sh编译，几个启动脚本的文本格式都是Unix，在win10上启动需要将start.bat转格式，转格式的方法有很多，实在搞不定的话可以下载发行版，用发行版里面的启动脚本替换掉你编译后的脚本。 <br>
同样的在linux下编译然后在win10启动也需要转格式。<br>

## 修改mysql连接

解压aj-report-xxxx.zip，找到bootstrap.yml <br>
![img_1.png](../picture/quickly/img_17.png) <br>

将图中关于mysql的连接配置信息换成你使用的IP:数据库名。如果没有修改flyway为false，那flyway会自动建立aj_report库 <br>

![bootstrap.png](../picture/quickly/img_2.png) <br>
**注**：请确认你的Mysql是否支持远程连接，登陆用户是否有DDL权限 <br>

```yaml
  datasource:
    url: jdbc:mysql://127.0.0.1:3306/aj_report?characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&useSSL=false
    username: root
    password: xxxxxxxx
```

## flyway

flyway是用于自动执行sql，因为mysql版本及配置等问题，flyway可能会执行失败。如果你mysql没问题，注意检查flyway是否开启。<br>

```yaml
  flyway:
    enabled: false    #是否开启flyway（自动执行sql脚本），默认false
```

## OSS配置

OSS底层已支持minio、amazonS3、nfs，都配置的情况下优先级minio->amazonS3->nfs <br>
![file.png](../picture/quickly/img.png) <br>

```yaml
  gaea:
    subscribes:
      oss: #文件存储 都配置的情况下优先级minio->amazonS3->nfs
        enabled: true
        ##允许上传的文件后缀
        file-type-white-list: .png|.jpg|.gif|.icon|.pdf|.xlsx|.xls|.csv|.mp4|.avi|.jpeg|.aaa|.svg
        # 用于文件上传成功后，生成文件的下载公网完整URL，http://serverip:9095/file/download，注意填写IP必须填写后端服务所在的机器IP
        downloadPath: http://10.108.26.197:9095/file/download
        nfs:
          #上传对应本地全路径，注意目录不会自动创建，注意 Win是 \ 且有盘符，linux是 / 无盘符，注意目录权限问题
          path: /app/disk/upload/
```

## jwt秘钥

生产环境请自行修改，避免被远程伪造登录攻击 <br>
[随机密码生成器](http://www.chahuo.com/token-generator.html)

```yaml
    Security:
      # jwt密钥，生产环境请自行修改，避免被远程伪造登录攻击
      jwtSecret: TybmmfrgsIqpPsBOYxvygCMVJWKNfDJU
```

## 启动

linux启动： <br>
aj-report-XXX --> bin --> start.sh <br>
sh bin/start.sh <br>

win10启动：<br>
aj-report-XXX --> bin --> start.bat <br>
双击start.bat启动 <br>

**注意文件格式**

## 日志位置

日志的位置是：report-xxx/logs/aj-report.log <br>

## 访问

http://serverip:9095 <br>
默认密码：admin 123456 <br>


