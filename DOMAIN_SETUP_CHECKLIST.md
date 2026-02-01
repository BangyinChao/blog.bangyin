# 博客域名配置诊断清单

## 📋 检查步骤

### 第1步：检查 Cloudflare Pages 部署状态

**位置**：https://dash.cloudflare.com/ → Workers & Pages → [您的项目] → Deployments

**检查项**：
- [ ] 最新的部署状态是什么？
  - 🟡 Building（正在构建）→ 等待 2-5 分钟
  - 🟢 Success（构建成功）→ 继续下一步
  - 🔴 Failed（构建失败）→ 查看构建日志

- [ ] 最新的 commit 是什么？
  - 应该是：`b91ad424` - "chore: trigger Cloudflare Pages deployment"
  - 或者：`cb2c5081` - "chore: update blog site URL to blog.bangyin.me"

- [ ] 构建时间是什么时候？
  - 应该是最近 5-10 分钟内

---

### 第2步：检查自定义域名配置

**位置**：https://dash.cloudflare.com/ → Workers & Pages → [您的项目] → Custom domains

**检查项**：
- [ ] 是否已添加 `blog.bangyin.me`？
  - ✅ 已添加 → 检查状态
  - ❌ 未添加 → 点击 "Set up a custom domain" 添加

- [ ] 如果已添加，状态是什么？
  - 🟡 Initializing（初始化中）→ 等待 1-2 分钟
  - 🟡 Pending（等待中）→ 等待 1-5 分钟
  - 🟡 Provisioning certificate（配置 SSL）→ 等待 5-15 分钟
  - 🟢 Active（已激活）→ 完成！
  - 🔴 Failed（失败）→ 查看错误信息

---

### 第3步：检查 DNS 配置

**位置**：https://dash.cloudflare.com/ → [选择 bangyin.me 域名] → DNS

**检查项**：
- [ ] 是否有 CNAME 记录？
  - 类型：CNAME
  - 名称：blog
  - 目标：bangyin-me.pages.dev
  - 代理状态：已代理（橙色云朵）

- [ ] 是否有冲突的记录？
  - 检查是否有多个 `blog` 记录
  - 如果有，删除冲突的记录

---

## 🔧 常见问题解决

### 问题1：部署失败

**症状**：Deployments 中显示 🔴 Failed

**解决方案**：
1. 点击失败的部署
2. 查看 "Build log"
3. 找到错误信息（通常在日志末尾）
4. 常见错误：
   - `npm install failed` → 依赖安装失败
   - `npm run build failed` → 构建失败
   - `Command not found` → 构建命令错误

**如果遇到错误**：
- 复制错误信息
- 告诉 COO，我会帮您解决

---

### 问题2：域名配置失败

**症状**：Custom domains 中显示 🔴 Failed

**解决方案**：
1. 检查 DNS 记录是否正确
2. 删除冲突的 DNS 记录
3. 重新添加自定义域名

---

### 问题3：部署成功但域名无法访问

**症状**：部署成功，域名已激活，但无法访问

**解决方案**：
1. 清除本地 DNS 缓存：
   ```
   ipconfig /flushdns
   ```
2. 等待 5-10 分钟让 DNS 传播
3. 使用无痕模式访问
4. 使用手机网络访问（避免本地 DNS 缓存）

---

## ✅ 配置完成标志

当以下所有项都完成时，配置就成功了：

- [ ] Cloudflare Pages 部署状态：🟢 Success
- [ ] 自定义域名状态：🟢 Active
- [ ] 可以访问：https://blog.bangyin.me/
- [ ] sitemap 中的 URL 是：https://blog.bangyin.me/
- [ ] 页面显示正常，无 SSL 警告

---

## 📞 需要帮助？

如果遇到问题，请提供以下信息：

1. **部署状态**：
   - 最新部署的状态（Building/Success/Failed）
   - 如果失败，提供构建日志的错误信息

2. **域名状态**：
   - 是否已添加 `blog.bangyin.me`
   - 当前状态（Pending/Active/Failed）

3. **DNS 配置**：
   - 是否有 CNAME 记录
   - 是否有冲突的记录

4. **访问测试**：
   - 浏览器访问 https://blog.bangyin.me/ 的结果
   - 错误信息（如果有）

---

**最后更新**：2026-01-30
**下次检查**：5-10 分钟后
