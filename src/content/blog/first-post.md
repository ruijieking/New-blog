---
title: 'First post'
description: 'Lorem ipsum dolor sit amet'
pubDate: 'Jul 08 2022'
heroImage: '../../assets/146656214_p0.jpg'
---

#第一篇写tailwind的装在到astro框架的博客步骤#
什么是tailwind？它是预置 CSS 规则库” + “按需编译器，以下是规则配置连接
https://tailwindcss.com/docs/colors?spm=a2ty_o01.29997173.0.0.15ff55fbx84hPu


第一步先先装载依赖和配置
https://www.tailwindcss.cn/docs/guides/astro这个网址是官网步骤，我把它移植下来加上我踩过的坑

npx astro add tailwind
自动安装 tailwindcss + @tailwindcss/vite
自动在 astro.config.mjs 的 vite.plugins 中注册插件

echo '@import "tailwindcss";' > src/styles/global.css
在global.css里面第一行加入tw'@import "tailwindcss"的声明，让解释器运行代码时第一个去解释tw，不要在命令行内写入会映入隐藏字符

@source "../**/*.astro";
让tailwindcsss识别astro

在 src/pages/index.astro 顶部：
---
import '../styles/global.css';
---
启动tw的全局配置，astro不会自动加载

在index.astro或者其他html格式的文件夹内输入以下指令查看tw是否生效
<h1 class="text-blue-600">测试</h1>
如果没有生效查看global.css.bak文件内的、
h1
h2,
h3,
h4,
h5, 
h6 {
  margin: 0 0 0.5rem 0;
  color: rgb(var(--black)); /* ⬅️ 这里强制规定了 h1 必须是黑色！ */
  line-height: 1.2;
}
所以把这行文件删除就行了