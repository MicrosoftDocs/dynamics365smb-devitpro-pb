---
title: "Working with multiple AL project folders within one workspace"
description: "Handling solutions in the AL language that contain multiple projects."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Working with multiple AL project folders within one workspace
Visual Studio Code offers the multi-root workspace feature which enables grouping different project folders into one workspace. The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] also supports the multi-root functionality and allows you to work with multiple AL folders including roots and projects within one workspace. 

## Working with multiple project folders 
Go through the following steps to work simultaneously on several related projects.  

1) On the **File** tab of Visual Studio Code, select **Add Folder to Workspace...** .  
2) Save the workspace file if you plan to open it again.  
This will create a `code-workspace` file that contains an array of folders with either absolute or relative paths. If you want to share your workspace files, choose the relative paths.  
3) Modify the settings of your files in the **Settings** editor. You can change your user settings, global workspace settings, or individual folder settings. 

For more information about multi-root workspaces in Visual Studio Code, see [Multi-root Workspaces](https://code.visualstudio.com/docs/editor/multi-root-workspaces).

## Grouping a set of disparate project folders into one workspace
It is not mandatory to use only AL-based roots. Different kinds of projects can be mixed, and each AL project will have its configuration values for the following settings: 

- `al.packageCachePath`  
- `al.enableCodeAnalysis`

The `al.packageCachePath` setting allows you to specify the path to a folder that will act as the cache for the symbol files used by your project. It can be specified in the **User Settings**, **Workspace Settings**, or **Project Settings**. The `al.enableCodeAnalysis` setting allows you to enable the execution of code analyzers on your project. It can likewise be specified in the **User Settings**, **Workspace Settings**, or **Project Settings**. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).


## See also 
[Development in AL](devenv-dev-overview.md)  
[Best Practices for AL](../compliance/apptest-bestpracticesforalcode.md)  
[Working with Multiple Projects and Project References](devenv-work-workspace-projects-references.md)  
