---
title: "AL Table Proxy Generator"
description: "Tool for creating integration or proxy tables for integration with Common Data Service from Business Central"
ms.custom: na
ms.date: 02/03/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# AL Table Proxy Generator

The **AL Table Proxy Generator** tool can be used to generate one or more tables for integration with Common Data Service. When one or more entities are present in Common Data Service, but not in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], the tool can be run to generate integration or proxy tables for the specified entity or entities.

The tool is available with the **AL Language** extension and the **altpgen.exe** tool is found in the equivalent folder of `c:\users\<username>\.vscode\extensions\<al extension version>\bin`. 

## Generating proxy tables

1. Start Windows PowerShell as an administrator.
2. At the command prompt...


The syntax for the generator is the following:

```console
.\altpgen
-Project
-PackageCachePath
-ServiceURI
-UserName
-Password
-Entities
-BaseId
-TableType
```

## Parameters

|Parameter|Description|
|---------|-----------|
|*Project*| The AL project folder to create the table(s) in.|
|*PackageCachePath*| The AL project cache folder. |
|*ServiceURI*| The server URL for Common Data Service. |
|*UserName*| The admin user name for Common Data Service. |
|*Password*| The admin password for Common Data Service. |
|*Entities*| The table(s) to create in AL. |
|*BaseId*| The assigned ID for the table(s) in AL. |
|*TableType*| The table type for the table(s) in AL. |

## Example
The following example starts the process for creating a new integration table in the specified AL project. When complete, the output path contains the **Worker.al** file that contains the description of the **50000 CDS Worker** integration table. This table is set to the table type **CDS**.

```powershell
-project <Your AL project folder>  
-packagecachepath <Your AL project cache folder>  
-serviceuri <CDS server URL>  
-username <Admin username for CDS>  
-password <Password>  
-entities cdm_worker  
-baseid 50000  
-tabletype CDS 
```

## See Also
[](cross link to the )