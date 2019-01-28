#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# 如果发布到 https://<USERNAME>.github.io
echo "环境变量"
echo ${ACCESS_TOKEN}
git push -f https://0f85e4556527cc6b37ee7f97657ed21bcaa34a6c@github.com/dianjiangtan/dianjiangtan.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:diangjiangtan/vue-press.git dev:dev

cd -