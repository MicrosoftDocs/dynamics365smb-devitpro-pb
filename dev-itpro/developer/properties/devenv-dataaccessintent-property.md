---
title: "DataAccessIntent Property"
description: "Sets the data access intent of the page."
ms.author: solsen
ms.date: 07/01/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DataAccessIntent Property
> **Version**: _Available or changed with runtime version 5.0._

Sets the data access intent of the page.

## Applies to
-   Page
-   Report
-   Query

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**ReadOnly**|runtime version 5.0|Intent to access records, but not to modify them. Read-only pages are run against a replica of the database leading to improved performance, but preventing modifications to the database records.|
|**ReadWrite**|runtime version 5.0|Intent to access and modify records.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
DataAccessIntent = ReadOnly|ReadWrite;
```

## Remarks  

For reports, API pages, and API queries, the [!INCLUDE [prod_short](../includes/prod_short.md)] server can use read-only database replicas on Azure SQL Database and SQL Server. If replicas are enabled, use this property to reduce the load on the primary database. Using **ReadOnly** might also improve performance when viewing objects. **ReadOnly** works as a hint for the server to route the connection to a secondary (read-only) replica, if one is available. When a workload is executed against the replica, insert/delete/modify operations aren't possible. If any of these operations are executed against the replica, an exception is thrown at runtime. The following sections explain how this property is handled on different object types.

### Page

The property only applies to pages of type API. The [Editable property](devenv-editable-property.md) must be set to **false**. When an OData call fetches data from the page, then it's only the call to fetch the data that uses the read-only replica. Database calls needed in setting up the API page are performed against the primary database, for example, database calls in the `OpenCompany` triggers.

### Query

The property only has an effect on queries exposed through OData (API queries). It has no effect in normal code paths. When an OData call fetches data from the query, then it's only the call to actually fetch the data that uses the read-only replica. Database calls needed in setting up the session before retrieving data are performed against the primary database, for example, database calls in the `OpenCompany` triggers.

### Report

The property also affects reports generated in UI sessions. The database calls needed while iterating through data items use the read-only replica if it's set. Records read before and after generation of the data set are read from the primary database.

From the client, the property value can be overwritten by using page **9880 Database Access Intent List** page.

When calling an API page or API query, the property value can be overwritten by specifying HTTP request header `Data-Access-Intent`. 

[!INCLUDE[database_access_intent_note](../../includes/include-database-access-intent-note.md)]

## See Also  

[Using Read Scale-Out for Better Performance](../../administration/database-read-scale-out-overview.md)  
[Optimizing SQL Server Performance](../../administration/optimize-sql-server-performance.md)  
[Properties](devenv-properties.md)   
[Page Properties](./devenv-properties.md)  
[Specifying Data Access Intent for REST API GET requests](../devenv-connect-apps-tips.md#DataAccessIntent)  
