#!/bin/sh

set -ev
wget -c http://q1.qlogo.cn/g\?b\=qq\&nk\=$(cat ./.travis/get-favicon)\&s\=3 -O ./static/favicon.ico
ls
ls ./static
