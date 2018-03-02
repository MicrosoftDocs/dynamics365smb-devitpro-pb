---
title: "PRINTONLYIFDETAIL Function (Report)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: abbd324e-7544-46cf-94a9-979c0db0499d
caps.latest.revision: 9
manager: edupont
---
# PRINTONLYIFDETAIL Function (Report)
Gets or sets the current settings of the [PrintOnlyIfDetail Property](PrintOnlyIfDetail-Property.md).  
  
## Syntax  
  
```  
  
[IsPrintOnlyIfDetail :=] PRINTONLYIFDETAIL([SetPrintOnlyIfDetail])  
```  
  
#### Parameters  
 *SetPrintOnlyIfDetail*  
 Type: Boolean  
  
 The new setting of [PrintOnlyIfDetail Property](PrintOnlyIfDetail-Property.md).  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the [PrintOnlyIfDetail Property](PrintOnlyIfDetail-Property.md) is set to true; otherwise, **false**.  
  
## Example  
 The following example is from the OnAfterGetRecord trigger of a report. If the PrintOnlyIfDetail property is true and if a GLEntryPage record exists, given the current filters, then the PageGroupNo is incremented. This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|GLEntryPage|Record|G/L Entry|  
|PageGroupNo|Integer|Not applicable|  
  
```  
IF CurrReport.PRINTONLYIFDETAIL AND GLEntryPage.FIND('-') THEN  
  PageGroupNo := PageGroupNo + 1;  
```  
  
## Example  
 The following example sets the value of the [PrintOnlyIfDetail Property](PrintOnlyIfDetail-Property.md) to true. It requires that you create a Report variable named Report111. The Subtype of the variable is report 111, Customer - Top 10 List.  
  
```  
IsPrintOnlyIfDetail := Report111.PRINTONLYIFDETAIL(true);  
```  
  
## See Also  
 [PrintOnlyIfDetail Property](PrintOnlyIfDetail-Property.md)   
 [Report Data Type](Report-Data-Type.md)