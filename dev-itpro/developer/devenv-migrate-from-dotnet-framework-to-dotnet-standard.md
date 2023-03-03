---
title: "Migrating from .NET Framework to .NET Standard"
description: "Description of the process of migrating DLLs used from AL from .NET Framework to .NET Standard"
author: kennienp
ms.custom: na
ms.date: 11/18/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: kepontop
---
# Migrating from .NET Framework to .NET Standard

Starting in 2022 release wave 2 (v21), the [!INCLUDE [server](includes/server.md)] supports .NET add-ins compiled to target the .NET Standard runtime. This change currently doesn't affect your .NET add-ins. However, it might affect some .NET add-ins in the next release (v22). Read this article to learn more.

## What's the difference between .NET Framework, .NET Core, and .NET Standard?

When first released, .NET Framework had one runtime for building and running Windows desktop and Web applications. The .NET implementation has evolved over the years. Now, to supplement the .NET Framework, we also have:

- .NET Core  
The latest .NET implementation, open source and available for multiple operating systems. With .NET Core, you can build cross-platform console apps and ASP.NET Core Web applications and cloud services.
- .NET Standard  
The set of fundamental APIs, sometimes referred to as the .NET Base Class Library (BCL) that all .NET implementations must implement. By targeting .NET Standard, you can build libraries that you can share across all your .NET apps, no matter on which .NET implementation or operating system they run.

The various .NET implementations target specific versions of .NET Standard.

## What are the changes to Business Central server?

- In v21, [!INCLUDE [server](includes/server.md)] now lets you install and run .NET add-ins that are compiled to target the .NET Standard runtime. The [!INCLUDE [server](includes/server.md)] executable itself is still compiled for the .NET Framework 4.8 runtime as in earlier versions.
- The difference in v22 is that the [!INCLUDE [server](includes/server.md)] executable will be complied for the .NET 6.0 runtime.

## What does this mean for your .NET add-ins?

In v21, you won't have any problems compiling, installing or using .NET add-ins built on the old .NET Framework, related to this change. The reason is because of the .NET compatibility mode. It isn't necessary to recompile your .NET to target another .NET runtime right now. For more information about compatibility mode, go to [.NET Framework compatibility mode](/dotnet/core/porting/third-party-deps#net-framework-compatibility-mode).

In v22, you'll still be able to use .NET add-ins built on the old .NET Framework. But problems will arise if you have a .NET add-in that calls another API that's not compatible with the add-in's target runtime. When the add-in calls the incompatible API, an exception will occur.

We recommend you start converting your .NET add-ins to use .NET Standard to avoid problems in the next release. Check your add-in code and decide on how to proceed to ensure continued compatibility.

- Because .NET add-ins aren't supported in the cloud, consider options for moving some or all scenarios to technologies that are supported in the cloud, for example, Azure Functions. This action will improve cloud readiness of the solution even if not yet migrating to cloud.
- You can also upgrade add-ins to be .NET Standard compliant. Some of .NET add-ins will be fully compliant out of the box or easily portable to be .NET Standard compliant, but for other more complex solutions, this process could involve more work.

## Using the Visual Studio .NET Portability Analyzer extension

Use the .NET Portability Analyzer extension from the Visual Studio Marketplace to check for compatibility to .NET Standard. It analyzes the assemblies. Then, it provides a detailed report on missing .NET APIs that prevent porting applications or libraries to a specified .NET platform.

> [!NOTE]  
> The Visual Studio .NET Portability Analyzer extension is currently only available for Visual Studio 2019.

After the tool is installed, configure it to define the type of portability analysis needed, such as the target .NET versions that you want to be compatible with. To do that, complete the following steps:

1. In Visual Studio, select **Analyze** and then **Portability Analyzer Settings**.
2. In the **General Settings** window, select .NET Standard 2.0 under **Target Platforms**, and then choose **OK**.
3. Now, open the project file containing the code that needs to target .NET Standard, right-click the project, and select **Analyze Project Portability**.  

This step opens up a **Portability Analysis Results** page with and assessment of compatibility, and a list of recommended changes. 

## Using the Microsoft ApiPort tool

Microsofts ApiPort tool is another way to check for compatibility to .NET Standard. This tool allows you to analyze  files in case you don't have access to the original source code. 

You can download the ApiPort tool at [.NET API Portability GitHub repository](https://github.com/Microsoft/dotnet-apiport).

To use the tool, do the following step:

1. Open a command prompt and type `ApiPort.exe analyze -f MyLibrary.dll`.

   The tool can also help analyze projects with dependencies between DLL files and visualize the dependencies. It's useful in more complex solutions with portability problems.

To analyze dependencies, do the following step:

1. Open a command prompt and type `ApiPort.exe analyze -r DGML -f [directory or your solution]`

  When the command finished, you have a DGML file that can be opened in Visual Studio. Directed Graph Markup Language (DGML) describes information used for visualization and complexity analysis. It's the format used to persist code maps in Visual Studio.

## See Also

[Get Started with AL](devenv-get-started.md)  
[.NET Control Add-Ins](devenv-dotnet-controladdins.md)  
[Subscribing to Events in a .NET Framework Type](devenv-dotnet-subscribe-to-events.md)  
[Serializing .NET Framework Types](devenv-dotnet-serializing-dotnetframework-types.md)  
[AL Language Extension Configuration](devenv-al-extension-configuration.md)  
