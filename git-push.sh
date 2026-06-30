#!/bin/bash

# 从环境变量读取凭证，不硬编码在脚本中
# 这个是失败的自动上传脚本
if [ -z "$GITHUB_TOKEN" ]; then
    echo "错误: 请先设置 GITHUB_TOKEN 环境变量"
    echo "运行: export GITHUB_TOKEN=ghp_xxxxxxxxxxxx"
    exit 1
fi

git add . && \
git commit -m "auto: $(date +%Y-%m-%d_%H:%M:%S)" && \
GIT_ASKPASS="echo $GITHUB_TOKEN" git push
