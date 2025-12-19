@echo off
chcp 65001 >nul 2>&1
setlocal enabledelayedexpansion
REM ====================================================================
REM Nacos 部署脚本
REM 将 nacos-server.jar 部署到服务器（自动备份）
REM ====================================================================

echo.
echo ========================================
echo   Nacos 部署工具
echo ========================================
echo.

REM 源文件
set SOURCE_JAR=%~dp0console\target\nacos-server.jar
set BACKUP_SUFFIX=.backup_%date:~0,4%%date:~5,2%%date:~8,2%_%time:~0,2%%time:~3,2%%time:~6,2%
set BACKUP_SUFFIX=!BACKUP_SUFFIX: =0!

REM 检查源文件
if not exist "%SOURCE_JAR%" (
    echo [错误] 找不到 nacos-server.jar
    echo 位置: %SOURCE_JAR%
    echo.
    echo 请先运行 build.bat 编译
    echo.
    pause
    exit /b 1
)

echo 源文件: %SOURCE_JAR%
for %%A in ("%SOURCE_JAR%") do (
    set /a sizeMB=%%~zA / 1048576
    echo 文件大小: !sizeMB! MB
)
echo.

REM 输入目标路径
set /p TARGET_DIR=请输入 Nacos 服务器目录（如 /home/install_app/nacos/target）: 

if not exist "%TARGET_DIR%" (
    echo.
    echo [错误] 目录不存在: %TARGET_DIR%
    pause
    exit /b 1
)

REM 查找目标文件
set TARGET_JAR=%TARGET_DIR%\nacos-server.jar
if not exist "%TARGET_JAR%" (
    set TARGET_JAR=%TARGET_DIR%\nacos-console.jar
)
if not exist "%TARGET_JAR%" (
    echo.
    echo [提示] 在目标目录中找不到 jar 文件
    set /p TARGET_JAR=请输入完整的 jar 文件路径: 
)

echo.
echo 目标文件: %TARGET_JAR%
echo.

REM 确认部署
set /p confirm=确认部署? (Y/N): 
if /i not "%confirm%"=="Y" (
    echo 已取消
    pause
    exit /b 0
)

echo.
echo ========================================
echo 开始部署...
echo ========================================
echo.

REM 备份
if exist "%TARGET_JAR%" (
    echo [1/3] 备份原文件...
    copy "%TARGET_JAR%" "%TARGET_JAR%%BACKUP_SUFFIX%" >nul
    echo 备份: %TARGET_JAR%%BACKUP_SUFFIX%
    echo.
)

REM 复制
echo [2/3] 复制新文件...
copy /Y "%SOURCE_JAR%" "%TARGET_JAR%" >nul
if %errorlevel% neq 0 (
    echo [错误] 复制失败！
    pause
    exit /b 1
)
echo.

REM 验证
echo [3/3] 验证...
if exist "%TARGET_JAR%" (
    for %%A in ("%TARGET_JAR%") do (
        set /a sizeMB=%%~zA / 1048576
        echo 目标文件大小: !sizeMB! MB
    )
    echo.
    echo ========================================
    echo ✓ 部署成功！
    echo ========================================
    echo.
    echo 提示：记得重启 Nacos 服务
) else (
    echo [错误] 验证失败
)

echo.
pause

