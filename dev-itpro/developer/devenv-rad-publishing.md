---
title: "Working with Rapid Application Development"
description: "Describes what Rapid Application Development is and how you publish using RAD."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/05/2019
ms.reviewer: na
ms.topic: article
ms.prod: "dynamics-businesscentral"
ms.author: solsen
---

# Working with Rapid Application Development
Working with Visual Studio Code and [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] you can benefit from Rapid Application Development (RAD) on large code projects. RAD allows faster development on projects with a large number of files by doing a delta compilation and publishing only on those application objects that have changed during development in Visual Studio Code. RAD publishing is an interim state and does not replace a full publish. 

## How RAD works
The files that have been changed by the application developer within Visual Studio Code are persisted in a special RAD file during builds. This file is saved in the .vscode folder of the code project. RAD changes are the changes of application objects within a RAD session. Only application objects, page customization objects, and profile objects are handled for RAD.
 

## RAD shortcuts
There are two commands for starting a RAD-based action.

|Shortcut     |Description|
|-------------|-----------|
|Ctrl+Shift+F5|Start RAD publishing.|
|Shift+F5     |Start RAD debugging.|

## See also

