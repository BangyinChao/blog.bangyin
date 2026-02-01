# 博客项目快速启动指南

## 🚀 5分钟快速上手

### 第1步：创作内容（2分钟）

在 Claude Code 中：

```
/social

"我想把今天关于 [主题] 的想法写成文章"
```

COO 会：
1. 分析您的想法
2. 提取核心观点
3. 生成 Markdown 文章
4. 保存到 `content/posts/YYYY-MM-DD-title.md`

---

### 第2步：发布到博客（1分钟）

```bash
scripts\publish-to-blog.bat
```

这个脚本会自动：
- 复制文章到 `blog/src/content/blog/`
- 显示复制的文件列表
- 提示下一步操作

---

### 第3步：提交到 Git（2分钟）

```bash
git add .
git commit -m "feat: add new blog post - [文章标题]

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
git push
```

---

### 第4步：等待自动部署（2-5分钟）

Cloudflare Pages 会自动：
1. 检测到 Git push
2. 克隆代码
3. 运行构建
4. 部署到 CDN

---

### 第5步：验证发布（1分钟）

```bash
blog\verify-deployment.bat
```

或者直接访问：https://blog.bangyin.me/

---

## 📊 完整流程可视化

```
┌─────────────────────────────────────────────────────────────┐
│                     博客发布完整流程                          │
└─────────────────────────────────────────────────────────────┘

┌──────────────┐
│ 1. 内容创作  │  在 Claude Code 中
│   /social    │  ↓
└──────────────┘  生成 Markdown 文章
                  ↓
                  保存到 content/posts/

┌──────────────┐
│ 2. 发布文章  │  运行发布脚本
│   publish    │  ↓
└──────────────┘  复制到 blog/src/content/blog/

┌──────────────┐
│ 3. 本地预览  │  可选步骤
│   npm dev    │  ↓
└──────────────┘  http://localhost:4321

┌──────────────┐
│ 4. 提交代码  │  Git add/commit/push
│   git push   │  ↓
└──────────────┘  推送到 GitHub

┌──────────────┐
│ 5. 自动部署  │  Cloudflare Pages
│   Building   │  ↓
└──────────────┘  构建和部署（2-5分钟）

┌──────────────┐
│ 6. 验证发布  │  访问博客
│   verify     │  ↓
└──────────────┘  https://blog.bangyin.me/
```

---

## 🎯 核心命令速查

### 日常使用

| 操作 | 命令 | 说明 |
|------|------|------|
| 创作内容 | `/social` | 在 Claude Code 中 |
| 发布文章 | `scripts\publish-to-blog.bat` | 复制到博客目录 |
| 本地预览 | `cd blog && npm run dev` | http://localhost:4321 |
| 本地构建 | `cd blog && npm run build` | 测试构建 |
| 提交代码 | `git add . && git commit && git push` | 推送到 GitHub |
| 验证部署 | `blog\verify-deployment.bat` | 检查部署状态 |

---

### 故障排查

| 问题 | 命令 | 文档 |
|------|------|------|
| 域名无法访问 | `blog\verify-domain.bat` | `DOMAIN_SETUP_CHECKLIST.md` |
| 部署失败 | 查看 Cloudflare Dashboard | `CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md` |
| 构建失败 | `cd blog && npm run build` | 查看错误日志 |
| Sitemap 错误 | 检查 `astro.config.mjs` | `CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md` |

---

## 📁 项目文件结构

```
ai-ops/
│
├── blog/                              # 博客项目
│   ├── src/
│   │   ├── content/blog/              # ✅ 已发布的文章
│   │   ├── components/                # Astro 组件
│   │   ├── layouts/                   # 页面布局
│   │   └── pages/                     # 站点页面
│   │
│   ├── public/                        # 静态资源
│   ├── dist/                          # 构建输出（自动生成）
│   │
│   ├── astro.config.mjs               # ⚙️ Astro 配置
│   ├── package.json                   # 依赖管理
│   │
│   ├── README.md                      # 📖 使用指南
│   ├── COMPLETE-WORKFLOW.md           # 📖 完整流程
│   ├── CLOUDFLARE_DEPLOYMENT.md       # 📖 部署指南
│   ├── CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md  # 📖 故障排查
│   ├── CUSTOM_DOMAIN_SETUP.md         # 📖 域名配置
│   ├── DOMAIN_SETUP_CHECKLIST.md      # 📖 配置检查清单
│   │
│   ├── verify-deployment.bat          # 🔧 验证脚本
│   └── verify-domain.bat              # 🔧 域名验证
│
├── content/posts/                     # 📝 内容暂存区
│   └── YYYY-MM-DD-title.md            # 待发布的文章
│
└── scripts/
    └── publish-to-blog.bat            # 🚀 发布脚本
```

---

## 🔄 工作流程详解

### 流程1：快速发布（10分钟）

适用于：日常发布单篇文章

```bash
# 1. 创作（2分钟）
/social "我想写一篇关于 XXX 的文章"

# 2. 发布（1分钟）
scripts\publish-to-blog.bat

# 3. 提交（2分钟）
git add .
git commit -m "feat: add new blog post"
git push

# 4. 等待（2-5分钟）
# Cloudflare Pages 自动部署

# 5. 验证（1分钟）
blog\verify-deployment.bat
```

---

### 流程2：批量发布（15分钟）

适用于：一次发布多篇文章

```bash
# 1. 创作多篇文章（10分钟）
# 在 Claude Code 中多次使用 /social

# 2. 检查文章列表
ls content\posts\

# 3. 批量发布
scripts\publish-to-blog.bat

# 4. 本地预览（可选）
cd blog
npm run dev
# 访问 http://localhost:4321

# 5. 提交
git add .
git commit -m "feat: add multiple blog posts

- 文章1
- 文章2
- 文章3

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
git push

# 6. 验证
blog\verify-deployment.bat
```

---

### 流程3：修改已发布文章（5分钟）

适用于：修复错误或更新内容

```bash
# 1. 直接编辑文章
# 位置：blog/src/content/blog/YYYY-MM-DD-title.md

# 2. 本地预览（可选）
cd blog
npm run dev

# 3. 提交
git add blog/src/content/blog/YYYY-MM-DD-title.md
git commit -m "fix: update blog post - [标题]

- 修复：[具体修改]

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
git push

# 4. 验证
blog\verify-deployment.bat
```

---

## 💡 最佳实践

### 内容创作

**✅ 推荐做法**：
- 使用 `/social` Skill 创作内容
- 保持文章结构清晰
- 添加有价值的案例和数据
- 使用清晰的标题层级

**❌ 避免做法**：
- 不要泄露商业秘密
- 不要使用过于技术化的语言
- 不要写过长的段落
- 不要忘记添加 frontmatter

---

### 文件命名

**✅ 推荐格式**：
```
YYYY-MM-DD-title-in-english.md

示例：
2026-01-30-why-not-use-notion-for-blog.md
2026-01-30-astro-blog-complete-guide.md
```

**❌ 避免格式**：
```
title.md                    # 缺少日期
2026-1-30-title.md          # 日期格式错误
2026-01-30-标题.md          # 使用中文
2026-01-30 title.md         # 包含空格
```

---

### Git 提交

**✅ 推荐格式**：
```bash
git commit -m "feat: add blog post about [主题]

- 添加 [主题] 相关文章
- 字数：约 [字数] 字
- 包含：[关键内容]

Co-Authored-By: Claude Sonnet 4.5 <noreply@anthropic.com>"
```

**❌ 避免格式**：
```bash
git commit -m "update"           # 太简单
git commit -m "添加文章"         # 使用中文
git commit -m "fix bug"          # 不清晰
```

---

## 🔧 常见问题

### Q1: 如何添加图片？

**方法1：使用占位图（推荐）**
```yaml
---
heroImage: "../../assets/blog-placeholder-1.jpg"
---
```

**方法2：添加自定义图片**
1. 将图片放到 `blog/src/assets/`
2. 在 frontmatter 中引用：
```yaml
---
heroImage: "../../assets/my-image.jpg"
---
```

---

### Q2: 如何修改博客样式？

**位置**：
- 全局样式：`blog/src/styles/global.css`
- 布局样式：`blog/src/layouts/BlogPost.astro`
- 组件样式：`blog/src/components/`

**修改后**：
```bash
cd blog
npm run dev  # 预览
git add .
git commit -m "style: update blog styles"
git push
```

---

### Q3: 如何添加评论系统？

推荐使用 Giscus（基于 GitHub Discussions）：

1. 访问 https://giscus.app/
2. 配置您的仓库
3. 获取嵌入代码
4. 添加到 `blog/src/layouts/BlogPost.astro`

---

### Q4: 如何查看访问统计？

推荐使用 Cloudflare Web Analytics（免费）：

1. 在 Cloudflare Dashboard 中启用 Web Analytics
2. 获取跟踪代码
3. 添加到 `blog/src/layouts/BlogPost.astro`

---

## 📞 获取帮助

### 文档资源

- **完整流程**: `blog/COMPLETE-WORKFLOW.md`
- **使用指南**: `blog/README.md`
- **部署指南**: `blog/CLOUDFLARE_DEPLOYMENT.md`
- **故障排查**: `blog/CLOUDFLARE_DEPLOYMENT_TROUBLESHOOTING.md`
- **域名配置**: `blog/CUSTOM_DOMAIN_SETUP.md`

### 在线资源

- **Astro 文档**: https://docs.astro.build
- **Cloudflare Pages 文档**: https://developers.cloudflare.com/pages/
- **Markdown 指南**: https://www.markdownguide.org/

### 联系 COO

在 Claude Code 中：
```
"博客项目遇到问题：[描述问题]"
```

COO 会帮您：
1. 诊断问题
2. 提供解决方案
3. 更新文档

---

## ✅ 检查清单

### 首次使用

- [ ] 阅读 `blog/README.md`
- [ ] 阅读 `blog/COMPLETE-WORKFLOW.md`
- [ ] 测试本地开发：`cd blog && npm run dev`
- [ ] 测试发布脚本：`scripts\publish-to-blog.bat`
- [ ] 验证域名访问：https://blog.bangyin.me/

### 每次发布

- [ ] 内容已创作完成
- [ ] Frontmatter 格式正确
- [ ] 没有商业秘密泄露
- [ ] 运行发布脚本
- [ ] 提交到 Git
- [ ] 验证部署成功

### 定期维护

- [ ] 检查 Cloudflare Pages 部署状态
- [ ] 更新依赖：`cd blog && npm update`
- [ ] 检查 sitemap：https://blog.bangyin.me/sitemap-0.xml
- [ ] 检查 RSS：https://blog.bangyin.me/rss.xml

---

**最后更新**: 2026-01-30
**版本**: 1.0.0
**维护者**: COO (Claude)
