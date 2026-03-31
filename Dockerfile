# Dockerfile
FROM ubuntu:22.04

# 基本依赖
RUN apt-get update && apt-get install -y curl git python3 python3-pip

# 安装 Ollama
RUN pip install ollama

# 拷贝项目（可选）
COPY . /app
WORKDIR /app

# 启动 Ollama 服务，绑定 Render 默认 Web Service 端口
CMD ["ollama", "serve", "--model", "llama3-7b", "--port", "10000", "--api-key", "$OLLAMA_API_KEY"]
