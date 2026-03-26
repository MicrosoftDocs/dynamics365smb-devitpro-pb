---
title: Compile AL project - al_compile
description: Learn about the al_compile tool available for AL development, including how to use it in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Compile AL project - al_compile

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: AL MCP Server only

The `al_compile` tool compiles the AL workspace and returns diagnostics **without** generating an `.app` package. Because it skips the packaging step, it's faster than [`al_build`](al-tool-build.md) and is the preferred choice for validation-only scenarios such as pull-request checks, precommit gates, and quick iterative feedback loops.

Use [`al_build`](al-tool-build.md) instead when you need the `.app` file—for example, before publishing.

> [!NOTE]
> `al_compile` is available on the AL MCP Server only. In Visual Studio Code, use `al_build` with `scope="current"` for an equivalent result.

## Parameters

All parameters are optional and are passed as properties of a single options object.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `onlyErrors` | boolean | `true` | When `true` (the default), only error-severity diagnostics are returned. Set to `false` to also receive warnings, informational messages, and hints. |
| `maxDiagnosticsPerCompilation` | integer | `100` | Maximum number of diagnostics to return per compilation. Increase this value if you expect a large number of issues. |
| `enableCodeAnalysis` | boolean | (server default) | Enable AL code analyzers during compilation. When enabled, the analyzers listed in `codeAnalyzers` are run. |
| `codeAnalyzers` | string[] | (server default) | List of code analyzers to run. Supported values: `${CodeCop}`, `${AppSourceCop}`, `${PerTenantExtensionCop}`, `${UICop}`. |

## Return value

The tool returns a compilation result object with the following properties:

| Property | Type | Description |
|----------|------|-------------|
| `Succeeded` | boolean | `true` if the compilation completed with no errors. |
| `Diagnostics` | array | List of diagnostic items. Each item contains `Severity`, `Code` (for example, `AL0118`), `Location` (file and line), and `Description` (human-readable message). |
| `Message` | string | Optional extra context about the compilation result. |

## Examples

### Validate the current workspace (errors only)

```json
{}
```

The default behavior returns only errors, which is suitable for pass/fail gates.

### Validate with all diagnostics and code analysis

```json
{
  "onlyErrors": false,
  "enableCodeAnalysis": true,
  "codeAnalyzers": ["${CodeCop}", "${AppSourceCop}"]
}
```

### Limit output in a large workspace

```json
{
  "maxDiagnosticsPerCompilation": 50
}
```

## Diagnostics format

Each item in the `Diagnostics` array has the following structure:

```json
{
  "Severity": "Error",
  "Code": "AL0118",
  "Location": "MyCodeunit.al(42,15)",
  "Description": "The name 'MyVariable' does not exist in the current context."
}
```

## Suggested next steps

| Outcome | Suggested action |
|---------|-----------------|
| No errors | Proceed with [`al_build`](al-tool-build.md) to generate the `.app` package. |
| Errors reported | Fix the reported issues and rerun `al_compile`. |
| Symbols not found | Run [`al_downloadsymbols`](al-tool-download-symbols.md) to refresh the symbol packages. |

## Related tools

- [`al_build`](al-tool-build.md) — Build and produce an `.app` package (both surfaces).
- [`al_getdiagnostics`](al-tool-get-diagnostics.md) — Retrieve diagnostics with richer filtering options.
- [`al_downloadsymbols`](al-tool-download-symbols.md) — Download symbol packages before compiling.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

