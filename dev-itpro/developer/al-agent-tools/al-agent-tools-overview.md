---
title: AI Agent Tools for AL Development
description: Learn about the AI agent tools available for AL development, including how to use them in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# AI agent tools for AL development

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)]

AI agent tools enable GitHub Copilot and any Model Context Protocol (MCP)-compatible AI agent to perform core Business Central development tasks on your behalf—building, publishing, searching symbols, running diagnostics, and debugging AL extensions—without leaving your editor or workflow.

> [!TIP]
> These tools are specific to AI agents in Visual Studio Code and are different from the [ALTool command-line tool](../devenv-al-tool.md), which is used for compiling and packaging AL extensions in CI/CD pipelines.

These tools are designed for two usage surfaces that share a consistent set of tool names and behaviors:

| Surface | Description | Best for |
|---------|-------------|----------|
| **Visual Studio Code Language Model Tools** | Tools registered with the Visual Studio Code Language Model Tools API, available to GitHub Copilot in Agent mode and any Copilot-compatible extension | Developers working interactively in Visual Studio Code |
| **AL MCP Server** | A standalone Model Context Protocol server (`altool launchmcpserver`) that exposes AL tools over STDIO or HTTP | Headless environments, CI/CD pipelines, AI agents that run outside Visual Studio Code |

Because both surfaces use the same tool names, an agent trained on one surface can work with the other with no retraining.

## Available tools

The following tools are available across both surfaces. Some tools are exclusive to one surface due to the nature of the operation.

| Tool | Description | Visual Studio Code | AL MCP |
|------|-------------|:-------:|:------:|
| [`al_build`](al-tool-build.md) | Build the AL project and generate the `.app` package | ✓ | ✓ |
| [`al_compile`](al-tool-compile.md) | Validate AL code without generating an `.app` (MCP only) | — | ✓ |
| [`al_publish`](al-tool-publish.md) | Publish the extension to Business Central (cloud or on-premises) | ✓ | ✓ |
| [`al_downloadsymbols`](al-tool-download-symbols.md) | Download dependent symbol packages required for compilation | ✓ | ✓ |
| [`al_symbolsearch`](al-tool-symbol-search.md) | Search AL symbols across the project and its dependencies | ✓ | ✓ |
| [`al_getdiagnostics`](al-tool-get-diagnostics.md) | Retrieve filtered compilation diagnostics | ✓ | ✓ |
| [`al_getpackagedependencies`](al-tool-get-package-dependencies.md) | List the project's `app.json` dependencies (MCP only) | — | ✓ |
| [`al_debug`](al-tool-debug.md) | Start a debug session without republishing (Visual Studio Code only) | ✓ | — |
| `al_setbreakpoint` | Programmatically add, remove, or toggle breakpoints (Visual Studio Code only) | ✓ | — |
| `al_snapshotdebugging` | Manage snapshot debugging sessions (Visual Studio Code only) | ✓ | — |
| [`al_auth_login`](al-tool-auth.md#al_auth_login) | Authenticate to Microsoft Entra ID (MCP only) | — | ✓ |
| [`al_auth_logout`](al-tool-auth.md#al_auth_logout) | Clear cached authentication tokens (MCP only) | — | ✓ |

## Using tools in Visual Studio Code with GitHub Copilot

When GitHub Copilot is running in Agent mode, it can call AL tools automatically in response to natural-language requests. You can also reference a tool explicitly in Copilot Chat by prefixing its name with `#`:

```
#al_build
#al_symbolsearch
#al_getdiagnostics
```

**Example Copilot prompts:**

- *"Build my AL project and show me any errors."* — Copilot calls `al_build`, then `al_getdiagnostics`.
- *"Find all codeunits related to posting."* — Copilot calls `al_symbolsearch` with appropriate filters.
- *"Publish my extension to my sandbox environment."* — Copilot calls `al_publish`.

Copilot can chain tools automatically. For example, if `al_build` reports errors, Copilot might call `al_getdiagnostics` to retrieve the full details, suggest code fixes, rebuild, and then publish—all in a single conversation turn.

## Using the AL MCP Server

The AL MCP Server is a standalone process that exposes AL tools over the Model Context Protocol. It runs anywhere that .NET 8 is available and doesn't require Visual Studio Code.

### Starting the server

```bash
altool launchmcpserver --transport stdio
```

JSON-RPC traffic is exchanged on `stdout`. All diagnostic logs are written to `stderr`. The server shuts down cleanly on EOF or Ctrl+C.

### Connecting an agent

Configure your MCP-compatible agent (for example, Claude Desktop, a custom agent built on the MCP SDK, or a CI pipeline agent) to launch the command above as an MCP server. The agent discovers the available AL tools automatically through the MCP `tools/list` call.

### Authentication

When the AL MCP Server needs to connect to a Business Central cloud environment, it uses browser-based interactive authentication via Microsoft Authentication Library (MSAL). Tokens are cached securely on disk and reused across tool calls.

- Call `al_auth_login` to authenticate before calling `al_publish` or `al_downloadsymbols` with a cloud environment.
- For on-premises deployments using Windows authentication, no explicit sign in is required.
- Call `al_auth_logout` to clear cached tokens when switching accounts.

## Common workflows

### Build and validate

1. Call `al_downloadsymbols` to download symbol packages if they're missing or out of date.
2. Call `al_build` (or `al_compile` in AL MCP for faster validation without producing an `.app`).
3. Call `al_getdiagnostics` to inspect errors and warnings.

### Build and publish to a sandbox

1. Call `al_downloadsymbols` to refresh symbols.
2. Call `al_build` to generate the `.app` package.
3. Call `al_auth_login` (AL MCP only) to authenticate to the cloud environment.
4. Call `al_publish` with the target environment details.

### Symbol discovery

1. Call `al_symbolsearch` with a query to find tables, codeunits, pages, fields, or other AL objects across the project and its dependencies.

### Debug an already-published extension (Visual Studio Code)

1. Call `al_debug` to attach the debugger to the deployed extension without republishing.
2. Optionally call `al_setbreakpoint` to set breakpoints at specific lines.

## Security

Authentication tokens are never passed as tool parameters or returned in tool responses. When a tool requires access to a Business Central cloud environment, it triggers a browser-based Microsoft Entra ID sign-in flow. The resulting tokens are stored by MSAL in a secure local cache and reused transparently.

To force re-authentication, set `noCache: true` on any tool that supports it, or call `al_auth_logout` first.

## Related information

[AL Language Model Tools for Visual Studio Code](al-language-model-tools-vscode.md)  
[AL MCP Server reference](al-mcp-server.md)  
[AL tool reference: al_build](al-tool-build.md)  
[AL tool reference: al_compile](al-tool-compile.md)  
[AL tool reference: al_publish](al-tool-publish.md)  
[AL tool reference: al_downloadsymbols](al-tool-download-symbols.md)  
[AL tool reference: al_symbolsearch](al-tool-symbol-search.md)  
[AL tool reference: al_getdiagnostics](al-tool-get-diagnostics.md)  
