---
title: "MaintainSQLIndex Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b9dfd30d-e935-477b-aba6-3cdf30cf0413
caps.latest.revision: 5
manager: edupont
---
# MaintainSQLIndex Property
Sets a value that indicates whether a SQL Server index that corresponds to the Microsoft Dynamics NAV key should be created.  
  
## Applies To  
 Keys  
  
## Property Value  
 **Yes** to create the SQL Server index; otherwise, **No**. The default is **Yes**.  
  
## Remarks  
 In Microsoft Dynamics NAV, you can use a key to sort data in a table by the set of fields specified in the key. SQL Server can sort data without an index on the fields to be sorted. However, if an index exists, sorting by the fields matching the index will be faster, but modifications to the table will be slower. The more indexes there are on a table, the slower the modifications become.  
  
 In situations where a key must be created to allow only occasional sorting \(for example, when running infrequent reports\), set this property to **No** to prevent slow modifications to the table.  
  
> [!NOTE]  
>  You cannot disable this property on the primary key of a table. This key is always created in SQL Server.  
  
## See Also  
 [Properties](Properties.md)