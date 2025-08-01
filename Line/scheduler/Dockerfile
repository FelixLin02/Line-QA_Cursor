# 使用一個包含常用作業系統工具的 Python 映像檔
FROM python:3.10-slim-bullseye

# 設定環境變數，確保 print() 的內容能即時輸出
ENV PYTHONUNBUFFERED=1

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

# 【本次最終修正】
# 將所有啟動指令合併到一行，直接在 shell 中執行。
# 這可以避免因外部腳本格式問題 (例如 Windows 換行符) 造成的啟動失敗。
# 這個指令會先啟動 cron 服務，然後持續追蹤日誌檔以保持容器運行。
CMD sh -c 'cron && tail -f /var/log/cron.log'
