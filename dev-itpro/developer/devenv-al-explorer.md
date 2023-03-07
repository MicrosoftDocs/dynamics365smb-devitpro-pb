---
title: AL Explorer
description: The AL Explorer for Business Central lets you explore and navigate objects in extensions.  
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 02/02/2023
ms.custom: bap-template
---

# AL Explorer

The **AL Explorer** provides a tool that allows you to explore, navigate, and better understand objects in extensions. You can drill down into object details, dependencies, and extension points, without looking at the code. With the **AL Explorer** you have a better overview of high-level structures of extensions that can help you specify new features, or do light troubleshooting.

The **AL Explorer** has four tabs: **OBJECTS**, **EVENTS**, **APIS**, and **EXTENSIBLE ENUMS**. For each of these categories, you can apply filtering, bookmarks, go to source, and for tables, pages, and report objects, you can run these directly from the explorer window. For events, you can select **Subscribe**, and paste a code snippet with the event subscriber syntax into, for example, a codeunit. 

> [!NOTE]  
> When you choose **Source** on a given object, the resource exposure policy set, may prevent the entire source code to be shown. 

You can get an overview of all objects in a given app scope, for example, a workspace or a selected project, and you can search in object names, and group objects by type. 

## Settings

You can choose when to show the **AL Explorer** as you start up Visual Studio Code, the default is that **AL Explorer** is shown when once at start up. To change the default, go to user or workspace settings, press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd>, and then choose **Preferences: Open Settings (UI)** for workspace settings, or choose **Preferences: Open User Settings** for user settings. Under **Extensions**, and **AL Language extension configuration**, change the **Show Explorer at startup** to a different value. For more information, see [AL Language extension configuration](devenv-al-extension-configuration.md).

## Go to source code

For a selected object, you can quickly jump to source code, whether it's to develop, read, and understand it, or whether it's to add breakpoints as part of troubleshooting.

## Bookmarks

You can bookmark objects used frequently to easily filter a list of objects to only the bookmarked ones—for example, when navigating between those you currently work on.

## View extension points - events, APIs, and enums

To ease creating extension points and to extend existing ones, AL Explorer also allows fast overview of all events and API pages as well as extensible enums that implement interfaces.

## See also

[AL Home](devenv-al-home.md)  
[Developing Extensions in AL](devenv-dev-overview.md)