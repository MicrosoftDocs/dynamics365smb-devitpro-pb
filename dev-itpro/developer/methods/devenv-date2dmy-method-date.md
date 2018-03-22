---
title: "DATE2DMY Method (Date)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: bd97816c-45ad-4846-990e-922ebed8508f
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# DATE2DMY Method (Date)
Gets the day, month, or year of a [Date Data Type](../datatypes/devenv-Date-Data-Type.md).  
  
## Syntax  
  
```  
  
Number := DATE2DMY(Date, What)  
```  
  
#### Parameters  
 *Date*  
 Type: Date  
  
 The input date.  
  
 *What*  
 Type: Integer  
  
 Specifies what the method should return. The valid options are 1, 2, and 3.  
  
 The value 1 corresponds to Day \(1-31\).  
  
 The value 2 corresponds to Month \(1-12\).  
  
 The value 3 corresponds to Year.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The day, month, or year of the *Date* parameter.  
  
## Example  
 This example shows how to use the DATE2DMY method. This code example requires that you create the following global variables and text constants.  
  
|Name|DataType|  
|----------|--------------|  
|InputDate|Date|  
|Day|Integer|  
|Month|Integer|  
|Year|Integer|  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|Today is day %1 of month %2 of the year %3.|  
  
```  
InputDate := TODAY;  
Day := DATE2DMY(InputDate,1);  
Month := DATE2DMY(InputDate,2);  
Year := DATE2DMY(InputDate,3);  
MESSAGE(Text000,Day,Month,Year);  
```  
  
 The message window displays the following:  
  
 **Today is day 16 of month 2 of the year 2014.**  
  
## See Also  
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)