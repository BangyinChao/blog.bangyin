# Blog Directory - Wandering Wasp

This directory contains the **wandering-wasp** Astro blog, integrated into the ai-ops project for unified management.

## 📁 Structure

```
blog/
├── src/
│   ├── content/
│   │   └── blog/           # Blog articles (Markdown)
│   ├── components/         # Astro components
│   ├── layouts/            # Page layouts
│   └── pages/              # Site pages
├── public/                 # Static assets
├── astro.config.mjs        # Astro configuration
└── package.json            # Dependencies
```

## 🚀 Quick Start

### Development

```bash
cd blog
npm install
npm run dev
```

Visit: http://localhost:4321

### Build for Production

```bash
cd blog
npm run build
```

Output: `blog/dist/`

### Preview Production Build

```bash
cd blog
npm run preview
```

## 📝 Content Workflow

### 1. Extract Content from Claude Code Conversations

Use the `social-media-assistant` Skill:

```bash
# In ai-ops root directory
/social

# Then tell the Skill:
"我想把今天的对话提取成博客文章"
```

The Skill will:
- Extract core insights from conversation
- Remove conversational traces
- Reorganize structure
- Generate Markdown with frontmatter
- Save to `content/posts/YYYY-MM-DD-title.md`

### 2. Publish to Blog

Run the publish script:

```bash
# Windows
scripts\publish-to-blog.bat

# Linux/Mac
bash scripts/publish-to-blog.sh
```

This copies content from `content/posts/` to `blog/src/content/blog/`

### 3. Preview and Deploy

```bash
cd blog
npm run dev      # Preview locally
npm run build    # Build for production
```

## 🌐 Deployment

### Option 1: Cloudflare Pages (Recommended)

1. **Connect Repository**
   - Go to Cloudflare Pages dashboard
   - Connect your GitHub repository
   - Select `ai-ops` repository

2. **Configure Build Settings**
   - Build command: `cd blog && npm install && npm run build`
   - Build output directory: `blog/dist`
   - Root directory: `/` (project root)

3. **Deploy**
   - Push to GitHub
   - Cloudflare Pages auto-deploys

### Option 2: Vercel

1. **Import Project**
   - Go to Vercel dashboard
   - Import `ai-ops` repository

2. **Configure**
   - Framework: Astro
   - Root directory: `blog`
   - Build command: `npm run build`
   - Output directory: `dist`

3. **Deploy**
   - Push to GitHub
   - Vercel auto-deploys

### Option 3: Netlify

1. **New Site from Git**
   - Connect GitHub repository

2. **Build Settings**
   - Base directory: `blog`
   - Build command: `npm run build`
   - Publish directory: `blog/dist`

3. **Deploy**
   - Push to GitHub
   - Netlify auto-deploys

## 📋 Frontmatter Format

All blog articles should include frontmatter:

```yaml
---
title: "文章标题"
description: "文章摘要"
pubDate: "YYYY-MM-DD"
heroImage: "../../assets/blog-placeholder-1.jpg"  # Optional
tags: [标签1, 标签2]  # Optional
---
```

## 🔧 Configuration

### Update Site URL

Edit `blog/astro.config.mjs`:

```javascript
export default defineConfig({
  site: 'https://your-domain.com',  // Update this
  integrations: [mdx(), sitemap()],
});
```

### Customize Theme

- **Colors**: Edit `blog/src/styles/global.css`
- **Layout**: Edit `blog/src/layouts/BlogPost.astro`
- **Header/Footer**: Edit `blog/src/components/Header.astro` and `Footer.astro`

## 📚 Related Documentation

- **Content Extraction**: `.claude/skills/social-media-assistant/`
- **Templates**: `.claude/skills/social-media-assistant/content-templates.md`
- **Workflow**: `.claude/skills/social-media-assistant/handbook.md`
- **Astro Docs**: https://docs.astro.build

## 🎯 Complete Workflow Example

```bash
# 1. Have a conversation in Claude Code
# (Discuss technical topics, methodologies, insights)

# 2. Extract content
/social
"我想把今天关于 Notion vs 静态博客的讨论提取成博客文章"

# 3. Publish to blog
scripts\publish-to-blog.bat

# 4. Preview
cd blog
npm run dev

# 5. Commit and push
git add .
git commit -m "feat: add new blog post about Notion vs Static Blog"
git push

# 6. Auto-deploy (Cloudflare Pages/Vercel/Netlify)
```

## 🔄 Keeping Blog Updated

### Update Dependencies

```bash
cd blog
npm update
```

### Update Astro

```bash
cd blog
npm install astro@latest
```

## 🐛 Troubleshooting

### Build Fails

```bash
cd blog
rm -rf node_modules package-lock.json
npm install
npm run build
```

### Port Already in Use

```bash
cd blog
npm run dev -- --port 3000
```

### Content Not Showing

1. Check frontmatter format
2. Verify file is in `blog/src/content/blog/`
3. Restart dev server

## 📞 Support

- **Astro Discord**: https://astro.build/chat
- **Astro Docs**: https://docs.astro.build
- **Project Issues**: Check `ai-ops` repository issues

---

## Original Astro Blog Template

Features:

- ✅ Minimal styling (make it your own!)
- ✅ 100/100 Lighthouse performance
- ✅ SEO-friendly with canonical URLs and OpenGraph data
- ✅ Sitemap support
- ✅ RSS Feed support
- ✅ Markdown & MDX support

Credit: This theme is based off of the lovely [Bear Blog](https://github.com/HermanMartinus/bearblog/).
