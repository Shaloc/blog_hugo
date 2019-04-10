#!/bin/bash

set -ev
export TZ='Asia/Shanghai'

# fetch from remote to save the commit records
git clone -b master git@github.com:Shaloc/shaloc.github.io.git .deploy_git

# copy unchanged files
cd .deploy_git
git checkout master
mv .git/ ../public/
mv CNAME ../public/

# copy files and commit/push
cd ../public
git remote add nju git@git.nju.edu.cn:Shaloc/shaloc.github.io.git
git add .
git commit -m "Site updated: $(date +"%Y-%m-%d %H:%M:%S")"
git push origin master:master --force --quiet
git push nju master:master --force --quiet