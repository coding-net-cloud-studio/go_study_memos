# NOTE 构建镜像_从原始的后端镜像构建_修改而来
# Build backend exec file.
FROM golang:1.19.3-alpine3.16
WORKDIR /backend-build

COPY . .

COPY ./.air/memos_dev.db .

# #构建后端和安装环境
RUN go env -w GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct \
    && go mod download -x \
    && go mod tidy

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update --no-cache

RUN CGO_ENABLED=0 go build -o memos ./main.go

EXPOSE 8118

# Directory to store the data, which can be referenced as the mounting point.
RUN mkdir -p /var/opt/memos
# VOLUME /var/opt/memos

COPY ./.air/memos_dev.db /var/opt/memos

# RUN ./memos setup --host-username=root --host-password=a123456 --mode dev

ENV MEMOS_MODE="dev"
ENV MEMOS_PORT="8118"

ENTRYPOINT ["./memos"]
