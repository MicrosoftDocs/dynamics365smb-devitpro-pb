---
title: "Developing Extensions in AL"
description: "Overview of the development experience for building extensions using the AL language."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/18/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
ms.author: solsen
---

# Development in AL

Extensions are a programming model where functionality is defined as an addition to existing objects and defines how they're different or modify the behavior of the solution. This section explains how you can develop extensions using the development environment for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].

If you're new to building extensions, we recommend that you read this document to get an understanding of the basics and terms you'll encounter while working. Next, follow the [Get Started with AL](devenv-get-started.md) to set up the tools.

> [!TIP]  
> If you are looking for the C/SIDE documentation, visit our [Dynamics NAV library](/dynamics-nav/development).

## Understanding objects in the development environment

All functionality in [!INCLUDE[prod_short](includes/prod_short.md)] is coded in objects. The extension model is object-based; you create new objects, and extend existing objects depending on what you want your extension to do.

* Table objects define the table schema that holds data.
* Page objects represent the pages seen in the user interface.
* Codeunits contain code for logical calculations and for the application behavior.

These objects are stored as code, known as AL code, and are saved in files with the `.al` file extension. The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] also supports the multi-root functionality, which allows you to work with multiple AL folders within one workspace. For more information on how to group a set of disparate project folders into one workspace, see [Working with multiple AL project folders within one workspace](devenv-multiroot-workspaces.md).


> [!NOTE]  
> A single .al file may contain multiple objects.

Table extension objects and page extension objects are used to add or override changes to table or page objects. For example, consider a business that sells organic food, and the business wants to add two extra fields; `Organic` and `Local Produce` in its existing item table. The business will use a table extension object to define those extra fields. The table extension has made the newly added fields available for use in the item table. You can store data in these fields and access them by code. You can then use the page extension object to display the fields in the UI.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

You have several options for creating new objects with the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code. For more information about the objects that you can create for your extension, see [AL Development Environment](devenv-reference-overview.md).

## Developing extensions in Visual Studio Code

Using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code, you'll get the benefits of a modern development environment along with seamless publishing and integration with your [!INCLUDE[prod_short](includes/prod_short.md)] tenant. For more information on the setup, see [Get Started with AL](devenv-get-started.md).

Visual Studio Code and the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] let you do the following tasks:

* Create new files for your solution.
* Assists you with the creation of appropriate settings and configuration files.
* Provides code snippets to help create application objects.
* Gives compiler validation while you code.
* Provides efficient publishing process. You can publish and see your code running by just pressing **Ctrl+F5**.

> [!NOTE]
> For some users the **Ctrl+F5** shortcut key may not work due to keyboard or other settings. If it doesn't work for you, run your code by choosing **Run Without Debugging** from the **Run** menu in Visual Studio Code.  

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

> [!NOTE]
> If you have previous experience working with the C/SIDE development environment and need an overview of some of the changes between the two development environments, see [Differences in the Development Environments](devenv-differences.md).

## Designer

Designer works in the client and allows you to design pages using drag and drop components. Designer lets you build extensions in the client itself by rearranging fields, adding fields, and previewing your changes in page design. For more information, see [Using Designer](devenv-inclient-designer.md).

## Compiling and deploying

Extensions are compiled as .app package files. The .app package file can be deployed to the [!INCLUDE[prod_short](includes/prod_short.md)] server. A .app package contains the various artifacts that deliver the new functionality to the [!INCLUDE[prod_short](includes/prod_short.md)] deployment and a manifest that specifies the name, publisher, version, and other attributes of the extension. For information about the manifest files, see [JSON Files](devenv-json-files.md).

## Instrumenting your app with telemetry

[!INCLUDE[prod_short](includes/prod_short.md)] emits telemetry data for several operations that occur when extension code is run. You can configure your extension to send this data to a specific Application Insights resource on Microsoft Azure. For more information, see [Sending Extension Telemetry to Azure Application Insights](devenv-application-insights-for-extensions.md).

## Submitting your app

After development and testing are done, you can submit your extension package to AppSource. Before you submit the extension package, we encourage you to read the checklist to facilitate the validation process. For more information, see [Checklist for Submitting Your App](devenv-checklist-submission.md). To get code validation helping you to bring your extension package to AppSource, you can enable the AppSourceCop code analyzer. For more information, see [Using the Code Analysis Tool](devenv-using-code-analysis-tool.md).

## See Also

[Get Started with AL](devenv-get-started.md)  
[Getting Started Developing Connect Apps for Dynamics 365 Business Central](devenv-develop-connect-apps.md)  
[Keyboard Shortcuts](devenv-keyboard-shortcuts.md)  
[AL Development Environment](devenv-reference-overview.md)  
[XML Comments in Code](devenv-xml-comments.md)  
[FAQ for Developing in AL](devenv-dev-faq.md)  
[Sending Extension Telemetry to Azure Application Insights](devenv-application-insights-for-extensions.md)  
