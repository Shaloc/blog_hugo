---
title: "Manjaro环境配置和软件记录"
date: 2019-07-22T19:04:22+08:00
tags: []
categories: []
author: "Shaloc"
draft: false
---

从重新开始使用ArchLinux到现在已经有几个月了，下面是一些经常使用和十分值得推荐的软件。

## 包管理工具

PACMAN: pacman（[加入archlinuxcn源](https://mirror.tuna.tsinghua.edu.cn/help/archlinuxcn/)）

AUR: yay, yaourt

更新到中国镜像：

```bash
sudo pacman-mirrors -c China 
```

## 工作

### 文献管理 

Zotero [+ 坚果云](http://help.jianguoyun.com/?p=3168)

Zotero使用的插件：Scihub QuickLook [ZotFile](https://www.yangzhiping.com/tech/zotero4.html)，使用papership登录zotero帐号可以实现和移动平台的同步

pdf阅读使用foxitpdf就好，大概是因为感觉标注和阅读更顺手，至于caj，可以尝试`pdf2caj`，当然能下载到pdf还是不要用caj啦。

之前也看到很多同学在Windows上用CNKI E-Study，大概这也算是CNKI对文献管理工具的一种尝试吧，目前对中文期刊的支持可以说十分优秀了，但是英文可能就没那么好。

目前已经尝试过Papers, EndNote, NoteExpress, Citavi这几种文献管理软件了，用起来的话还是Zotero和Citavi比较顺手，Zotero的全平台大概是最优秀的，当然也可能是因为我比较懒惰不想直接用bibtex管理文献？

{{% bwbox info %}}
尽量在今年比较闲的时候写一个文献管理软件对比吧。
{{% /bwbox %}}

### 文本编辑

代码：Code-OSS和Atom，两个看起来差不多，但是不知道为什么总觉的Atom的提示看起来比较顺眼。VSCode的插件列表保存到了Gist上。 Vim(vimplus)

文本：TexLive2018 + WPS Office 2019 + Libre Office
当然需要用到Word的场合会用一下Windows的。

笔记：Evernote - Tusk

### IDE

MATLAB(因为学校买了所以一直在用最新的)

JetBrains ToolBox - Clion, PyCharm, IDEA

Xilinx Vivado 2018.2和2019.1

### Shell

terminator + zsh

zsh插件：git z extract zsh-autosuggestions zsh-syntax-highlighting

zsh主题：powerline

### 输入法

fcitx + googlepinyin + 云输入插件

### 小工具

Electron-SSR：不需要命令行，但是Manjaro-gnome上需要额外安装`libappindicator`以正常显示右上角的图标

balanaEtcher：磁盘镜像烧写工具

## 阅读

### 图书管理

Calibre（因为跨平台性能比较好）

### PDF

Foxitpdf

## 媒体

vlc

foobar2000(use wine, AUR repo)