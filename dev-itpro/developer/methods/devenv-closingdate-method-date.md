---
title: "CLOSINGDATE Method (Date)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ff8ed675-00d3-4d11-af67-3ffc0621d3a7
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLOSINGDATE Method (Date)
Gets the closing date for a [Date Data Type](../datatypes/devenv-Date-Data-Type.md).  
  
## Syntax  
  
```  
  
ClosingDate := CLOSINGDATE(Date)  
```  
  
#### Parameters  
 *Date*  
 Type: Date  
  
 The input date.  
  
## Property Value/Return Value  
 Type: Date  
  
 The corresponding closing date for the input date.  
  
## Remarks  
 All dates have a corresponding closing date. A closing date is a period in time following the given date but before the next regular date. Closing dates are sorted immediately after the corresponding regular date but before the next regular date.  
  
 xxxxxxD: Regular date  
  
 xxxxxxC: Closing date  
  
 The compiler cannot convert the expression xxxxxxC to a Date data type. Therefore, you must use the CLOSINGDATE method to create a closing date.  
  
## Example  
 The first example shows how to use the CLOSINGDATE method. A regular date is given as input. This code example requires that you create the following global variables and text constants.  
  
|Name|DataType|  
|----------|--------------|  
|Date1|Date|  
|CloDate|Date|  
  
|Name|ConstValue|  
|----------|----------------|  
|Text000|The closing date for %1 is %2.|  
  
```  
Date1 := 040414D;  
CloDate := CLOSINGDATE(Date1);  
MESSAGE(Text000, Date1, CloDate);  
```  
  
 The following message is displayed:  
  
 **The closing date for 04/04/14 is C04/04/14.**  
  
## Example  
 The second example shows some statements that do not work and explains why they do not work. This example requires that you create the following global variables and text constants.  
  
|Name|DataType|  
|----------|--------------|  
|Date1|Date|  
|CloDate1|Date|  
|CloDate2|Date|  
  
|Name|ConstValue|  
|----------|----------------|  
|Text001|The closing date for %1 is %2.|  
  
```  
// Date1 := 040414C;  
// The previous statement does not compile because the compiler   
// cannot convert '040414C' to a Date data type.  
Date1 := 040414D;  
// The previous statement compiles.   
// The compiler converts '040414D' to a Date data type.  
// CloDate1 := CLOSINGDATE(050514C);  
// The previous statement does not compile because the compiler   
// cannot convert '050514C' to a Date data type and the CLOSINGDATE   
// method requires a Date data type for its parameter.  
CloDate1 := CLOSINGDATE(Date1);  
// The previous statement compiles.  
// Date1 is a Date data type.   
CloDate2 := CLOSINGDATE(CloDate1);  
// The previous statement compiles.  
// CloDate1 is a Date data type.  
MESSAGE(Text001, CloDate1, CloDate2);  
```  
  
 The following message is displayed:  
  
 **The closing date for C04/04/14 is C04/04/14.**  
  
## See Also  
 [Date and Time Methods](devenv-Date-and-Time-Methods.md)