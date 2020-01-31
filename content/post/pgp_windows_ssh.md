---
title: "Windows下使用GPG4WIN配置SSH和Git"
date: 2019-09-17T11:12:10+08:00
tags: ["notes"]
categories: ["tech"]
author: "Shaloc"
draft: false
---

{{% bwbox info %}}
建议使用最新版的软件进行操作，但是本说明可能不会立刻随着软件的更新更新。本说明使用了Cmder集成的git-for-windows。

GPG4WIN: [下载地址](https://files.gpg4win.org/gpg4win-3.1.10.exe)
Cmder: [下载地址](https://github.com/cmderdev/cmder/releases/download/v1.3.12/cmder.zip)
{{% /bwbox %}}

<!--more-->

## Git

Windows下使用GPG签名Git commit只需要修改git的设置即可。

```ini
# git config --global --edit
[user]
    ...
[gpg]
    program = C:/Program Files (x86)/GnuPG/bin/gpg.exe
[commit]
    gpgsign = true
```

这样之后的提交就都是使用GPG签名过的了。

![20190917122652.png](https://i.loli.net/2019/09/17/Iwpsl9Y2yrZLoJj.png)

## SSH

首先，要使用GPG作为SSH公钥，你需要有一个[A]类型的子秘钥，或者主秘钥具有[A]类型声明。

> A: Auth，验证

它看起来应该是这样的

![示例1](https://i.loli.net/2019/09/17/AKUf4tC5pQ9sJaq.png)

或者是这样的

![示例2](https://i.loli.net/2019/09/17/RLQasJNK4xMfGHc.png)

{{% bwbox tip %}}
至于如何创建一个这样的子秘钥，可以参考[这个帮助页面](https://www.linode.com/docs/security/authentication/gpg-key-for-ssh-authentication/#generating-the-authentication-subkey)。
{{% /bwbox %}}

然后我们使用GPG作为SSH_AUTH_SOCK就可以了。

首先，打开Kleopatra，依次选择设置 - 配置Kleopatra - GnuPG系统 - Private Keys，勾选`Enable ssh support`和`Enable putty support`。

![20190917123621.png](https://i.loli.net/2019/09/17/64SzTUZDyInq5Cr.png)

此外，你还可以通过修改这个选项卡下的`Expire SSH keys after N seconds`和`Set maximum SSH key lifetime to N seconds`来决定要多久输入重新一次秘钥的密码，如果这个值太小，你可能要频繁地输入密码，但是更安全。

然后重启gpg-agent或者重启电脑即可（以下shell操作均在cmder中进行）。

```shell
# 充启gpg-connect-agent
gpg-connect-agent reloadagent /bye
start-ssh-pageant.cmd
```

{{% bwbox tip %}}
有些安装了OpenSSH的电脑（Windows 1803以上会自动安装这个应用）的`ssh-agent`可能不是Cmder目录下的ssh-agent，你需要把`C:\Windows\System32\OpenSSH`从环境变量中移除，它的位置可以参考下一个操作。
{{% /bwbox %}}

然后将SSH_AUTH_SOCK指向上一步输出的内容即可，它一般来说应该是`/tmp/.ssh-pageant-%USERNAME%`。设置系统环境变量`SSH_AUTH_SOCK`为上一个指令输出的内容，这里是`/tmp/.ssh-pageant-Administrator`。

![20190917125153.png](https://i.loli.net/2019/09/17/C1sV8NZxrvwjHYg.png)

如果一切配置正确，这时在控制台输入`ssh-add -L`的输出应该是

![20190917125415.png](https://i.loli.net/2019/09/17/kwFsNAWXPvHSB2o.png)

如果不是这样，你应该首先检查是否按照tip中的指示操作。

然后，在`%APPDATA%/Roaming/gnupg`目录下新建一个名为sshcontrol的文件，将具有A功能的子秘钥的keygrip添加到其中。可以通过`gpg --list-keys --with-keygrip`命令查看keygrip。

![20190917125648.png](https://i.loli.net/2019/09/17/Kk7emtfds5ZXyhw.png)

这时再执行`ssh-add -L`，即可显示这个秘钥对应的公钥。

![20190917125810.png](https://i.loli.net/2019/09/17/MmqyNIXZcxzJaCS.png)

将这个公钥添加到你想添加的服务器，即可实现免密码登陆。

![screen.gif](https://i.loli.net/2019/09/17/ry9YOuWRLN4a6vb.gif)

至于使用GNUPG作为SSH登陆秘钥的意义，大概在于不需要在目标服务器上存储你为每一个自己的设备生成的公钥，同时也不需要担心这些公钥对应的私钥泄露后其他人可以直接通过泄露的私钥直接登陆你的服务器。
