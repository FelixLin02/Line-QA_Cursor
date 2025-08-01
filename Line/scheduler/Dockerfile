# 使用一個包含常用作業系統工具的 Python 映像檔
FROM python:3.10-slim-bullseye

# 在容器中設定工作目錄
WORKDIR /app

# 複製函式庫需求清單並安裝
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製排程器主程式
COPY scheduler.py .

# 【本次關鍵修正】
# 安裝 cron 服務
RUN apt-get update && apt-get -y install cron

# 複製我們的鬧鐘設定檔到系統的 cron 目錄中
COPY crontab /etc/cron.d/scheduler-cron

# 賦予鬧鐘設定檔正確的權限
RUN chmod 0644 /etc/cron.d/scheduler-cron

# 建立一個日誌檔案，以便 tail 指令可以追蹤它
RUN touch /var/log/cron.log

# 容器啟動時執行的指令：
# 1. 啟動 cron 服務 (在背景運行)
# 2. 使用 tail -f 來讓容器保持前景運行，並持續輸出 cron 的日誌
CMD cron && tail -f /var/log/cron.log
