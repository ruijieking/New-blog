#!/bin/bash

# 从环境变量读取凭证，不硬编码在脚本中
# 这个是失败的自动上传脚本

git add . && \
git commit && \
git push
