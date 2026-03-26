---
title: Download AL symbol packages - al_downloadsymbols
description: Learn about the al_downloadsymbols tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Download AL symbol packages - al_downloadsymbols

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_downloadsymbols` tool downloads dependent `.app` symbol packages that AL compilation requires. Symbol packages contain the type information for objects defined in other extensions and in the Business Central base application.

Run this tool before building or compiling if you encounter "symbol not found" errors, if you have added new dependencies to `app.json`, or if you want to refresh symbols to pick up updates from a connected Business Central environment.

In Visual Studio Code, connection details are read from the active `launch.json` configuration. In AL MCP, you can pass connection parameters directly or let the tool read from the workspace configuration.

After a successful download, the workspace is automatically reloaded to refresh compilation caches.

## Parameters

### Visual Studio Code

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `globalSourcesOnly` | boolean | `false` | When `true`, downloads symbols only from global sources (Microsoft NuGet feeds and AppSource). No Business Central server connection or authentication is required. Useful in CI environments without access to a live BC server. |

### AL MCP Server

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `projectPath` | string | First project in workspace | Absolute path to the AL project folder containing `app.json` and `launch.json`. |
| `globalSourcesOnly` | boolean | `false` | When `true`, downloads symbols only from Microsoft NuGet feeds and AppSource. No server connection or authentication is required. |
| `force` | boolean | `false` | When `true`, re-downloads all symbol packages even if they're already cached locally. |
| `noCache` | boolean | `false` | When `true`, bypasses the authentication token cache and forces a new sign-in. |
| `useInteractiveLogin` | boolean | `true` | When `true`, opens a browser window for Microsoft Entra ID sign-in if authentication is required. |
| `environmentName` | string | — | Cloud environment name (for example, `"sandbox"` or `"production"`). Overrides `launch.json`. |
| `environmentType` | string | — | `"Sandbox"` or `"Production"`. Overrides `launch.json`. |
| `tenant` | string | — | Microsoft Entra tenant ID or domain. Overrides `launch.json`. |
| `serverUrl` | string | — | On-premises server URL (for example, `"http://myserver"`). Overrides `launch.json`. |
| `serverInstance` | string | — | On-premises server instance name (for example, `"BC"`). Overrides `launch.json`. |
| `port` | integer | — | Development service port. Overrides `launch.json`. |
| `authentication` | string | `"AAD"` | Authentication method: `"AAD"`, `"Windows"`, or `"UserPassword"`. |

## Symbols storage

Downloaded symbols are saved to the `.alpackages` folder inside the project directory. This folder is used automatically by the AL compiler when you build or compile.

## Examples

### Download symbols from a connected BC server (Visual Studio Code)

In Copilot Chat, say: *"Download symbols for my project."*

Copilot calls `al_downloadsymbols`. Connection details are read from `launch.json`.

### Download symbols from global sources only (offline / CI)

This mode doesn't require a Business Central server connection. It downloads the Microsoft platform and base application symbols from Microsoft NuGet feeds and AppSource.

**Visual Studio Code:**

```json
{
  "globalSourcesOnly": true
}
```

**AL MCP:**

```json
{
  "globalSourcesOnly": true
}
```

### Force re-download of all symbols (AL MCP)

```json
{
  "force": true
}
```

### Download symbols for a specific project (AL MCP)

```json
{
  "projectPath": "C:/repos/MyExtension",
  "environmentName": "sandbox",
  "tenant": "contoso.onmicrosoft.com"
}
```

## Suggested next steps

| Outcome | Suggested action |
|---------|-----------------|
| Download succeeded | Run [`al_build`](al-tool-build.md) or [`al_compile`](al-tool-compile.md) to compile the project. |
| Authentication error | Run [`al_auth_login`](al-tool-auth.md#al_auth_login) (AL MCP) and retry, or set `noCache: true`. |

## Related tools

- [`al_build`](al-tool-build.md) — Build the project after downloading symbols.
- [`al_compile`](al-tool-compile.md) — Validate code after downloading symbols (AL MCP only).
- [`al_getpackagedependencies`](al-tool-get-package-dependencies.md) — List the dependencies defined in `app.json` (AL MCP only).
- [`al_auth_login`](al-tool-auth.md#al_auth_login) — Authenticate before downloading symbols from a cloud environment.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

