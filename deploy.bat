@echo off
chcp 65001 >nul
echo ========================================
echo 博客一键部署脚本
echo ========================================
echo.

cd /d C:\Users\Administrator\blog.bangyin

echo [1/4] 检查是否有变更...
git status --short
echo.

echo [2/4] 添加所有变更...
git add .
echo.

echo [3/4] 提交变更...
set /p commit_msg="请输入提交说明（直接回车使用默认）: "
if "%commit_msg%"=="" set commit_msg=update: 更新文章内容

git commit -m "%commit_msg%"
echo.

echo [4/4] 推送到 GitHub...
git push origin main
echo.

echo ========================================
echo ✅ 部署完成！
echo Cloudflare Pages 正在自动部署（1-3分钟）
echo 访问: https://blog.bangyin.me/
echo ========================================
echo.

pause
