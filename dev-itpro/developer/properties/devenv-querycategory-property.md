---
title: "QueryCategory Property"
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---
 
# QueryCategory Property

This property can be used for displaying SmartLists in the UI. SmartLists are additional views of information linked to a master entity in [!INCLUDE[prodshort](../includes/prodshort.md)]. SmartLists are displayed in the UI under any defined views.

SmartLists are created based on queries. With this functionality, you can create your own lists through extensions. The created list can then be assigned to an entity by setting the `QueryCategory` property.

By being able to create a new list page based on a query, you can get the data you want on one list even if all the data isn’t in a single table in the database.

On queries, the `QueryCategory` property specifies one or more query categories that the object supports. On pages, `QueryCategory` specifies the query category that the page supports.

## Applies to  

- Queries
- Pages

## Syntax

```al
page 50111 CustomerSourceTable
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = Customer;
    QueryCategory = 'Customer';
...
}
```
```al
query 50100 QueryWithCategories
{
    QueryType = Normal;
    QueryCategory = 'Customer', 'Items';

...
}
```



## See Also  
[Properties](devenv-properties.md)   
[Query Object](../devenv-query-object.md)  
[Page Object](../devenv-page-object.md)

