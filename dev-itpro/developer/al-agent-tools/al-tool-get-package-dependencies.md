---
title: Get package dependencies - al_getpackagedependencies
description: Learn about the al_getpackagedependencies tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Get package dependencies - al_getpackagedependencies

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: AL MCP Server only

The `al_getpackagedependencies` tool reads the `app.json` file of an AL project and returns its declared package dependencies—including the app name, publisher, app ID (GUID), and version range for each dependency.

Use this tool to understand what packages a project requires before downloading symbols or publishing, to audit dependency graphs, or to check whether a specific package is referenced.

> [!NOTE]
> This tool is available on the AL MCP Server only. In Visual Studio Code, inspect the `app.json` file directly to view dependencies.

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `projectPath` | string | First project in workspace | Absolute path to the AL project folder containing `app.json`. |
| `name` | string | — | Optional. When specified, returns only the dependency matching this app name. |

## Return value

| Property | Type | Description |
|----------|------|-------------|
| `Succeeded` | boolean | `true` if the operation completed successfully. |
| `ModuleName` | string | The name of the queried project or module. |
| `Dependencies` | array | List of dependency items (see below). |
| `ErrorMessage` | string | Error description if `Succeeded` is `false`. |

Each item in `Dependencies` has:

| Property | Type | Description |
|----------|------|-------------|
| `Name` | string | App name. |
| `Publisher` | string | Publisher name. |
| `Id` | string | App ID (GUID). |
| `Version` | string | Required version range (for example, `"24.0.0.0"`). |

## Examples

### List all dependencies for the workspace project

```json
{}
```

### List dependencies for a specific project

```json
{
  "projectPath": "C:/repos/MyExtension"
}
```

### Check whether a specific package is a dependency

```json
{
  "projectPath": "C:/repos/MyExtension",
  "name": "Base Application"
}
```

## Suggested next steps

- Use the returned dependency list to decide which packages to download with [`al_downloadsymbols`](al-tool-download-symbols.md).
- Compare the declared dependencies against what is available in `.alpackages` to identify missing symbols.

## Related tools

- [`al_downloadsymbols`](al-tool-download-symbols.md) — Download the symbol packages for the listed dependencies.
- [`al_symbolsearch`](al-tool-symbol-search.md) — Search symbols within the downloaded packages.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  
