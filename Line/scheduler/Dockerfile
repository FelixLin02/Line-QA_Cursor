# 使用一個包含常用作業系統工具的 Python 映像檔
FROM python:3.10-slim-bullseye

# 在容器中設定工作目錄
WORKDIR /app

# 複製函式庫需求清單並安裝
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製排程器主程式
COPY scheduler.py .

# 安裝 cron 服務
RUN apt-get update && apt-get -y install cron

# 複製我們的鬧鐘設定檔到系統的 cron 目錄中
COPY crontab /etc/cron.d/scheduler-cron

# 賦予鬧鐘設定檔正確的權限
RUN chmod 0644 /etc/cron.d/scheduler-cron

# 建立一個日誌檔案，以便 tail 指令可以追蹤它
RUN touch /var/log/cron.log

# 複製我們的啟動腳本到容器中
COPY entrypoint.sh /usr/local/bin/

# 賦予啟動腳本執行的權限
RUN chmod +x /usr/local/bin/entrypoint.sh

# 【本次最終修正】
# 將啟動腳本設定為容器啟動時執行的唯一指令。
CMD ["entrypoint.sh"]
