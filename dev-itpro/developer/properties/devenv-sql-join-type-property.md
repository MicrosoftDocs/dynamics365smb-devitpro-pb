---
title: "SQLJoinType Property"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 87e3c92e-3651-45cb-9741-05ca8cde85bd
caps.latest.revision: 7
author: SusanneWindfeldPedersen
---

 

# SQLJoinType Property
Sets the data item link type between data items in a query to determine the records that are included in the resulting dataset.  
  
## Applies To  
  
-   Query data items  
  
## Property Value  
 The **SQLJoinType** property has the following values.  
  
|Value|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|-----------|---------------------------------------|  
|Left Outer Join|The resulting dataset contains every record from the upper data item table, even if a record does not have a matching value in the lower data item for fields that are linked by the [DataItemLink Property \(Query\)](devenv-dataitemlink-query-property.md).|  
|Inner Join|The resulting dataset contains records from data item tables where a match is found between the fields that are linked by the **DataItemLink** property of the lower data item.|  
|Right Outer Join|The resulting dataset set contains every record from the lower data item table, even if a record does not have a matching value in the upper data item for fields that are linked by the **DataItemLink** property.|  
|Full Outer Join|The resulting dataset contains all the records from the upper data item table, and all records from the lower data item, including records that do not have a matching value for columns that are linked by the **DataItemLink** property.|  
|Cross Join|The resulting dataset contains rows that combine each row from the upper data item table with each row from a lower data item table. Cross joins are also called Cartesian products.<br /><br /> **Important:** Cross Join does not require any comparisons between fields of data items, so the **DataItemLink** property must be left blank.|  
  
## Remarks  
 When setting up a data item link between two data items, you always set up the **SQLJoinType** property on the lower data item in Query Designer. To access the SQL advanced options, you open the properties of a data item, and then set the **DataItemLinkType** property to **SQL Advanced Options**. The **SQLJoinType** property appears in the **Properties** window for the data item.  
  
 Except for Cross Join, the **SQLJoinType** property works together with the **DataItemLinkType** property to combine records from tables into a dataset. The **DataItemLink** property sets up "equal to" \(=\) comparison between two or more fields of the data item tables. When the query is run, the query compares each row of the two data items to find records that having matching values for the fields. Records that have matching field values are combined into a row in the resulting dataset. In some cases, there will be records that do not have matching values. You use the [DataItemLinkType Property](devenv-dataitemlink-type-property.md) to include records that do not have matching field values.  
 <!--  
 For more information about data item links and SQL Advanced Option, see [Understanding Data Item Links](Understanding-Data-Item-Links.md) and [SQL Advanced Options for Data Item Link Types](SQL-Advanced-Options-for-Data-Item-Link-Types.md). -->