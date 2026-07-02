---
title: '第一篇：把 Tailwind 装进 Astro'
description: '记录我在 Astro 项目中接入 Tailwind 的步骤，以及一些踩过的坑。'
pubDate: 'Jul 07 2026'
heroImage: '../../assets/146656214_p0.jpg'
---



Tailwind CSS 是一个很常用的实用优先 CSS 工具库。它的特点是：

- 预置了大量可直接使用的样式类
- 配合构建工具可以按需生成样式
- 非常适合快速搭建现代化页面

下面是我在 Astro 项目里接入 Tailwind 的完整步骤，坑已经被优化。

## 1. 安装依赖

官方文档地址：

- [Tailwind CSS 官方文档](https://tailwindcss.com/docs/colors)
- [Astro + Tailwind 集成指南](https://www.tailwindcss.cn/docs/guides/astro)

我实际使用的命令是：

```bash
npx astro add tailwind
```

这条命令会自动完成以下事情：

- 安装 `tailwindcss` 和 `@tailwindcss/vite`
- 在 `astro.config.mjs` 中注册 Vite 插件

## 2. 创建全局样式文件

在项目中创建或更新 `src/styles/global.css`，并写入：

```css
@import "tailwindcss";
```

注意：这行代码要放在文件顶部，避免出现隐藏字符或编码问题。

## 3. 配置 Tailwind 识别 Astro 文件

如果你使用的是 **Tailwind v4**，可以在 `src/styles/global.css` 中添加下面这一行：

```css
@source "../**/*.astro";
```
因为我们的 global.css 位于 src/styles/ 目录下，需要先用 ../ 向上跳出一层回到 src/ 目录，然后才能递归扫描 pages 和 components 里的所有 .astro 文件。

如果你使用的是 **Tailwind v3**，则需要在 `tailwind.config.js` 的 `content` 字段中加入：

```js
content: ['./src/**/*.astro'],
```

不确认版本时，可查看 `package.json` 中 `tailwindcss` 的版本号。

## 4. 在页面中引入全局样式

在 `src/pages/index.astro` 或其他页面文件顶部引入：

```astro
---
import '../styles/global.css';
---
```

这一步可以让 Tailwind 的全局配置在 Astro 中正确生效。

## 5. 测试是否生效

在页面中加入一个简单测试：

```html
<h1 class="text-blue-600">测试</h1>
```

如果页面没有显示出蓝色样式，可以检查一下 `src/styles/global.css` 里是否还保留了旧样式，例如：

```css
h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 0 0 0.5rem 0;
  color: rgb(var(--black));
  line-height: 1.2;
}
```

如果有这段代码，直接删除  color: rgb(var(--black));即可。否则，旧样式可能会覆盖 Tailwind 的效果。

## 6. 小结

这套流程整体来说并不复杂，关键点就是：

- 确保 Tailwind 插件已经正确注册
- 全局样式文件已经被正确引入
- 删除旧的冲突样式，避免覆盖新样式

如果你也在用 Astro 搭建个人博客，这种方式非常适合快速上手样式开发。

*（踩坑踩出来的经验，希望对你有帮助！）*