---
title: Search AL symbols - al_symbolsearch
description: Learn about the al_symbolsearch tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Search AL symbols - al_symbolsearch

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_symbolsearch` tool searches AL symbols—objects such as tables, codeunits, pages, reports, enumerations, and interfaces, as well as their members such as fields, methods, keys, actions, and triggers—across the active project and all referenced dependencies. Results come from the AL Language Server, which ensures that the search is workspace-aware and reflects the current compilation state.

Use this tool to explore the AL symbol space, discover available APIs, audit object usage, or understand what fields and methods an object exposes.

> [!NOTE]
> In the AL MCP Server, all search parameters must be wrapped under a `parameters` key. See the [AL MCP examples](#al-mcp-server-examples) section.

## Parameters

The tool accepts a `query` string and an optional `filters` object.

### `query`

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `query` | string | Yes | The search term. Use `"*"` to match all symbols. Supports partial name matching. |

### `filters`

All filter properties are optional.

| Property | Type | Description |
|----------|------|-------------|
| `kinds` | string[] | Restrict results to specific object types: `"Table"`, `"Codeunit"`, `"Page"`, `"Report"`, `"Enum"`, `"Interface"`, and others. |
| `objectName` | string | Search for members inside a specific object. For example, set `objectName: "Customer"` to search within the Customer table. |
| `memberKinds` | string[] | Restrict member results to specific member types: `"Field"`, `"Method"`, `"Key"`, `"Action"`, `"Trigger"`. |
| `namespace` | string | Restrict results to a specific namespace. |
| `access` | string[] | Filter by accessibility: `"Public"`, `"Internal"`. |
| `obsoleteState` | string[] | Filter by obsolete state: `"No"`, `"Pending"`, `"Removed"`. By default, obsolete symbols are included. |
| `match` | string | Where to apply the query: `"name"` (default), `"doc"` (documentation summary), or `"all"`. |
| `scope` | string | Limit the search scope: `"project"` (current project only), `"dependencies"` (referenced packages only), or `"all"` (both). Default: `"all"`. |
| `limit` | integer | Maximum number of results to return. Maximum allowed value: `200`. |

## Return value

The tool returns a `symbols` array. Each item in the array has the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `id` | string | Unique identifier for the symbol. |
| `name` | string | Symbol name. |
| `fullName` | string | Fully qualified name including namespace. |
| `kind` | string | Symbol kind (for example, `"Table"`, `"Field"`, `"Codeunit"`). |
| `namespace` | string | Namespace of the symbol. |
| `containerName` | string | Name of the containing object (for member symbols). |
| `signature` | string | For methods and procedures: the full signature. |
| `docSummary` | string | Documentation summary from the XML doc comment, if available. |
| `path` | string | File path where the symbol is defined. |

The response also includes a `truncated` boolean flag. When `true`, there are more results than the specified `limit`; narrow your search to see all matches.

## Visual Studio Code examples

In Copilot Chat, you can describe what you are looking for in natural language:

- *"Find all codeunits related to posting."*
  Copilot calls `al_symbolsearch` with `query="posting"` and `filters.kinds=["Codeunit"]`.

- *"Show me the fields on the Customer table."*
  Copilot calls `al_symbolsearch` with `query="*"`, `filters.objectName="Customer"`, and `filters.memberKinds=["Field"]`.

- *"Are there any public interfaces in my project?"*
  Copilot calls `al_symbolsearch` with `query="*"`, `filters.kinds=["Interface"]`, `filters.scope="project"`, and `filters.access=["Public"]`.

## AL MCP Server examples

In AL MCP, wrap all parameters under a `parameters` key:

### Find objects by name

```json
{
  "parameters": {
    "query": "Customer",
    "filters": {
      "kinds": ["Table"],
      "scope": "all"
    }
  }
}
```

### List all fields on the Customer table

```json
{
  "parameters": {
    "query": "*",
    "filters": {
      "objectName": "Customer",
      "memberKinds": ["Field"]
    }
  }
}
```

### Search for posting-related codeunits in the project

```json
{
  "parameters": {
    "query": "Post",
    "filters": {
      "kinds": ["Codeunit"],
      "scope": "project"
    }
  }
}
```

### Find all public procedures inside a specific codeunit

```json
{
  "parameters": {
    "query": "*",
    "filters": {
      "objectName": "Sales-Post",
      "memberKinds": ["Method"],
      "access": ["Public"]
    }
  }
}
```

### Exclude obsolete symbols

```json
{
  "parameters": {
    "query": "Balance",
    "filters": {
      "objectName": "Customer",
      "obsoleteState": ["No"]
    }
  }
}
```

## Related tools

- [`al_getdiagnostics`](al-tool-get-diagnostics.md) — Get compilation errors and warnings.
- [`al_getpackagedependencies`](al-tool-get-package-dependencies.md) — List the packages available in the symbol search scope (AL MCP only).

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  
