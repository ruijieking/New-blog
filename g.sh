#!/bin/bash

# 从环境变量读取凭证，不硬编码在脚本中
# 自动上传git的基础脚本

git add . && \
git commit -m "v0.11这个版本去除了不必要的声明和依赖做了轻量优化" && \
git push origin main
