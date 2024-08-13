# 使用Node.js镜像
FROM node:14 AS node

WORKDIR /app
COPY app/package*.json ./
RUN npm install
COPY app/ .

# 使用Nginx镜像
FROM nginx:alpine

COPY --from=node /app /app
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# 暴露端口
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]