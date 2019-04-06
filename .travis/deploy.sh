#!/bin/bash

set -ev
export TZ='Asia/Shanghai'
G='e3ff32d5bd875634126822a70e07d95e9fe38e59'

git clone -b master https://github.com/Shaloc/shaloc.github.io .deploy_git
cd .deploy_git
git checkout master
mv .git/ ../public/
cd ../public
git add -A
git commit -m "Site updated: $(date +"%Y-%m-%d %H:%M:%S")"
git push "https://Shaloc:${G}@github.com/Shaloc/shaloc.github.io" master:master --force --quiet