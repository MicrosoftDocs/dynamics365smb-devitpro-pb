---
title: "DataItemTableFilter Property"
ms.custom: na
ms.date: 06/01/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1ed10f7d-2c47-4b96-b064-d8f8479e6473
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

 

# DataItemTableFilter Property
Sets filters on fields of the underlying table of a query.  
  
## Applies to  
 DataItems of queries  
  
## Property Value  
 Filter expression.  
  
 The filter expression must follow the required syntax. For more information, see [Entering Criteria in Filters](../devenv-entering-criteria-in-filters.md).  
  
## Remarks  
 In a query, a DataItem specifies a table from which to retrieve data. You use the DataItemTableFilter property to apply conditions on one or more fields of the table to limit the records in the resulting dataset of the query. You can filter on any field in the table, not just those fields that are included as columns in the resulting dataset.  
  
 To set up filters, you can either enter the filter syntax directly in the **Value** column for the DataItemTableField property in the **Properties** window or choose the **Value** column, and then use the **Table Filter** window to set up the filters. If you are entering filters manually, then you must separate filters for different fields by using a comma.  
  
 In addition to the DataItemTableField property, you can also filter on the same field by setting the [ColumnFilter Property](devenv-columnfilter-property.md) on a Column or Filter row in Query Designer or by calling the [SETFILTER Method (Query)](../methods/devenv-setfilter-method-query.md) and [SETRANGE Method (Query\)](../methods/devenv-setrange-method-query.md) from AL. A filter that is set by the ColumnFilter property, SETFILTER method, or SETRANGE method is joined to the filter that is set by the DataItemTableFilter property. In logical terms, and in SQL SELECT statements, this combination corresponds to an "AND" operator. For example, if the DataItemTableFilter property sets a filter on a field to include values less than fifty \(\<50\) and the ColumnFilter property sets a filter on the same field to include values greater than twenty \(>20\), then the resultant filter includes values that are greater than twenty and less than fifty \(20\< value \<50\). Using the same example, if the SETFILTER method is called from AL code and sets a filter to include values greater than ten \(>10\), then the SETFILTER method overwrites the ColumnFilter property and the resultant filter on the field includes values that are greater than ten and less than fifty \(10\< value \<50\).  
  
> [!NOTE]  
>  In an SQL SELECT statement, a filter that is set by the DataItemTableFilter property would correspond to a WHERE clause.