# 使用官方的 Python 3.10 slim 映像檔作為基礎
FROM python:3.10-slim

# 在容器中設定工作目錄
WORKDIR /app

# 複製函式庫需求清單並安裝
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 複製排程器主程式
COPY scheduler.py .

# 【本次最終修正】
# 直接將 scheduler.py 作為容器的主程序運行。
# 程式中的 BlockingScheduler 會讓它一直保持運行，並在指定時間執行任務。
CMD ["python3", "scheduler.py"]
