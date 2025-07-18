FROM ghcr.io/cyreneai/base-mcp:latest

# Set working directory
WORKDIR /app

# Copy application code
COPY server.py .

# Standard MCP port in Kubernetes
EXPOSE 9000

CMD ["uvicorn", "server:app", "--host", "0.0.0.0", "--port", "9000"]
 