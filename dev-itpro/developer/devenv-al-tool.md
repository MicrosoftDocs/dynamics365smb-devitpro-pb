---
title: ALTool
author: SusanneWindfeldPedersen
description: Simplify AL extension development with ALTool. Validate code, package extensions, and integrate into CI/CD pipelines for seamless deployment.
ms.date: 03/09/2026
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

## Related information

[AI agent tools for AL development](al-agent-tools/al-agent-tools-overview.md)  
[AL Development Tools package](devenv-al-tool-package.md)  
[Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)