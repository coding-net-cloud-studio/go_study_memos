#! /usr/bin/make -f 

default:help

help:
	@echo "\n"
	@echo -e "\033[33m 使用帮助: \033[0m"
	@echo "\n"
	@echo -e "\033[33m 在中国数百万的程序员都有了自己的家庭与子女 \033[0m"
	@echo -e "\033[33m Memos很适合数百万程序员的妻子,给她们的孩子制作\"时光都去了哪儿了!\" 图片格式,家庭视觉日记: \033[0m"
	@echo "\n"
	@echo "特别提示: 先输入make 再选择数字 接着按键盘左上角的Tab键 可以自动完成输入"
	@echo "\t  --这样的方式对于初学者最为简洁^_&"
	@echo "\t  --资深程序员请忽略本方式"
	@echo "\n"
	@echo "make 1_check                                   : 判断是否处于cloudstudio工作空间中"
	@echo "make 2_init                                    : 本目标只是在cloudstudio工作空间中运行_只需要运行1次就可以了"
	@echo "make 3_在cloudstudio中_安装_vscode扩展         : 本目标只是在cloudstudio工作空间中安装多个vscode扩展_设置自己的vscode扩展自定义组合"
	@echo "make 4_在cloudstudio中_安装_go语言_小工具      : 安装几个go语言编写的小工具_包括_处理markdown的工具"
	@echo "\n"
	@echo "make a1_memos_概览老师主要修改了哪些文件       : 概览老师主要修改了哪些文件"
	@echo "make b2_memos_构建_并_使用air启动memos         : 构建memos前端_构建memos后端_并_使用air启动memos"
	@echo "\n"
	@echo "make k9_memos_stop_all                         : 尝试停止所有被启动的服务_或_容器等"
	@echo "\n"
	@echo "每个学员看到的网址都不一样_通过浏览器访问类似于 https://ohbott-buwkox-8081.preview.myide.io/ 的网址"
	@echo -e "\033[33m ---使用默认账号(账号:root 密码: a123456)登录memos \033[0m"
	@echo "\n\n"
	@exit 0

# -----------------------------------------------------------------------
# bash - Makefile中的基本if else语句
# https://www.coder.work/article/7542462
.PHONY : 1_check
1_check:
	@echo -e "$$(pwd)/Makefile wmtask_[1_check]_目标_被运行\n"
	@if [ $$(which cloudstudio) ]; then \
		echo "位于cloudstudio工作空间中"; \
	else \
		echo "没有处于cloudstudio工作空间中"; \
	fi

# -----------------------------------------------------------------------

# 初始化本cloudstudio的工作空间
.PHONY : 2_init
2_init:
	@echo -e "$$(pwd)/Makefile wmtask_[2_init]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f82_main 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
# 在cloudstudio中安装vscode扩展_定制自己的个性化组合
.PHONY : 3_在cloudstudio中_安装_vscode扩展
3_在cloudstudio中_安装_vscode扩展:
	@echo -e "$$(pwd)/Makefile wmtask_[3_在cloudstudio中_安装_vscode扩展]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f27_38_install_some_vs_ext_quick 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
# 在cloudstudio中安装几个go语言编程的小工具_例如处理markdown文件等
.PHONY : 4_在cloudstudio中_安装_go语言_小工具
4_在cloudstudio中_安装_go语言_小工具:
	@echo -e "$$(pwd)/Makefile wmtask_[4_在cloudstudio中_安装_go语言_小工具]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh f68_20_install_go_tools 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
.PHONY : a1_memos_概览老师主要修改了哪些文件
a1_memos_概览老师主要修改了哪些文件:
	@echo -e "$$(pwd)/Makefile wmtask_[a1_memos_概览老师主要修改了哪些文件]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh $TODO_这里需要换名字 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
.PHONY : b2_memos_构建_并_使用air启动memos
b2_memos_构建_并_使用air启动memos:
	@echo -e "$$(pwd)/Makefile wmtask_[b2_memos_构建_并_使用air启动memos]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh $TODO_这里需要换名字 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
.PHONY : k9_memos_stop_all
k9_memos_stop_all:
	@echo -e "$$(pwd)/Makefile wmtask_[k9_memos_stop_all]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh $TODO_这里需要换名字 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------

