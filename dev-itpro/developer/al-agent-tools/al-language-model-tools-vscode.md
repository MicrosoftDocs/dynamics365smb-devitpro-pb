---
title: AL Language Model Tools for Visual Studio Code
description: Learn about the AL Language Model Tools available for AL development, including how to use them in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# AL Language Model tools for Visual Studio Code

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)]

The AL Language extension registers a set of Language Model Tools with the Visual Studio Code Language Model Tools API. These tools are available to GitHub Copilot in Agent mode and to any Copilot-compatible extension running inside Visual Studio Code. They allow an AI agent to perform core AL development tasks—building, publishing, downloading symbols, searching symbols, reading diagnostics, and debugging—directly from a conversation.

## Available tools

| Tool | Description |
|------|-------------|
| [`al_build`](al-tool-build.md) | Build the AL project and generate the `.app` package. |
| [`al_publish`](al-tool-publish.md) | Publish the extension to Business Central. |
| [`al_downloadsymbols`](al-tool-download-symbols.md) | Download dependent symbol packages from the configured BC server or global sources. |
| [`al_symbolsearch`](al-tool-symbol-search.md) | Search AL symbols across the project and its dependencies. |
| [`al_getdiagnostics`](al-tool-get-diagnostics.md) | Retrieve compilation diagnostics from the Problems panel. |
| [`al_debug`](al-tool-debug.md) | Start a debug session without republishing. |
| [`al_setbreakpoint`](al-tool-debug.md#al_setbreakpoint--set-or-remove-a-breakpoint) | Add, remove, or toggle a breakpoint at a specific file and line. |
| `al_snapshotdebugging` | Manage snapshot debugging sessions. |

## Using tools in Copilot Chat

When GitHub Copilot is in Agent mode, it can invoke AL tools automatically in response to natural-language requests. You can also reference a specific tool explicitly by prefixing its name with `#` in the chat input:

```
#al_build
#al_symbolsearch
#al_getdiagnostics
```

### Example prompts

| Your prompt | What happens |
|-------------|--------------|
| *"Build my AL project."* | Copilot calls `al_build` with `scope="current"`. |
| *"Build everything in the workspace."* | Copilot calls `al_build` with `scope="all"`. |
| *"Publish my extension to my sandbox."* | Copilot calls `al_publish` using connection details from `launch.json`. |
| *"Download symbols."* | Copilot calls `al_downloadsymbols`. |
| *"Find all codeunits related to posting."* | Copilot calls `al_symbolsearch` with `query="posting"` and `kinds=["Codeunit"]`. |
| *"Show me all errors in the project."* | Copilot calls `al_getdiagnostics` with `scope="project"` and `severities=["error"]`. |
| *"Start debugging without republishing."* | Copilot calls `al_debug`. |
| *"Set a breakpoint on line 42 of CustomerMgt.Codeunit.al."* | Copilot calls `al_setbreakpoint` with `lineNumber=42` and `action="add"`. |
| *"Start snapshot debugging."* | Copilot calls `al_snapshotdebugging` with `action="initialize"`. |

## Tool chaining

Copilot can chain AL tools automatically in a single conversation turn. For example:

- If `al_build` reports errors, Copilot might call `al_getdiagnostics` to retrieve the full list, suggest code fixes, rebuild, and then publish—all without further prompting.
- If you ask Copilot to investigate a bug, it might call `al_symbolsearch` to locate the relevant code, set a breakpoint with `al_setbreakpoint`, and then start debugging with `al_debug`.

This behavior is guided by workflow chains that the AL Language Server defines for each tool. The chains describe likely next steps after success or failure, enabling Copilot to make coherent, multi-step decisions.

## Connection settings

The Visual Studio Code tools read connection settings from the active `launch.json` configuration in your workspace. You don't need to specify server URLs, tenant IDs, or authentication parameters in the chat—Copilot derives them from your workspace configuration.

To target a different environment, update `launch.json` or switch the active launch configuration in Visual Studio Code before invoking the tool.

## Downloading symbols from global sources

The `al_downloadsymbols` tool supports a `globalSourcesOnly` option that downloads Microsoft platform and base application symbols from Microsoft NuGet feeds and AppSource without requiring a connection to a live Business Central server. This is useful when:

- You're working offline.
- You want to build without configuring a server connection.
- You're running in a CI environment where a BC server isn't available.

To use this in Copilot Chat: *"Download symbols from global sources only."*

## Prerequisites

- The AL Language extension version 17.0 or later must be installed in Visual Studio Code.
- GitHub Copilot must be installed and signed in.
- Your workspace must contain a valid AL project with an `app.json` file.
- A `launch.json` configuration is required for tools that connect to a Business Central server (`al_publish`, `al_downloadsymbols` without `globalSourcesOnly`).

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  
[al_build](al-tool-build.md)  
[al_publish](al-tool-publish.md)  
[al_downloadsymbols](al-tool-download-symbols.md)  
[al_symbolsearch](al-tool-symbol-search.md)  
[al_getdiagnostics](al-tool-get-diagnostics.md)  
[al_debug, al_setbreakpoint, al_snapshotdebugging](al-tool-debug.md)  
