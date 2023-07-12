# Development

Memos is built with a curated tech stack. It is optimized for developer experience and is very easy to start working on the code:

1. It has no external dependency.
2. It requires zero config.
3. 1 command to start backend and 1 command to start frontend, both with live reload support.

## Prerequisites

- [Go](https://golang.org/doc/install)
- [Air](https://github.com/cosmtrek/air#installation) for backend live reload
- [Node.js](https://nodejs.org/)
- [pnpm](https://pnpm.io/installation)

## Steps

1. pull source code

   ```bash
   mkdir -p ~/RemoteWorking/
   cd ~/RemoteWorking/

   git clone https://gitcode.net/weixin_44128887/cloudstudio_take_notes_memos ./22.wmsrc_memos

   mkdir -p ~/RemoteWorking/08.文件备份
   mkdir -p ~/RemoteWorking/11.可以删除

   cp -r ~/RemoteWorking/22.wmsrc_memos ~/RemoteWorking/20.wmsrc_memos_wmraw_原始文件/

   ```

2. start backend using air(with live reload)

   ```bash
   # 01_先构建_前端_生成前端的目标文件夹
   cd web && npm install && npm run build && cd ..
   # 02_把上面构建好的_前端目标文件夹_拷贝一份到_后端的./server/dist目录下
   # 03_上述覆盖了./server/dist中原有内容
   cp -r ./web/dist/ ./server/

   # 05_为构建后端的go代码做准备
   go mod download -x
   # 07_构建后端的go代码_并且放入到./.air/目录下
   go build -o ./.air/memos ./main.go
   # 09_调用刚刚生成的go后端可执行文件_设置用户名称是_root_密码是_a123456
   ./.air/memos setup --host-username=root --host-password=a123456 --mode dev
   # 11_此时应该位于本git仓库的顶层目录下_类似_绝对目录为_/root/RemoteWorking/22.wmsrc_memos
   # 15_执行如下的命令_以dev_开发模式_启动后台
   # 16_缺省的后台服务端口是_8081
   air -c scripts/.air.toml
   ```

3. 在浏览器中登录
- cloudstudio 会自动打开一个链接地址
- 类似于 https://ohbott-buwkox-8081.preview.myide.io/
- 每个学生打开的链接都不相同
- 选择中文语言
- 用户名称: root
- 用户密码: a123456

4. start frontend dev server
- 特别提示_在cloudstudio不需要执行这些步骤
- 原因是已经把生成的前端目标文件内容都拷贝到后端的相应目录中
- 后端已经能够找到那些目标文件

   ```bash
   <!-- cd web && pnpm i && pnpm dev -->
   cd web && npm install && npm run build && cd ..
   cp -r ./web/dist/ ./server/
   cd web && npm run dev
   ```



Memos should now be running at [http://localhost:3001](http://localhost:3001) and change either frontend or backend code would trigger live reload.
