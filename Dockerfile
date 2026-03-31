FROM ubuntu:22.04

# 基本依赖
RUN apt-get update && apt-get install -y curl git python3.11 python3.11-venv python3-pip
RUN python3.11 -m pip install --upgrade pip
RUN pip install ollama

# 拷贝项目
COPY . /app
WORKDIR /app

# 使用 Render 的 PORT 和 API Key
CMD ollama serve --model llama3-7b --port $PORT --api-key "$OLLAMA_API_KEY"
