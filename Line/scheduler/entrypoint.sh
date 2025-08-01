#!/bin/sh

echo "--- Starting Entrypoint Script ---"

# 檢查關鍵檔案是否存在
echo "Checking for crontab file at /etc/cron.d/scheduler-cron..."
if [ ! -f "/etc/cron.d/scheduler-cron" ]; then
    echo "ERROR: Crontab file not found after copy!"
    exit 1
fi
echo "Crontab file found. Contents:"
cat /etc/cron.d/scheduler-cron

# 啟動 cron 服務 (在背景運行)
echo "Starting cron daemon..."
cron

echo "Cron daemon started. Tailing log file /var/log/cron.log..."
# 使用 tail -f 指令來持續追蹤 cron 的日誌檔，並將其輸出。
# 這不僅能讓容器保持前景運行，還能讓我們直接在 Zeabur 日誌中看到 cron 的執行狀況。
tail -f /var/log/cron.log