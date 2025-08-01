# 使用官方的 Python 3.10 slim 映像檔作為基礎
FROM python:3.10-slim

# 在容器中設定工作目錄
WORKDIR /app

# 複製函式庫需求清單到容器中
COPY requirements.txt .

# 安裝所有必要的 Python 函式庫
RUN pip install --no-cache-dir -r requirements.txt

# 複製排程器主程式到容器中
COPY scheduler.py .

# 【本次關鍵修正】
# 這個指令會讓容器在沒有任務時保持運行狀態，
# 以便 Zeabur 的排程器可以在指定時間進入並執行任務。
CMD ["tail", "-f", "/dev/null"]