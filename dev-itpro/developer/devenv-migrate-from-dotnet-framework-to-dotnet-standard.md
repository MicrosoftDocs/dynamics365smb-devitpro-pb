---
title: "Migrating from .NET Framework to .NET Standard"
description: "Description of the process of migrating DLLs used from AL from .NET Framework to .NET Standard"
author: kennienp
ms.custom: na
ms.date: 09/01/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: kepontop
---

# Migrating from .NET Framework to .NET Standard

Starting from 2022 release wave 2, the [!INCLUDE [prod_long](../includes/prod_long.md)] server is running on .NET Standard and if you are using on-premises .NET add-ins that targets .NET Framework, you need to convert them to use .NET Standard, because add-ins compiled with .NET Framework will stop working in [!INCLUDE [prod_short](../includes/prod_short.md)] 2022 release wave 2.

## What is the difference between .NET Framework, .NET Standard, and .NET Core?

When the .NET Framework was originally shipped, it came with a single .NET runtime so that developers could build and run Windows desktop and Web applications. Over the years, the .NET implementation has evolved and now, to supplement the .NET Framework, we also have:

- .NET Core  
The latest .NET implementation, open source and available for multiple operating systems. With .NET Core, you can build cross-platform console apps and ASP.NET Core Web applications and cloud services.
- .NET Standard  
The set of fundamental APIs, sometimes referred to as the .NET Base Class Library (BCL) that all .NET implementations must implement. By targeting .NET Standard, you can build libraries that you can share across all your .NET apps, no matter on which .NET implementation or operating system they run.

The various .NET implementations target specific versions of .NET Standard. 

## What does that mean for your .NET add-ins?

With the [!INCLUDE [prod_long](../includes/prod_long.md)] server running .NET Standard, you need to check your add-in code and decide on how to proceed to ensure continued compatibility.

- As .NET add-ins are not supported in the cloud, you should consider options for moving some or all scenarios to technologies that are supported in the cloud, for example, Azure Functions, thereby improving cloud readiness of the solution even if not yet migrating to cloud.
- You can also upgrade add-ins to be .NET Standard compliant. Some of .NET add-ins will be fully compliant out of the box or easily portable to be .NET Standard compliant, but for other more complex solutions, this process could involve more work. Add-ins compiled with .NET Framework and not .NET Standard will stop working in [!INCLUDE [prod_short](../includes/prod_short.md)] 2022 release wave 2.


## Using the Visual Studio .NET Portability Analyzer extension

The .NET Portability Analyzer extension from the Visual Studio Marketplace is a tool you can use to check for compatibility to .NET Standard. It analyzes assemblies and provides a detailed report on .NET APIs that are missing for the applications or libraries to be portable to a specified .NET platform.

> [!NOTE]  
> The Visual Studio .NET Portability Analyzer extension is currently only available for Visual Studio 2019.

When installed, the tool must be configured to define the type of portability analysis needed, such as the target .NET versions that you want to be compatible with. To do that, complete the following steps:

1. In Visual Studio select **Analyze** and then **Portability Analyzer Settings**.
1. In the **General Settings** window, select .NET Standard 2.0 under **Target Platforms**, and then choose **OK**.
1. Now, open the project file containing the code that needs to target .NET Standard, right-click the project, and select **Analyze Project Portability**.  

This opens up a **Portability Analysis Results** page with and assessment of compatibility, and a list of recommended changes. 

## Using the Microsoft ApiPort tool

Microsofts ApiPort tool is another way to check for compatibility to .NET Standard. This tool allows you to analyze  files in case you do not have access to the original source code. 

You can download the ApiPort tool at [.NET API Portability Github repository](https://github.com/Microsoft/dotnet-apiport).

To use the tool, do the following:

1. Open a command prompt and type `ApiPort.exe analyze -f MyLibrary.dll`.

The tool can also help analyze projects with dependencies between DLL files and visualize the dependencies. This is useful in more complex solutions with portability problems.

To analyze dependencies, do the following:

1. Open a command prompt and type `ApiPort.exe analyze -r DGML -f [directory or your solution]`

When the command finished, you have a DGML file that can be opened in Visual Studio. Directed Graph Markup Language (DGML) describes information used for visualization and complexity analysis, and is the format used to persist code maps in Visual Studio.

## See Also

[Get Started with AL](devenv-get-started.md)  
[.NET Control Add-Ins](devenv-dotnet-controladdins.md)  
[Subscribing to Events in a .NET Framework Type](devenv-dotnet-subscribe-to-events.md)  
[Serializing .NET Framework Types](devenv-dotnet-serializing-dotnetframework-types.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  
