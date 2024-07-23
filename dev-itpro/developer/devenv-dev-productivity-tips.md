---
title: Developer productivity tips
description: Learn about productivity tips when programming in AL for Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: conceptual
ms.collection: 
ms.custom: bap-template 
ms.date: 01/29/2024
ms.reviewer: solsen
---

# Developer productivity tips

Working in Visual Studio Code and programming in AL for Business Central can be a very productive experience. This article describes some of the productivity tips that can help you get more done when programming in AL.

## AL language tips

### AL snippets

In addition to the inline help of IntelliSense, you have access to various snippets that'll give you a template for a specific object type. Use a code snippet from an .al file by start typing the snippet name. All snippets start with the letter `t`. For example, to get a template for a table, type `ttable` and press <kbd>Tab</kbd>.

## Code actions

Code actions can help you fix issues in the code and give you possible corrective actions right next to an error or warning. If actions are available, a light bulb appears next to the error or warning. Examples of code actions are; explicit and implicit `with` statements, interface implementer, and spell check. For more information, see [AL code actions](devenv-code-actions.md). 


## Centralized launch configuration

> [!NOTE]  
> Introduced with [!INCLUDE[prod_short](includes/prod_short.md)] version 21.1.

Add a launch property to a code-workspace or in the settings.json file. This allows for a centralized configuration of projects. Any local `launch.json` file overrides the user and workspace configuration. And a workspace launch configuration overrides the launch configuration specified in the user `settings.json` file.

> [!NOTE]  
> If a local `launch.json` file doesn't contain a valid AL launch configuration, we'll try to find one in the code-workspace first, and then in the `settings.json` files. However, if the launch property is specified in the code-workspace file even without specifying a valid AL configuration, the user `settings.json` file won't be able to override it.

## General Visual Studio Code tips

### Git integration

Visual Studio Code has built-in Git integration that makes it easy to manage your code changes. This can be useful when working together on projects with other developers and allows you to manage your Git repos directly from the editor. For more information, see [Git integration](https://code.visualstudio.com/docs/sourcecontrol/overview).

### Command Palette

The Command Palette allows you to search for and run commands in Visual Studio Code. To open the **Command Palette**, press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>.

## See also

[JSON files](devenv-json-files.md)  
[Launch JSON file](devenv-json-launch-file.md)  