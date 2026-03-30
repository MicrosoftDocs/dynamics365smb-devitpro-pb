---
title: Debugging tools - al_debug, al_setbreakpoint, al_snapshotdebugging
description: Learn about the debugging tools available for AL development, including how to use them in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Debugging tools - al_debug, al_setbreakpoint, al_snapshotdebugging

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code only

Three tools support debugging AL extensions inside Visual Studio Code. All three are available only in Visual Studio Code (not in the AL MCP Server), because they interact directly with the Visual Studio Code debugger and Problems panel.

---

## al_debug — Start a debug session

The `al_debug` tool starts a debug session that attaches to an already-published AL extension without triggering a new publish. This is equivalent to the **Start Without Publishing** action in Visual Studio Code.

Use this tool when your extension is already deployed and you want to attach the debugger to investigate a specific issue without the overhead of a full publish.

### Parameters

None.

### Return value

A message string indicating that the debug session started, or an error message if the operation failed.

### Example

In Copilot Chat: *"Start debugging without republishing."*

Copilot calls `al_debug`. If no debug configuration is active, Visual Studio Code prompts you to select one.

## al_setbreakpoint — Set or remove a breakpoint

The `al_setbreakpoint` tool programmatically adds, removes, or toggles a breakpoint at a specific line in an AL source file. This lets an agent set targeted breakpoints as part of an automated debugging workflow—for example, after analyzing an error to determine exactly where execution should pause.

### Parameters

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| `filePath` | string | — | Yes | Absolute path to the `.al` file where the breakpoint should be placed. |
| `lineNumber` | integer | — | Yes | The line number (1-based) at which to set the breakpoint. |
| `action` | `"toggle"` \| `"add"` \| `"remove"` | `"toggle"` | No | The action to perform: `"add"` creates the breakpoint unconditionally, `"remove"` deletes it, `"toggle"` adds it if absent or removes it if present. |

### Return value

A string describing the outcome (for example, `"Breakpoint added at line 42 in CustomerMgt.Codeunit.al"`).

### Examples

**Set a breakpoint at line 42 (Copilot Chat):**
*"Set a breakpoint on line 42 of CustomerMgt.Codeunit.al."*

Copilot calls `al_setbreakpoint` with `action="add"` and `lineNumber=42`.

**Remove a breakpoint:**
```json
{
  "filePath": "C:/repos/MyExtension/src/CustomerMgt.Codeunit.al",
  "lineNumber": 42,
  "action": "remove"
}
```

**Toggle a breakpoint:**
```json
{
  "filePath": "C:/repos/MyExtension/src/CustomerMgt.Codeunit.al",
  "lineNumber": 100,
  "action": "toggle"
}
```

## al_snapshotdebugging — Manage snapshot debugging sessions

The `al_snapshotdebugging` tool manages snapshot debugging sessions. Snapshot debugging lets you capture execution traces from live environments — including production — without interrupting users or requiring a connected debug session. After the snapshot is collected, you can step through the recorded execution offline.

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `action` | `"initialize"` \| `"finish"` \| `"view"` | Yes | The action to perform: `"initialize"` starts a new snapshot capture, `"finish"` ends the current capture and saves the trace, `"view"` opens the Snapshots view in Visual Studio Code to inspect recorded traces. |

### Return value

A command result object or a string indicating success or failure.

### Examples

**Start a snapshot capture:**
```json
{
  "action": "initialize"
}
```

**End the capture:**
```json
{
  "action": "finish"
}
```

**Open the snapshots view:**

In Copilot Chat: *"Show me the captured snapshots."*

Copilot calls `al_snapshotdebugging` with `action="view"`.

### Snapshot debugging workflow

1. Call `al_snapshotdebugging` with `action="initialize"` to start capturing.
2. Reproduce the scenario you want to investigate in Business Central.
3. Call `al_snapshotdebugging` with `action="finish"` to stop the capture and save the trace.
4. Call `al_snapshotdebugging` with `action="view"` to open the trace in Visual Studio Code and step through the recorded execution.

## Related tools

- [`al_publish`](al-tool-publish.md) — Deploy the extension before starting a debug session.
- [`al_getdiagnostics`](al-tool-get-diagnostics.md) — Review compilation errors to identify where to set breakpoints.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

