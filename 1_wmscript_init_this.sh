#! /bin/bash

pause_60_second(){
	if read -t 60 -p "暂停60秒,按回车继续运行: "
	then
		# echo "hello $REPLY,welcome to cheng du"
		printf "\n";
	else
		# echo "sorry, Output timeout, please execute the command again !"
		printf "\n时间已到,继续运行\n";
	fi
}

# 在cloudstudio环境中_更新_vscode的_用户_settings_文件
# 主要是设置cloud studio为"永不休眠"
f16_cs_vs_settings_user_update(){
	# cloud studio中用户设置文件
	CS_VSCODE_SETTINGS_USER=/root/.local/share/code-server/data/User/settings.json
	# -----------------------------------------------------------
	# '嵌入文档涵盖了生成脚本的主体部分.

	(
	cat <<'EOF'
{
	"cloudstudio.autosleep": "no",
	"go.toolsManagement.autoUpdate": true,
	"redhat.telemetry.enabled": false,
	"bookmarks.saveBookmarksInProject": true
}
EOF
	) > ${CS_VSCODE_SETTINGS_USER}

}

f20_linux_git_setting() {
	#在Linux操作系统环境下
	# git status中文显示乱码解决:
	# https://www.cnblogs.com/v5captain/p/14832597.html
	#相当于在~/.gitconfig 文件中加入一行 file:/root/.gitconfig   core.quotepath=false
	# core.quotepath=false
	git config --global core.quotepath false
	git config --global --add safe.directory $(pwd)

	# git config命令详解
	# http://www.mybatis.cn/archives/2151.html
	# git config --list --show-origin

	# 来自廖雪峰的git教程
	# https://www.liaoxuefeng.com/wiki/896043488029600/898732837407424
	git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

	git config --global alias.count "rev-list --all --count"

}

# NOTE wmtag_memo_教学_如何定制自己使用的vscode扩展组合
# wmtag_memo_查看当前有哪些vscode扩展已经被安装上了_在本函数中_各位同学可以_自由的添加_或删除_vscode扩展_定制自己的需要环境
# 在cloudstudio中快速的安装某几个vscode的扩展
f27_38_install_some_vs_ext_quick(){

	# NOTE 列出cloudstudio云上工作室已经安装的vscode扩展列表
	# [[ -f $(which cloudstudio) ]] && cloudstudio --list-extensions

	# NOTE 安装某些vscode的扩展
	echo -e "\n-------在cloudstudio中快速的安装某几个vscode的扩展-------\n"

	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  formulahendry.code-runner         --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  AMiner.codegeex                   --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  alefragnani.Bookmarks             --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  ExodiusStudios.comment-anchors    --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  ritwickdey.LiveServer             --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  ms-azuretools.vscode-docker       --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  cweijan.vscode-office             --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  arcanis.vscode-zipfs              --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  mads-hartmann.bash-ide-vscode     --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  vsls-contrib.codetour             --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  ms-vscode.makefile-tools          --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  golang.go                         --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  egomobile.vscode-powertools       --force
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  maelvalais.autoconf               --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  Sycl.markdown-command-runner      --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  CloudStudio.tutorialkit           --force

	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  Fr43nk.seito-openfile             --force

	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  cweijan.vscode-mysql-client2      --force
	[[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  cweijan.vscode-database-client2   --force
	
	# [[ -f $(which cloudstudio) ]] && cloudstudio --install-extension  mkhl.direnv                       --force

	# NOTE 下面是强制删除某些vscode的扩展
	[[ -f $(which cloudstudio) ]] && cloudstudio --uninstall-extension muhammad-sammy.csharp             --force

}

f30_install_common_software(){
	apt update
	apt install -y \
		sudo \
		tree \
		curl \
		net-tools \
		lsof \
		htop \
		direnv \
		strace \
		rsync \
		sshfs \
		jq \
		aria2 \
		iputils-ping \
		lynx \
		hugo \
		flex \
		sqlite3 \
		mysql-client \
		redis-tools
		
		# apt install -y ffmpeg 

}

f36_install_gcc_10_versioin(){
	apt install -y gcc-10
	apt install -y g++-10

	[ -f /usr/bin/gcc-9 ]  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 120
	[ -f /usr/bin/gcc-10 ] && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 150
	[ -f /usr/bin/g++-9 ]  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 120
	[ -f /usr/bin/g++-10 ] && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 150

}

# 安装多个用go语言开发的工具
# 这些工具主要是当做linux pipe 管道的小工具的用途
f68_20_install_go_tools(){

	# goawk
	# go语言对于awk的实现.
	# GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/benhoyt/goawk@latest


	# gojq 
	# go处理json文件格式.是jq的go语言实现.
	# GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/itchyny/gojq/cmd/gojq@latest


	# glow 
	# glow 在TUI,也就是终端中显示markdown文件.
	# 能否很好的显示各种颜色标示的内容
	# 下载时间比较长一点
	GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/charmbracelet/glow@latest 

	# 安装谢孟军以前写的类似curl的bat工具
	# Bat 是使用 Go 实现的 CLI 工具,类似 cURL 的工具,可以说是 Go 语言版本的 cURL .
	# Bat 可以用来测试,调试和 HTTP 服务器进行一般的交互.
	# GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/astaxie/bat@latest

	# csv2md
	# csv数据格式文件转为markdown格式的表格_方便嵌入到docsify中去
	GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/uchiiii/csv2md@latest

	# air
	# go使用Air实时热加载
	GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/cosmtrek/air@latest

	# html2md 
	# 把html页面转换为markdown格式
	GO111MODULE=auto GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct go install github.com/suntong/html2md@latest 
		# NOTE 紧随其后的2条容易失败_原因是访问github的问题_不是html2md出现错误 
			# html2md -i https://github.com/suntong/html2md | head -3
			# html2md -i https://github.com/JohannesKaufmann/html-to-markdown -s "div.BorderGrid-row.hide-sm.hide-md > div"
		# echo '<strong>Bold Text</strong>' | html2md -i
		# echo '<strong>Bold Text</strong>' | html2md -i --opt-strong-delimiter="__"
		# cat $GOPATH/src/github.com/JohannesKaufmann/html-to-markdown/testdata/TestPlugins/table/input.html | html2md -i -T | head -6
		# cat $GOPATH/src/github.com/JohannesKaufmann/html-to-markdown/testdata/TestPlugins/table/input.html | html2md -i -T --domain example.com | diff -wU 1 $GOPATH/src/github.com/JohannesKaufmann/html-to-markdown/testdata/TestPlugins/table/output.table.golden -
		# cat $GOPATH/src/github.com/JohannesKaufmann/html-to-markdown/testdata/TestPlugins/table/input.html | html2md -i --plugin-table-compat | head -6
		# cat $GOPATH/src/github.com/JohannesKaufmann/html-to-markdown/testdata/TestPlugins/table/input.html | html2md -i --plugin-table-compat --domain example.com | diff -wU 1 $GOPATH/src/github.com/JohannesKaufmann/html-to-markdown/testdata/TestPlugins/table/output.tablecompat.golden -
		# REVIEW 这个是库 Convert HTML to Markdown. Even works with entire websites and can be extended through rules.
			# https://github.com/JohannesKaufmann/html-to-markdown.git

}

# 删除多个配置文件中的go env涉及的环境变量
f70_remove_go_env(){

	# sed命令删除包含特定字符行: 删除包含"xxx"的行
	# sed -i '/xxx/d' filename

	sed -i '/GO111MODULE/d' ~/.profile
	sed -i '/GO111MODULE/d' ~/.zshrc
	sed -i '/GO111MODULE/d' ~/.bashrc

	sed -i '/GOPROXY/d' ~/.profile
	sed -i '/GOPROXY/d' ~/.zshrc
	sed -i '/GOPROXY/d' ~/.bashrc

}

f71_set_go_env(){

	go env -w GO111MODULE=auto ; \
	go env -w GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct ; \
	go env -w GOSUMDB=sum.golang.google.cn ; \
	echo "export GO111MODULE=auto" >> ~/.profile ; \
	echo "export GOSUMDB=sum.golang.google.cn" >> ~/.profile ; \
	echo "export GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct" >> ~/.profile ; \
	echo "export GO111MODULE=auto" >> ~/.zshrc ; \
	echo "export GOSUMDB=sum.golang.google.cn" >> ~/.zshrc ; \
	echo "export GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct" >> ~/.zshrc ; \
	echo "export GO111MODULE=auto" >> ~/.bashrc ; \
	echo "export GOPROXY=https://goproxy.cn,https://mirrors.tencent.com/go/,https://mirrors.aliyun.com/goproxy,https://proxy.golang.com.cn,direct" >> ~/.bashrc ; \
	echo "export GOSUMDB=sum.golang.google.cn" >> ~/.bashrc

}

# ======================================================================================


# 本git仓库特有的下拉好多个docker镜像
y77_docker_pull_images(){

	apt update && apt-get install -y mysql-client redis-tools

	docker pull golang:1.19.3-alpine

}

# ======================================================================================

all(){

	f16_cs_vs_settings_user_update

	f20_linux_git_setting

	f30_install_common_software

	f36_install_gcc_10_versioin

	f70_remove_go_env

	f71_set_go_env

	# f68_20_install_go_tools

	# y77_docker_pull_images

}

f82_main(){
	
	# 判断是否位于腾云扣钉的cloudstudio工作空间中
	if [[ -f $(which cloudstudio) ]]; then
		# 已经在cloudstudio工作空间中
		# 可以执行
		all
	else
		echo "本脚本只在cloudstudio工作空间中执行_不满足执行的条件_all_函数_没有_被执行"
	fi

	# 不论是位于cloudstudio都执行下面的操作
	# 由于某些文件会产生变化_我们创造一个新的本地分支
	# 例如: data/config/application.yml
	git checkout -b wmstudy_wmlocal

	return 0

}

# eval f82_main

# 下面是_正式_的入口
[ -z "$1" ] && eval f82_main || eval $1 $*
