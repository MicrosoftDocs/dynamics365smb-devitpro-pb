---
title: "Optimize Visual Studio Code Editing and Building Performance"
description: "Explains how yo configure Visual Studio Code to get better performance when editing and building AL projects"
author: jswymer
ms.custom: na
ms.date: 07/06/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Optimizing Visual Studio Code for AL Development

Visual Studio Code is built to handle many smaller, dependent projects, and not one large project, however, as the base application is not yet split into modules or components that allows managing the code in smaller projects, we recommend the following performance optimizations.

Open your `settings.json` file in the project (or global settings if you prefer that) pressing **Ctrl+Shift+P**. Set:

- `"al.enableCodeAnalysis": false` to turn off code analysis completely, read more here [Using the Code Analysis Tool](../developer/devenv-using-code-analysis-tool.md).
- `"al.backgroundCodeAnalysis": false` to turn off running code analysis in the background, but code analysis will be enabled when building with **Ctrl+Shift+B**. This is an alternative if analyzers are required with `"al.enableCodeAnalysis": true`.
- `"al.enableCodeActions": false` to turn off AL Code Actions, read more here [AL Code Actions](devenv-code-actions.md).
- `"al.incrementalBuild": true` to allow the compiler to reuse the existing background compilation for creating the package.
- `"editor.codeLens": false` to turn off code lens in Visual Studio Code, see [Code Navigation](https://code.visualstudio.com/Docs/editor/editingevolved#_reference-information).
- `"[al]": {​​​​​​​​​​"editor.formatOnSave": false }​​​​​​​​` to turn off AL formatting when saving a file. If you want formatting, then you can adjust what to run formatting on, and you can choose only modifications using the **Format On Save Mode** option.

- Add the build folder to the exclusion list for [Windows Defender](https://support.microsoft.com/help/4028485/windows-10-add-an-exclusion-to-windows-security).

## See also 
[Development in AL](devenv-dev-overview.md)   
[Best Practices for AL](../compliance/apptest-bestpracticesforalcode.md)
