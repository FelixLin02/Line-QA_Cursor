# 使用一個包含常用作業系統工具的 Python 映像檔
FROM python:3.10-slim-bullseye

# 設定環境變數，確保 print() 的內容能即時輸出
ENV PYTHONUNBUFFERED=1

# 在容器中設定工作目錄
WORKDIR /app

# 複製函式庫需求清單並安裝
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製所有應用程式碼
COPY scheduler.py .
COPY crontab .
COPY entrypoint.sh .

# 安裝 cron 服務和 dos2unix 工具 (用來修正檔案格式)
RUN apt-get update && apt-get -y install cron dos2unix

# 複製我們的鬧鐘設定檔到系統的 cron 目錄中
COPY crontab /etc/cron.d/scheduler-cron

# 賦予鬧鐘設定檔和啟動腳本正確的權限
RUN chmod 0644 /etc/cron.d/scheduler-cron
RUN chmod +x entrypoint.sh

# 修正啟動腳本可能存在的 Windows 換行符問題
RUN dos2unix entrypoint.sh

# 建立一個日誌檔案，以便 tail 指令可以追蹤它
RUN touch /var/log/cron.log

# 【本次最終修正】
# 將啟動腳本設定為容器啟動時執行的唯一指令。
CMD ["./entrypoint.sh"]
