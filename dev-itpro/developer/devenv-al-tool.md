---
title: ALTool
author: SusanneWindfeldPedersen
description: Simplify AL extension development with ALTool. Validate code, package extensions, and integrate into CI/CD pipelines for seamless deployment.
ms.date: 05/09/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# ALTool

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
C:\Users\<user>\.vscode\extensions\ms-dynamics-smb.al-17.0.1750311\bin\win32\alc.exe
```

Alternatively, you can install the [AL Development Tools package](devenv-al-tool-package.md) as a NuGet package, which provides the `al` alias so you can run ALTool commands without specifying the full path to `alc.exe`. This option is ideal for CI/CD pipelines and automated environments where a full Visual Studio Code installation isn't needed.

## ALTool commands

To get a list of available commands, run the following command in your terminal or command prompt:

```shell
alc.exe help
```

| Command                        | Description                                           |
|--------------------------------|-------------------------------------------------------|
| `compile`                      | Compile a package using `alc.exe`. Learn more in [Workspace commands](#workspace-commands). |
| `workspace`                    | Workspace commands for creating, compiling, and mapping multi-project AL workspaces. Learn more in [Workspace commands](#workspace-commands). |
| `launchmcpserver`              | Launches an AL Model Context Protocol (MCP) server.  |
| `launchlspserver`              | Launches an AL Language Server Protocol (LSP) server for use by autonomous AI agents and editors. Learn more in [AL LSP](#al-lsp). |
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

### workspace map

Generates a Markdown file with a Mermaid dependency diagram from a workspace. The output includes a visual graph of inter-project dependencies, a project details table, and warnings for any circular dependencies detected.

```bash
al workspace map my.code-workspace
al workspace map my.code-workspace output.md
```

## Symbol-only and runtime package detection

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

ALTool now supports detecting whether an app is symbol-only and whether a package is a runtime package. These checks help tools like AL-Go determine if an extension can be published to SaaS or containers.

## ALMCP

The ALMCP (AL Model Context Protocol) server allows autonomous agents to interact with an AL workspace. It's launched via ALTool with the `launchmcpserver` command. Its usage is as follows:

```shell
alc.exe launchmcpserver [<projects>...] [options]
```

The `projects` argument is a space-separated list of paths to AL project folders. Each path should be wrapped in double quotes `"`.

The following options are supported:

| Option                 | Description|
|------------------------|------------|
| `--port <port>`        | Port number for the HTTP server. [default: 5000] |
| `--packagecachepath <paths>` | Paths to the package cache folders. |
| `--assemblyprobingpaths <paths>` | Paths to probe for dependent assemblies. |
| `--ruleset <path>`     | Path to the ruleset file. |
| `--outfolder <path>`   | Output folder for compilation artifacts. |
| `--codeanalyzers <analyzers>` | Code analyzers to enable. |
| `-?, -h, --help`          | Show help and usage information |

Once the server is launched, it listens on the specified port for MCP calls and provides several tools for agents to interact with the loaded projects.

## AL LSP

The [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/) is the contract that editors and IDEs use for code intelligence. For autonomous AI agents working with AL—whether they're answering questions about a codebase, refactoring across files, or building new extensions—an LSP server provides the same grounded semantic understanding that a human developer gets inside Visual Studio Code, without the editor itself. Instead of guessing from raw source text, an agent can ask precise questions ("where is this procedure called?", "what's the type of this record?", "what symbols does this codeunit expose?") and receive structured answers from the language server.

This is fundamentally more powerful than text-based search tools such as `grep` or regular expressions. A regular expression matches characters; it can't distinguish a procedure declaration from a comment that mentions the procedure's name, separate a `Customer` record reference from the word *Customer* in a message string, or know that two textually identical names in different namespaces refer to different symbols. The LSP server understands the language—scopes, types, accessibility, and the relationships between modules—and answers based on that, which is why agents that drive their navigation through LSP make fewer mistakes and need less context than those that fall back on text search.

This matters in real-world AL workspaces, which routinely span multiple projects (a base app plus tests, or verticals plus extensions): semantic find-references and go-to-definition that correctly follow AL-specific relationships such as `internalsVisibleTo` and `propagateDependencies` are difficult to reproduce by hand or with text search, and an agent that navigates the workspace symbolically uses far less context than one that has to read files exhaustively to compensate. Refactorings such as rename remain accurate because the server knows every reference. The result is faster, more reliable agentic workflows on AL code.

ALTool exposes this through the `launchlspserver` command. The agent or editor spawns ALTool as a child process and communicates with it over stdio using JSON-RPC. The server provides the full set of AL language features: hover, go-to-definition, completions, find-references (including across projects), document symbols, rename, formatting, inlay hints, folding ranges, and type hierarchy.

Wire ALTool into your LSP host's plugin configuration so it's invoked as:

```shell
altool launchlspserver [<projects>...] [options]
```

The `projects` argument is a space-separated list of AL project folder paths. Wrap each path in double quotes `"`. When more than one project is supplied, ALTool reads each project's `app.json` and resolves the dependencies between them (including `internalsVisibleTo` and `propagateDependencies` relationships) so that find-references and other cross-project requests span every supplied project. If `<projects>` is omitted, ALTool falls back to scanning the `rootUri` from the LSP `initialize` request; that fallback suits a single-project workspace but doesn't enable cross-project resolution. The `--workspacefile` option below is an alternative source of project folders, and folders from a workspace file merge with positional projects.

The following options are supported:

| Option                 | Description |
|------------------------|-------------|
| `--packagecachepath <paths>` | Paths to the package cache folders containing the `.app` symbol packages (`System.app`, `BaseApp.app`, etc.). Optional when `al.packageCachePath` is supplied via `--settingspath` or `--workspacefile`. |
| `--assemblyprobingpaths <paths>` | Paths to probe for dependent .NET assemblies. Required when AL projects reference .NET add-ins in non-standard locations. |
| `--ruleset <path>`     | Path to a ruleset (`.json`) file for AL code analysis. |
| `--settingspath <path>` | Path to a `settings.json` file (any Visual Studio Code scope—user, workspace, or folder) whose `al.*` keys override CLI defaults at startup. When omitted, ALTool auto-discovers `<rootUri>/.vscode/settings.json` from the LSP `initialize` request, walking ancestors. The LSP `initializationOptions.settingsPath` key from the client takes final precedence. |
| `--workspacefile <path>` | Path to a Visual Studio Code `.code-workspace` file. Its `folders` extend the projects loaded at startup (merged with the positional `<projects>` argument), and its inline `settings` block contributes `al.*` keys as workspace-level configuration. `--settingspath`, when also supplied, overrides the inline settings. |
| `--logfile <path>`     | Path to the log file. Defaults to `~/.al-mcp/almcp.log`. |
| `--loglevel <level>`   | Log level: `Debug`, `Verbose`, `Normal` (default), `Warning`, `Error`. |
| `--nolog`              | Disable logging entirely. |
| `-?, -h, --help`       | Show help and usage information. |

Configuration is layered, from least to most authoritative: CLI flags → `--workspacefile` inline settings → `--settingspath` file → auto-discovered `.vscode/settings.json` → LSP `initializationOptions`. The recognized `al.*` keys are `packageCachePath`, `assemblyProbingPaths`, `ruleSetPath`, `enableCodeAnalysis`, and `codeAnalyzers`. JSONC features (`//` comments, trailing commas) are tolerated to match the Visual Studio Code parser.

ALTool validates the supplied input. `--workspacefile` and `--settingspath` paths must exist and parse, and a package cache must be reachable (the `.app` symbol packages are required for AL LSP to provide full language intelligence). When `assemblyProbingPaths` and `ruleSetPath` are both empty, ALTool emits a warning—compilation can fail on projects that reference .NET add-ins or rely on analyzer rulesets.

Diagnostic output is written to the standard log file (`--logfile`) and mirrored to `stderr`, which the LSP host typically surfaces in its own diagnostic stream.

## Related information

[AI agent tools for AL development](al-agent-tools/al-agent-tools-overview.md)  
[AL Development Tools package](devenv-al-tool-package.md)  
[Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)