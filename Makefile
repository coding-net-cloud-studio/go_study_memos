#! /usr/bin/make -f

# NOTE 本教程是针对完全的初学者
# NOTE 本教程是针对"泛开发者"
# NOTE 泛开发者是指:在本职工作领域是专业人士,但不以编程作为谋生手段
# NOTE 本教程不适合初级程序员_初级程序员应该去看更深的教程了_不需要看本教程
# NOTE 所有曾经编写过300行代码的人士_都不适合看本初级教程了_应该去看其他更深的教程了
#	# NOTE 向已经是程序员的群体,深度推荐:白明,柴树杉,丁尔男,史斌,郝林,徐秋华,陈剑煜,刘丹冰,廖显东,郭宏志,湖南长沙老郭(Nick),王中阳,申专等老师与专家的专业课程
# NOTE Makefile中是支持utf-8(unicode)作为目标名称的_我们这样写的目的是给"泛开发者"在初期容易理解实行的
# NOTE 在后继的课程中_我们将取消这些方法_回归到_英文目标名的传统方式
# NOTE 在bash shell script脚本中_针对_泛开发者_我们使用很长的函数名称这样的_非传统方式
# NOTE 在后继的课程中_我们将取消上述_长函数名的_非传统方式_回归常规写法

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
	@echo "make p11_开启_cloudstudio自动运行预览          : 开启_下一次启动本cloudstudio工作空间运行自动预览"
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
	@bash 1_wmscript_init_this.sh y01_a1_memos_check_revised_files 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
.PHONY : b2_memos_构建_并_使用air启动memos
b2_memos_构建_并_使用air启动memos:
	@echo -e "$$(pwd)/Makefile wmtask_[b2_memos_构建_并_使用air启动memos]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh y36_b2_memos_build_and_start_with_livecode_by_air 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
.PHONY : k9_memos_stop_all
k9_memos_stop_all:
	@echo -e "$$(pwd)/Makefile wmtask_[k9_memos_stop_all]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh y66_k9_memos_stop_all 2nd参数 3rd参数 || exit 0

# -----------------------------------------------------------------------
.PHONY : p11_开启_cloudstudio自动运行预览
k9_memos_stop_all:
	@echo -e "$$(pwd)/Makefile wmtask_[p11_开启_cloudstudio自动运行预览]_目标_被运行\n"
	@bash 1_wmscript_init_this.sh y72_p11_change_vscode_preview_file_content 2nd参数 3rd参数 || exit 0

