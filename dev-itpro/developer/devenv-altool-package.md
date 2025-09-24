---
title: AL Development Tools package
author: SusanneWindfeldPedersen
description: 
ms.date: 09/18/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---


# AL Development Tools package

When you install the AL Development Tools package, you gain access to a set of command-line utilities designed to streamline AL extension development and automation. The main features include:

- **ALTool command-line utility**: A cross-platform tool for compiling, packaging, and managing AL extensions outside of Visual Studio Code.
- **Integration with CI/CD pipelines**: Easy automation of build and deployment processes for your AL projects in Azure DevOps, GitHub Actions, or other automation platforms.
- **Multiple installation options**: The tools package is available as a NuGet package, making it simple to install on build agents or local machines using standard package management workflows.
- **No need for full Visual Studio Code installation**: Using the ALTool independently is ideal for automated environments or lightweight setups.
- **Support for various ALTool commands**: Compile, create symbol packages, retrieve manifests, and more—all from the command line.

Learn more in [Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)

> [!NOTE]  
> To deploy code built using ALTool, you must sign up for a [Dynamics 365 Business Central Sandbox tenant](https://aka.ms/getsandboxforbusinesscentral).

## Get started

Get started with the AL Development Tools package by following the instructions on [Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools). When you install the package, you get access to the ALTool command-line tool, and you can use the `al` alias to run it.

## ALTool commands

To get a list of available commands, run the following command in your terminal or command prompt:

```shell
al help
```

| Command                        | Description                                           |
|--------------------------------|-------------------------------------------------------|
| `compile`                      | Compile a package using `alc.exe`.  |
| `GetPackageManifest`           | Retrieve the manifest from a `.app` file.            |
| `CreateSymbolPackage`          | Create a symbol-only package from a `.app` file.     |
| `GetLatestSupportedRuntimeVersion` | Get the latest supported AL runtime version for a platform version. |
| `help`                         | Display detailed information about a specific command. |
| `version`                      | Display version information.                         |

## Related information

[ALTool](devenv-altool.md)  
[Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)