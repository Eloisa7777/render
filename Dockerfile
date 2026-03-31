FROM ubuntu:22.04

# 安装 Node.js 18 LTS 和 curl
RUN apt-get update && apt-get install -y curl git build-essential \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# 安装 Ollama JS 版本全局命令
RUN npm install -g ollama

# 拷贝项目
COPY . /app
WORKDIR /app

# 使用 Render 提供的 PORT 和 API_KEY
CMD ["sh", "-c", "ollama serve --model llama3-7b --port $PORT --api-key $OLLAMA_API_KEY"]
