## 🌐 Web MCP (Multi-Channel Platform Server)

This repository contains the Web MCP (Multi-Channel Platform) server, a specialized microservice within the Multi-Agent Bot system. Its primary role is to expose a suite of web-related tools (like general web search, Stack Overflow search, and news retrieval) via the FastMCP protocol, making them discoverable and invokable by the cyrene-agent (bot-api) service.

## ✨ Features

- **Web Search**: Provides a tool for general web searches (e.g., via SerpApi).
- **Stack Overflow Search**: Offers a specialized tool for searching programming-related questions and answers on Stack Overflow.
- **News Article Retrieval**: Integrates with a news API to fetch current news headlines and articles.
- **FastMCP Integration**: Registers all web-related functionalities as discoverable tools for the cyrene-agent.
- **Modular & Scalable**: Runs as an independent microservice, allowing for easy scaling and maintenance.

## 🏛️ Architecture Context

The web-mcp is one of several specialized MCP servers. It communicates with external web APIs (like SerpApi, NewsAPI) to perform its functions. The cyrene-agent discovers its tools via the fastmcp-core-server and then directly calls these tools on the web-mcp service.

## 🚀 Getting Started

### Prerequisites

* Python 3.12+
* **API Keys**:

  * **SerpApi API Key**: Required for `serpapi_search` and `google_search` tools. Obtain one from SerpApi.
  * **NewsAPI.org API Key**: Required for `newsapi_org` tool. Obtain one from NewsAPI.org.

### Installation

Clone this repository:

```bash
git clone https://github.com/CyreneAI/web-mcp.git
cd web-mcp
```

> **Note:** If you are setting up the entire multi-repo system, you would typically clone the main orchestrator repository first, which would then handle cloning individual MCPs or using them as submodules.

Install Python dependencies:

```bash
pip install -r requirements.txt
```

### Environment Variables

Create a `.env` file in the root of this `web-mcp` directory with the following variables:

```env
# .env in web-mcp directory
SERPAPI_API_KEY=your_serpapi_api_key_here
NEWSAPI_API_KEY=your_newsapi_api_key_here
```

* `SERPAPI_API_KEY`: Your SerpApi API key.
* `NEWSAPI_API_KEY`: Your NewsAPI.org API key.

### Running the Application (Local Development)

Run the web-mcp service using Uvicorn:

```bash
uvicorn server:app --reload --host 0.0.0.0 --port 9000
```

The web-mcp server will be accessible at `http://localhost:9000`. It will automatically register its tools with the fastmcp-core-server if it's running and configured correctly.

## 🧪 Usage

Once the web-mcp server is running and its tools are registered with fastmcp-core-server, the cyrene-agent can invoke its tools.

Example queries you can send to your agent (via the agent-UI or direct API chat) that would trigger web-mcp tools:

* “What is the capital of France?” (Uses `google_search` or `serpapi_search`)
* “How do I fix a ‘TypeError: ‘int’ object is not subscriptable’ in Python?” (Uses `stackoverflow_search`)
* “What are the latest headlines about artificial intelligence?” (Uses `newsapi_org`)

## 📁 Project Structure

```
web-mcp/
├── .env.example
├── .gitignore
├── README.md           # <- This file
├── Dockerfile          # Dockerfile for the web-mcp service
├── requirements.txt    # Python dependencies for web-mcp if running locally for docker it will use base-mcp for requirements
└── server.py           # FastAPI application for the web-mcp
```
