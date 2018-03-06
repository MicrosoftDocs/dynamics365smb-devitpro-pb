---
title: "Record-Level Security"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bb86bc9d-f259-452d-97cf-4f08c169a85b
caps.latest.revision: 19
manager: edupont
---
# Record-Level Security
Record-level security lets you limit the access that a user has to the data in a table.  
  
 You implement record-level security in [!INCLUDE[navnow](includes/navnow_md.md)] by creating security filters on table data. A security filter describes a set of records in a table that a user has permission to access. You can specify, for example, that a user can only read the records that contain information about a particular customer. This means that the user cannot access the records that contain information about other customers. For more information, see [How to: Set Security Filters](How-to--Set-Security-Filters.md).  
  
## Setting Security Filtering Modes  
 When you create security filters, you limit a user's access to data in a table. Therefore, code that requires access to all data in a table fails and the user receives an error message.  
  
 You can resolve potential conflicts with security filters and specify the desired behavior by setting the security filtering mode on Record variables to determine how the security filters are applied. For more information, see [Security Filter Modes](Security-Filter-Modes.md).  
  
## Performance  
 Record-level security filters are handled by SQL Server just like other filters that are applied by the user. They do not adversely affect performance unless the security filtering mode is **Validated**. When the security filtering mode for a record is **Validated**, then [!INCLUDE[navnow](includes/navnow_md.md)] must validate whether each record is in the filter expression.  
  
## See Also  
 [Data Security](Data-Security.md)