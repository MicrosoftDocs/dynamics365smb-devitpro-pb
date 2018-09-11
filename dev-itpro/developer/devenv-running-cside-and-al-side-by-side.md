---
title: "Running C/SIDE and AL Side-by-Side"
description: "Description of how you can run both development environments side-by-side."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 09/11/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Running C/SIDE and AL Side-by-Side
 [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises supports development using both C/SIDE and AL, as well as Designer side-by-side. When new objects are added or changed in C/SIDE these changes must be reflected in the symbol download in Visual Studio Code using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)]. To enable this reflection, a new command and argument has been added to finsql.exe called `generatesymbolreference`, run it as illustrated below.

## Get started generating symbols and compiling all objects
Use the `generatesymbolreference` command specified with the database and server name. This command will add symbol references to the **Object Metadata** table for the specified database. 

> [!IMPORTANT]  
> Run this command at least once to have a set of symbol references.

### Syntax example
```
finsql.exe Command=generatesymbolreference, Database="Demo Database NAV (11-0)", ServerName=.\NAVDEMO
```

> [!NOTE]  
> This is a lengthy operation.

## Continuously generate symbols each time you compile objects in C/SIDE
Use `generatesymbolreference` set to yes as a command line argument each time you start finsql.exe to have all compilations add a symbol reference to the **Object Metadata** table. The default setting of the argument is no. 

> [!NOTE]  
> If you make changes in C/SIDE and start the C/SIDE development environment without the `generatesymbolreference` flag set to `yes`, no symbols will be generated when downloading symbols from Visual Studio Code.

### Syntax example
```
finsql.exe generatesymbolreference=yes
```

## Business Central on-premises server setting
In addition, you must enable the [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises server setting; **Enable Symbol Loading at Server Startup**. This setting must be enabled to allow any symbol generation. 

If the setting is not enabled, the `generatesymbolreference` setting does not have any effect.

## See Also
[Developing Extensions](devenv-dev-overview.md)  