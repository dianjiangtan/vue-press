#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
yarn docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

git config --global --replace-all user.name $GH_NAME
git config --global --replace-all user.emial $GH_EMAIL

# 如果发布到 https://<USERNAME>.github.io
git push 'https://${GH_TOKEN}@github.com/dianjiangtan/dianjiangtan.github.io.git' master

cd -