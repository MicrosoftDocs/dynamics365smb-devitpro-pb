---
title: "ReverseSign Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 1a82a17a-7145-4cf9-a1d7-8ae71c9fb1b7
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

 

# ReverseSign Property
Changes negative values into positive values and positive values into negative values in a column of a resulting query dataset.  
  
## Applies to  
 Query columns  
  
> [!NOTE]  
>  The **ReverseSign** property applies only to columns that have a numeric data type. If you set the **ReverseSign** property on a column that does not have a numeric data type, you will get an error.  
  
## Property Value  
 **True** to reverse the sign of column values; otherwise, **false**. The default is **false**.  
 
## Syntax
```
ReverseSign = true;
```
 
## Remarks  
 Field values in a database table can be negative numbers, as well as positive. For example, credits are typically stored as negative values to deduct them from the overall balance due. However, for displaying purposes, such as in spreadsheets and charts, you might want these quantities to appear as a positive numbers.  

## See Also  
[Properties](devenv-properties.md)   
[AL Data Types](../datatypes/devenv-al-data-types.md)   
 
