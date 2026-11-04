**本地部署**

- swagger文档路径：http://localhost:8080/medical-search-serve/doc.html
- 账号密码：admin/admin
  <br>
  **redis容器构建**

```bash
docker run -d --name redis6379 \
-p 6379:6379 \
-v /home/data/docker/redis/conf:/etc/redis/redis.conf \
-v /home/data/docker/redis/data:/data \
redis redis-server /etc/redis/redis.conf

```

[Docker部署Redis](https://blog.csdn.net/CSDN_LJK/article/details/129147749?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522168491717016800226566630%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=168491717016800226566630&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-1-129147749-null-null.268^v1^control&utm_term=redis&spm=1018.2226.3001.4450)


<br>
**后端docker容器创建**

```bash
docker run --name medical-search-serve \
        -d -p 20000:8080 \
        --restart=always \
        -v /home/data/docker/ms-serve/medical-search-admin.jar:/usr/local/medical-search-admin.jar \
        -v /home/data/docker/ms-serve/config:/usr/local/config \
        -v /home/data/docker/ms-serve/logs:/usr/local/mslog \
        -v /home/data/docker/ms-serve/img:/home/data/docker/ms-serve/img \
        -e TZ="Asia/Shanghai"  \
        java:8u111 sh -c "cd /usr/local && java -jar medical-search-admin.jar --server.port=8080 --spring.profiles.active=zxyy"
```
<br>
**前端docker容器创建**

```bash
 docker run --name medical-search-web \
        -d -p 21000:80 \
        --privileged=true \
        --restart=always \
        -v /home/data/docker/ms-web/dist/:/usr/local/apache2/htdocs/ \
        -v /home/data/docker/ms-web/conf/httpd.conf:/usr/local/apache2/conf/httpd.conf \
        -v /home/data/docker/ms-web/logs/:/usr/local/apache2/logs/ \
        httpd
```
[Docker Apache容器部署React项目](https://blog.csdn.net/CSDN_LJK/article/details/129088813?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522168491700116800217217631%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fblog.%2522%257D&request_id=168491700116800217217631&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~blog~first_rank_ecpm_v1~rank_v31_ecpm-1-129088813-null-null.268^v1^control&utm_term=httpd&spm=1018.2226.3001.4450)



```bash
curl -H "Content-Type: application/json" -X POST -d '{"username":"admin", "password":"admin"}' "http://msnode2:20000/medical-search-admin/login"
```

