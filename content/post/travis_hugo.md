---
title: "使用Travis自动部署Hugo"
date: 2019-04-09T18:53:47+08:00
tags: ["travis-ci", "hugo"]
categories: ["tech"]
author: "Shaloc"
draft: false
---

之前做博客的自动部署使用的是在云服务器上部署一个webhook，每当提交一个git push的时候服务器pull一下更新的内容，然后再copy到wwwroot下来完成更新。这样做并没有什么问题，使用这种方法也可以很容易地将生成的静态文件部署到其他地点。但是这样要始终保证服务器的可用性，如果阿里云自动重启了KVM实例，博客就可能无法正常部署。

同时，最近我将博客同时迁移到了git pages（这部分会在之后写），所以使用travis来做自动化部署也就成了一件顺理成章的事情。

<!--more-->

## 准备工作

首先要有一个github账号。Public的Repo可以免费使用Travis，不需要其他付费购买了。在travis上登陆一下，授予它必要的权限即可。

## 部署ssh公钥，加密私钥

因为travis自动部署时并不支持把环境变量作为stdin输入，我们不能通过命令行直接给git密码。因此我们要通过数字签名的方式来实现github的免密码登录和push权限获取。

首先，要在自己的电脑上安装`travis`，具体方法如下（系统为ubuntu 18.04）：

```bash
sudo apt update
sudo apt install ruby ruby-dev
gem install travis
```

然后生成一对ssh公私钥

```bash
ssh-keygen -t rsa -b 4096 -C "your_mail@your_domain" -f travis.key 
```
不需要passphrase，直接使用即可。

此操作会同时生成travis.key和travis.key.pub两个文件。将travis.key.pub中的内容复制到用来做pages的github repo setting - deploykeys中（点击Add depoly key)即可。记得在增加的时候把下面的“给予写入权限”也勾选上。

![将travis秘钥部署到github](https://i.loli.net/2019/04/09/5cac7de543149.png)

然后要处理travis.key，这是自己的私钥，是不能给别人看的部分，任何拿到这个私钥的人都可以伪装成你向所有你部署了公钥的地方进行改动，所以我们要用travis本身的加密机制将这个私钥加密再放到repo中，这样就算有人拿到了这个私钥也只是加密过的版本。

```bash
# 首先登录travis，登录org版，防止出现奇怪的问题
travis login --org
# 输入github用户名、密码，进入工作目录
cd path-to-repo
# -r和--add选一个就好，--add会自动修改你的.travis.yml但是要求你在repo目录下。
travis encrypt-file path/to/travis.key [ -r <name of repo> ] [ --add] -p
# 正常情况下travis会自动将这次加密对应的key和iv存储到环境变量中，但是如果没有，你需要自己复制下面的key和iv并在travis中部署。
# 同时把这句话复制下来(xxx是你自己生成的)：
openssl aes-256-cbc -K $encrypted_xxx_key -iv $encrypted_xxx_iv -in travis.key.enc -out ./travis.key -d
```

## 编写.travis.yml

进入存放博客代码的repo的根目录，创建一个.travis.yml。travis会将这个作为配置文件进行自动部署。这个文件有多少种可能的写法这里不做详细介绍，仅介绍本项目中重要的部分。

首先是环境。hugo是用go语言编写的，我们不妨将lauguage设置为go，版本为stable即可。

```yaml
language: go
go: stable
```

设置一下版本，本项目中使用免费版travis，所以endpoint是`api.travis-ci.org`

```yaml
repos:
  Shaloc/blog_hugo:
    endpoint: https://api.travis-ci.org/
```

同时将需要用到的站点添加到known_hosts中，防止首次登陆需要接受RSA指纹（手动输入yes）。

```yaml
addons:
  ssh_known_hosts:
  - github.com
  - gitee.com
  - shaloc.site
```

然后解密之前放在repo中的加密过的私钥，将它保存到`~/.ssh/id_rsa`中即可。这样临时生成的编译服务器就会把他作为私钥与其他服务器做ssh连接。同时配置一下git的用户名和邮箱。

```yaml
before_install:
# 此处就是我们之前复制下来的那句话，不过要修改一下-out后的内容
- openssl aes-256-cbc -K $encrypted_xxx_key -iv $encrypted_xxx_iv
  -in ./.travis/travis.key.enc -out ~/.ssh/id_rsa -d
# 修改一下id_rsa的权限，防止它被其他服务器拒绝
- chmod 400 ~/.ssh/id_rsa
- git config --global user.name "Shaloc"
- git config --global user.email "shalocn@outlook.com"
```

获取hugo并安装，同时把保存在另一个repo中的主题文件clone到项目中。

```yaml
install:
- go get github.com/gohugoio/hugo
- git submodule update --init --recursive
```

然后执行hugo编译生成新的博客即可。

```yaml
script:
- hugo version
- hugo
```

部署部分单独放到了一个脚本中，在下一部分叙述。

```yaml
after_success:
- ".travis/deploy.sh"
```

##　部署

在编译后由使用一个脚本进行部署。

```bash
#!/bin/bash

# 设置工作目录和时区
set -ev
export TZ='Asia/Shanghai'

# 为了保留commit记录，使用clone而不是init然后force push来获取用来存储博客内容的repo
git clone -b master git@github.com:Shaloc/shaloc.github.io.git .deploy_git

# 复制文件，同时要保留一些不是hugo生成的文件。
cd .deploy_git
git checkout master
mv .git/ ../public/
mv CNAME ../public/

# 然后在repo中commit和push，将文件部署到最终的服务器中即可。此处用Site updated : 日期-时间 作为commit格式。
cd ../public
git add .
git commit -m "Site updated: $(date +"%Y-%m-%d %H:%M:%S")"
git push origin master:master --force --quiet
```

这样将文件都保存到对应位置之后，尝试修改一下博客中的文章，然后push，travis ci就会触发一次自动部署，可以在travis-ci中查看对应的部署日志并进行相应的除错工作。

![travis部署记录](https://i.loli.net/2019/04/09/5cac84b009b4e.png)

好！这样我们就完成了自动部署工作。至于git pages的配置和ssl可以放到后面再说，大概会和cloudflare放到一起（可能是个大坑，还要自己再踩一踩呜呜呜）