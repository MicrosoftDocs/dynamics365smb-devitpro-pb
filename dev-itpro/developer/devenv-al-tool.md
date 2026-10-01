---
title: ALTool Command-Line Reference for AL Development
author: SusanneWindfeldPedersen
description: Simplify AL extension development with ALTool. Validate code, package extensions, and integrate into CI/CD pipelines for seamless deployment.
ms.date: 09/03/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Develop AL extensions with ALTool

ALTool is a command line tool used for compiling and packaging AL extensions for [!INCLUDE [prod_short](includes/prod_short.md)]. It's useful for integration into CI/CD pipelines to automate the build and deployment process.

> [!NOTE]  
> To deploy code built using ALTool, you must sign up for a [Dynamics 365 Business Central Sandbox tenant](https://aka.ms/getsandboxforbusinesscentral).

## Key features

- **Compilation** ALTool can compile AL code into a deployable package, ensuring that it meets all necessary requirements.
- **Integration** ALTool can be integrated into CI/CD pipelines, allowing for automated validation and packaging of extensions during the development process.

## Usage

ALTool is typically used in the following scenarios:

1. **Local development** Developers can use ALTool to validate their code before they deploy it to a sandbox environment.
2. **Continuous integration** ALTool can be integrated into CI/CD pipelines to automate the validation and packaging of extensions.

## Get started

The ALTool is available through the Visual Studio Code AL Extension and can be accessed via the command line. To get started, ensure you have the AL Extension installed in Visual Studio Code.

The ALTool executable is located in the `bin` folder in a path equivalent to the following depending on your operating system:

```shell
C:\Users\<user>\.vscode\extensions\ms-dynamics-smb.al-17.0.1750311\bin\win32\altool.exe
```

> [!NOTE]
> Install the [AL Development Tools package](devenv-al-tool-package.md) as a NuGet package. It provides the `al` alias so you can run ALTool commands without specifying the full path to `altool.exe`. This option is ideal for CI/CD pipelines and automated environments where a full Visual Studio Code installation isn't needed. The examples in the next sections assume you have the tools package installed and can use the `al` alias to run ALTool commands. If you don't have the tools package installed, simply replace `al` with the full path to `altool.exe` in the examples.

## ALTool commands

To get a list of available commands, run the following command in your terminal or command prompt:

```shell
al help
```

> [!NOTE]
> Starting with Business Central 2026 release wave 2, ALTool command names are case-insensitive. For example, `al Compile` and `al compile` run the same command.

| Command                        | Description                                           |
|--------------------------------|-------------------------------------------------------|
| `compile`                      | Compile a package using `al.exe`. Learn more in [Workspace commands](#workspace-commands). |
| `workspace`                    | Workspace commands for creating, compiling, and mapping multi-project AL workspaces. Learn more in [Workspace commands](#workspace-commands). |
| `runtests`                     | Run AL test codeunits from the command line. Learn more in [Run tests](#run-tests). |
| `graph`                        | Build and query a static AL call graph across your apps. Learn more in [Graph commands](#graph-commands). |
| `launchmcpserver`              | Launches an AL Model Context Protocol (MCP) server.  |
| `launchlspserver`              | Launches an AL Language Server Protocol (LSP) server for use by autonomous AI agents and editors. Learn more in [AL LSP](#al-lsp). |
| `launchprofilingmcpproxy`      | Launches a Performance Profiling MCP proxy that lets an AI agent capture CPU profiles from a slow Business Central session. Learn more in [Performance Profiling MCP proxy](#performance-profiling-mcp-proxy). **NOTE:** This feature is available in preview with a prerelease of runtime 18 and Business Central Server version 29. |
| `launchsnapshotmcpproxy`       | Launches a Snapshot Debugging MCP proxy that lets an AI agent capture an AL snapshot from the next Business Central session that reproduces a failing scenario. For more information, see [Snapshot debugging MCP proxy](#snapshot-debugging-mcp-proxy). **NOTE:** This feature is available in preview with a prerelease of runtime 18 and Business Central Server version 29. |
| `GetPackageManifest`           | Retrieve the manifest from a `.app` file.            |
| `CreateSymbolPackage`          | Create a symbol-only package from a `.app` file.     |
| `GetLatestSupportedRuntimeVersion` | Get the latest supported AL runtime version for a platform version. |
| `help`                         | Display detailed information about a specific command. |
| `version`                      | Display version information.                         |

## Workspace commands

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

ALTool includes a set of workspace commands for working with multi-project AL workspaces. The recommended way to install the tool is via the Business Central Development Tools NuGet package, which is a .NET tool that provides the `al` command:

```bash
dotnet tool install --global Microsoft.Dynamics.BusinessCentral.Development.Tools
```

### workspace create

Creates a `.code-workspace` file by recursively searching one or more folders for AL projects (folders containing `app.json`). Each discovered project is added to the workspace with its name read from the manifest.

```bash
al workspace create my.code-workspace ./src
```

When the specified folders are themselves AL projects, only those folders are included. Otherwise, the command searches subdirectories recursively and excludes nested projects that fall under another project root.

### workspace compile

Compiles all projects in a workspace in the correct dependency order. The command reads each project's manifest to build a dependency graph, then parallelizes compilations where possible.

```bash
al workspace compile my.code-workspace
```

The following options are available:

| Option | Description |
|---|---|
| `--maxcpucount` | Maximum number of concurrent compilations. Defaults to the number of processors. |
| `--packagecachepath` | Semicolon-separated list of package cache directories. |
| `--assemblyprobingpaths` | Semicolon-separated list of assembly probing paths. |
| `--analyzers` | Built-in analyzers to run (CodeCop, AppSourceCop, PTECop, UICop). |
| `--customanalyzers` | Paths to custom analyzer assemblies. Supports absolute paths, paths relative to the workspace directory, and well-known variables (for example, `${AnalyzerFolder}/MyAnalyzer.dll`). |
| `--features` | Features to enable (LcgTranslationFile, TranslationFile, GenerateCaptions). |
| `--generatereportlayout` | Generate report layout. |
| `--define` | Preprocessor symbols to define. |
| `--sourcerepositoryurl` | Source repository URL for the workspace. |
| `--sourcecommit` | Source commit ID for the workspace. |
| `--loglevel` | Logging level. |
| `--logdirectory` | Directory to store compilation log files. |
| `--errorlogdirectory` | Directory to store a structured error log (JSON) for each project. If omitted, no error logs are written. |

> **APPLIES TO:** Business Central 2026 release wave 2 and later

When you specify `--errorlogdirectory`, `workspace compile` writes one structured error log for each project. It saves each log in that directory and names it `<project>_<timestamp>.errorLog.json`, such as `MyApp_20260615_093000.errorLog.json`. Each log captures errors, warnings, and code-analysis alerts produced while compiling the project. You can use these per-project diagnostics with external alert-tracking or reporting tools. If you omit `--errorlogdirectory`, no error logs are written.

### workspace map

Generates a Markdown file with a Mermaid dependency diagram from a workspace. The output includes a visual graph of inter-project dependencies, a project details table, and warnings for any circular dependencies detected.

```bash
al workspace map my.code-workspace
al workspace map my.code-workspace output.md
```

## Symbol-only and runtime package detection

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

ALTool now supports detecting whether an app is symbol-only and whether a package is a runtime package. These checks help tools like AL-Go determine if an extension can be published to SaaS or containers.

## Run tests

> **APPLIES TO:** Business Central 2026 release wave 2 and later

The `runtests` command runs AL test codeunits from the command line without the MCP server. Use it to run tests against a Business Central server as a CI/CD pipeline step.

```shell
al runtests [<codeunitId>] [options]
```

The optional `codeunitId` argument is the ID of the test codeunit to run (for example, `50100`). It's required unless you use `--testgroups` to run a batch of codeunits instead. The command connects to the target server, runs the specified test codeunit (or the codeunits listed in `--testgroups`), and reports the results.

The following options are available:

| Option | Description |
|---|---|
| `--testmethods <names>` | Test method names to run within the codeunit specified by `codeunitId`. Runs all methods in the codeunit if omitted. Requires `codeunitId` and can't be combined with `--testgroups`. |
| `--project <path>` | AL project folder path, used to locate `launch.json` for connection settings. |
| `--company <name>` | Company to use when running the tests (for example, `CRONUS International Ltd.`). |
| `--testgroups <path>` | Path to a JSON file that runs a batch of codeunits over a single connection. Can't be combined with the `codeunitId` argument or `--testmethods`. Learn more in [Run tests in a batch](#run-tests-in-a-batch). |
| `--raw` | Print a human-readable summary on the console instead of the default structured JSON result. Learn more in [Raw console output](#raw-console-output). |

`runtests` also accepts the shared server-connection options `--server`, `--serverinstance`, `--port`, `--environmentname`, `--environmenttype`, `--authentication`, and `--tenant`. Learn more about environment variables for headless on-premises and container connections in [Environment variables for headless connections](#environment-variables-for-headless-connections).

### Structured JSON results

By default, `runtests` writes a single structured, machine-parseable JSON document to `stdout` and keeps `stdout` free of log noise. The tool writes server messages and any interactive authentication prompts to `stderr`. This approach makes results easy to consume in CI/CD pipelines without scraping console text.

```json
{
  "succeeded": true,
  "message": "Test run completed successfully.",
  "data": {
    "success": true,
    "passed": 2,
    "failed": 0,
    "skipped": 0,
    "total": 2,
    "results": [
      {
        "codeunitId": 50100,
        "methodName": "TestPostSalesOrder",
        "status": "passed",
        "output": "",
        "durationMs": 842
      },
      {
        "codeunitId": 50100,
        "methodName": "TestPostSalesCreditMemo",
        "status": "passed",
        "output": "",
        "durationMs": 355
      }
    ]
  },
  "nextSteps": [],
  "warnings": []
}
```

| Field | Description |
|---|---|
| `succeeded` | Whether the command invocation completed as expected (for example, the connection was established and the run finished). |
| `data.success` | Whether the test run succeeded, meaning no test failed (`data.failed` is `0`). |
| `data.passed`, `data.failed`, `data.skipped`, `data.total` | Aggregate counts for the run. |
| `data.results` | Array of per-method results. Each entry has `codeunitId`, `methodName`, `status` (`passed`, `failed`, or `skipped`), `output` (test output or error message), and `durationMs`. |

The process exits with code `0` when the run succeeds (no failing tests) and `1` otherwise. You can use `runtests` to gate a CI/CD pipeline step on the exit code alone, without parsing the JSON.

### Raw console output

Pass `--raw` to get a human-readable summary instead of structured JSON: a progress line followed by a plain-text summary of the run.

```bash
al runtests 50100 --project ./MyApp --raw
```

### Run tests in a batch

Use `--testgroups <path>` to run several codeunits, each with its own subset of methods, over a single authenticated server session instead of invoking `runtests` once per codeunit. This approach avoids the per-codeunit connection cost.

```bash
al runtests --testgroups testgroups.json --project ./MyApp
```

`testgroups.json` is a JSON array where each entry pairs a codeunit with the methods to run in it:

```json
[
  {
    "codeunitId": 134001,
    "testMethods": ["MethodA", "MethodB"]
  },
  {
    "codeunitId": 134002
  }
]
```

| Property | Type | Description |
|---|---|---|
| `codeunitId` | Number | The ID of the test codeunit to run. Must be a positive integer. |
| `testMethods` | Array of strings | The methods to run in that codeunit. Optional—an empty or omitted array runs all methods in the codeunit. |

`runtests` matches property names case-insensitively. You can't combine `--testgroups` with the `codeunitId` argument or `--testmethods`. List the methods for each codeunit inside the file instead. The whole batch still produces a single structured JSON result (or, with `--raw`, a single console summary) covering every codeunit in the file.

## Environment variables for headless connections

> **APPLIES TO:** Business Central 2026 release wave 2 and later

The `runtests` and `publishapp` commands connect to a Business Central server. For cloud targets, both commands use Microsoft Entra ID authentication by default and honor any command-line options that you pass. A cloud target specifies `--environmentname` or sets `--environmenttype` to `Sandbox` or `Production`. For headless on-premises and container scenarios, both commands use the following environment variables for connection values that you don't pass explicitly:

| Environment variable | Corresponds to |
|---|---|
| `BC_SERVER_URL` | `--server` |
| `BC_SERVER_INSTANCE` | `--serverinstance` |
| `BC_SERVER_PORT` | `--port` |
| `BC_SERVER_USERNAME` | Username for `UserPassword` authentication |
| `BC_SERVER_PASSWORD` | Password for `UserPassword` authentication |

When you set both `BC_SERVER_USERNAME` and `BC_SERVER_PASSWORD` but don't pass `--authentication`, `runtests` and `publishapp` automatically select `UserPassword` authentication for an on-premises target. The commands treat the target as on-premises when either command gets a server URL or server instance from a command-line option or environment variable, or when you specify `--environmenttype OnPrem`.

Precedence, from most to least authoritative:

1. An explicit command-line option (for example, `--server`) always wins.
2. For an explicit cloud target, the commands never consult the corresponding `BC_SERVER_*` environment variables. Cloud connection values must come from the command line.
3. Otherwise, the commands use the matching `BC_SERVER_*` environment variable.
4. If no option or environment variable supplies a value, `runtests` and `publishapp` use their cloud defaults (Microsoft Entra ID authentication).

```powershell
$env:BC_SERVER_URL = "http://localhost"
$env:BC_SERVER_INSTANCE = "BC"
$env:BC_SERVER_PORT = "7049"
$env:BC_SERVER_USERNAME = "admin"
$env:BC_SERVER_PASSWORD = "<Password>"

al runtests 50100 --project ./MyApp
```

## Graph commands

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

The `graph` command builds a static **call graph** across your AL apps and lets you query how code reaches other code. For example, you can see how internal code is reached from your public API surface, or where code that you can't inspect in the debugger hands data to code that can. It extracts facts per app from AL source, stitches them into one global call graph, and lets you query and export views of that graph.

The workflow is a pipeline: **extract** the source into per-app fact shards, **stitch** the shards into one global graph, then **query** or **export** views of it.

```text
extract-all / extract-whole   (AL source  -> per-app fact shards)
        |
      stitch                  (shards      -> one global graph)
        |
        +-- query             (arbitrary reachability / paths)
        +-- export            (query subgraph -> DGML / GraphML / SARIF)
```

The following examples use the `al` alias and a convenience variable, `$out`, for the output directory.

### graph extract-all

Extracts each app under `--corpus` into its own content-hashed fact shard. This mode is fast and incremental, because it only re-extracts changed apps. However, because it compiles each app on its own, it **doesn't resolve cross-app direct calls**. Use it for fast within-app analysis.

```bash
al graph extract-all --corpus C:\source\MyApps --out "$out\shards"
```

| Option | Description |
|---|---|
| `--corpus` | Root directory of app source folders (each containing an `app.json`). Required. |
| `--out` | Output directory for the per-app fact shards. Required. |
| `--parallel` | Maximum number of concurrent extractions. Defaults to the processor count. |

### graph extract

Extracts a single app folder into one fact shard.

```bash
al graph extract --app C:\source\MyApp --out "$out\shards"
```

| Option | Description |
|---|---|
| `--app` | App source folder containing an `app.json`. Required. |
| `--out` | Output directory for the shard. Required. |

### graph extract-whole

Compiles **all** apps under the corpus root or roots together as one compilation, so cross-app calls resolve. This mode is heavier but produces a complete cross-app graph. Pass `--graph` to stitch the resulting shard straight to a graph file in one step, skipping a separate `stitch` call.

```bash
al graph extract-whole --corpus C:\source\MyApps --corpus C:\source\Dependencies --out "$out\whole" --graph "$out\graph.jsonl"
```

| Option | Description |
|---|---|
| `--corpus` | Corpus root. Repeat the option for multiple roots. Required. |
| `--out` | Output directory for the combined shard. Required. |
| `--graph` | Optional. Also stitch the shard straight to this graph file. |

### graph stitch

Merges the fact shards from a directory into one global graph, resolving cross-app, event, and interface edges. You don't need to run this command if you used `extract-whole --graph`.

```bash
al graph stitch --shards "$out\shards" --out "$out\graph.jsonl"
```

| Option | Description |
|---|---|
| `--shards` | Directory of fact shards produced by `extract`, `extract-all`, or `extract-whole`. Required. |
| `--out` | Output graph file (JSONL). Required. |

### graph query

Runs an arbitrary reachability or path query over a stitched graph and writes the result to the console. Describe the endpoints by using [node selectors](#query-syntax) and shape the traversal with filters such as `--direction` and `--depth`.

```bash
# Who calls a specific object's method?
al graph query --graph "$out\graph.jsonl" --to "obj:Codeunit/My Impl.#Create" --direction callers

# Enumerate concrete paths between two namespaces
al graph query --graph "$out\graph.jsonl" --from "ns:MyCompany.Sales*" --to "ns:MyCompany.Posting*" --paths
```

| Option | Description |
|---|---|
| `--graph` | Stitched graph file. Required. |
| `--from` | Source node selector. See [Query syntax](#query-syntax). |
| `--to` | Target node selector. |
| `--direction` | `callees`, `callers`, or `both`. Default: `callees` for `--from`, `callers` for `--to`. |
| `--edge-kinds` | Comma-separated edge kinds to traverse (`Direct`, `Event`, `Interface`, `Trigger`). |
| `--scope` | Restrict results to `cloud` or `onprem`. |
| `--depth` | Maximum traversal depth. `0` (the default) is unbounded. |
| `--paths` | Enumerate concrete `from`->`to` paths rather than just reachability. |
| `--max-paths` | Cap on enumerated paths when `--paths` is set. Defaults to `1000`. |
| `--resolved-only` | Only follow statically resolved edges, dropping over-approximated indirect edges. |
| `--frontier` | Return the *nearest* nodes matching this selector along the traversal. |
| `--exclude` | Prune nodes matching this selector from the whole query (for example, `"ns:*Test*"` to drop test code). |

### graph export

Exports a subgraph in a format you can open in a viewer. The same [node selectors](#query-syntax) and traversal filters scope the export to a consumable subgraph. If you don't use selectors, the command exports the whole graph.

```bash
# An object and its call graph (callers + callees), depth-bounded, as DGML
al graph export --graph "$out\graph.jsonl" --from "obj:Codeunit/My Impl." --direction both --depth 3 --format dgml --out "$out\my-impl.dgml"
```

`graph export` accepts the same query options as [`graph query`](#graph-query) (except `--paths`/`--max-paths` and `--scope`), plus:

| Option | Description |
|---|---|
| `--format` | `dgml`, `graphml`, or `sarif`. Defaults to `dgml`. |
| `--out` | Output export path. Required. |

Choose the format for your viewer:

| Format | Open with |
|---|---|
| `dgml` | Visual Studio (native). Renders as an interactive, collapsible tree. |
| `graphml` | yEd, Gephi, or Cytoscape. |
| `sarif` | Any SARIF viewer, Visual Studio, or GitHub code scanning. |

Exports include each node's captured source location, so you can navigate from the graph back to the `.al` file: SARIF thread-flow steps include a `physicalLocation`, DGML nodes carry a `Reference` attribute and `Line` property, and GraphML nodes carry `sourcePath` and `line` keys. These point to the local source path captured during extraction.

### Query syntax

Node selectors identify the nodes for `--from`, `--to`, `--frontier`, and `--exclude`. Combine them with these operators:

| Operator | Meaning |
|---|---|
| `,` | OR. |
| `+` | AND (binds tighter than `,`). |
| `!` or `not:` | Negates a single atom. |

For example, `access:public+app:<guid>` matches public code in a specific app, and `!debuggable` matches nodes that can't be inspected in the debugger for any reason.

Selectors are either a built-in named alias or a prefixed selector:

| Selector | Matches |
|---|---|
| `debuggable` | Nodes whose execution can be inspected in the AL debugger. Use `!debuggable` for the opposite. |
| `elevation` | Nodes that carry inherent permissions or entitlements. |
| `onprem-surface` | The OnPrem-gated boundary (`Scope('OnPrem')` symbols, OnPrem `Scope` tables, and OnPrem platform built-ins). |
| `ns:<glob>` | Namespace glob. Supports `*` and `?` wildcards. |
| `obj:<Type>/<Name>` | An object by type and name. `obj:<Name>` matches by name only. Append `#<member>` for a member, or `#` alone for the object-level node only. A bare object (no `#`) matches the object and all its members. |
| `app:<guid>` | All nodes in the app with this ID. |
| `id:<moniker>` | A single node by its symbol identity. |
| `kind:<nodeKind>` | Nodes of a kind: `Object`, `Method`, `Trigger`, `Table`, or `BuiltInMethod`. |
| `scope:<cloud\|onprem>` | Nodes by compilation scope. |
| `access:<internal\|public\|local\|protected>` | Nodes by declared accessibility. |

> [!NOTE]
> `--paths` is a capped sample: it clamps depth and stops at `--max-paths`, so a reachable target can have no emitted path. Rerun without `--paths` (an exhaustive reachability query) to confirm reachability. `--exclude` prunes matching nodes from the traversal itself, not just the result set, so a broad selector can hide a real path. Use it to focus a query, not to prove that code is unreachable.

### Example scenarios

To audit an extension's internal structure, scope any query to a single extension by using `app:<guid>` or a namespace glob. The following examples assume `$g` is your stitched graph file and `<guid>` is the app's ID from `app.json`.

**Audit your public API surface.** Find how your internal code is reached from your public surface:

```bash
al graph query --graph "$g" --from "access:public+app:<guid>" --to "access:internal+app:<guid>" --paths
```

**Find the first public entry point** that exposes a piece of internal code. `--frontier` returns the nearest matching node along the traversal:

```bash
al graph query --graph "$g" --to "access:internal+app:<guid>" --direction callers --frontier access:public
```

**Review debug exposure inside your app.** Find where code that you can't inspect in the debugger hands data to code that you can:

```bash
al graph query --graph "$g" --from "!debuggable+app:<guid>" --to "debuggable+app:<guid>" --paths
```

**Explore one object's call graph** (callers and callees), depth-bounded, and open it in Visual Studio:

```bash
al graph export --graph "$g" --from "obj:Codeunit/My Impl." --direction both --depth 3 --format dgml --out "$out\my-impl.dgml"
```

**Review elevated surfaces** in your app. Find which nodes that carry inherent permissions or entitlements are reachable from your public API:

```bash
al graph query --graph "$g" --from "access:public+app:<guid>" --to "elevation+app:<guid>" --paths
```

## ALMCP

The ALMCP (AL Model Context Protocol) server allows autonomous agents to interact with an AL workspace. It's launched via ALTool with the `launchmcpserver` command. Its usage is as follows:

```shell
al launchmcpserver [<projects>...] [options]
```

The `projects` argument is an optional space-separated list of paths to AL project folders. Wrap each path in double quotes `"`. If you omit this argument, the server starts without any projects loaded. You can add projects dynamically at runtime by using the `al_addproject` tool.

The following options are supported:

| Option                 | Description|
|------------------------|------------|
| `--port <port>`        | Port number for the HTTP server. [default: 5000] |
| `--packagecachepath <paths>` | Paths to the package cache folders. |
| `--assemblyprobingpaths <paths>` | Paths to probe for dependent assemblies. |
| `--ruleset <path>`     | Path to the ruleset file. |
| `--outfolder <path>`   | Output folder for compilation artifacts. |
| `--codeanalyzers <analyzers>` | Code analyzers to enable. |
| `--logfile <path>`     | Path to the log file. Defaults to `~/.al-mcp/almcp.log`. |
| `--loglevel <level>`   | Log level: `Debug`, `Verbose`, `Normal` (default), `Warning`, `Error`. |
| `--nolog`              | Disable logging entirely. |
| `--noauth`             | Bypass MCP-managed authentication handling. Learn more in [Headless authentication](#headless-authentication). |
| `-?, -h, --help`          | Show help and usage information |

Once the server is launched, it listens on the specified port for MCP calls and provides several tools for agents to interact with the loaded projects.

### Add projects at runtime

When the server starts without the `projects` argument, agents can call the `al_addproject` tool with the path to an AL project folder (containing an `app.json` file) to load it into the workspace. All other tools (`al_compile`, `al_build`, `al_symbolsearch`, and so on) return an actionable error if you invoke them before adding any projects.

```bash
al LaunchMcpServer --port 5000
```

### File logging

Use the `--logfile` and `--loglevel` arguments to enable file-based logging for diagnostics and troubleshooting:

```powershell
al LaunchMcpServer --port 5000 --logfile C:\logs\almcp.log --loglevel Verbose
```

If you don't specify `--logfile`, logging defaults to `~/.al-mcp/almcp.log` on Windows, Linux, and macOS. Use `--nolog` to disable logging entirely.

### Headless authentication

> **APPLIES TO:** Business Central 2026 release wave 2 and later

Pass `--noauth` to bypass the MCP server's credential lookup and interactive authentication prompting. Use this option in headless scenarios where an external process supplies authentication. For example, a CI/CD agent might already have a token or credentials configured outside the MCP server.

```bash
al LaunchMcpServer --port 5000 --noauth
```

`--noauth` only disables the server's authentication handling for publish, test, and symbol operations. It doesn't supply connection details on its own. You still need to provide the target server or environment through the usual connection configuration. Use a project's `launch.json` or the `BC_SERVER_*` environment variables described in [Environment variables for headless connections](#environment-variables-for-headless-connections).

## AL LSP

The [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/) is the contract that editors and IDEs use for code intelligence. For autonomous AI agents working with AL—whether they're answering questions about a codebase, refactoring across files, or building new extensions—an LSP server provides the same grounded semantic understanding that a human developer gets inside Visual Studio Code, without the editor itself. Instead of guessing from raw source text, an agent can ask precise questions ("where is this procedure called?", "what's the type of this record?", "what symbols does this codeunit expose?") and receive structured answers from the language server.

This is fundamentally more powerful than text-based search tools such as `grep` or regular expressions. A regular expression matches characters; it can't distinguish a procedure declaration from a comment that mentions the procedure's name, separate a `Customer` record reference from the word *Customer* in a message string, or know that two textually identical names in different namespaces refer to different symbols. The LSP server understands the language—scopes, types, accessibility, and the relationships between modules—and answers based on that, which is why agents that drive their navigation through LSP make fewer mistakes and need less context than those that fall back on text search.

This matters in real-world AL workspaces, which routinely span multiple projects (a base app plus tests, or verticals plus extensions): semantic find-references and go-to-definition that correctly follow AL-specific relationships such as `internalsVisibleTo` and `propagateDependencies` are difficult to reproduce by hand or with text search, and an agent that navigates the workspace symbolically uses far less context than one that has to read files exhaustively to compensate. Refactorings such as rename remain accurate because the server knows every reference. The result is faster, more reliable agentic workflows on AL code.

ALTool exposes this through the `launchlspserver` command. The agent or editor spawns ALTool as a child process and communicates with it over stdio using JSON-RPC. The server provides the full set of AL language features: hover, go-to-definition, completions, find-references (including across projects), document symbols, rename, formatting, inlay hints, folding ranges, and type hierarchy.

Wire ALTool into your LSP host's plugin configuration so it's invoked as:

```shell
al launchlspserver [<projects>...] [options]
```

The `projects` argument is a space-separated list of AL project folder paths. Wrap each path in double quotes `"`. When more than one project is supplied, ALTool reads each project's `app.json` and resolves the dependencies between them (including `internalsVisibleTo` and `propagateDependencies` relationships) so that find-references and other cross-project requests span every supplied project. If `<projects>` is omitted, ALTool falls back to scanning the `rootUri` from the LSP `initialize` request; that fallback suits a single-project workspace but doesn't enable cross-project resolution. The `--workspacefile` option below is an alternative source of project folders, and folders from a workspace file merge with positional projects.

The following options are supported:

| Option                 | Description |
|------------------------|-------------|
| `--packagecachepath <paths>` | Paths to the package cache folders containing the `.app` symbol packages (`System.app`, `BaseApp.app`, etc.). Optional when `al.packageCachePath` is supplied via `--settingspath` or `--workspacefile`. |
| `--assemblyprobingpaths <paths>` | Paths to probe for dependent .NET assemblies. Required when AL projects reference .NET add-ins in nonstandard locations. |
| `--ruleset <path>`     | Path to a ruleset (`.json`) file for AL code analysis. |
| `--settingspath <path>` | Path to a `settings.json` file (any Visual Studio Code scope - user, workspace, or folder) whose `al.*` keys override CLI defaults at startup. When omitted, ALTool autodiscovers `<rootUri>/.vscode/settings.json` from the LSP `initialize` request, walking ancestors. The LSP `initializationOptions.settingsPath` key from the client takes final precedence. |
| `--workspacefile <path>` | Path to a Visual Studio Code `.code-workspace` file. Its `folders` extend the projects loaded at startup (merged with the positional `<projects>` argument), and its inline `settings` block contributes `al.*` keys as workspace-level configuration. `--settingspath`, when also supplied, overrides the inline settings. |
| `--logfile <path>`     | Path to the log file. Defaults to `~/.al-mcp/almcp.log`. |
| `--loglevel <level>`   | Log level: `Debug`, `Verbose`, `Normal` (default), `Warning`, `Error`. |
| `--nolog`              | Disable logging entirely. |
| `-?, -h, --help`       | Show help and usage information. |

Configuration is layered, from least to most authoritative: CLI flags → `--workspacefile` inline settings → `--settingspath` file → autodiscovered `.vscode/settings.json` → LSP `initializationOptions`. The recognized `al.*` keys are `packageCachePath`, `assemblyProbingPaths`, `ruleSetPath`, `enableCodeAnalysis`, and `codeAnalyzers`. JSONC features (`//` comments, trailing commas) are tolerated to match the Visual Studio Code parser.

ALTool validates the supplied input. `--workspacefile` and `--settingspath` paths must exist and parse, and a package cache must be reachable (the `.app` symbol packages are required for AL LSP to provide full language intelligence). When `assemblyProbingPaths` and `ruleSetPath` are both empty, ALTool emits a warning—compilation can fail on projects that reference .NET add-ins or rely on analyzer rulesets.

Diagnostic output is written to the standard log file (`--logfile`) and mirrored to `stderr`, which the LSP host typically surfaces in its own diagnostic stream.

## Performance profiling MCP proxy

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

The `launchprofilingmcpproxy` command lets an AI agent profile a slow [!INCLUDE [prod_short](includes/prod_short.md)] session. Where `launchmcpserver` and `launchlspserver` operate on a local AL workspace, this command connects *out* to a running Business Central environment and exposes the platform's [scheduled performance profiler](/dynamics365/business-central/dev-itpro/administration/scheduled-performance-profiler-overview) as Model Context Protocol (MCP) tools. No AL project is loaded. For the end-to-end agent workflow, prerequisites, and permissions, see [Profiling with an AI agent](/dynamics365/business-central/dev-itpro/administration/scheduled-performance-profiler-overview#profiling-with-an-ai-agent-mcp-server).

ALTool runs as a stdio MCP server that an agent host—for example, Visual Studio Code in agent mode—spawns as a child process. It exposes the following tools that the agent calls on the user's behalf:

- **Schedule profiling** — arms a profiler schedule for a target session's user and activity type, enabled for a bounded window (5 minutes by default, capped at 1 hour). The platform then captures a profile automatically for every matching activity, exactly as if the schedule were created from the **Profiler Schedules** page. The session's memory usage is also estimated automatically, which is on by default, nothing to opt in to, and embedded into each captured profile.
- **Stop schedule and get profiles** — disables the schedule and returns the captured `.alcpuprofile` files together with a per-activity overview (durations, SQL, and HTTP call counts and times). Each `.alcpuprofile` also carries two session-level totals when a memory estimate was captured: `totalMemoryUsed`; estimated managed memory held by the session, in bytes, and `totalObjectCount`; estimated managed object count. The detailed per-type memory breakdown goes to server-side telemetry rather than the downloaded profile.
- **Get profile for activity** — returns a single activity's profile for a closer look.
- **Analyze profiles in folder** — a *local* analysis tool that doesn't connect to Business Central. It lists the `.alcpuprofile` (or `.zip`) files you've placed in the proxy's user profile folder so the agent can read and analyze them with its filesystem tools. Use it for profiles obtained out of band or captured earlier: drop the files into the folder and call the tool.

When an activity profile is captured, the proxy also saves it to a local file so agent hosts that drop embedded binary content can still read it. Auto-captured profiles are grouped in a per-schedule subfolder of the profile folder and are removed once they're past the retention window—cleanup runs at proxy startup and at the start of the next capture (it isn't a background timer). Profiles you want to keep and analyze go in the `user` subfolder, which the proxy never deletes. These files can contain sensitive business data, so handle them securely and in line with your privacy requirements.

The target session is identified per tool call—for example, the agent reads *"profile session 10"* from your prompt—so it isn't a launch option. The connection target and authentication are fixed for the lifetime of the proxy through the options below.

Wire ALTool into your MCP host so it's invoked as:

```shell
al launchprofilingmcpproxy [options]
```

The following options are supported:

| Option | Description |
|--------|-------------|
| `--environmenttype <type>` | Cloud environment type—`Sandbox` or `Production`—or `OnPrem` for an on-premises server. |
| `--environmentname <name>` | Cloud environment name (for example, `production`). Cloud only. |
| `--tenant <tenant>` | Cloud: the Microsoft Entra tenant ID or primary domain (for example, `contoso.onmicrosoft.com`). Multitenant on-premises: the Business Central tenant name. |
| `--applicationfamily <family>` | Application family for embed apps. Optional. |
| `--authentication <method>` | `MicrosoftEntraID` (or `AAD`) for cloud, or `Windows` or `UserPassword` for on-premises. Defaults to Microsoft Entra ID. |
| `--server <url>` | On-premises server URL (for example, `http://localhost`). On-premises only. |
| `--serverinstance <name>` | On-premises server instance name (for example, `BC`). On-premises only. |
| `--port <port>` | On-premises port that the MCP service shares with the Business Central API/OData endpoint (for example, `7047`)—not the development endpoint port (`7049`). On-premises only. |
| `--logfile <path>` | Path to the diagnostics log file. Defaults to `%LOCALAPPDATA%/Microsoft/ALLanguageServer/profilingmcpproxy.log`. |
| `--loglevel <level>` | Log level: `Debug`, `Verbose`, `Normal` (default), `Warning`, `Error`. |
| `--nolog` | Disable file logging entirely. |
| `--profilefolder <path>` | Root folder for locally saved profile files. Defaults to `%TEMP%/bc-profiling`. Auto-captured profiles are stored in per-schedule subfolders; drop your own profiles in the `user` subfolder and analyze them with the **Analyze profiles in folder** tool. |
| `--profileretentiondays <days>` | How long (in days) auto-captured per-schedule folders are kept before cleanup. Defaults to `1`. Values of `0` or less fall back to `1`. The `user` subfolder is never deleted automatically. |
| `-?, -h, --help` | Show help and usage information. |

Standard output is reserved for the MCP JSON-RPC stream; all human-readable diagnostics go to `stderr` and to the log file.

### Authentication

The proxy authenticates non-interactively and never opens a browser. For **cloud** connections, it resolves a token in this order: the `BC_ACCESS_TOKEN` environment variable, then a token cached by a prior interactive `altool auth login` sign-in. For **on-premises** hosts, you supply credentials through environment variables. Explicit options take precedence. The proxy caches values read from environment variables in memory only and never writes them to disk.

| Variable | Use |
|----------|-----|
| `BC_ACCESS_TOKEN` | A preacquired Microsoft Entra bearer token for cloud connections. The token value is never logged. |
| `BC_SERVER_USERNAME`, `BC_SERVER_PASSWORD` | Credentials for on-premises `UserPassword` (Basic) authentication. |

On-premises `Windows` authentication uses the current Windows identity and needs no credentials.

For a cloud environment, the simplest option is to sign in interactively once by using the `altool auth login` command. This action caches a token (together with a refresh token) that the proxy reuses and refreshes silently, so you don't need to set `BC_ACCESS_TOKEN`:

```bash
altool auth login --environmenttype Sandbox --environmentname sandbox --tenant contoso.onmicrosoft.com
```

Alternatively, for headless or CI/CD hosts where interactive sign-in isn't possible, acquire a `BC_ACCESS_TOKEN` by using the [Azure CLI](/cli/azure/) (after `az login` as a user who has access to the environment), requesting a token for the Business Central API scope:

```bash
az account get-access-token --scope https://api.businesscentral.dynamics.com/.default --query accessToken --output tsv
```

This token is short-lived (about one hour), so refresh it when it expires. Because `BC_ACCESS_TOKEN` takes precedence over a cached sign-in, leave it unset when you rely on `altool auth login`.

> [!TIP]  
> In Visual Studio Code agent mode, the AL extension registers this proxy automatically as the **Business Central Profiling MCP Server** and derives the connection from your `launch.json`, so you don't normally run the command yourself. Sign in by using the **AL: Sign in to Business Central Profiling MCP** command, then ask the agent to profile a session. Learn more in [Profiling with an AI agent](/dynamics365/business-central/dev-itpro/administration/scheduled-performance-profiler-overview#profiling-with-an-ai-agent-mcp-server).

## Snapshot debugging MCP proxy

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

The `launchsnapshotmcpproxy` command lets an AI agent capture an AL [snapshot](devenv-snapshot-debugging.md) from a running [!INCLUDE [prod_short](includes/prod_short.md)] session and then debug the recorded execution offline. Where `launchmcpserver` and `launchlspserver` operate on a local AL workspace, this command connects *out* to a running Business Central environment and exposes the platform's [snapshot debugger](devenv-snapshot-debugging.md) as Model Context Protocol (MCP) tools. No AL project is loaded. For the end-to-end agent workflow, prerequisites, and permissions, see [Snapshot debugging with an AI agent](devenv-snapshot-debugging.md#snapshot-debugging-with-an-ai-agent-mcp-server).

ALTool runs as a stdio MCP server that an agent host—for example, Visual Studio Code in agent mode—spawns as a child process. It exposes the following tools that the agent calls on the user's behalf:

- **Initialize snapshot debugging** — arms a waiting snapshot on the server for a set of snappoints, optionally scoped to a specific user. There's usually no session yet: the server records the *next* session that reproduces the scenario.
- **Get snapshot status** — reports whether the armed snapshot is still waiting, recording, or finished.
- **Stop snapshot debugging** — finalizes the run and returns the recorded snapshot archive so the agent can debug it.

The snapshot is recorded on the server while you reproduce the scenario. If the environment moves or restarts before you stop it, the in-progress recording is lost and the status tool reports that there's nothing to collect; simply initialize a new snapshot and reproduce the scenario again. The captured archive can contain sensitive business data, so handle it securely and in line with your privacy requirements.

Snapshot debugging usually records the next session that reproduces a problem, so you don't need a session ID; if you want to target a session that's already running, its ID is supplied per tool call rather than as a launch option. The connection target and authentication are fixed for the lifetime of the proxy through the options below.

Wire ALTool into your MCP host so it's invoked as:

```shell
al launchsnapshotmcpproxy [options]
```

The following options are supported:

| Option | Description |
|--------|-------------|
| `--environmenttype <type>` | Cloud environment type—`Sandbox` or `Production`—or `OnPrem` for an on-premises server. |
| `--environmentname <name>` | Cloud environment name (for example, `production`). Cloud only. |
| `--tenant <tenant>` | Cloud: the Microsoft Entra tenant ID or primary domain (for example, `contoso.onmicrosoft.com`). Multitenant on-premises: the Business Central tenant name. |
| `--applicationfamily <family>` | Application family for embed apps. Optional. |
| `--authentication <method>` | `MicrosoftEntraID` (or `AAD`) for cloud, or `Windows` or `UserPassword` for on-premises. Defaults to Microsoft Entra ID. |
| `--server <url>` | On-premises server URL (for example, `http://localhost`). On-premises only. |
| `--serverinstance <name>` | On-premises server instance name (for example, `BC`). On-premises only. |
| `--port <port>` | On-premises port that the MCP service shares with the Business Central API/OData endpoint (for example, `7047`)—not the development endpoint port (`7049`). On-premises only. |
| `--logfile <path>` | Path to the diagnostics log file. Defaults to `%LOCALAPPDATA%/Microsoft/ALLanguageServer/snapshotmcpproxy.log`. |
| `--loglevel <level>` | Log level: `Debug`, `Verbose`, `Normal` (default), `Warning`, `Error`. |
| `--nolog` | Disable file logging entirely. |
| `-?, -h, --help` | Show help and usage information. |

Standard output is reserved for the MCP JSON-RPC stream; all human-readable diagnostics go to `stderr` and to the log file.

### Authentication

The proxy authenticates non-interactively and never opens a browser. For **cloud** connections, it resolves a token in this order: the `BC_ACCESS_TOKEN` environment variable, then a token cached by a prior interactive `altool auth login` sign-in. For **on-premises** hosts, you supply credentials through environment variables. Explicit options take precedence. The proxy caches values read from environment variables in memory only and never writes them to disk.

| Variable | Use |
|----------|-----|
| `BC_ACCESS_TOKEN` | A preacquired Microsoft Entra bearer token for cloud connections. The token value is never logged. |
| `BC_SERVER_USERNAME`, `BC_SERVER_PASSWORD` | Credentials for on-premises `UserPassword` (Basic) authentication. |

On-premises `Windows` authentication uses the current Windows identity and needs no credentials.

For a cloud environment, the simplest option is to sign in interactively once by using the `altool auth login` command. This action caches a token (together with a refresh token) that the proxy reuses and refreshes silently, so you don't need to set `BC_ACCESS_TOKEN`:

```bash
altool auth login --environmenttype Sandbox --environmentname sandbox --tenant contoso.onmicrosoft.com
```

Alternatively, for headless or CI/CD hosts where interactive sign-in isn't possible, acquire a `BC_ACCESS_TOKEN` by using the [Azure CLI](/cli/azure/) (after `az login` as a user who has access to the environment), requesting a token for the Business Central API scope:

```bash
az account get-access-token --scope https://api.businesscentral.dynamics.com/.default --query accessToken --output tsv
```

This token is short-lived (about one hour), so refresh it when it expires. Because `BC_ACCESS_TOKEN` takes precedence over a cached sign-in, leave it unset when you rely on `altool auth login`.

> [!TIP]  
> In Visual Studio Code agent mode, the AL extension registers this proxy automatically as the **Business Central Snapshot MCP Server** and derives the connection from your `launch.json`, so you don't normally run the command yourself. Sign in by using the **AL: Sign in to Business Central Snapshot MCP** command, then ask the agent to capture a snapshot. Learn more in [Snapshot debugging with an AI agent](devenv-snapshot-debugging.md#snapshot-debugging-with-an-ai-agent-mcp-server).

## Related information

[AI agent tools for AL development](al-agent-tools/al-agent-tools-overview.md)  
[AL Development Tools package](devenv-al-tool-package.md)  
[Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)