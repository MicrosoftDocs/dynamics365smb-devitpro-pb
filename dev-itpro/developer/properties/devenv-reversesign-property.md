---
title: "ReverseSign Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# ReverseSign Property
> **Version**: _Available from runtime version 1.0._

Changes negative values into positive values and positive values into negative values in a column of a resulting query data set.

## Applies to
-   Query Column


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> The **ReverseSign** property applies only to columns that have a numeric data type. If you set the **ReverseSign** property on a column that does not have a numeric data type, you will get an error.  
  
## Property Value  

**True** to reverse the sign of column values; otherwise, **false**. The default is **false**.  
 
## Syntax

```AL
ReverseSign = true;
```
 
## Remarks

Field values in a database table can be negative numbers, as well as positive. For example, credits are typically stored as negative values to deduct them from the overall balance due. However, for displaying purposes, such as in spreadsheets and charts, you might want these quantities to appear as a positive numbers.  

## See Also  

[Properties](devenv-properties.md)   
[AL Data Types](../datatypes/devenv-al-data-types.md)  