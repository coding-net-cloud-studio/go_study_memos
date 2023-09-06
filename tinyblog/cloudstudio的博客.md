# CloudStudio助力少年功夫熊猫成长为技术上的神龙大侠

我经常喜欢看CSDN的技术文章,看着看着,发现很多当年的技术小白,经过岁月的洗礼,已经成为技术领域的老师傅.

这令我总是想起一部老电影<功夫熊猫>,想起那个卖面的小伙计,**阿宝**,就是下面这位小兄弟.

![1689265698693](image/功夫熊猫/1689265698693.png)

在电影功夫熊猫中,有一个场面至今留在我的记忆深处,就是,阿宝刚刚开始学习功夫的时候,大意说自己是一个"小白中的小白".

如今,从2000年进入互联网时代,已经23年了,很多的青年大学生,都想快速的掌握一些信息技术,好在自己的专业领域成为"神龙大侠".

2023年的09月金秋,崭新的一批大学生即将进入美丽的大学校园,其中理科生,工科生普遍都有一点点编程课程.

他们/她们,就是编程领域中"小白中的小白".

![1689746735767](image/功夫熊猫/1689746735767.jpg)

无数技术老师傅的成长与职业发展经验表明:

> **这些2030年的神龙大侠,有时会制作一些非常实用的本专业小工具.**  
> **这些小工具,只在作者本专业的互动社区分享与发布.**  
> **这些专业的小工具,融入领域知识,实用与广受欢迎是它们的共同特点.**  
> **而这些,2030年的新一代神龙大侠 一定会在 他/她 的本专业中获得更好的社会评价.**  

一个新的泛开发者群体正在 **AIGC与AI代码辅助完成技术** 的助力下,技能飞快成长,群体规模迅速扩大.

**"他们是自己专业领域中的专业人士,习得编程技术,但不以编程作为谋生手段"**

![1689266425100](image/功夫熊猫/1689266425100.png)

<br/>
<br/>

## 新泛开发者群体,小白中的小白,如何快速成长

<br/>

前一段时间,我读[ memos 使用指南:自建一个备忘录中心服务](https://zhuanlan.zhihu.com/p/589633444) 文章中的内容

> "不知道小伙伴们平时有没有写日记的习惯?虽说这年头正经人都不写日记了,但我们每天要处理各种各样的事情,一本备忘录还是有必要的.
> 这类应用其实有很多,我自己也体验过一些.有的集成了许多花里胡哨的功能;有的则是充斥着各种广告.于是我寻思着,那还不如自建一个服务来得直接."

还有另外一篇文章,[让回忆有迹可循——Memos](https://www.kejiwanjia.com/jiaocheng/129450.html) 如下内容

> "你是不是经常会有突然的灵感浮现在你的脑海,你是不是突然灵光乍现却无处记录,使用过许多Memo类软件,但却不是被广告困扰就是需要支付高昂的会员费用,且自己的隐私不能得到保证..."
> "现在你不用担心这些啦,免费开源的Memos来啦,可以把他部署到自己的服务器上,自己管理自己的Memo,可能你会说,网页使用不方便,但是它有小程序和APP,服务端都是可以用自己的,今天我就教大家搭建Memos的服务端和小程序."

"我在使用Memos的时候,一开始使用的网页端,感觉平平无奇,但自从我部署小程序之后,那丝滑的多平台过度,随时可查阅的状态,归档,置顶,分享,这些功能真的是太香了!"

**我对这个,开源,基于 Golang 和 TypeScript 开发的,自托管的备忘录中心Memo,来了兴趣.**

> *感到,如果在腾云扣钉的cloudstudio.net中,用Memos(脉陌笔记)当做样例,建立一个教程,可以帮助很多的,初学者,快速学习,信息处理技能.*
> *这里是本系列的第一篇文章与第一个基础教程.*

<br/>
<br/>

## 话不多说,直接上最后的结果

<br/>

这是我制作好的cloudstudio工作空间模板,想尝试的小伙伴们,直接点击下面的勋章就可以了!

赶考（个人）分享了「v39_cloudstudio_memos」模版 https://cloudstudio.net/templates/rCqR7g1Fu9V

[![Cloud Studio Template](https://cs-res.codehub.cn/common/assets/icon-badge.svg)](https://cloudstudio.net/templates/rCqR7g1Fu9V)

<br/>
<br/>

## 制作过程

<br/>

#### **在cloudstudio中最终运行效果**

![1689267726276](image/功夫熊猫/1689267726276.png)

<br/>

#### **把自己在cloudstudio中运行Memos的过程,制作了一个教程**

![1689267841946](image/功夫熊猫/1689267841946.png)

<br/>

#### **再上几张图**

<!-- 下面是v32版本的图 -->

![1689746735761](image/功夫熊猫/1689746735761.png)

<!-- 下面是v28版本的图 -->

<!-- ![1689267929099](image/功夫熊猫/1689267929099.png) -->

<br/>

#### **在cloudstudio云上工作室中docker build构建成功**

```bash
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

```

<br/>

#### **Memos已经被成功的启动起来了**

![1689268023065](image/功夫熊猫/1689268023065.png)

<br/>

### **Get的新体会**

#### **在CloudStudio中各种优秀的功能集成于一身,CloudStudio会成为IT培训机构的有力助手**

![1689268286489](image/功夫熊猫/1689268286489.png)

<br/>
<br/>

## 总结

## 期望小伙伴在cloudstudio云上工作室中成长IT技术 焕发光彩

![1689268556667](image/功夫熊猫/1689268556667.png)

<br/>
<br/>

## 最后真的是一个广告 "越分享 越幸福"

时光流逝,很多在CSDN上写技术博客的小伙伴,都成为了各个公司的技术专家,你也加入CSDN的技术分享队伍吧!

![1689269158500](image/功夫熊猫/1689269158500.png)

<br/>
<br/>

# 等待你的加入

![1689269336547](image/功夫熊猫/1689269336547.png)

<br/>
<br/>

- 参考了如下文章
  - [让回忆有迹可循——Memos](https://www.kejiwanjia.com/jiaocheng/129450.html)
  - [memos 使用指南:自建一个备忘录中心服务](https://zhuanlan.zhihu.com/p/589633444)
  - [Memos-碎片化知识卡片管理工具](https://blog.csdn.net/weixin_45694843/article/details/130308387)
  - [碎片化知识管理工具Memos](https://blog.csdn.net/wbsu2004/article/details/125594736)

<br/>

- Memos仓库地址
  - [memos 仓库地址](https://github.com/usememos/memos)
