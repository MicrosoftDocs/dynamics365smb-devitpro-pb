---
title: "Working with Rapid Application Development"
description: "Describes what Rapid Application Development is and how you publish using RAD."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.topic: article
ms.prod: "dynamics-businesscentral"
ms.author: solsen
---

# Working with Rapid Application Development

Working with Visual Studio Code and [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] you can benefit from Rapid Application Development (RAD) on large code projects. RAD allows faster development on projects with a large number of files by doing a delta compilation and publishing only on those application objects that have changed during development in Visual Studio Code. RAD publishing is an interim state and does not replace a full publish. 

## How RAD works
The files that have been changed by the application developer within Visual Studio Code are persisted in a special RAD (.rad) file during builds. This file is saved in the .vscode folder of the code project. RAD changes are the changes of application objects within a RAD session. Only application objects, page customization objects, and profile objects are handled for RAD. RAD changes will not be persisted during save, only during build, publish, and debug.

> [!IMPORTANT]  
> The `rad.json` file should not be modified.

> [!IMPORTANT]  
> If you change many files and close Visual Studio Code without a build (**Ctrl+Shift+B**), publish (**Ctrl+F5**, **Ctrl+Shift+F5**) or debug (**F5**, **Shift+F5**) all the RAD changes will be lost. This means that if you, in the next Visual Studio Code session perform a RAD publishing, this is done on the latest changes and not the prior changes. This can lead to an incomplete published package if it succeeds. It is therefore a best practice to do a regular publish. You can always check the RAD file in the code project to see what application objects are going to be changed during publishing.

In scenarios when application IDs are renamed, or refactored it is also a best practice to first do a full publishing, and then a RAD publishing for the consecutive changes. RAD does not check for application ID changes and ID changes can occur in a wrongly published application.

A RAD published file will not contain the following files that are normally packaged during regular publishing: 

- Translation files
- Permission files
- Custom word and report rdl layout files  
- Table data
- Web service definitions  

These files will need to be re-generated with full publishing (**Ctrl+F5**). A RAD file will be deleted as a result of a successful publishing.

> [!NOTE]  
> If RAD publishing fails, then you must do a full publishing before performing another RAD publishing. The final state of an application must be built using full publishing, and never with RAD publishing.

## RAD shortcuts
There are two commands for starting a RAD-based action. 

|Shortcut     |Description|
|-------------|-----------|
|Ctrl+Alt+F5  |Start RAD publishing without debugging.|
|Alt+F5       |Start RAD with debugging.|

## See also
[Developing Extensions in AL](devenv-dev-overview.md)  
[Debugging](devenv-debugging.md)  

