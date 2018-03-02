---
title: "DMY2DATE Function (Date)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d065665e-4272-427d-8147-7105c7cc8b84
caps.latest.revision: 9
manager: edupont
---
# DMY2DATE Function (Date)
Gets a Date object based on a day, month, and year.  
  
## Syntax  
  
```  
  
Date := DMY2DATE(Day [, Month] [, Year])  
```  
  
#### Parameters  
 *Day*  
 Type: Integer  
  
 The number of the day in the month \(1-31\)  
  
 *Month*  
 Type: Integer  
  
 The number of the month in the year \(1-12\). If you omit this optional parameter, the current month will be used as the default.  
  
 *Year*  
 Type: Integer  
  
 The four-digit number of the year. If you omit this optional parameter, the current year is used as the default.  
  
## Property Value/Return Value  
 Type: Date  
  
 The resulting date.  
  
## Example  
 This code example requires that you create the following variables and text constants in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|Day|Integer|  
|Month|Integer|  
|Year|Integer|  
|OutputDate|Date|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Day number %1, month number %2, and year number %3 corresponds to the date %4.|  
  
```  
Day := 17;  
Month := 2;  
Year := 2014;  
OutputDate := DMY2DATE(Day, Month, Year);  
MESSAGE(Text000, Day, Month, Year, OutputDate);  
```  
  
 On a computer that has the regional format set to English \(United States\), the message window displays the following:  
  
 **Day number 17, month number 2, and year number 2014 corresponds to the date 02/17/14.**  
  
## See Also  
 [Date and Time Functions](Date-and-Time-Functions.md)   
 [Date Data Type](Date-Data-Type.md)