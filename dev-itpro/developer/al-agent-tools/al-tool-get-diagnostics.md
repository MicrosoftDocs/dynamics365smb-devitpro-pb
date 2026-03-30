---
title: Get AL diagnostics - al_getdiagnostics
description: Learn about the al_getdiagnostics tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Get AL diagnostics - al_getdiagnostics

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_getdiagnostics` tool retrieves AL compilation diagnostics—errors, warnings, informational messages, and hints—with flexible filtering by scope, severity, source area, file, or folder.

- In Visual Studio Code, diagnostics are read from the Problems panel, which reflects the current state of the AL Language Server.
- In AL MCP, diagnostics come directly from the compiler output.

Use this tool after a build or compilation to inspect what needs to be fixed, to check whether a project is error-free, or to monitor code quality by filtering for specific diagnostic codes or analyzer areas.

## Parameters

### Visual Studio Code

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `scope` | `"workspace"` \| `"project"` \| `"folder"` \| `"file"` | `"workspace"` | The scope from which to retrieve diagnostics. |
| `filePath` | string | — | Absolute path to a single `.al` file. Narrows results to that file. |
| `folderPath` | string | — | Absolute path to a folder. Returns diagnostics from all `.al` files in the folder recursively. |
| `projectPath` | string | — | Absolute path to an AL project folder. Returns diagnostics for all files in that project. |
| `severities` | string[] | All severities | Filter by severity level: `"error"`, `"warning"`, `"info"`, `"hint"`. |
| `areas` | string[] | All areas | Filter by diagnostic source area, for example `"AL"`, `"AppSourceCop"`, `"CodeCop"`, `"PerTenantExtensionCop"`. |
| `limit` | integer | `200` | Maximum number of diagnostics to return. Maximum allowed value: `500`. |
| `includeRelatedInformation` | boolean | `false` | When `true`, includes related diagnostic information (secondary locations and context messages). |

### AL MCP Server

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `filePath` | string | — | Absolute path to a single `.al` or `.dal` file. |
| `folderPath` | string | — | Absolute path to a folder (recursive). |
| `projectPath` | string | — | Absolute path to an AL project folder. |
| `severities` | string[] | All severities | Filter by severity: `"error"`, `"warning"`, `"info"`, `"hint"`. |
| `areas` | string[] | All areas | Filter by diagnostic source area. |
| `limit` | integer | `200` | Maximum number of diagnostics to return. Maximum allowed value: `500`. |

## Return value

### Visual Studio Code

The response includes:

| Property | Type | Description |
|----------|------|-------------|
| `diagnostics` | array | List of diagnostic items (see below). |
| `counts` | object | Summary counts: `total`, `error`, `warning`, `info`, `hint`. |
| `truncated` | boolean | `true` if there are more diagnostics than the specified `limit`. |

Each item in `diagnostics` has:

| Property | Type | Description |
|----------|------|-------------|
| `uri` | string | File URI. |
| `path` | string | File system path. |
| `severity` | string | `"error"`, `"warning"`, `"info"`, or `"hint"`. |
| `message` | string | Human-readable diagnostic message. |
| `source` | string | Diagnostic source (for example, `"AL"`, `"AppSourceCop"`). |
| `code` | string | Diagnostic code (for example, `"AL0118"`). |
| `range` | object | Start and end position in the file: `{ start: { line, character }, end: { line, character } }`. |
| `relatedInformation` | array | Extra context, when `includeRelatedInformation: true`. |

### AL MCP Server

Each item in `diagnostics` has: `file`, `severity`, `message`, `code`, and a location string (file and line number).

## Examples

### Get all errors in the workspace (Visual Studio Code)

In Copilot Chat: *"Show me all errors in the project."*

Copilot calls `al_getdiagnostics` with `scope="project"` and `severities=["error"]`.

### Check for AppSourceCop violations (Visual Studio Code)

```json
{
  "severities": ["error", "warning"],
  "areas": ["AppSourceCop"]
}
```

### Get errors in a specific file (Visual Studio Code)

```json
{
  "scope": "file",
  "filePath": "C:/repos/MyExtension/src/CustomerCard.Page.al",
  "severities": ["error"]
}
```

### Get all diagnostics for a project (AL MCP)

```json
{
  "projectPath": "C:/repos/MyExtension"
}
```

### Get only errors in a folder (AL MCP)

```json
{
  "folderPath": "C:/repos/MyExtension/src",
  "severities": ["error"]
}
```

### Check AppSourceCop violations with a high limit (AL MCP)

```json
{
  "projectPath": "C:/repos/MyExtension",
  "areas": ["AppSourceCop"],
  "limit": 500
}
```

## Suggested next steps

| Outcome | Suggested action |
|---------|-----------------|
| No errors | Proceed with [`al_publish`](al-tool-publish.md) to deploy the extension. |
| Errors reported | Fix the reported issues and rebuild with [`al_build`](al-tool-build.md). |
| Many analyzer warnings | Review the list and configure or suppress individual rules as appropriate. |

## Related tools

- [`al_build`](al-tool-build.md) — Build the project; errors are returned in the build result and also appear in diagnostics.
- [`al_compile`](al-tool-compile.md) — Compile without building; faster validation (AL MCP only).
- [`al_symbolsearch`](al-tool-symbol-search.md) — Search for the symbol referenced in an error to understand its definition.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

