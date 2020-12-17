---
title: " Resolving Table 8620 Compilation Error"
description: Explains how to resolve the compilation error that you get for Table 8620 when converting a database from Dynamics NAV to Business Central.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Table 8620 Compilation Error 
This article explains how to resolve the compilation error that you get for codeunit **8620 Config. Tmpl. Selection Rules** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prod_short.md)].

## Resolution

On the `Page ID - OnValidate()` trigger, replace the following code:

``` 
VALIDATE("Table ID",PageMetadata.EntitySetName);
```

With the following code:

``` 
VALIDATE("Table ID",PageMetadata.SourceTable);
```
## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
