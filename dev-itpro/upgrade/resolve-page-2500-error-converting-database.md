---
title: "Page Page 2500 Errors "
description: "Explains how to resolve the compilation errors that you get for Page 2500 when converting a database from Dynamics NAV to Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Page 2500 Compilation Error 
This article explains how to resolve the compilation error that you get for page **2500 Page Management** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prod_short.md)].

## Resolution

In the `Download Source -OnAction` trigger, replace the following code:

```
Designer.GenerateDesignerPackageZipStream(NvOutStream,ID);
```

With:

```
Designer.GenerateDesignerPackageZipStreamByVersion(NvOutStream,ID,VersionString);
```
## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
