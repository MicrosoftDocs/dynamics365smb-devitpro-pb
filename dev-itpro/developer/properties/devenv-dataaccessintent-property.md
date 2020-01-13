---
title: "DataAccessIntent Property"
ms.custom: na
ms.date: 01/02/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---

# DataAccessIntent Property

Sets whether to access data for the object from a read-only replica of the database or the primary database.

## Applies To  

- Pages of the type API.

    The [Editable property](devenv-editable-property.md) must be set to **false**.

- Query
- Reports

## Property Value

The property has the following values.  

|  Value  |  Description  |
|---------|---------------|  
|**ReadOnly**|Specifies to access data from a read-only replica.|  
|**ReadWrite**|Specifies to access data from the primary database.|  
  
## Syntax
```
DataAccessIntent = ReadOnly|ReadWrite;
```

## Remarks  

For reports, API pages, and queries, the Business Central server can use read-only replicas on Azure SQL database and SQL Server. This property can be used to improve performance when displaying objects when modifications to data is not required. Setting the property to ReadOnly works as a hint for the server to connect to a secondary (read-only) replica if one is available. When a workload is executed against the replica, insert/delete/modify operations are not possible. If any of these operations are executed against the replica, an exception is thrown at runtime.

From the client, the property value can be overwritten by using page **9880 Database Access Intent List** page.

## See Also  

[Properties](devenv-properties.md)   
[Page Properties](devenv-page-properties.md)  
[InDataSet Property](devenv-indataset-property.md)
