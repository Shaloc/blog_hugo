---
title: "Ubuntu 18.04 重新安装 Grub2"
date: 2019-04-13T10:09:39+08:00
tags: ["ubuntu", "grub"]
categories: ["tech"]
author: "Shaloc"
draft: false
---

重新安装GNU/Grub2

<!--more-->

不知道发生了什么，从grub引导ubuntu的时候会出现神秘的错误，错误内容大概是

<link rel="stylesheet" href="/bwbox.css">
<div class="box box-info">
<i class="bwicon-info"> </i>
io错误，无法从'hd4'读盘
</div>

然后按下<kbd>Enter</kbd>后强行进入会直接kernel panic无法进入系统，kernal panic的内容大概也和磁盘io错误有关。抱着十分害怕的心情从另一个系统启动扫了一下磁盘，发现似乎问题并不是很严重（虽然如此crc校验错误计数器已经到了几千了）所以推测应该是grub在上次启动之后的某次操作中出了问题，所以还是先重装一下grub再考虑数据备份的问题吧。

首先要有一个烧录好的Live CD或者U盘，以便我们获得恢复环境。然后从U盘启动进入Ubuntu试用模式，这时候至少Busy box已经配置好了。

然后先把原来安装Ubuntu的卷挂载到/mnt下（哪里都可以）

```bash
sudo mount /dev/sda7 /mnt
```

此处如果不确定是哪个硬盘，可以先使用`sudo fdisk -l`，从分区的类型和容量推断。

然后chroot到原来的卷上。

```bash
sudo mount --bind /dev /mnt/dev
sudo mount --bind /dev/pts /mnt/dev/pts
sudo mount --bind /proc /mnt/proc
sudo mount --bind /sys /mnt/sys
# 和嵌入式系统课程制作initrd.img好像啊
sudo chroot /mnt
```

然后大概是比较坑的部分，因为我的ubuntu和EFI分区并不在同一个硬盘上，所以要把grub安装到`/dev/sdb`。大部分网上的教程都会说直接`grub-install /dev/sdb`就好，但是这样会导致他报一个神秘的错，要么是找不到EFI分区，要么就会报错无法安装。最后看了一下grub-install的说明，我们可以直接把它安装到EFI分区，而不是指定使用那一个硬盘。

```bash
# 挂载EFI分区
sudo mount /dev/sdb1 /boot/efi
# 安装grub
grub-install /boot/efi
grub-install --recheck /boot/efi
# 也可以不更新
update-grub
```
然后`exit`，`sudo reboot now`就好啦。

当然这样还是有点恐怖的，如果真的是硬盘坏了事情可能会麻烦很多，所以做好数据备份也十分重要。现在重要的数据大概同时备份到了OneDrive和NJU自己的SeaFile服务器。过一段时间再想换硬盘的事情啦。当然重新配置环境大概也是十分复杂的事情，所以决定做完毕设先弄一个环境配置的脚本，尽量实现工作环境一键部署吧。