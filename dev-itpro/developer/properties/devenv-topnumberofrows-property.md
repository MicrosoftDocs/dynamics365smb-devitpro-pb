---
title: "TopNumberOfRows Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 9ae8cc3e-5264-4d56-87f8-cab19e1615a7
caps.latest.revision: 9
author: SusanneWindfeldPedersen
---

# TopNumberOfRows Property
Specifies the maximum number of rows to include in the resulting dataset of a query.  
  
## Applies to  
 Query objects  
  
## Property Value  
 An integer that specifies the maximum number of rows to include in the resulting dataset.  
  
> [!NOTE]  
>  A value of **0** is the same as leaving the property blank. If you set the value to **0**, then there is no limit and all rows of the dataset are returned.  
 
## Syntax
```
TopNumberOfRows = 10;
```

## Remarks  
You use the **TopNumberOfRows** property to limit the resulting dataset to the first set of rows that are generated for the query. For example, you can include only the first 10 or first 100 rows in the resulting dataset. The TOPNUMBEROFROWS property is useful for key performance indicators such as the top number of customers or sales.  
  
 You can also specify the number of rows to include in the dataset by calling the [TOPNUMBEROFROWS Method](../methods-auto/query/queryinstance-topnumberofrows-method.md) from AL. The TOPNUMBEROFROWS method will overwrite the **TopNumberOfRows** property setting.  
  
## See Also

[Query Object](../devenv-query-object.md)  
[Linking and Joining Data Items](../devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](../devenv-query-totals-grouping.md)  
[Filtering Data in Query Objects](../devenv-query-filters.md)  
[Properties](devenv-properties.md)
