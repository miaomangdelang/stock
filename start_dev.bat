@echo off
echo 启动开发环境...
set ENV=dev
echo 请选择要启动的服务：
echo 1. Web服务 (端口9988)
echo 2. 交易服务
echo 3. 数据任务
echo 4. 全部启动
set /p choice=请输入选择 (1-4): 

if "%choice%"=="1" (
    echo 启动Web服务...
    cd instock\web
    python web_service.py
) else if "%choice%"=="2" (
    echo 启动交易服务...
    cd instock\trade
    python trade_service.py
) else if "%choice%"=="3" (
    echo 启动数据任务...
    cd instock\job
    python execute_daily_job.py
) else if "%choice%"=="4" (
    echo 启动所有服务...
    start "Web服务" cmd /k "cd instock\web && python web_service.py"
    start "交易服务" cmd /k "cd instock\trade && python trade_service.py"
    echo 服务已启动，请查看新打开的窗口
) else (
    echo 无效选择
)
pause
