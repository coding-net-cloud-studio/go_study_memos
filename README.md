# memos

# <font color="#dddd00" size="6">我们一起Go</font><br /> 

- <font color="#dddd00">在中国数百万的程序员都有了自己的家庭与子女</font><br /> 
- <font color="#dddd00">Memos很适合数百万程序员的妻子,给她们的孩子制作\"时光都去了哪儿了!\" 图片格式,家庭视觉日记</font><br /> 


<img height="72px" src="https://usememos.com/logo.webp" alt="✍️ memos" align="right" />


A lightweight, self-hosted memo hub. Open Source and Free forever.

[本教程是针对泛开发者_这里有本教程适用人群的_说明](./Makefile)

<a href="https://usememos.com/docs">Documentation</a> •
<a href="https://demo.usememos.com/">Live Demo</a> •
Discuss in <a href="https://discord.gg/tfPJa4UmAv">Discord</a> / <a href="https://t.me/+-_tNF1k70UU4ZTc9">Telegram</a>

<p>
  <a href="https://github.com/usememos/memos/stargazers"><img alt="GitHub stars" src="https://img.shields.io/github/stars/usememos/memos?logo=github" /></a>
  <a href="https://discord.gg/tfPJa4UmAv"><img alt="Discord" src="https://img.shields.io/badge/discord-chat-5865f2?logo=discord&logoColor=f5f5f5" /></a>
</p>

![demo](https://usememos.com/demo.webp)

## Key points

- Open source and free forever
- Self-hosting with Docker in seconds
- Markdown support
- Customizable and sharable
- RESTful API for self-service

## Deploy with Docker in seconds

```bash
docker run -d --name memos -p 5230:5230 -v ~/.memos/:/var/opt/memos ghcr.io/usememos/memos:latest
```

> The `~/.memos/` directory will be used as the data directory on your local machine, while `/var/opt/memos` is the directory of the volume in Docker and should not be modified.

Learn more about [other installation methods](https://usememos.com/docs#installation).

## Contribution

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. We greatly appreciate any contributions you make. Thank you for being a part of our community! 🥰

<a href="https://github.com/usememos/memos/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=usememos/memos" />
</a>

---

- [Moe Memos](https://memos.moe/) - Third party client for iOS and Android
- [lmm214/memos-bber](https://github.com/lmm214/memos-bber) - Chrome extension
- [Rabithua/memos_wmp](https://github.com/Rabithua/memos_wmp) - WeChat MiniProgram
- [qazxcdswe123/telegramMemoBot](https://github.com/qazxcdswe123/telegramMemoBot) - Telegram bot
- [eallion/memos.top](https://github.com/eallion/memos.top) - Static page rendered with the Memos API
- [eindex/logseq-memos-sync](https://github.com/EINDEX/logseq-memos-sync) - Logseq plugin
- [JakeLaoyu/memos-import-from-flomo](https://github.com/JakeLaoyu/memos-import-from-flomo) - Import data. Support from flomo, wechat reading
- [Send to memos](https://sharecuts.cn/shortcut/12640) - A shortcut for iOS
- [Memos Raycast Extension](https://www.raycast.com/JakeYu/memos) - Raycast extension
- [Memos Desktop](https://github.com/xudaolong/memos-desktop) - Third party client for MacOS and Windows
- [MemosGallery](https://github.com/BarryYangi/MemosGallery) - A static Gallery rendered with the Memos API

## Acknowledgements

- Thanks [Uffizzi](https://www.uffizzi.com/) for sponsoring preview environments for PRs.

## Star history

[![Star History Chart](https://api.star-history.com/svg?repos=usememos/memos&type=Date)](https://star-history.com/#usememos/memos&Date)
