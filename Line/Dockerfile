# 使用官方的 Python 3.10 slim 映像檔作為基礎
FROM python:3.10-slim

# 在容器中設定工作目錄
WORKDIR /app

# 複製函式庫需求清單到容器中
COPY requirements.txt .

# 安裝所有必要的 Python 函式庫
RUN pip install --no-cache-dir -r requirements.txt

# 複製所有應用程式碼到容器中
COPY . .

# 開放 8080 連接埠
EXPOSE 8080

# 容器啟動時執行的指令
CMD ["gunicorn", "--workers", "2", "--bind", "0.0.0.0:8080", "app:app"]