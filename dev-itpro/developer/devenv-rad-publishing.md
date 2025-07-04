---
title: Work with Rapid Application Development
description: Describes what Rapid Application Development is and how you publish using RAD.
author: SusanneWindfeldPedersen
ms.date: 07/01/2025
ms.topic: article
ms.author: solsen
ms.reviewer: solsen
---

# Work with Rapid Application Development

Rapid Application Development (RAD) is a feature designed to streamline development workflows in Visual Studio Code when working with [!INCLUDE [prod_short](includes/prod_short.md)]. By enabling delta compilation, RAD allows developers to focus on changes made to application objects, reducing build and publish times for large projects. RAD publishing is an interim state and doesn't replace a full publish. This article explains how RAD works, its limitations, and best practices for using RAD effectively when you're working with AL.

## How RAD works

Files changed by the application developer in Visual Studio Code are saved in a special RAD (.rad) file during builds. This file is stored in the .vscode folder of the code project. RAD changes include application objects, page customization objects, and profile objects within a RAD session. These changes aren't saved during regular saves but only during build, publish, and debug actions.

> [!IMPORTANT]  
> The `rad.json` file shouldn't be modified.

> [!IMPORTANT]  
> If you change many files and close Visual Studio Code without a build (<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>B</kbd>), publish (<kbd>Ctrl</kbd>+<kbd>F5</kbd>, <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>F5</kbd>) or debug (<kbd>F5</kbd>, <kbd>Shift</kbd>+<kbd>F5</kbd>), all the RAD changes are lost. This means that if you, in the next Visual Studio Code session perform a RAD publishing, it's done on the latest changes and not on the prior changes. This can lead to an incomplete published package if it succeeds. It's therefore a best practice to do a regular publish. You can always check the RAD file in the code project to see what application objects are going to be changed during publishing.

In scenarios when application IDs are renamed, or refactored it's also a best practice to first do a full publishing, and then a RAD publishing for the consecutive changes. RAD doesn't check for application ID changes and ID changes can occur in a wrongly published application.

A RAD-published file doesn't include the following files normally packaged during regular publishing:

- Translation files
- Permission files
- Custom word and report RDL layout files
- Table data
- Web service definitions

These files will need to be regenerated with full publishing (<kbd>Ctrl</kbd>+<kbd>F5</kbd> ). A RAD file will be deleted as a result of a successful publishing.

> [!NOTE]  
> If RAD publishing fails, do a full publishing before performing another RAD publishing. The final state of an application must be built using full publishing, and never with RAD publishing.


> [!NOTE]  
> When building using RAD, all translations will be ignored, even though the `"features": [ "TranslationFile" ]` setting is specified in the `app.json` file. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

## RAD shortcuts

Two commands start a RAD-based action. 

|Shortcut     |Description|
|-------------|-----------|
|<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F5</kbd>  |Start RAD publishing without debugging.|
|<kbd>Alt</kbd>+<kbd>F5</kbd>       |Start RAD with debugging.|

## Related information

[Developing extensions in AL](devenv-dev-overview.md)  
[Debugging](devenv-debugging.md)  
