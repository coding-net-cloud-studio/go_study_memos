# REVIEW 构建镜像_从原始的后端镜像构建_修改而来
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

# wmtag_memo_教学_为了教学方便_老师提供了预制的一个内容数据库_如下的可以不执行
# RUN ./memos setup --host-username=root --host-password=a123456 --mode dev

# NOTE wmtag_memo_教学_端口号定义在这里_8118_端口
ENV MEMOS_MODE="dev"
ENV MEMOS_PORT="8118"

ENTRYPOINT ["./memos"]
