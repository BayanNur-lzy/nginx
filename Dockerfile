# 基础镜像使用nginx
FROM artifact-registry.mercedes-benz.com.cn/baselibrary/nginx:1.16.1-alpine
# 作者
MAINTAINER bylz
# 将jar包添加到容器中
ADD ./target/nginx-0.0.1-SNAPSHOT.jar /etc/nginx/nginx-0.0.1-SNAPSHOT.jar
RUN chmod -R 777 /etc/nginx
# 修改这个jar包的访问时间和修改时间为当前时间
RUN bash -c 'touch /etc/nginx/nginx-0.0.1-SNAPSHOT.jar'
USER 1000
ENTRYPOINT ["java","-jar","/etc/nginx/nginx-0.0.1-SNAPSHOT.jar"]
