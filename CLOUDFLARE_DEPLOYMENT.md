# Cloudflare Pages 部署配置指南

## 🚀 快速配置

### 1. 连接 GitHub 仓库

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 进入 **Workers & Pages** > **Pages**
3. 点击 **Create a project** > **Connect to Git**
4. 选择 **GitHub**，授权 Cloudflare 访问你的仓库
5. 选择 `ai-ops` 仓库

### 2. 配置构建设置

**Framework preset**: 选择 `Astro`

**Build configuration**:
```
Production branch: feature/feishu-integration (或 main)
Build command: cd blog && npm install && npm run build
Build output directory: blog/dist
Root directory: (留空，使用项目根目录)
```

**Environment variables** (如果需要):
```
NODE_VERSION=18
```

### 3. 部署

点击 **Save and Deploy**

Cloudflare Pages 会自动：
1. 克隆你的仓库
2. 运行构建命令
3. 部署到 CDN
4. 提供一个 `*.pages.dev` 域名

### 4. 自定义域名（可选）

1. 在 Cloudflare Pages 项目设置中
2. 进入 **Custom domains**
3. 添加你的域名（如 `bangyin.me`）
4. Cloudflare 会自动配置 DNS

---

## 🔧 构建配置详解

### 为什么是 `cd blog && npm install && npm run build`？

因为博客项目在 `ai-ops/blog/` 子目录中，需要：
1. `cd blog` - 进入博客目录
2. `npm install` - 安装依赖
3. `npm run build` - 构建静态文件

### 为什么输出目录是 `blog/dist`？

Astro 默认将构建结果输出到 `dist/` 目录，因为我们在 `blog/` 子目录中构建，所以完整路径是 `blog/dist`。

---

## 🎯 完整工作流

```
本地开发
    ↓
Claude Code 对话
    ↓
/social 提取内容 → content/posts/YYYY-MM-DD-title.md
    ↓
scripts\publish-to-blog.bat → blog/src/content/blog/YYYY-MM-DD-title.md
    ↓
git add . && git commit && git push
    ↓
Cloudflare Pages 自动检测到 push
    ↓
自动构建和部署
    ↓
博客更新 (https://your-site.pages.dev)
```

---

## 🐛 常见问题

### 1. 构建失败：`npm: command not found`

**解决方案**: 在 Cloudflare Pages 设置中添加环境变量：
```
NODE_VERSION=18
```

### 2. 构建失败：`Cannot find module`

**解决方案**: 确保 `package.json` 中的依赖完整，运行：
```bash
cd blog
npm install
git add package-lock.json
git commit -m "chore: update package-lock.json"
git push
```

### 3. 部署成功但页面空白

**解决方案**: 检查 `blog/astro.config.mjs` 中的 `site` 配置：
```javascript
export default defineConfig({
  site: 'https://your-actual-domain.pages.dev',  // 更新为实际域名
  integrations: [mdx(), sitemap()],
});
```

### 4. 样式丢失

**解决方案**: 确保 `blog/public/` 目录中的静态资源已提交到 Git。

---

## 📊 监控部署

### 查看构建日志

1. 进入 Cloudflare Pages 项目
2. 点击 **Deployments**
3. 选择最新的部署
4. 查看 **Build log**

### 回滚部署

如果新部署有问题：
1. 进入 **Deployments**
2. 找到之前成功的部署
3. 点击 **Rollback to this deployment**

---

## 🔄 自动部署触发

Cloudflare Pages 会在以下情况自动部署：

1. **Push 到生产分支** (如 `main` 或 `feature/feishu-integration`)
   - 自动触发生产部署

2. **Push 到其他分支**
   - 自动创建预览部署
   - 提供独立的预览 URL

3. **Pull Request**
   - 自动为 PR 创建预览部署
   - 在 PR 中显示预览链接

---

## 🎨 自定义构建

### 使用不同的 Node 版本

在 Cloudflare Pages 设置中添加：
```
NODE_VERSION=20
```

### 添加构建前脚本

修改 `blog/package.json`：
```json
{
  "scripts": {
    "prebuild": "echo 'Running pre-build tasks...'",
    "build": "astro build",
    "postbuild": "echo 'Build completed!'"
  }
}
```

### 环境变量

在 Cloudflare Pages 设置中添加环境变量，然后在代码中使用：
```javascript
// blog/astro.config.mjs
export default defineConfig({
  site: import.meta.env.SITE_URL || 'https://example.com',
});
```

---

## 📚 相关文档

- [Cloudflare Pages 官方文档](https://developers.cloudflare.com/pages/)
- [Astro 部署指南](https://docs.astro.build/en/guides/deploy/cloudflare/)
- [Cloudflare Pages 构建配置](https://developers.cloudflare.com/pages/configuration/build-configuration/)

---

## ✅ 配置完成检查清单

- [ ] GitHub 仓库已连接到 Cloudflare Pages
- [ ] 构建命令配置正确：`cd blog && npm install && npm run build`
- [ ] 输出目录配置正确：`blog/dist`
- [ ] 首次部署成功
- [ ] 可以访问 `*.pages.dev` 域名
- [ ] 自定义域名已配置（如果需要）
- [ ] 测试了完整的内容发布流程

---

## 🎉 下一步

配置完成后，你就可以：

1. **在 Claude Code 中对话**
2. **使用 `/social` 提取内容**
3. **运行 `scripts\publish-to-blog.bat`**
4. **Git commit + push**
5. **自动部署到 Cloudflare Pages**

完全无痛的对话到博客发布流程！
