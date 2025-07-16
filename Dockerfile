FROM ghcr.io/cyreneai/base-mcp:latest

# Set working directory
WORKDIR /app

# Copy application code
COPY server.py .

# Set environment variables for Kubernetes deployment
ENV LOCAL_MODE="false"
ENV FASTMCP_BASE_URL="http://fastmcp-core-svc:9000"

# Standard MCP port in Kubernetes
EXPOSE 9000

CMD ["uvicorn", "web-mcp.server:app", "--host", "0.0.0.0", "--port", "9000"]
