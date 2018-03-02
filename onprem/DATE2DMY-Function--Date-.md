---
title: "DATE2DMY Function (Date)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bd97816c-45ad-4846-990e-922ebed8508f
caps.latest.revision: 12
manager: edupont
---
# DATE2DMY Function (Date)
Gets the day, month, or year of a [Date Data Type](Date-Data-Type.md).  
  
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
  
 Specifies what the function should return. The valid options are 1, 2, and 3.  
  
 The value 1 corresponds to Day \(1-31\).  
  
 The value 2 corresponds to Month \(1-12\).  
  
 The value 3 corresponds to Year.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The day, month, or year of the *Date* parameter.  
  
## Example  
 This example shows how to use the DATE2DMY function. This code example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
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
 [Date and Time Functions](Date-and-Time-Functions.md)