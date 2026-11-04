# 部署指南

## 一、部署`Docker`

### 解压

```linux
tar -zxvf docker-24.0.9.tgz
```

### 移动到/usr/bin

```linux
mv ./docker/* /usr/bin
```

### 创建docker.service文件

```linux
cd /etc/systemd/system/
touch docker.service
```

### 编辑docker.service文件

```linux
vim docker.service
```

### 然后将下边内容复制到docker.service

```linux
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target firewalld.service
Wants=network-online.target
 
[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd
ExecReload=/bin/kill -s HUP $MAINPID
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
#TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
# restart the docker process if it exits prematurely
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s
 
[Install]
WantedBy=multi-user.target
```

### 添加可执行权限

```linux
chmod +x docker.service
```

### 加载docker.service，注意，若修改了docker.service文件，则要重新加载该文件。

```linux
systemctl daemon-reload
```

### 启动docker

```linux
systemctl start docker
```

### 查看docker

```linux
systemctl status docker
```

### 设置开机自启动

```linux
systemctl enable docker.service
```

## 二、部署`jdk8`、`redis`、`nginx`

### 导入镜像

```linux
docker load -i java_8u111.tar
docker load -i redis_7.2.10.tar
docker load -i nginx_latest.tar
```

### 验证

```linux
docker images
```

## 三、部署后端

```linux
mkdir -p /home/jykj/ms-api/config
mkdir -p /home/jykj/ms-api/logs

docker run --name ms-api \
-d \
-p 8082:8082 \
--restart=always \
-v /home/jykj/ms-api/medical-search-admin.jar:/usr/local/medical-search-admin.jar \
-v /home/jykj/ms-api/config:/usr/local/config \
-v /home/jykj/ms-api/logs:/usr/local/logs \
-v /data/ms/attach:/data/ms/attach \
-e TZ="Asia/Shanghai" \
java:8u111 \
sh -c "java -XX:+UseG1GC -Xms512m -Xmx4g -jar /usr/local/medical-search-admin.jar --server.port=8082 --spring.profiles.active=cdbytest"
```

## 四、部署前端

```linux
docker run \
-d -p 9000:80 \
--name ms-web \
--privileged=true \
--restart=always \
-v /home/jykj/ms-web/conf/nginx.conf:/etc/nginx/nginx.conf \
-v /home/jykj/ms-web/logs:/var/log/nginx \
-v /home/jykj/ms-web/dist:/usr/share/nginx/html \
nginx:latest
```
