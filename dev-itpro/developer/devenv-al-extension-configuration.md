---
title: "AL Language Extension Configuration"
description: "Description of the settings of the AL Language extension in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 05/28/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# AL Language Extension Configuration

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

The AL Language extension has a number of settings that can be specified for a specific user or for a workspace. To activate the settings, press **Ctrl+Shift+P**, and then choose **Preferences: Open Settings (UI)** for workspace settings, or choose **Preferences: Open User Settings** for user settings. Under **Extensions**, and **AL Language extension configuration** you will find the settings that are available for the AL Language extension. For tips on how to optimize Visual Studio Code, see [Optimizing Visual Studio Code for AL Development](devenv-optimize-visual-studio-code.md).

## Settings
The following table describes the user and workspace settings for the AL Language extension:

|Setting|Value|
|-------|-----|
|Assembly Probing Paths|Sets the list of directory paths where the compiler searches for referenced .NET assemblies. For example: `"al.assemblyProbingPaths": ["./.netpackages", "C:/Program Files/Assemblies"]`|
|Browser|Specifies the browser in which to open the Business Central client when launching the application from Visual Studio Code.|
|Code Analyzers|Sets the list of paths to code analyzers to use for performing code analysis. For example : `"al.codeAnalyzers": ["${AppSourceCop}", "${CodeCop}"]`.|
|Compilation Options|Specifies the compilation options; `generateReportLayout`, which controls whether report layout files are generated during build and `parallel`, which controls whether to use concurrent builds. Both options are default set to `true`.|
|Editor Services Log Level|Sets the logging verbosity level for the AL Language Editor Services host executable. Possible values are `Verbose`, `Normal`, `Warning`, and `Error`.|
|Editor Services Path|Specifies the path to the Editor Services host executable.|
|Enable Code Actions|Specifies whether code actions should be enabled for all source files in the current project. Default is `false`.|
|Enable Code Analysis|Specifies whether code analysis should be performed for all source files in the current project. Default is `false`. If this is set to `true`, you must specify the **Code Analyzers** setting with the list of code analyzers to use.|
|Incognito|Specifies whether to open the browser in Incognito/InPrivate mode when launching the application from Visual Studio Code. This option will take effect only if the **Browser** option is set to a non-default value.|
|Package Cache Path|Sets the directory path where reference symbol packages are located.|
|Rule Set Path|Sets the path to the file containing the customized rules to use when running code analysis.|
|Incremental Build| Specifies whether a project, when it is built using **Ctrl+Shift+B**, **Ctrl+F5**, or **F5**, will reuse the last known tracked compilation which will enhance the compilation time significantly. For more information about project to project references, see [Working with multiple projects and project references](devenv-work-workspace-projects-references.md). <br> **Note:** Setting this to `true` will not do an end-to-end build, as it is depending on an already-compiled state. To get a clean, full build, this flag must be set to `false`. Default is `false`.|
|Snapshot Output Path|Sets the directory path where snapshot files are saved. Default is `./.snapshots`.|
|Snapshot Debugging Path|Sets the directory path where the snapshot debugger sources are located. Default is `./.snapshot`.|
<!-- |DefaultLaunchConfigurationName|Specifies the setting for resolving a server name. If this is set then all scenarios that need to resolve a server name will use this configuration setting.<br><br> For example, using the **Go to definition** option, if this server name is not specified, a list will be displayed to select a configuration from, which will be used going forward to resolve the server name and possibly provide symbolic information in the DAL file. To change that, specify the `DefaultLaunchConfigurationName`setting.<br> Another example is **Download symbols**; if there are multiple debug configurations, the specified `DefaultLaunchConfigurationName` will be used to resolve the server name and download symbols. If the server name is not specified, a list will be displayed to select a configuration from.| -->

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Debugging in AL](devenv-debugging.md)  
[JSON Files](devenv-json-files.md)  
[Working with multiple projects and project references](devenv-work-workspace-projects-references.md)  