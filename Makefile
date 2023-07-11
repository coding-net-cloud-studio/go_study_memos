#! /usr/bin/make -f 

default:help

help:
	@echo "使用帮助:"
	@echo "make check  : 判断是否处于cloudstudio工作空间中"
	@echo "make init   : 本目标只是在cloudstudio工作空间中运行_只需要运行1次就可以了"
	@echo "make create : 创建docker镜像_包括后端镜像与前端镜像"
	@echo "make start  : 启动leaf的后端 启动leaf的前端"
	@echo "make stop   : 停止leaf的前端 停止leaf的后端"
	@echo "通过浏览器访问 : http://127.0.0.1:9090/manage/login"
	@echo "---使用默认账号(账号:leaf@admin.com 密码: 123456789)登录后台管理"
	@echo "特别提示: 进入管理界面后_必须在_分区管理_建立_分区_与_子分区_确实比较繁琐"
	@echo "---- http://127.0.0.1:9090/manage/partition "
	@echo "make w22_init              : 本目标只是在cloudstudio工作空间中运行_只需要运行1次就可以了"
	@echo "make w26_vs_ext_install    : 本目标只是在cloudstudio工作空间中安装多个vscode扩展"
	@echo "make w27_install_go_tools  : 安装几个go语言编写的处理markdown的工具"


# -----------------------------------------------------------------------

# 初始化本cloudstudio的工作空间
.PHONY : init
init:
	@echo -e "$$(pwd)/Makefile init_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f82_main 2nd参数 3rd参数

# -----------------------------------------------------------------------

# 初始化本cloudstudio的工作空间
.PHONY : w22_init
w22_init:
	@echo -e "$$(pwd)/Makefile init_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f82_main 2nd参数 3rd参数

w26_vs_ext_install:
	@echo -e "$$(pwd)/Makefile wmtask_w26_vs_ext_install_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f27_38_install_some_vs_ext_quick 2nd参数 3rd参数

w27_install_go_tools:
	@echo -e "$$(pwd)/Makefile wmtask_w27_install_go_tools_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f68_20_install_go_tools 2nd参数 3rd参数

w28_all:
	echo "我是你"

w30_create:
	@[ -d /etc ] && mkdir -p ~/RemoteWorking/b20_leaf_视频播放/08_文件保存

# -----------------------------------------------------------------------
# 参考如下的文档
# https://leaf.kuukaa.fun/guide/docker.html
# 配置后端文件
# 打开 data/config/application.yml文件,根据其中的注释修改配置文件并保存
create_back_end_docker_image:
	@echo -e "$$(pwd)/Makefile create_back_end_docker_image_目标_被运行\n"
	@docker-compose build

create_front_end_docker_image:
	@echo -e "$$(pwd)/Makefile create_front_end_docker_image_目标_被运行\n"
	@cd ./web && docker build -f Dockerfile-build -t "leaf-web" .

.PHONY : create
create:create_back_end_docker_image create_front_end_docker_image
	@echo -e "$$(pwd)/Makefile create_目标_被运行\n"

# -----------------------------------------------------------------------
# bash - Makefile中的基本if else语句
# https://www.coder.work/article/7542462

check:
	@if [ $$(which cloudstudio) ]; then \
		echo "位于cloudstudio工作空间中"; \
	else \
		echo "没有处于cloudstudio工作空间中"; \
	fi

# -----------------------------------------------------------------------

# -----------------------------------------------------------------------

# .PHONY : start_back_end
# start_back_end:
# 	-@docker-compose up -d

.PHONY : start_back_end
start_back_end:
	@if [ $$(which cloudstudio) ]; then \
		echo "位于cloudstudio工作空间中"; \
		docker-compose up -f 38_for_cloudstudio_docker-compose.yml -d \
	else \
		echo "没有处于cloudstudio工作空间中"; \
		docker-compose up -f docker-compose.yml -d \
	fi


# 前端用的是docker run_因为是启动的临时docker的容器_停止后_自动消失
# docker run -it --rm --name c32_leaf_frontend_leafweb -p 9090:9090 "leaf-web" /bin/sh
.PHONY : run_front_end
run_front_end:
	-@docker run -it --rm --name c32_leaf_frontend_leafweb -p 9090:9090 "leaf-web"

# 01_启动leaf的后端
# 然后
# 06_启动leaf的前端
.PHONY : start
start: start_back_end run_front_end
	@echo -e "$$(pwd)/Makefile start_目标_被运行\n"

# -----------------------------------------------------------------------

.PHONY : stop_front_end
stop_front_end:
	-@docker stop c32_leaf_frontend_leafweb

.PHONY : stop_back_end
stop_back_end:
	-@docker-compose stop


# 01_停止leaf的前端
# 然后
# 06_停止leaf的后端
.PHONY : stop
stop: stop_front_end stop_back_end
	@echo -e "$$(pwd)/Makefile stop_目标_被运行\n"

# -----------------------------------------------------------------------

# 下面的目标是非常特殊的_给deepin虚拟机用的
# REVIEW 解决docker运行以后某些目录被更改为root用户的目录
deepin:
	sudo chown -hR aia:aia ./
