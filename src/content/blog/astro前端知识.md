---
title: 'Astro 前端知识笔记'
description: '记录 Astro 的基本原理、组件、路由和样式配置。'
pubDate: 'Jul 07 2026'
---

# Astro 前端知识笔记

## Astro 是什么

Astro 是一个 **SSG（静态站点生成器）**。当你运行 `npm run dev` 启动开发服务器时，Astro 会将内部的模板代码转换为浏览器可以执行的 Web 代码。

形象地说，Astro 在服务端充当了一个 **"编码器翻译官"** 的角色——它不是在用户点击跳转时才进行转码，而是在构建时就已经将页面转换成了 HTML 格式的静态文件。浏览器直接读取这些文件即可渲染界面，不需要任何后端 CPU 计算（**零运行时开销**）。这个转编译过程由 **Vite**（构建工具）完成。

## @import 指令

`@import` 是调用配置文件的指令，用于**引入**其他文件夹中的代码。

## 组件模块（Components）

组件是 Astro 中非常好用的功能。你可以自定义一个模块名字，在里面写好 CSS 样式代码，然后使用 `@import`、`from` 等语法进行调用。

**一个组件就是一个自定义的 HTML 标签。** 原本 HTML 只有 `<div>`、`<h1>` 等原生标签，但通过 Astro，你可以创建属于自己的标签，例如：

```astro
<GeekTicker />
```

## 页面与路由

`src/pages/` 目录下的文件结构决定了网站的路由映射地址：

| 文件路径 | 映射地址 |
|---|---|
| `src/pages/index.astro` | `http://你的域名/` |
| `src/pages/about.astro` | `http://你的域名/about` |
| `src/pages/blog/post1.astro` | `http://你的域名/blog/post1` |

## 全局样式

`src/styles/global.css` 是用来配置全站 CSS 样式的文件。你可以引入自定义的 CSS 样式，并覆盖浏览器默认样式。

```css
@import "tailwindcss";
```
在 Tailwind v4 中，@import "tailwindcss" 实际上是一个 “引擎启动开关（Macro）”。Vite 编译器在读取 CSS 文件时，会像扫描雷达一样寻找这个特定的字符串。如果它前面有注释、空行或其他代码，编译器就会认为“这个文件没有安装 Tailwind 引擎”，从而直接罢工，什么都不编译。所以，它必须在绝对的第一行作为“启动信号”被识别。
> ⚠️ **注意：** `@import "tailwindcss";` 必须放在 `global.css` 的**最上**面，这样才能正确应用到整个项目。文件第一行的优先级最高。
