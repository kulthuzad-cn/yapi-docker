# zpfield/yapi:0.11
FROM node:10.16.3-alpine

WORKDIR /app
EXPOSE 3000
# 安装编译工具
RUN apk add --no-cache python make \
&& wget http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-1.8.5.tgz \
&& mkdir -p /app/log \
&& tar zxvf ./yapi-vendor-1.8.5.tgz -C /app \
&& rm ./yapi-vendor-1.8.5.tgz \
&& cd /app/package \
&& npm i --production --registry https://registry.npm.taobao.org \
&& npm cache clean --force \
&& apk del python make
# 判断数据库是否已有当前管理员用户
COPY ["./docker-install.js", "/app/package/server/docker-install.js"]
CMD ["sh", "-c", "node /app/package/server/docker-install.js && node /app/package/server/app.js"]
