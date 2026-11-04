**本地部署**

- swagger文档路径：http://localhost:8080/medical-search-serve/doc.html
- 账号密码：admin/admin
  <br>

# 三、部署

**后端docker容器创建**
```
docker run --name ms-api \
        -d -p 2082:8080 \
        --privileged=true \
        --restart=always \
        -v /home/jykj/ms-api/medical-search-admin.jar:/usr/local/medical-search-admin.jar \
        -v /home/jykj/ms-api/config:/usr/local/config \
        -v /home/jykj/ms-api/logs:/usr/local/appLog \
        -v /data/ms/attach:/data/ms/attach \
        -e TZ="Asia/Shanghai"  \
        java:8u111 sh -c "cd /usr/local && java -jar medical-search-admin.jar --server.port=8080  --spring.profiles.active=cdbytest"
```

**前端docker容器创建**
```
docker run \
-d -p 3082:80 \
--name ms-web \
--privileged=true \
--restart=always \
-v /home/jykj/ms-web/conf/nginx.conf:/etc/nginx/nginx.conf \
-v /home/jykj/ms-web/logs:/var/log/nginx \
-v /home/jykj/ms-web/dist:/usr/share/nginx/html \
nginx:latest
```


[Docker Nginx容器部署vue项目](https://blog.csdn.net/CSDN_LJK/article/details/134645388?spm=1001.2014.3001.5502)

[Docker部署Redis](https://blog.csdn.net/CSDN_LJK/article/details/129147749?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522168491717016800226566630%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=168491717016800226566630&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-1-129147749-null-null.268^v1^control&utm_term=redis&spm=1018.2226.3001.4450)

