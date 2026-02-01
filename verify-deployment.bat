@echo off
echo ========================================
echo 博客部署验证脚本
echo ========================================
echo.

echo [1/4] 检查博客首页访问...
curl -I https://blog.bangyin.me/ 2>&1 | findstr "HTTP"
echo.

echo [2/4] 检查 sitemap URL...
curl -s https://blog.bangyin.me/sitemap-0.xml | findstr "blog.bangyin.me" > nul
if %errorlevel% == 0 (
    echo ✅ Sitemap URL 正确 - https://blog.bangyin.me/
) else (
    echo ❌ Sitemap URL 还是旧的 - https://example.com/
)
echo.

echo [3/4] 检查博客文章访问...
curl -I https://blog.bangyin.me/blog/2026-01-28-why-not-use-notion-for-blog/ 2>&1 | findstr "HTTP"
echo.

echo [4/4] 显示前3个 sitemap URL...
curl -s https://blog.bangyin.me/sitemap-0.xml | findstr "<loc>" | head -3
echo.

echo ========================================
echo 验证完成
echo ========================================
echo.
echo 如果 sitemap URL 还是 example.com，请在 Cloudflare Pages 中手动触发部署
pause
