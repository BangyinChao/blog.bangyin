# 博客项目完整流程指南

## 📋 目录

1. [项目概览](#项目概览)
2. [技术架构](#技术架构)
3. [完整工作流程](#完整工作流程)
4. [日常使用流程](#日常使用流程)
5. [故障排查](#故障排查)
6. [最佳实践](#最佳实践)

---

## 项目概览

### 基本信息

- **项目名称**: Wandering Wasp (邦印博客)
- **技术栈**: Astro + Cloudflare Pages
- **域名**: https://blog.bangyin.me/
- **备用域名**: https://bangyin-me.pages.dev/
- **代码仓库**: GitHub - ai-ops/blog/
- **部署平台**: Cloudflare Pages

### 项目特点

- ✅ **极快的加载速度**: < 0.5 秒
- ✅ **SEO 友好**: 完整的 sitemap 和 RSS
- ✅ **完全可控**: 样式、功能、数据都在您手里
- ✅ **成本低**: 几乎免费（只需域名费用）
- ✅ **自动部署**: Git push 自动触发部署

---

## 技术架构

### 目录结构

```
ai-ops/
├── blog/                          # 博客子项目
│   ├── src/
│   │   ├── content/blog/          # 博客文章（Markdown）
│   │   ├── components/            # Astro 组件
│   │   ├── layouts/               # 页面布局
│   │   └── pages/                 # 站点页面
│   ├── public/                    # 静态资源
│   ├── dist/                      # 构建输出（自动生成）
│   ├── astro.config.mjs           # Astro 配置
│   ├── package.json               # 依赖管理
│   └── README.md                  # 使用文档
├── content/posts/                 # 内容暂存区
└── scripts/
    └── publish-to-blog.bat        # 发布脚本
```

### 技术选型

**静态博客生成器**: Astro
- 极快的加载速度
- 默认零 JavaScript
- Markdown 原生支持
- SEO 友好

**部署平台**: Cloudflare Pages
- 完全免费
- 自动部署
- 全球 CDN 加速
- 自动 SSL 证书

---

## 完整工作流程

### 阶段1：内容创作（在 Claude Code 中）

```
董事长提供想法/对话
    ↓
COO 分析和整理
    ↓
调用 /social Skill
    ↓
生成 Markdown 文章（带 frontmatter）
    ↓
保存到 content/posts/YYYY-MM-DD-title.md
```

**示例**：
```bash
# 在 Claude Code 中
/social

# 然后说：
"我想把今天关于博客搭建的讨论提取成文章"
```

---

### 阶段2：内容审核和修改

**位置**: `content/posts/YYYY-MM-DD-title.md`

**检查清单**：
- [ ] 标题是否清晰
- [ ] frontmatter 是否完整
- [ ] 内容是否有价值
- [ ] 是否有商业秘密泄露
- [ ] 语言风格是否符合

**Frontmatter 格式**：
```yaml
---
title: "文章标题"
description: "文章摘要（150字以内）"
pubDate: "YYYY-MM-DD"
author: "Bangyin"
tags: [标签1, 标签2, 标签3]
heroImage: "../../assets/blog-placeholder-1.jpg"  # 可选
---
```

---

### 阶段3：发布到博客

**方法1：使用发布脚本（推荐）**

```bash
# Windows
scripts\publish-to-blog.bat

# 这个脚本会：
# 1. 复制 content/posts/*.md 到 blog/src/content/blog/
# 2. 显示复制的文件列表
# 3. 提示下一步操作
```

**方法2：手动复制**

```bash
# 复制单个文件
copy content\posts\2026-01-30-title.md blog\src\content\blog\

# 或者复制所有文件
copy content\posts\*.md blog\src\content\blog\
```

---

### 阶段4：本地预览（可选）

```bash
# 进入博客目录
cd blog

# 安装依赖（首次或依赖更新时）
npm install

# 启动开发服务器
npm run dev

# 访问 http://localhost:4321
```

**检查内容**：
- [ ] 文章是否显示在首页
- [ ] 文章页面是否正常
- [ ] 样式是否正确
- [ ] 图片是否加载

---

### 阶段5：提交到 Git

```bash
# 检查变更
git status

# 添加变更
git add blog/src/content/blog/
git add content/posts/

# 提交
git commit -m "feat: add new blog post - [文章标题]

- 添加新文章：[文章标题]
- 主题：[主题]
- 字数：约 [字数] 字

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"

# 推送到 GitHub
git push origin HEAD:master
```

---

### 阶段6：自动部署

**Cloudflare Pages 自动流程**：

```
GitHub 收到 push
    ↓
Cloudflare Pages 检测到变更
    ↓
自动触发构建
    ├─ 1. 克隆代码
    ├─ 2. cd blog && npm install
    ├─ 3. npm run build
    └─ 4. 部署到 CDN
    ↓
部署完成（2-5 分钟）
    ↓
博客自动更新
```

**监控部署**：
1. 访问 https://dash.cloudflare.com/
2. Workers & Pages → 您的项目 → Deployments
3. 查看最新部署状态

---

### 阶段7：验证发布

**自动验证**：
```bash
# 运行验证脚本
blog\verify-deployment.bat
```

**手动验证**：
1. 访问 https://blog.bangyin.me/
2. 检查首页是否显示新文章
3. 点击文章链接，检查内容是否正确
4. 检查 sitemap: https://blog.bangyin.me/sitemap-0.xml

---

## 日常使用流程

### 快速发布流程（10分钟）

```bash
# 1. 在 Claude Code 中创作内容（5分钟）
/social
"我想把今天的想法写成文章"

# 2. 发布到博客（1分钟）
scripts\publish-to-blog.bat

# 3. 提交到 Git（2分钟）
git add .
git commit -m "feat: add new blog post"
git push

# 4. 等待自动部署（2-5分钟）
# 访问 https://blog.bangyin.me/ 验证
```

---

### 批量发布流程

如果有多篇文章需要发布：

```bash
# 1. 确保所有文章都在 content/posts/
ls content/posts/

# 2. 批量发布
scripts\publish-to-blog.bat

# 3. 预览（可选）
cd blog
npm run dev

# 4. 提交
git add .
git commit -m "feat: add multiple blog posts

- 文章1标题
- 文章2标题
- 文章3标题

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
git push
```

---

### 修改已发布文章

```bash
# 1. 直接编辑博客文件
# 位置：blog/src/content/blog/YYYY-MM-DD-title.md

# 2. 本地预览（可选）
cd blog
npm run dev

# 3. 提交变更
git add blog/src/content/blog/YYYY-MM-DD-title.md
git commit -m "fix: update blog post - [文章标题]

- 修复：[修复内容]

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
git push
```

---

## 故障排查

### 问题1：博客无法访问

**症状**：https://blog.bangyin.me/ 无法访问

**诊断**：
```bash
# 检查 DNS
nslookup blog.bangyin.me

# 检查 HTTPS
curl -I https://blog.bangyin.me/
```

**解决方案**：
1. 检查 Cloudflare Pages 部署状态
2. 检查自定义域名配置
3. 清除 DNS 缓存：`ipconfig /flushdns`

**详细指南**: `blog/DOMAIN_SETUP_CHECKLIST.md`

---

### 问题2：新文章没有显示

**症状**：推送代码后，新文章没有显示在博客上

**诊断**：
```bash
# 1. 检查文件是否在正确位置
ls blog/src/content/blog/

# 2. 检查 frontmatter 格式
cat blog/src/content/blog/YYYY-MM-DD-title.md | head -10

# 3. 检查部署状态
# 访问 Cloudflare Dashboard
```

**解决方案**：
1. 确认文件在 `blog/src/content/blog/` 目录
2. 确认 frontmatter 格式正确
3. 确认 Cloudflare Pages 部署成功
4. 清除浏览器缓存

---

### 问题3：构建失败

**症状**：Cloudflare Pages 显示构建失败

**诊断**：
```bash
# 本地测试构建
cd blog
npm run build
```

**常见错误**：

**错误1：依赖安装失败**
```
npm install failed
```
解决：检查 `package.json` 和 `package-lock.json`

**错误2：构建命令失败**
```
npm run build failed
```
解决：本地运行 `npm run build` 查看详细错误

**错误3：文件引用错误**
```
Could not resolve "xxx" from "yyy"
```
解决：检查文件路径和引用

**详细指南**: `blog/CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md`

---

### 问题4：Sitemap URL 不正确

**症状**：sitemap 中的 URL 是 `https://example.com/` 而不是 `https://blog.bangyin.me/`

**诊断**：
```bash
# 检查配置
cat blog/astro.config.mjs

# 检查线上 sitemap
curl -s https://blog.bangyin.me/sitemap-0.xml | grep "<loc>"

# 检查本地构建
cd blog
npm run build
cat dist/sitemap-0.xml | grep "<loc>"
```

**解决方案**：
1. 确认 `blog/astro.config.mjs` 中 `site` 配置正确
2. 在 Cloudflare Pages 中手动触发部署
3. 清除 Cloudflare 缓存

**详细指南**: `blog/CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md`

---

## 最佳实践

### 内容创作

**1. 文章命名规范**
```
YYYY-MM-DD-title-in-english.md

示例：
2026-01-30-why-not-use-notion-for-blog.md
2026-01-30-astro-blog-setup-guide.md
```

**2. Frontmatter 最佳实践**
```yaml
---
title: "清晰、简洁的标题（< 60 字符）"
description: "吸引人的摘要（100-150 字符）"
pubDate: "YYYY-MM-DD"
author: "Bangyin"
tags: [主标签, 次标签, 相关标签]  # 3-5 个标签
heroImage: "../../assets/blog-placeholder-1.jpg"  # 可选
---
```

**3. 内容结构**
```markdown
## 引言
- 吸引读者注意
- 说明文章价值

## 核心内容
- 清晰的标题层级
- 使用列表和代码块
- 添加示例和案例

## 总结
- 回顾要点
- 提供行动建议

## 相关资源
- 相关链接
- 延伸阅读
```

---

### Git 提交规范

**Commit Message 格式**：
```
<type>: <subject>

<body>

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>
```

**Type 类型**：
- `feat`: 新文章
- `fix`: 修复文章错误
- `docs`: 文档更新
- `style`: 样式调整
- `refactor`: 重构
- `chore`: 其他变更

**示例**：
```bash
git commit -m "feat: add blog post about Astro setup

- 添加 Astro 博客搭建指南
- 包含完整的配置步骤
- 字数：约 3000 字

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

---

### 部署最佳实践

**1. 部署前检查**
- [ ] 本地构建成功
- [ ] 文章内容无误
- [ ] frontmatter 格式正确
- [ ] 没有商业秘密泄露

**2. 部署后验证**
- [ ] 博客首页显示新文章
- [ ] 文章页面正常
- [ ] sitemap 已更新
- [ ] RSS feed 已更新

**3. 监控部署**
- 在 Cloudflare Dashboard 中查看部署状态
- 如果构建失败，立即查看日志
- 如果部署成功，等待 1-2 分钟后验证

---

### SEO 优化

**1. 标题优化**
- 包含关键词
- 清晰、简洁（< 60 字符）
- 吸引点击

**2. 描述优化**
- 包含关键词
- 说明文章价值
- 100-150 字符

**3. 标签优化**
- 3-5 个相关标签
- 使用常见关键词
- 保持一致性

**4. 内容优化**
- 使用清晰的标题层级
- 添加内部链接
- 添加外部权威链接
- 使用语义化 HTML

---

## 快速参考

### 常用命令

```bash
# 本地开发
cd blog && npm run dev

# 本地构建
cd blog && npm run build

# 发布文章
scripts\publish-to-blog.bat

# 验证部署
blog\verify-deployment.bat

# 提交变更
git add . && git commit -m "feat: xxx" && git push
```

---

### 常用链接

- **博客首页**: https://blog.bangyin.me/
- **Cloudflare Dashboard**: https://dash.cloudflare.com/
- **GitHub 仓库**: https://github.com/BangyinChao/ai-ops
- **Astro 文档**: https://docs.astro.build

---

### 相关文档

- `blog/README.md` - 博客使用指南
- `blog/CLOUDFLARE_DEPLOYMENT.md` - 部署配置指南
- `blog/CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md` - 故障排查指南
- `blog/CUSTOM_DOMAIN_SETUP.md` - 自定义域名配置
- `blog/DOMAIN_SETUP_CHECKLIST.md` - 域名配置检查清单

---

## 总结

### 核心流程

```
内容创作（Claude Code）
    ↓
发布到博客（scripts\publish-to-blog.bat）
    ↓
提交到 Git（git add/commit/push）
    ↓
自动部署（Cloudflare Pages）
    ↓
验证发布（blog\verify-deployment.bat）
```

### 关键要点

1. **内容为王**: 专注于创作有价值的内容
2. **流程简单**: 整个流程不超过 10 分钟
3. **自动化**: Git push 自动触发部署
4. **可控性**: 完全掌控代码和数据
5. **稳定性**: 静态博客，长期稳定

---

**最后更新**: 2026-01-30
**版本**: 1.0.0
**维护者**: COO (Claude)
