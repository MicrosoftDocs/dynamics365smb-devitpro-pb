---
title: ALTool
description: Description of the ALTool used for validating and packaging extensions.
author: SusanneWindfeldPedersen
ms.date: 09/15/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# ALTool

ALTool is a .NET command-line tool used for validating and packaging AL extensions for [!INCLUDE [prod_short](includes/prod_short.md)]. It helps developers ensure that their extensions meet the necessary requirements and can be successfully deployed to the [!INCLUDE [prod_short](includes/prod_short.md)] environment. 

> [!NOTE]  
> To deploy code built using ALTool, you must sign up for a [Dynamics 365 Business Central Sandbox tenant](https://aka.ms/getsandboxforbusinesscentral).

Learn more in [Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)

## Key features

- **Validation**: ALTool can validate AL code for syntax errors, best practices, and compliance with Microsoft guidelines.
- **Packaging**: The tool can package AL extensions into a deployable format, making it easier to distribute and install them in [!INCLUDE [prod_short](includes/prod_short.md)].
- **Integration**: ALTool can be integrated into CI/CD pipelines, allowing for automated validation and packaging of extensions during the development process.

## Usage

ALTool is typically used in the following scenarios:

1. **Local development**: Developers can use ALTool to validate their code before they deploy it to a sandbox environment.
2. **Continuous integration**: ALTool can be integrated into CI/CD pipelines to automate the validation and packaging of extensions.
3. **Pre-deployment checks**: Before you deploy an extension to a production environment, ALTool can be used to ensure that it meets all necessary requirements.

## Get started

Get started with the AL Development Tools package by following the instructions on [Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools). When you install the package, you get access to the ALTool command-line tool, and you can use the `AL` alias to run it.

## ALTool commands

To get a list of available commands, run the following command in your terminal or command prompt:

```shell
AL help
```

| Command                        | Description                                           |
|--------------------------------|-------------------------------------------------------|
| `compile`                      | Compile a package using `alc.exe`. Available with runtime 16.   |
| `GetPackageManifest`           | Retrieve the manifest from a `.app` file.            |
| `CreateSymbolPackage`          | Create a symbol-only package from a `.app` file.     |
| `GetLatestSupportedRuntimeVersion` | Get the latest supported AL runtime version for a platform version. |
| `help`                         | Display detailed information about a specific command. |
| `version`                      | Display version information.                         |


## Related information

[Microsoft.Dynamics.BusinessCentral.Development.Tools](https://www.nuget.org/packages/Microsoft.Dynamics.BusinessCentral.Development.Tools)