@echo off
echo ========================================
echo 博客域名配置验证
echo ========================================
echo.

echo [1/3] 检查 DNS 解析...
nslookup blog.bangyin.me
echo.

echo [2/3] 检查 HTTPS 访问...
curl -I https://blog.bangyin.me/
echo.

echo [3/3] 检查页面内容...
curl -s https://blog.bangyin.me/ | findstr "<title>"
echo.

echo ========================================
echo 验证完成
echo ========================================
pause
