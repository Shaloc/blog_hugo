#!/bin/bash

set -ev
export TZ='Asia/Shanghai'

git clone -b master https://github.com/Shaloc/shaloc.github.io .deploy_git
cd .deploy_git
git checkout master
mv .git/ ../public/
cd ../public
git add -A
git commit -m "Site updated: $(date +"%Y-%m-%d %H:%M:%S")"
git push "https://github.com/Shaloc/shaloc.github.io" master:master --force --quiet