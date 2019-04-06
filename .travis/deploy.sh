#!/bin/bash

set -ev
export TZ='Asia/Shanghai'
G='f18a2569fdcd2e4bb788b79fc94d7d650d6e6885'

git clone -b master https://github.com/Shaloc/shaloc.github.io .deploy_git
cd .deploy_git
git checkout master
mv .git/ ../public/
cd ../public
git add -A
git commit -m "Site updated: $(date +"%Y-%m-%d %H:%M:%S")"
git push "https://${G}@github.com/Shaloc/shaloc.github.io" master:master --force --quiet