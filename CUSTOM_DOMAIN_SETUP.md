# Cloudflare Pages 自定义域名配置指南

## 📋 当前状态

- ✅ 博客已部署：https://bangyin-me.pages.dev/
- ✅ 代码已更新：site URL 已改为 https://blog.bangyin.me
- ✅ DNS 记录已配置：blog.bangyin.me → 198.18.0.235
- ⏳ 等待配置：需要在 Cloudflare Pages 中添加自定义域名

---

## 🎯 目标

将 `blog.bangyin.me` 指向博客主页

---

## 📝 详细操作步骤

### 第1步：登录 Cloudflare Dashboard

1. 访问：https://dash.cloudflare.com/
2. 使用您的 Cloudflare 账号登录

### 第2步：进入 Pages 项目

1. 在左侧菜单中，点击 **Workers & Pages**
2. 在项目列表中，找到您的博客项目
   - 项目名称可能是：`ai-ops` 或 `bangyin-me` 或类似名称
3. 点击项目名称进入项目详情页

### 第3步：添加自定义域名

1. 在项目详情页中，点击顶部的 **Custom domains** 标签
2. 点击 **Set up a custom domain** 按钮
3. 在弹出的输入框中输入：`blog.bangyin.me`
4. 点击 **Continue** 按钮

### 第4步：确认 DNS 配置

Cloudflare 会检查 DNS 配置：

**情况1：域名在 Cloudflare 管理（推荐）**
- ✅ Cloudflare 会自动配置 DNS 记录
- ✅ 会自动添加 CNAME 记录：`blog` → `bangyin-me.pages.dev`
- ✅ 会自动配置 SSL 证书
- 点击 **Activate domain** 按钮

**情况2：域名不在 Cloudflare**
- Cloudflare 会提示您需要添加 DNS 记录
- 记录类型：CNAME
- 名称：blog
- 值：bangyin-me.pages.dev
- 在您的域名提供商处添加此记录后，回到 Cloudflare 点击 **Activate domain**

### 第5步：等待生效

添加域名后，会看到以下状态：

| 状态 | 说明 | 预计时间 |
|------|------|---------|
| 🟡 **Initializing** | 初始化中 | 1-2 分钟 |
| 🟡 **Pending** | DNS 配置中 | 1-5 分钟 |
| 🟡 **Provisioning certificate** | SSL 证书配置中 | 5-15 分钟 |
| 🟢 **Active** | 已激活，可以访问 | 完成 ✅ |

**注意**：
- 整个过程通常需要 5-20 分钟
- 请耐心等待，不要重复操作
- 可以刷新页面查看最新状态

---

## 🔍 验证配置

### 方法1：在 Cloudflare Dashboard 中检查

1. 进入项目的 **Custom domains** 标签
2. 查看 `blog.bangyin.me` 的状态
3. 如果显示 🟢 **Active**，说明配置成功

### 方法2：在浏览器中访问

1. 打开浏览器
2. 访问：https://blog.bangyin.me/
3. 如果能看到博客首页，说明配置成功

### 方法3：使用命令行测试

```bash
# 测试 HTTPS 访问
curl -I https://blog.bangyin.me/

# 应该看到：
# HTTP/1.1 200 OK
# Content-Type: text/html; charset=utf-8
```

---

## 🐛 常见问题排查

### 问题1：状态一直是 Pending

**可能原因**：DNS 记录未正确配置

**解决方案**：
1. 进入 Cloudflare DNS 管理
2. 访问：https://dash.cloudflare.com/ → 选择 `bangyin.me` 域名 → DNS
3. 检查是否有以下记录：
   ```
   类型: CNAME
   名称: blog
   目标: bangyin-me.pages.dev
   代理状态: 已代理（橙色云朵）
   ```
4. 如果没有，点击 **Add record** 手动添加

### 问题2：SSL 证书配置失败

**可能原因**：有冲突的 DNS 记录

**解决方案**：
1. 检查是否有多个 `blog` 记录（如 A 记录和 CNAME 记录同时存在）
2. 删除冲突的记录，只保留 CNAME 记录
3. 等待 5-10 分钟后重试

### 问题3：显示 Active 但无法访问

**可能原因**：本地 DNS 缓存

**解决方案**：
```bash
# Windows 清除 DNS 缓存
ipconfig /flushdns

# 然后重新访问
https://blog.bangyin.me/
```

### 问题4：访问显示 "This site can't be reached"

**可能原因**：DNS 还未完全生效

**解决方案**：
1. 等待 5-10 分钟
2. 清除浏览器缓存
3. 尝试使用无痕模式访问
4. 尝试使用手机网络访问（避免本地 DNS 缓存）

---

## 📊 配置完成检查清单

配置完成后，请确认以下内容：

- [ ] Cloudflare Pages 中 `blog.bangyin.me` 状态为 🟢 **Active**
- [ ] 浏览器可以访问 https://blog.bangyin.me/
- [ ] 页面显示正常，无 SSL 证书警告
- [ ] 页面加载速度快（< 2 秒）
- [ ] 可以正常浏览博客文章

---

## 🎉 配置成功后的下一步

1. **测试博客功能**
   - 访问首页
   - 点击文章链接
   - 检查样式和布局

2. **更新书签**
   - 将 https://blog.bangyin.me/ 添加到浏览器书签

3. **准备发布内容**
   - 使用 `/social` Skill 从对话中提取内容
   - 生成新的博客文章
   - 发布到博客

---

## 📞 需要帮助？

如果遇到问题，请提供以下信息：

1. Cloudflare Pages 中 `blog.bangyin.me` 的状态（截图）
2. DNS 记录配置（截图）
3. 浏览器访问时的错误信息（截图）
4. 命令行测试结果：
   ```bash
   curl -I https://blog.bangyin.me/
   nslookup blog.bangyin.me
   ```

---

## 📚 相关文档

- [Cloudflare Pages 官方文档](https://developers.cloudflare.com/pages/)
- [自定义域名配置](https://developers.cloudflare.com/pages/configuration/custom-domains/)
- [DNS 记录管理](https://developers.cloudflare.com/dns/)
