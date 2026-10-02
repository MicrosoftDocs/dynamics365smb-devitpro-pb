---
title: Get next object ID - al_getnextobjectid
description: Learn about the al_getnextobjectid tool for AL development and how to use it in Visual Studio Code and the AL MCP Server to allocate free object IDs.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 09/29/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Get next object ID - al_getnextobjectid

[!INCLUDE [2026rw2-later-al-ext](../includes/2026rw2-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_getnextobjectid` tool returns the next available AL object ID (or IDs) for a given object type in the current AL project. Call it immediately before scaffolding a new object - table, page, codeunit, report, query, XML port, enum, permission set, or one of the matching `*Extension` types - so the generated code uses an ID that doesn't collide with anything already declared in the project. This approach removes the need for an agent to read the `app.json` file and scan existing objects manually.

The scan is syntax-only and scoped to the active project: the tool doesn't detect IDs declared in installed app dependencies or in other extensions published to the same development sandbox. The tool always returns an advisory warning describing this limitation - and surfaces it to the user when relevant.

> [!IMPORTANT]
> This tool doesn't reserve IDs. Two consecutive calls without persisting a new object in between return the same ID. Save the newly created object (or request a larger `count`) before calling the tool again.

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `objectType` | string | Yes | The AL object type to allocate an ID for. Case-insensitive. One of: `Table`, `Page`, `Codeunit`, `Report`, `Query`, `XmlPort`, `Enum`, `EnumExtension`, `PageExtension`, `TableExtension`, `ReportExtension`, `PermissionSet`, `PermissionSetExtension`. If you pass an unsupported value, the error message lists every supported value. |
| `count` | integer | No | Number of free IDs of the same `objectType` to return. Default `1`, maximum `50`. Use this parameter when scaffolding several objects of the same kind in one turn. To allocate IDs for multiple object types, call the tool once per type. |
| `rangeStart` | integer | No | Lower bound of an explicit range to allocate within. Must be specified together with `rangeEnd`. The requested range is intersected with the project's `idRanges` from `app.json`. |
| `rangeEnd` | integer | No | Upper bound of an explicit range to allocate within. Must be specified together with `rangeStart`. |
| `projectPath` | string | No | Filesystem path or `app.json` path of the AL project to allocate within. Required when multiple AL projects are loaded; defaults to the only loaded project otherwise. |

When you omit `rangeStart` and `rangeEnd`, the tool searches the full set of `idRanges` declared in the project's `app.json`. If a project declares no `idRanges` (or falls back to the compiler's universal default range), the tool returns an error because allocating from the entire integer space is unsafe.

## Return value

| Property | Type | Description |
|----------|------|-------------|
| `succeeded` | boolean | `true` only when the requested `count` of IDs is fully satisfied. A short allocation (fewer IDs available than requested) is reported as a failure so an agent doesn't silently scaffold fewer objects than intended. |
| `message` | string | Human-readable status. Set on failure, and on a partial allocation that still returns some IDs. |
| `objectType` | string | Echoes back the resolved object type. |
| `ids` | integer[] | The free, in-range IDs returned to the caller, in ascending order (not guaranteed to be contiguous). Contains the valid prefix when fewer IDs were available than requested. |
| `ranges` | array | The ID ranges searched, after intersecting the project's `idRanges` with any `rangeStart`/`rangeEnd` override. Each item has `start` and `end` (inclusive). |
| `outOfRange` | boolean | `true` when the project's ranges didn't contain enough free IDs to satisfy the requested `count`. |
| `nextOutOfRangeId` | integer | When `outOfRange` is `true`, the next ID past the configured ranges. `null` otherwise. |
| `warnings` | string[] | Non-fatal advisories, such as the project-syntax-only scan scope. Always returned on success. |

## Visual Studio Code examples

In Copilot Chat, you can describe what you're scaffolding in natural language:

- *"I need a new codeunit for posting loyalty points—what ID should I use?"*
  Copilot calls `al_getnextobjectid` with `objectType="Codeunit"`, then scaffolds the codeunit using the returned ID.

- *"Find three table IDs so I can create the loyalty program tables."*
  Copilot calls `al_getnextobjectid` with `objectType="Table"` and `count=3`.

- *"Find a free page extension ID in the 50100-50149 range."*
  Copilot calls `al_getnextobjectid` with `objectType="PageExtension"`, `rangeStart=50100`, and `rangeEnd=50149`.

## AL MCP Server examples

Pass the `al_getnextobjectid` arguments directly at the top level.

### Allocate a single codeunit ID

```json
{
  "objectType": "Codeunit"
}
```

Example response:

```json
{
  "succeeded": true,
  "objectType": "Codeunit",
  "ids": [50100],
  "ranges": [{ "start": 50100, "end": 50149 }],
  "outOfRange": false,
  "nextOutOfRangeId": null,
  "warnings": [
    "Scope is project syntax only; IDs declared in installed app dependencies or other extensions published to the same dev sandbox are not detected."
  ]
}
```

### Allocate several table IDs in one call

```json
{
  "objectType": "Table",
  "count": 3
}
```

### Allocate within an explicit range

```json
{
  "objectType": "PageExtension",
  "rangeStart": 50100,
  "rangeEnd": 50149
}
```

### Allocate in a specific project (multi-project workspace)

```json
{
  "objectType": "Table",
  "projectPath": "C:/repos/MyExtension"
}
```

## Suggested next steps

- Persist the new object using the returned ID, then call [`al_build`](al-tool-build.md) or [`al_compile`](al-tool-compile.md) to confirm it compiles cleanly.
- Call [`al_symbolsearch`](al-tool-symbol-search.md) with `filters.source="environment"` to check whether an object with the same purpose already exists on the connected environment before scaffolding a new one.
- If `outOfRange` is `true`, expand `idRanges` in `app.json` or request a smaller `count`.

## Related tools

- [`al_symbolsearch`](al-tool-symbol-search.md) — Search existing symbols before allocating a new object ID.
- [`al_getdiagnostics`](al-tool-get-diagnostics.md) — Get compilation errors and warnings after scaffolding the new object.
- [`al_build`](al-tool-build.md) — Build the project to verify the new object compiles.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL Language Model Tools for Visual Studio Code](al-language-model-tools-vscode.md)  
[AL MCP Server reference](al-mcp-server.md)  
