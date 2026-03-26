---
title: Publish AL extension to Business Central - al_publish
description: Learn about the al_publish tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Publish AL extension to Business Central - al_publish

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_publish` tool deploys an AL extension to a Business Central environment—either a cloud (SaaS) sandbox or production environment, or an on-premises server. It supports several deployment modes depending on your workflow.

## Deployment modes

| Mode | Description |
|------|-------------|
| **Full publish** | Builds the project and publishes the resulting `.app` file. This is the default mode. |
| **Incremental (RAD) publish** | Uses Rapid Application Development (RAD) delta compilation to publish only the changes since the last full publish. Faster for iterative development. Available in Visual Studio Code only. |
| **Full dependency tree** | Builds and publishes the active project together with all its dependencies in the correct order. |
| **Skip build** | Publishes an existing `.app` file without rebuilding the project. Useful when the build has already been performed in a previous step. |

## Authentication

For cloud environments, the tool uses browser-based interactive authentication via Microsoft Authentication Library (MSAL). Tokens are cached and reused across calls.

- In AL MCP, call [`al_auth_login`](al-tool-auth.md#al_auth_login) before publishing to a cloud environment.
- For on-premises environments using Windows authentication, no explicit sign in is required.
- Pass `noCache: true` to force a new sign-in and bypass the token cache.

## Parameters

### Visual Studio Code

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `debug` | boolean | `true` | When `true`, a debug session is started automatically after the publish completes. |
| `type` | `"full"` \| `"incremental"` | `"full"` | The publish type. `"incremental"` uses RAD delta compilation for faster iterative publishing. |
| `fulldependencytree` | boolean | `false` | When `true`, all project dependencies are built and published in dependency order before the active project. |
| `skipbuild` | boolean | `false` | When `true`, the build step is skipped and the existing `.app` file is published directly. |

### AL MCP Server

**App source** — provide one of the following:

| Parameter | Type | Description |
|-----------|------|-------------|
| `appPath` | string | Absolute path to an existing `.app` file to publish. |
| `projectPath` | string | Absolute path to an AL project folder. The tool builds the project and publishes the resulting `.app`. Defaults to the first project in the workspace. |

**Cloud environment options:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `environmentName` | string | — | The name of the cloud environment (for example, `"sandbox"` or `"production"`). |
| `environmentType` | string | — | `"Sandbox"` or `"Production"`. |
| `tenant` | string | — | The Microsoft Entra tenant ID or domain (for example, `"contoso.onmicrosoft.com"`). |

**On-premises options:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `serverUrl` | string | — | The Business Central server URL (for example, `"http://myserver"`). |
| `serverInstance` | string | — | The server instance name (for example, `"BC"`). |
| `port` | integer | — | The development service port. |
| `authentication` | string | `"AAD"` | Authentication method: `"AAD"`, `"Windows"`, or `"UserPassword"`. |

**Deployment options:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `schemaUpdateMode` | string | `"Synchronize"` | How to handle database schema changes: `"Synchronize"`, `"ForceSync"`, or `"Recreate"`. |
| `forceUpgrade` | boolean | `false` | When `true`, skips the version compatibility check and forces the upgrade. |
| `skipBuild` | boolean | `false` | When `true`, publishes an existing `.app` without building. |
| `buildDependencies` | boolean | `false` | When `true`, builds and publishes all project dependencies before the active project. |
| `useInteractiveLogin` | boolean | `true` | When `true`, opens a browser window for Microsoft Entra ID sign-in if authentication is required. |
| `noCache` | boolean | `false` | When `true`, clears cached tokens and forces a new sign-in before publishing. |

## Examples

### Publish the active project to a sandbox (Visual Studio Code)

In Copilot Chat, say: *"Publish my extension to the sandbox."*

Copilot calls `al_publish` with the default parameters. Connection details come from `launch.json`.

### Publish with full dependency tree (Visual Studio Code)

```json
{
  "fulldependencytree": true,
  "debug": false
}
```

### Publish an existing `.app` to a cloud sandbox (AL MCP)

```json
{
  "appPath": "C:/build/output/MyExtension_1.0.0.0.app",
  "environmentName": "sandbox",
  "environmentType": "Sandbox",
  "tenant": "contoso.onmicrosoft.com",
  "skipBuild": true
}
```

### Publish to an on-premises server with Windows authentication (AL MCP)

```json
{
  "projectPath": "C:/repos/MyExtension",
  "serverUrl": "http://myserver",
  "serverInstance": "BC",
  "port": 7049,
  "authentication": "Windows"
}
```

### Force schema re-creation (AL MCP)

```json
{
  "projectPath": "C:/repos/MyExtension",
  "environmentName": "sandbox",
  "schemaUpdateMode": "Recreate"
}
```

## Suggested next steps

| Outcome | Suggested action |
|---------|-----------------|
| Published successfully | In Visual Studio Code, the debugger attaches automatically (when `debug: true`). In AL MCP, verify the deployment on the BC server. |
| Build error before publish | Run [`al_getdiagnostics`](al-tool-get-diagnostics.md) to review the errors, fix the code, and retry. |
| Authentication error | Run [`al_auth_login`](al-tool-auth.md#al_auth_login) (AL MCP) and retry, or set `noCache: true`. |

## Related tools

- [`al_build`](al-tool-build.md) — Build without publishing.
- [`al_downloadsymbols`](al-tool-download-symbols.md) — Download symbol packages needed before publishing.
- [`al_auth_login`](al-tool-auth.md#al_auth_login) — Authenticate to Microsoft Entra ID before publishing to the cloud.
- [`al_debug`](al-tool-debug.md) — Attach the debugger without republishing (Visual Studio Code only).

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

