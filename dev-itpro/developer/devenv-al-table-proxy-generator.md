---
title: "AL Table Proxy Generator"
description: "Tool for creating integration or proxy tables for integration with Common Data Service from Business Central"
ms.custom: na
ms.date: 04/16/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# AL Table Proxy Generator

The **AL Table Proxy Generator** tool can be used to generate one or more tables for integration with Common Data Service. When one or more entities are present in Common Data Service, but not in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], the tool can be run to generate integration or proxy tables for the specified entity or entities.

An integration or proxy table is a table that represents an entity in Common Data Service. The integration table includes fields that correspond to fields in the entity. The integration table acts as a link or connector between the [!INCLUDE[prodshort](includes/prodshort.md)] table and the Common Data Service entity.

The **AL Table Proxy Generator** tool is available with the **AL Language** extension. Look for the **altpgen.exe** tool in the equivalent folder of `c:\users\<username>\.vscode\extensions\<al extension version>\bin`. 

## Generating proxy tables

1. Start Windows PowerShell as an administrator.
2. From the command prompt, write `.\altpgen.exe` followed by the parameters as described below.  
    ```
    -Project
    -PackageCachePath
    -ServiceURI
    -UserName
    -Password
    -Entities
    -BaseId
    -TableType
    ```
3. The table or tables are generated in the folder of the specified AL project.

## Parameters

|Parameter|Description|
|---------|-----------|
|*Project*| The AL project folder to create the table(s) in.|
|*PackageCachePath*| The AL project cache folder for symbols. <br> **Note:** It is important that the latest symbols have been downloaded because these are used for comparison when the tool runs. |
|*ServiceURI*| The server URL for Common Data Service. For example, `https://tenant.crm.dynamics.com`.|
|*UserName*| The admin user name for Common Data Service. |
|*Password*| The admin password for Common Data Service. |
|*Entities*| The table(s) to create in AL. If multiple, this must be specified as a comma-separated list.<br> |
|*BaseId*| The assigned starting ID for the generated new table(s) in AL. |
|*TableType*| The table type for the table(s) in AL. The options are `CDS` and `CRM`.|

## Example
The following example starts the process for creating a new integration table in the specified AL project. When complete, the output path contains the **Worker.al** file that contains the description of the **50000 CDS Worker** integration table. This table is set to the table type **CDS**.

```
.\altpgen -project: <Your AL project folder> -packagecachepath: <Your AL project cache folder> -serviceuri: <CDS server URL> -username: <Admin username for CDS> -password: <Password> -entities: cdm_worker -baseid: 50000 -tabletype: CDS 
```

## See Also

[Custom Integration with Common Data Service](../administration/administration-custom-cds-integration.md)  