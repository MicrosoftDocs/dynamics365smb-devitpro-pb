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

The **AL Table Proxy Generator** tool is available with the **AL Language** extension. 



Locate the **altpgen.exe** tool in the equivalent folder of `c:\users\<username>\.vscode\extensions\<al extension version>\bin`.


1. On the computer that is running Business Central..., start Windows PowerShell as an administrator.
2. At the command prompt...

Locate the **altpgen.exe** tool in the equivalent folder of `c:\users\<username>\.vscode\extensions\<al extension version>\bin`.

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