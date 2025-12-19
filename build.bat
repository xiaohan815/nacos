@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion
REM ====================================================================
REM Nacos 编译脚本
REM 功能：完整编译所有模块，生成 nacos-server.jar
REM ====================================================================

echo.
echo ========================================
echo   Nacos 编译工具
echo ========================================
echo.

cd /d %~dp0

echo [1/4] 关闭可能占用文件的 Java 进程...
taskkill /F /IM java.exe >nul 2>&1
taskkill /F /IM javaw.exe >nul 2>&1
echo 已处理
echo.

echo [2/4] 清理 istio 缓存（避免文件锁定）...
if exist "istio\target\" (
    rd /s /q "istio\target\" >nul 2>&1
    echo 已清理
) else (
    echo 无需清理
)
echo.

echo [3/4] 开始编译...
echo 预计需要 2-3 分钟，请稍候...
echo.
call mvn clean install -Prelease-nacos -Dmaven.test.skip=true -Drat.skip=true

if %errorlevel% neq 0 (
    echo.
    echo ========================================
    echo [失败] 编译出错！
    echo ========================================
    echo 请检查上面的错误信息
    echo.
    pause
    exit /b %errorlevel%
)

echo.
echo [4/4] 检查结果...
if exist "console\target\nacos-server.jar" (
    echo.
    echo ========================================
    echo ✓ 编译成功！
    echo ========================================
    echo.
    echo 生成文件：%~dp0console\target\nacos-server.jar
    for %%A in ("console\target\nacos-server.jar") do (
        set size=%%~zA
        set /a sizeMB=!size! / 1048576
        echo 文件大小：!sizeMB! MB
    )
    echo.
    echo 下一步：运行 deploy.bat 部署到服务器
) else (
    echo.
    echo [失败] nacos-server.jar 未生成
)

echo.
pause

