---
title: "Running C/SIDE and AL Side-by-Side"
description: "Description of how you can run both development environments side-by-side."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/26/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Running C/SIDE and AL Side-by-Side
[!INCLUDE[prodshort](../includes/prodshort.md)] on-premises supports development using both C/SIDE and AL, as well as Designer side-by-side. When new objects are added or changed in C/SIDE these changes must be reflected in the symbol download in Visual Studio Code using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. To enable this reflection, a new command and argument called `generatesymbolreference` has been added to finsql.exe and you can run it as illustrated below. 

## Get started generating symbols and compiling all objects
Use the `generatesymbolreference` command specified with the database and server name to add symbol references to the **Object Metadata** table for the specified database. 

Given the `generatesymbolreference` command, C/SIDE will traverse all the objects in the database and generates symbols for them. This command should be run at least once to generate the initial set of symbols to which incremental updates can be applied.

### Syntax example
```
finsql.exe Command=generatesymbolreference, Database="Demo Database NAV (11-0)", ServerName=.\NAVDEMO
```

> [!NOTE]  
> This is a lengthy operation.

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

This flag is also a part of the Compile-NavApplicationObject PowerShell command and you can use it to compile and generate symbols on a filtered set of application objects through PowerShell. This alternative should be considered if you do not work with the UI in C/SIDE. For more information about it, see [Compile-NavApplicationObject](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.ide/compile-navapplicationobject?view=dynamicsnav-ps-2018).


## Business Central on-premises server setting
In addition, you must enable the [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises server setting; **Enable Symbol Loading at Server Startup**. This setting must be enabled to allow any symbol generation. 

If the setting is not enabled, the `generatesymbolreference` setting does not have any effect.

## See Also
[Developing Extensions](devenv-dev-overview.md)  