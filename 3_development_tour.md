# 在cloudstudio云上工作室中构建与执行memos

## 步骤

a1. 

   ```bash
   # TODO a1_09_概览_老师_重点_修改了哪些文件
   [[ -f workspace.yml ]] && grep -r -H wmtag_memo_教学 | grep NOTE 
   ```

b2. 使用air启动memos后端(在修改go语言编写的后端的时候,可以自动重载_liveload)

   ```bash
   # TODO b2_01_先构建_前端_生成前端的目标文件夹
   [[ -f workspace.yml ]] && cd web && npm install && npm run build && touch ./dist/02_web构建时间_$(date '+%Y-%m-%d日_%H:%M:%S秒').md && ls -lah ./dist && cd ..
   ```

   ```bash
   # TODO b2_02_把上面构建好的_前端目标文件夹_拷贝一份到_后端的./server/dist目录下
   # 03_上述覆盖了./server/dist中原有内容
   [[ -f workspace.yml ]] && [[ -d ./server/dist/ ]] && rm -rf ./server/dist/ && cp -r ./web/dist/ ./server/ && touch ./server/dist/03_从web前端dist拷贝时间_$(date '+%Y-%m-%d日_%H:%M:%S秒').md && ls -lah ./server/dist/
   ```

   ```bash
   # TODO b2_05_为构建后端的go代码做准备
   [[ -f workspace.yml ]] && go mod download -x
   ```

   ```bash
   # TODO b2_06_为了放置memos后端服务正在运行_运用下述命令_先把memos尝试停止运行_真实查找的是_"air -c scripts/.air.toml"
   [[ -f workspace.yml ]] && kill $(ps -ef | grep "air -c scripts/.air.toml" | grep -v grep | awk '{print $2}')
   ```

   ```bash
   # TODO b2_07_构建后端的go代码_并且放入到./.air/目录下
   [[ -f workspace.yml ]] && [[ -f ./.air/memos ]] && rm -f ./.air/memos && go build -o ./.air/memos ./main.go && touch ./.air/07_go_build_memos_构建时间_$(date '+%Y-%m-%d日_%H:%M:%S秒').md && ls -lah ./.air
   ```

   ```bash
   # b2_09_调用刚刚生成的go后端可执行文件_设置用户名称是_root_密码是_a123456
   [[ -f workspace.yml ]] && ./.air/memos setup --host-username=root --host-password=a123456 --mode dev
   ```

   ```bash
   # b2_11_此时应该位于本git仓库的顶层目录下_类似_绝对目录为_/root/RemoteWorking/22.wmsrc_memos
   # TODO b2_15_执行如下的命令_以dev_开发模式_启动后台
   # b2_16_缺省的后台服务端口是_8081
   [[ -f workspace.yml ]] && air -c scripts/.air.toml
   ```

c3. 在浏览器中登录
	- cloudstudio 会自动打开一个链接地址
	- 类似于 https://ohbott-buwkox-8081.preview.myide.io/
	- 每个学生打开的链接都不相同
	- 选择中文语言
	- 用户名称: root
	- 用户密码: a123456

d4. 尝试构建docker镜像
   ```bash
   # TODO d4_01_下拉构建过程中需要用的镜像_需要等待比较长一点的时间
   [[ -f workspace.yml ]] && docker pull golang:1.19.3-alpine3.16
   ```

   ```bash
   # TODO d4_03_尝试构建镜像
   [[ -f workspace.yml ]] && docker build -f ./Dockerfile -t neosmemo/memos:latest .
   ```

   ```bash
   # TODO d4_05_尝试在上面新构建的镜像_运行一个临时容器_暴露的端口号是_8118_端口
   [[ -f workspace.yml ]] && docker run -it --rm --name m12_cloudstudio_memos -p 8118:8118 neosmemo/memos:latest
   ```

   ```bash
   # TODO d4_07_尝试停止上面运行起来的m12_cloudstudio_memos容器_执行本步骤_即使是出现错误_也没有问题_可以继续进行
   [[ -f workspace.yml ]] && docker stop m12_cloudstudio_memos
   ```

   ```bash
   # TODO d4_09_尝试使用docker-compose运行起来_这次使用的外露端口是_8228_端口
   [[ -f workspace.yml ]] && docker-compose up -d 
   ```

   ```bash
   # TODO d4_11_尝试停止docker-compose启动容器
   [[ -f workspace.yml ]] && docker-compose down
   ```

