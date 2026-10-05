---
title: Search AL symbols - al_symbolsearch
description: Learn about the al_symbolsearch tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 10/02/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Search AL symbols - al_symbolsearch

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_symbolsearch` tool searches AL symbols; objects such as tables, codeunits, pages, reports, enumerations, and interfaces, as well as their members such as fields, methods, keys, actions, and triggers, across the active project and all referenced dependencies, or across the AL objects installed on a connected Business Central environment. Results come from the AL Language Server, which ensures that the search is workspace-aware and reflects the current compilation state.

Use this tool to explore the AL symbol space, discover available APIs, audit object usage, or understand what fields and methods an object exposes.

> [!NOTE]
> The AL MCP Server accepts `query` and `filters` either at the top level or under a `parameters` key. The examples in this article use the `parameters` wrapper for compatibility with existing clients.

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
| `scope` | string | Limit the search scope to `"project"` (current project only), `"dependencies"` (referenced packages only), or `"all"` (both). Default: `"all"`. Ignored when `source` is `"environment"`. |
| `source` | string | Specify where to search for symbols. `"workspace"` (default) searches the local project and its dependencies (see `scope`). `"environment"` searches the AL objects installed on the connected Business Central environment. Requires AL Language extension version 18.0 or later. |
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
| `appId` | string | Environment search only. The ID (GUID) of the app - an installed extension or per-tenant customization - that owns the symbol on the connected environment. Not present for workspace results. |
| `appName` | string | Environment search only. The owning app's name. |
| `appPublisher` | string | Environment search only. The owning app's publisher. |
| `appVersion` | string | Environment search only. The owning app's version. |

The response also includes a `truncated` boolean flag. When `true`, there are more results than the specified `limit`; narrow your search to see all matches.

## Searching the connected environment

> [!NOTE]
> Environment search (`filters.source = "environment"`) requires AL Language extension version 18.0 or later.

By default (`filters.source = "workspace"`), `al_symbolsearch` searches only your local project and its downloaded symbols. Set `filters.source = "environment"` to search the AL objects actually installed on the connected Business Central environment instead—Base Application, System Application, and any installed apps or per-tenant extensions on the tenant. This method finds objects that exist on the environment even when they aren't yet a dependency in your project or downloaded to `.alpackages`.

Each match from an environment search includes the owning app's identity: `appId`, `appName`, `appPublisher`, and `appVersion`. Use these values to add the missing dependency to `app.json` and call [`al_downloadsymbols`](al-tool-download-symbols.md) before referencing the object in code.

When a workspace (local) search finds nothing, the tool appends a hint suggesting a retry with `filters.source = "environment"`, since the object might be installed on the tenant rather than defined locally.

Environment search requires a connection to a Business Central environment:

- **Visual Studio Code** resolves the connection from the active `launch.json` configuration, the same way [`al_publish`](al-tool-publish.md) does.
- **AL MCP Server** resolves the connection from `BC_SERVER_URL` and `BC_SERVER_INSTANCE`, or from a project's `launch.json`, the same way other connected AL MCP tools do. Call [`al_auth_login`](al-tool-auth.md#al_auth_login) first for cloud environments.

If no connection is configured, the tool returns a clear, non-throwing error instead of failing the turn—retry with `filters.source = "workspace"` to search the local project instead.

> [!NOTE]
> The legacy `filters.scope = "environment"` value is still accepted as an alias for `filters.source = "environment"`. Use `source` in new code.

## Visual Studio Code examples

In Copilot Chat, you can describe what you are looking for in natural language:

- *"Find all codeunits related to posting."*
  Copilot calls `al_symbolsearch` with `query="posting"` and `filters.kinds=["Codeunit"]`.

- *"Show me the fields on the Customer table."*
  Copilot calls `al_symbolsearch` with `query="*"`, `filters.objectName="Customer"`, and `filters.memberKinds=["Field"]`.

- *"Are there any public interfaces in my project?"*
  Copilot calls `al_symbolsearch` with `query="*"`, `filters.kinds=["Interface"]`, `filters.scope="project"`, and `filters.access=["Public"]`.

- *"Is there a Loyalty Program table installed on my sandbox environment?"*
  Copilot calls `al_symbolsearch` with `query="Loyalty Program"`, `filters.kinds=["Table"]`, and `filters.source="environment"`—resolving the connection from your active `launch.json`—and reports the owning app if it finds a match.

## AL MCP Server examples

The following AL MCP examples use the supported `parameters` wrapper:

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

### Search the connected environment

Requires a resolvable connection (from `BC_SERVER_URL`/`BC_SERVER_INSTANCE` or the project's `launch.json`); call [`al_auth_login`](al-tool-auth.md#al_auth_login) first for cloud environments.

```json
{
  "parameters": {
    "query": "Loyalty Program",
    "filters": {
      "kinds": ["Table"],
      "source": "environment"
    }
  }
}
```

A match returns the owning app's identity alongside the usual symbol fields:

```json
{
  "succeeded": true,
  "symbols": [
    {
      "id": "50100",
      "name": "Loyalty Program",
      "kind": "Table",
      "appId": "00001111-aaaa-2222-bbbb-3333cccc4444",
      "appName": "Loyalty Management",
      "appPublisher": "Contoso",
      "appVersion": "1.2.0.0"
    }
  ],
  "truncated": false
}
```

Add `appId`, `appName`, `appPublisher`, and `appVersion` to `app.json` `dependencies`, then call [`al_downloadsymbols`](al-tool-download-symbols.md) before referencing the object.

## Related tools

- [`al_getdiagnostics`](al-tool-get-diagnostics.md) — Get compilation errors and warnings.
- [`al_getpackagedependencies`](al-tool-get-package-dependencies.md) — List the packages available in the symbol search scope (AL MCP only).
- [`al_downloadsymbols`](al-tool-download-symbols.md) — Download symbols for a dependency discovered through environment search.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  
