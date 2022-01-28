---
title: "Nonclustered Columnstore Indexes (NCCI) and Performance"
description: This article looks at the factors you must take into consideration when you deal with nonclustered columnstore indexes and performance. 
ms.custom: na
ms.date: 01/28/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Nonclustered Columnstore Indexes and Performance

This article looks at the factors you must take into consideration when you deal with nonclustered columnstore indexes (NCCIs) and performance.  
  
## Performance factors to consider

The factors that you must take into consideration when you deal with any performance problems that arise include:  
- Do you need an NCCI at all (is it being used)?
- Which fields do you need to index?
- Can you disable some or all SIFT indexes and just use an NCCI?
  
> [!IMPORTANT]  
> Remember to perform tests every time you make any changes to the NCCI structure. You must ensure that the changes that you have made don't cause problems in any other areas of the application. You must also ensure that your changes don't have a negative effect on performance.
  
## See Also

[NCCI and SQL Server](devenv-ncci-and-sql-server.md)  
[NCCI Tuning and Tracing](devenv-ncci-tuning-and-tracing.md)  
[Migrating from SIFT to NCCI](devenv-migrating-from-sift-to-ncci.md)  
[FlowFields](devenv-FlowFields.md)  