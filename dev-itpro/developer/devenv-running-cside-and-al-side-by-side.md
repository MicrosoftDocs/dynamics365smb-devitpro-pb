---
title: "Running C/SIDE and AL Side-by-Side"
description: "Description of how you can run both development environments side-by-side."
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

# Running C/SIDE and AL Side-by-Side
[!INCLUDE[prod_short](../includes/prod_short.md)] on-premises supports development using both C/SIDE and AL, as well as Designer side-by-side. When new objects are added or changed in C/SIDE these changes must be reflected in the symbol download in Visual Studio Code using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. To enable this reflection, a command and argument called `generatesymbolreference` has been added to finsql.exe and you can run it as illustrated below. 

## Get started generating symbols and compiling all objects

Open a command prompt **Run as administrator** and change to the directory where the finsql.exe file has been installed as part of Dynamics NAV Development Environment.

Use the `generatesymbolreference` command specified with the database and server name to add symbol references to the **Object Metadata** table for the specified database. 

Given the `generatesymbolreference` command, C/SIDE will traverse all the objects in the database and generate symbols for them. This command should be run at least once to generate the initial set of symbols to which incremental updates can be applied.

### Syntax example

```
finsql.exe Command=generatesymbolreference, Database=<DatebaseName>, ServerName=<ServerName>\<Instance>
```

For example:
```
finsql.exe Command=generatesymbolreference, Database="Demo Database NAV (11-0)", ServerName=.\NAVDEMO
```
<br>

> [!TIP]  
> The finsql.exe includes several parameters that you can set to suit you environment. For more information, see [Using the Development Environment from the Command Prompt](../cside/cside-command-prompt.md). 

This is a lengthy operation. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**.
    
When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred.

> [!NOTE]
> The symbol references are stored in the **Symbol Reference** column of the **Object Metadata** table of the database. For on-premises installations, if you experience problems with generating symbols, check the information in the naverrorlog.txt file.

## Continuously generate symbols each time you compile objects in C/SIDE
The `generatesymbolreference` flag enables incremental symbol generation through the UI or through the compile command passed on the command line.
To update the symbols for a set of objects from the UI, start C/SIDE with the `generatesymbolreference` flag, make any desired modifications to your application objects, and compile them.

> [!NOTE]  
> Use `generatesymbolreference` set to yes as a command line argument each time you start finsql.exe to have all compilations add a symbol reference to the **Object Metadata** table. The default setting of the argument is no. 

> [!NOTE]  
> If you make changes in C/SIDE and start the C/SIDE development environment without the `generatesymbolreference` flag set to `yes`, the symbols downloaded from Visual Studio Code will not reflect your changes.

### Syntax example
```
finsql.exe generatesymbolreference=yes
```

This flag is also a part of the `Compile-NavApplicationObject` PowerShell command and you can use it to compile and generate symbols on a filtered set of application objects through PowerShell. This alternative should be considered if you do not work with the UI in C/SIDE. For more information about it, see [Compile-NavApplicationObject](/powershell/module/microsoft.dynamics.nav.ide/compile-navapplicationobject?view=businesscentral-ps).


## Business Central on-premises server setting
In addition to the symbol generation setting you have chosen above, you must enable the [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises server setting. 

1. Go to **[!INCLUDE[prod_short](../includes/prod_short.md)] Administration**.
2. Scroll to the **Development** tab and expand the tab.
3. Choose the **Edit** button, and then select the **Enable loading application symbols at server startup** checkbox.

> [!IMPORTANT]  
> This setting must be enabled to allow any symbol generation. If the setting is not enabled, the `generatesymbolreference` setting does not have any effect.

## See Also
[Developing Extensions](devenv-dev-overview.md)  