---
title: "TopNumberOfRows Property"
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
# TopNumberOfRows Property
> **Version**: _Available from runtime version 1.0._

Specifies the maximum number of rows to include in the resulting data set of a query.

## Applies to
-   Query

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

An integer that specifies the maximum number of rows to include in the resulting dataset.  
  
> [!NOTE]  
> A value of **0** is the same as leaving the property blank. If you set the value to **0**, then there is no limit and all rows of the dataset are returned.  
 
## Syntax

```AL
TopNumberOfRows = 10;
```

## Remarks

You use the **TopNumberOfRows** property to limit the resulting dataset to the first set of rows that are generated for the query. For example, you can include only the first 10 or first 100 rows in the resulting dataset. The TopNumberOfRows property is useful for key performance indicators such as the top number of customers or sales.  
  
You can also specify the number of rows to include in the dataset by calling the [TopNumberOfRows Method](../methods-auto/query/queryinstance-TopNumberOfRows-method.md) from AL. The TopNumberOfRows method will overwrite the **TopNumberOfRows** property setting.  
  
## See Also

[Query Object](../devenv-query-object.md)  
[Linking and Joining Data Items](../devenv-query-links-joins.md)  
[Aggregating Data in Query Objects](../devenv-query-totals-grouping.md)  
[Filtering Data in Query Objects](../devenv-query-filters.md)  
[Properties](devenv-properties.md)
