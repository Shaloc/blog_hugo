---
title: "PlutoSDR<1> FM电台的GNU Radio实现(1)"
date: 2019-01-17T14:24:18+08:00
tags: ["PlutoSDR", "sdr"]
categories: ["sdr"]
author: "Shaloc"
draft: false
---

<link rel="stylesheet" href="static/custom_style.css">

<div class="box box-alert">
<i class="icon-alert"> </i>
本项目<strong>已经弃用</strong>, 这个破玩意的天线根本不支持FM波段
</div>

传输音频是SDR上手的不错的方法。使用GNU Radio搭设电台的发送模块和接收模块以传输音频。
## 准备工作
一般来说FM电台的频率大概在70MHz~130MHz间，然而这枚芯片上的AD9363仅支持325-3800MHz@20MHz BW，然而根据[官网](https://wiki.analog.com/university/tools/pluto/users/customizing)所述，它是可以被Update到AD3964的70-6000MHz@56MHz BW的，只需要在PlutoSDR的U-Boot中设置两个环境变量：
```bash
fw_setenv attr_name compatible
fw_setenv attr_val ad9364
```
然后重启机器即可。

前后两种参数如下表所示：

|RF Transceiver|LO tuning range|Bandwidth|
|:--:|:--:|:--:|
|AD9363|325-3800MHz|20MHz|
|AD9364|70-6000MHz|56MHz|

虽然官网上说只有旧机器才有可以升级的芯片，但是似乎我拿到的这两台都可以进行这样的操作。这可能是AD9363是没有通过某个测试的AD9364的芯片的原因。即没拿到许可，就贴了一个标称值更低的牌子先拿出来卖。
## 发送模块
发送模块由一个WAV采样模块（双通道）、加法器模块、窄带调频模块(NBFM)、重采样模块和PlutoSDR Sink(发送)模块构成。
音频采样率为44.1kHz
//待补完
