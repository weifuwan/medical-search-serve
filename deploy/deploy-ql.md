**本地部署**

- swagger文档路径：http://localhost:8080/medical-search-serve/doc.html
- 账号密码：admin/admin
  <br>



**后端docker容器创建**

**后端docker容器创建**
```
docker run --name ms-api \
        -d -p 20000:8080 \
        --privileged=true \
        --restart=always \
        -v /home/jykj/ms-api:/usr/local \
        -v /home/jykj/ms-api/config:/usr/local/config \
        -v /home/jykj/ms-api/logs:/usr/local/appLog \
        -v /data/ms/attach:/data/ms/attach \
        -v /data/ms/export:/data/ms/export \
        -e TZ="Asia/Shanghai"  \
        java:8u111 sh -c "cd /usr/local && java -jar medical-search-admin.jar --server.port=8080  --spring.profiles.active=ql"

```



**前端docker容器创建**
```
docker run \
-d -p 21000:80 \
--privileged=true \
--restart=always \
--name ms-web \
-v /home/jykj/ms-web/conf/nginx.conf:/etc/nginx/nginx.conf \
-v /home/jykj/ms-web/logs:/var/log/nginx \
-v /home/jykj/ms-web/dist:/usr/share/nginx/html \
nginx:latest
```