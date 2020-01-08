#!/bin/sh

set -ev
rm ./static/favicon.ico
wget -c http://q1.qlogo.cn/g\?b\=qq\&nk\=$(cat ./.travis/get-favicon)\&s\=3 -O ./static/favicon.ico > /dev/null
