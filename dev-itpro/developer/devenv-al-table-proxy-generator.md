---
title: "AL Table Proxy Generator Overview"
description: ""
ms.custom: na
ms.date: 02/03/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# AL Table Proxy Generator Overview

The **AL Table Proxy Generator** tool can be used to generate one or more tables for integration with Common Data Service. The tool is available with the **AL Language** extension and the **altpgen.exe** tool is found in the equivalent folder of `c:\users\<username>\.vscode\extensions\<al extension version>\bin`.


1. Start Windows PowerShell as an administrator.
2. At the command prompt...


The syntax for the generator is the following:

```powershell
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

-project <Your AL project folder>  
-packagecachepath <Your AL project cache folder>  
-serviceuri <CDS server URL>  
-username <Admin username for CDS>  
-password <Password>  
-entities cdm_worker  
-baseid 50000  
-tabletype CDS   


This starts the process for creating the table. When completed, the output path contains the **Worker.al** file that contains the description of the **50001 CDS Worker** integration table. This table is set to the table type **CRM**.

## See Also