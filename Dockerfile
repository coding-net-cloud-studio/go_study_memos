# Build frontend dist.
FROM node:latest AS frontend
WORKDIR /frontend-build

COPY ./web/package.json ./web/pnpm-lock.yaml ./

RUN corepack enable && pnpm i --frozen-lockfile

COPY ./web/ .

# 设置淘宝npm镜像
RUN npm config set registry https://registry.npm.taobao.org 
# 安装pnpm
# RUN npm install -g pnpm
# 安装依赖
RUN pnpm install

RUN pnpm build

# Build backend exec file.
FROM golang:1.19.3-alpine3.16 AS backend
WORKDIR /backend-build

COPY . .
COPY --from=frontend /frontend-build/dist ./server/dist

# #构建后端和安装环境
RUN go env -w GOPROXY=https://goproxy.cn,direct \
    && go mod tidy

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update --no-cache \
    && apk add ffmpeg  

RUN CGO_ENABLED=0 go build -o memos ./main.go

# Make workspace with above generated files.
FROM alpine:3.16 AS monolithic
WORKDIR /usr/local/memos

RUN apk add --no-cache tzdata
ENV TZ="UTC"

COPY --from=backend /backend-build/memos /usr/local/memos/

EXPOSE 5230

# Directory to store the data, which can be referenced as the mounting point.
RUN mkdir -p /var/opt/memos
VOLUME /var/opt/memos

ENV MEMOS_MODE="prod"
ENV MEMOS_PORT="5230"

ENTRYPOINT ["./memos"]
