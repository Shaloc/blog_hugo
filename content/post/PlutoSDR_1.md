---
title: "PlutoSDR<0> 环境配置"
date: 2019-01-17T10:31:11+08:00
tags: ["PlutoSDR", "sdr"]
categories: ["sdr"]
author: "Shaloc"
draft: false
---

君软件无线电本当上手(x)

<!--more-->

## PlutoSDR简介
参考AD官网即可。

## 环境
PlutoSDR官方镜像 + Ubuntu 18.04(Parallel Desktop虚拟机)
## 配置方法
### iio-oscilloscope
```bash
# install essential tools
sudo apt-get -y install libglib2.0-dev libgtk2.0-dev libgtkdatabox-dev libmatio-dev libfftw3-dev libxml2 libxml2-dev bison flex libavahi-common-dev libavahi-client-dev libcurl4-openssl-dev libjansson-dev cmake libaio-dev
## build & install libiio
sudo apt-get install libxml2 libxml2-dev bison flex libcdk5-dev cmake libaio-dev libusb-1.0-0-dev libserialport-dev libxml2-dev libavahi-client-dev doxygen graphviz
### enable USB backend
cd /usr/include/linux/usb
sudo rm functionfs.h
sudo wget https://raw.githubusercontent.com/torvalds/linux/master/include/uapi/linux/usb/functionfs.h
### clone & build
cd ~/sdr
git clone https://github.com/analogdevicesinc/libiio.git
cd libiio
cmake .
make all
sudo make install
## build & install libad9361-iio
cd ~/sdr
git clone https://github.com/analogdevicesinc/libad9361-iio.git
cd libad9361-iio
cmake .
make
sudo make install
# build itself
cd ~/sdr
git clone https://github.com/analogdevicesinc/iio-oscilloscope.git
cd iio-oscilloscope
git checkout origin/master
make
sudo make install
```
run:
```bash
osc
```
### GNU Radio
```bash
# after fininshing the installation of osc
# Download and build gr-iio
cd ~/sdr
# finstly, setup the PYTHONPATH (in environment variables)
# we could use gnuradio in python after this step
echo 'PYTHONPATH=/usr/local/lib/python3.6/dist-packages/gnuradio:${PYTHONPATH}' >> ~/.zshrc # I use zsh, change it to your own shell's rc e.g. ~/.bashrc
source ~/.zshrc # load once
git clone https://github.com/analogdevicesinc/gr-iio.git
cd gr-iio
cmake .
make 
sudo make install
cd ..
sudo ldconfig
# finally
sudo cp -r /usr/local/lib/python2.7/dist-packages/gnuradio/iio /usr/lib/python2.7/dist-packages/gnuradio/
# also copy the python 3.6 libs
sudo cp -r /usr/local/lib/python3.6/dist-packages/gnuradio/iio /usr/lib/python3.6/dist-packages/gnuradio/
```
### PlutoSDR_Python
也可以用Python直接控制PultoSDR的官方固件
```bash
cd ~/sdr
cd libiio/bindings/python
sudo python setup.py install
sudo python3 setup.py install
cd ~/sdr
git clone https://github.com/radiosd/rsdLib.git
cd rsdLib
sudo python setup.py install
sudo python3 setup.py install
cd ~/sdr
git clone https://github.com/radiosd/PlutoSdr
cd PlutoSdr
sudo python setup.py install
sudo python3 setup.py install
```
PlutoSDR中的相关测试都可以用，使用这些测试大概可以了解相关接口。

> 注意，因为设置和取值精度的问题，有些测试自己都不能通过。
> 这可能是一些bug

API接口都可以直接使用：
```python
from pluto.pluto_sdr import PlutoSdr
sdr = PlutoSdr()
```

