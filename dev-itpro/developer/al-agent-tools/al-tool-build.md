---
title: Build AL project - al_build
description: Learn about the al_build tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Build AL project - al_build

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: Visual Studio Code, AL MCP Server

The `al_build` tool compiles AL source code and generates a deployable `.app` package. It supports building a single project or the entire workspace including the full dependency tree, and returns detailed diagnostics on completion.

Use `al_build` when you need the `.app` file—for example, before publishing. If you only need to validate your code without producing an output package, use [`al_compile`](al-tool-compile.md) (AL MCP only), which is faster.

## Parameters

### Visual Studio Code

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `scope` | `"current"` \| `"all"` | `"current"` | `"current"` builds the active project only. `"all"` builds the entire workspace in dependency order, producing one `.app` per project. |

### AL MCP Server

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| `scope` | `"current"` \| `"all"` | `"current"` | No | `"current"` builds the active project; `"all"` builds the full workspace in dependency order. |
| `projectPath` | string | First project in workspace | No | Absolute path to the AL project folder that contains `app.json`. Required when the workspace contains multiple projects and you want to build a specific one. |
| `outputPath` | string | Project output folder | No | Destination directory for the generated `.app` file. If omitted, the default output directory configured in `app.json` is used. |
| `onlyErrors` | boolean | `false` | No | When `true`, only error-severity diagnostics are returned. Warnings, informational messages, and hints are suppressed. |
| `maxDiagnostics` | integer | `100` | No | Maximum number of diagnostics to return. Use a higher value if you expect a large number of issues. |
| `enableCodeAnalysis` | boolean | (server default) | No | Enable AL code analyzers during the build. When enabled, the analyzers specified in `codeAnalyzers` are run. |
| `codeAnalyzers` | string[] | (server default) | No | List of code analyzers to run. Supported values: `${CodeCop}`, `${AppSourceCop}`, `${PerTenantExtensionCop}`, `${UICop}`. |

## Return value

On success, the tool creates the `.app` file in the output directory and returns a result that includes:

- A success indicator.
- A list of diagnostics (errors, warnings, and so on) up to `maxDiagnostics`.

On failure, the tool returns a list of diagnostics describing what prevented the build from completing.

> [!NOTE]
> The `.app` file is only created when the build succeeds with no errors. A build that produces warnings still generates the `.app` file.

## Prerequisites

- The AL project folder must contain a valid `app.json` file.
- Required symbol packages must be available in the `.alpackages` folder. If they're missing, run [`al_downloadsymbols`](al-tool-download-symbols.md) first.

## Examples

### Build the active project (Visual Studio Code or AL MCP)

```json
{
  "scope": "current"
}
```

### Build all projects in the workspace

```json
{
  "scope": "all"
}
```

### Build with code analysis and error-only output (AL MCP)

```json
{
  "scope": "current",
  "onlyErrors": true,
  "enableCodeAnalysis": true,
  "codeAnalyzers": ["${CodeCop}", "${AppSourceCop}"]
}
```

### Build a specific project to a custom output path (AL MCP)

```json
{
  "projectPath": "C:/repos/MyExtension",
  "outputPath": "C:/build/output"
}
```

## Suggested next steps

| Outcome | Suggested action |
|---------|-----------------|
| Build succeeded | Call [`al_publish`](al-tool-publish.md) to deploy the extension to Business Central. |
| Build failed with diagnostics | Call [`al_getdiagnostics`](al-tool-get-diagnostics.md) for the full diagnostic list, fix the reported issues, and rebuild. |
| Symbols not found | Call [`al_downloadsymbols`](al-tool-download-symbols.md) and then retry. |

## Related tools

- [`al_compile`](al-tool-compile.md) — Validate code without generating an `.app` (AL MCP only, faster).
- [`al_downloadsymbols`](al-tool-download-symbols.md) — Download symbol packages before building.
- [`al_getdiagnostics`](al-tool-get-diagnostics.md) — Read errors and warnings after a build.
- [`al_publish`](al-tool-publish.md) — Deploy the built `.app` to Business Central.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

