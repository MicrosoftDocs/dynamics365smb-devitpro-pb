---
title: AL MCP Server
description: Learn about the AL MCP Server, a standalone Model Context Protocol (MCP) server that exposes AL development tools for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# AL MCP server

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)]

The AL MCP Server is a standalone Model Context Protocol (MCP) server that exposes AL development tools—building, compiling, publishing, symbol search, diagnostics, and more—to any MCP-compatible AI agent. It runs as a separate process and doesn't require Visual Studio Code.

This makes it possible to integrate AL development operations into CI/CD pipelines, chat-based agent workflows, and custom automation tooling using any agent that supports the Model Context Protocol.

## System requirements

- .NET 8 runtime
- AL Language extension installed (provides the `altool` binary)
- Network access to a Business Central environment (for tools that connect to a server, such as `al_publish` and `al_downloadsymbols`)

## Starting the server

### STDIO transport (recommended for most agents)

```bash
altool launchmcpserver --transport stdio
```

The server reads JSON-RPC requests from `stdin` and writes responses to `stdout`. All diagnostic log output is written to `stderr` and should be captured separately. The server shuts down cleanly when `stdin` reaches EOF or when the process receives a termination signal.

### HTTP transport

```bash
altool launchmcpserver --transport http --port 5010
```

The server listens for HTTP requests on the specified port. Use this transport for agents that connect over a network or for scenarios where launching a subprocess isn't practical.

## Available tools

The following tools are exposed by the AL MCP Server. Tools marked **MCP only** aren't available in the Visual Studio Code Language Model Tools API.

| Tool | Description |
|------|-------------|
| [`al_build`](al-tool-build.md) | Build the AL project and generate the `.app` package. |
| [`al_compile`](al-tool-compile.md) | Validate AL code without generating an `.app`. Faster than a full build. |
| [`al_publish`](al-tool-publish.md) | Publish the extension to a Business Central cloud or on-premises environment. |
| [`al_downloadsymbols`](al-tool-download-symbols.md) | Download dependent symbol packages from a BC environment or global sources. |
| [`al_symbolsearch`](al-tool-symbol-search.md) | Search AL symbols across the project and its dependencies. |
| [`al_getdiagnostics`](al-tool-get-diagnostics.md) | Retrieve compilation diagnostics with filtering. |
| [`al_getpackagedependencies`](al-tool-get-package-dependencies.md) | List the project's declared `app.json` dependencies. **MCP only.** |
| [`al_auth_login`](al-tool-auth.md#al_auth_login) | Authenticate to Microsoft Entra ID for cloud operations. **MCP only.** |
| [`al_auth_logout`](al-tool-auth.md#al_auth_logout) | Clear cached authentication tokens. **MCP only.** |

## Configuring an agent to use the AL MCP Server

The exact configuration depends on your agent. Most MCP-compatible agents accept a server configuration that specifies the command to launch. The example below shows a typical configuration in JSON format:

```json
{
  "mcpServers": {
    "al": {
      "command": "altool",
      "args": ["launchmcpserver", "--transport", "stdio"]
    }
  }
}
```

The agent discovers available tools automatically by calling the MCP `tools/list` endpoint after the server starts.

## Calling a tool

Tool calls follow the MCP JSON-RPC protocol. The agent sends a `tools/call` request with the tool name and its parameters.

**Example: compile the current workspace**

```json
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "tools/call",
  "params": {
    "name": "al_compile",
    "arguments": {
      "onlyErrors": true
    }
  }
}
```

**Example: search for symbols (note the required `parameters` wrapper)**

```json
{
  "jsonrpc": "2.0",
  "id": 2,
  "method": "tools/call",
  "params": {
    "name": "al_symbolsearch",
    "arguments": {
      "parameters": {
        "query": "Post",
        "filters": {
          "kinds": ["Codeunit"],
          "scope": "project"
        }
      }
    }
  }
}
```

> [!NOTE]
> The `al_symbolsearch` tool requires its search parameters to be wrapped under a `parameters` key. All other tools accept their parameters at the top level.

## Authentication

When a tool needs to connect to a Business Central cloud environment, the AL MCP Server uses browser-based interactive authentication via Microsoft Authentication Library (MSAL). Tokens are cached securely on disk and reused across calls.

**Recommended authentication workflow:**

1. Before the first cloud operation in a session, call `al_auth_login` with your tenant and environment details.
2. The server opens a browser window for Microsoft Entra ID sign-in.
3. After sign-in, the token is cached. All subsequent tool calls in the session reuse it automatically.
4. When finished, call `al_auth_logout` to clear the cache.

For on-premises Business Central deployments that use Windows authentication, no explicit sign in is required.

## Common automation workflows

### CI/CD validation pipeline

```bash
# 1. Start the MCP server (managed by the CI agent)
altool launchmcpserver --transport stdio

# The agent then calls tools in sequence:
# al_downloadsymbols  (refresh symbols from global sources)
# al_compile          (validate — fast, no .app output)
# al_getdiagnostics   (fail the pipeline if errors exist)
```

### Full build and deploy to sandbox

```bash
# The agent calls:
# al_auth_login       (authenticate to the cloud environment)
# al_downloadsymbols  (refresh symbols)
# al_build            (produce the .app package)
# al_publish          (deploy to sandbox)
```

### Code quality gate (AppSourceCop)

```bash
# The agent calls:
# al_compile with enableCodeAnalysis=true, codeAnalyzers=["${AppSourceCop}"]
# al_getdiagnostics filtered by areas=["AppSourceCop"]
# (fail if any errors are returned)
```

## Session behavior

The AL MCP Server maintains a compilation session during the process lifetime. The session is initialized when the server starts and is shared across all tool calls. This means that symbol state and compilation caches are preserved between calls, which improves performance for sequential operations such as compile → diagnose → fix → recompile.

If you need to work with multiple AL projects in the same server session, use the `projectPath` parameter on individual tool calls to target a specific project.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL Language Model Tools for Visual Studio Code](al-language-model-tools-vscode.md)  
[al_build](al-tool-build.md)  
[al_compile](al-tool-compile.md)  
[al_publish](al-tool-publish.md)  
[al_downloadsymbols](al-tool-download-symbols.md)  
[al_symbolsearch](al-tool-symbol-search.md)  
[al_getdiagnostics](al-tool-get-diagnostics.md)  
[al_getpackagedependencies](al-tool-get-package-dependencies.md)  
[al_auth_login and al_auth_logout](al-tool-auth.md)  
