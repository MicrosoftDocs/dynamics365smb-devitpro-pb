---
title: "Resolving Page 9624 Compilation Error on Technical Upgrade "
description: "Explains how to resolve the compilation error that you get for Page 9624 when converting a database from Dynamics NAV to Business Central."
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Page 9624 Compilation Error 
This article explains how to resolve the compilation error that you get for page **9624 Finish Design List Part** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prodshort.md)].

## Resolution

-    Change the field that has the `SourceExpr="Display Name"` to have the `SourceExpr="Customer Name"`.
- In C/AL code, delete the global function `GetTaskDisplayName`.



## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
