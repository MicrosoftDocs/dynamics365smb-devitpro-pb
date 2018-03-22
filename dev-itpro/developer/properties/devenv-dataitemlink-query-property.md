---
title: "DataItemLink Property (Query)"
ms.custom: na
ms.date: 06/02/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9a76b82f-c9fa-40a0-9f47-9bbb27deb809
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# DataItemLink Property (Query)
Sets a reference between one or more fields of the data item table and data item or data items above it.  
  
## Applies To  
  
-   Query data items  
  
## Property Value  
 **Field**=**Table**.**ReferenceField**  
  
-   **Field** is the name of the field in the table of the lower data item.  
  
-   **Table** is the name of the table of the upper data item.  
  
-   **ReferenceField** is the name of the field in the table of the upper data item.  
  
> [!NOTE]  
>  You can link to more than one column. Separate multiple column links with a comma.  
  
## Remarks  
 The DataItemLink property works together with the DataItemLinkType property to combine records from tables into a dataset. The DataItemLink property sets up "equal to" (=) comparison between two fields of the data item tables. When the query is run, the query compares each row of the two data items to find records that having matching values for the fields. Records that have a matching field values are combined into a row in the resulting dataset. In some cases, there will be records that do not have matching values. You use the [DataItemLinkType Property](devenv-dataitemlink-type-property.md) to include records that do not have matching values. <!-- For more information about data item links, see [Understanding Data Item Links](Understanding-Data-Item-Links.md).  -->
  
 When setting up a data item link between two data items, you always set up the DataItemLinkType property on the lower data item in Query Designer. To set the DataItemLink property, you can choose the **AssistButton** to select the fields from field name lookups to data item tables or you can type the syntax directly in the **Value** column.  
  
> [!NOTE]  
>  If the DataItemLinkType property is set to **SQL Advanced Options** and the [SQLJoinType Property](devenv-sql-join-type-property.md) is set to **Cross Join**, then you cannot set the DataItemLink property. <!-- For more information about cross joins, see [SQL Advanced Options for Data Item Link Types](SQL-Advanced-Options-for-Data-Item-Link-Types.md).  -->
  
## Example  
 A Salesperson table and a Sales Header table have the Code column and Salesperson\_Code field in common, respectively. To create a link between these two tables, you add the following value in the DataItemLink property of the **Sales Header** data item.  
  
```  
Salesperson Code=Salesperson.Code  
```  
 <!-- 
 For a detailed step-by-step example of the DataItemLink property, see [Walkthrough: Creating a Query to Link Two Tables](Walkthrough--Creating-a-Query-to-Link-Two-Tables.md). --> 
  
## See Also  
 [DataItemLinkType Property](devenv-dataitemlink-type-property.md)  
 <!--  [Understanding Data Item Links](Understanding-Data-Item-Links.md)  
 [How to: Create Queries](How-to--Create-Queries.md)
 -->