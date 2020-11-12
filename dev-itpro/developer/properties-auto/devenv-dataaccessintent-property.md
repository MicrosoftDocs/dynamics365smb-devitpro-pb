---
title: "DataAccessIntent Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataAccessIntent Property
> **Version**: _Available from runtime version 5.0._

Sets the data access intent of the page.

## Applies to
-   Page
-   Report
-   Query

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**ReadOnly**|Intent to access records, but not to modify them. Read-only pages are run against a replica of the database leading to improved performance, but preventing modifications to the database records.|
|**ReadWrite**|Intent to access and modify records.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Syntax

```AL
DataAccessIntent = ReadOnly|ReadWrite;
```

## Remarks  

> [!NOTE]
> It only applies to pages of the type API. For such, The [Editable property](devenv-editable-property.md) must be set to **false**.

For reports, API pages, and queries, the Business Central server can use read-only database replicas on Azure SQL Database and SQL Server. If replicas are enabled, use this property to reduce the load on the primary database. Using **ReadOnly** might also improve performance when viewing objects. **ReadOnly** works as a hint for the server to route the connection to a secondary (read-only) replica, if one is available. When a workload is executed against the replica, insert/delete/modify operations aren't possible. If any of these operations are executed against the replica, an exception is thrown at runtime.

From the client, the property value can be overwritten by using page **9880 Database Access Intent List** page.

## See Also  

[Using Read Scale-Out for Better Performance](../../administration/database-read-scale-out-overview.md)  
[Optimizing SQL Server Performance](../../administration/optimize-sql-server-performance.md)  
[Properties](devenv-properties.md)   
[Page Properties](devenv-page-properties.md)  
[InDataSet Property](devenv-indataset-property.md)
