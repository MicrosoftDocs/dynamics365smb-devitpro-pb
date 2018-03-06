---
title: "COPYFILTERS Method (Record)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4b2e584c-31fc-44f4-94d8-590c53c859f2
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COPYFILTERS Method (Record)
Copies all the filters set by the [SETFILTER Method \(Record\)](devenv-SETFILTER-Method-Record.md) or the [SETRANGE Method \(Record\)](devenv-SETRANGE-Method-Record.md) from one record to another.  
  
## Syntax  
  
```  
  
Record.COPYFILTERS(FromRecord)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record to which you want to copy filters.  
  
 *FromRecord*  
 Type: Record  
  
 The record from which you want to copy filters.  
  
## Remarks  
 This method is used to apply the filters defined for one record to another record. The filters are used as a basis for counting, searching, calculating, or a similar operation.  
  
## Example  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Customer1|Record|Customer|  
|Customer2|Record|Customer|  
|Count|Integer|Not applicable|  
  
```  
// Set filters on fields in a Customer record  
Customer1.SETFILTER("No.", '<1000');  
Customer1.SETRANGE("Credit Limit (LCY)", 10000, 20000);  
Customer1.MARKEDONLY(TRUE);   
// Apply filters to another record  
Customer2.COPYFILTERS(Customer1);  
Count := Customer2.COUNT;  
```  
  
 The filters defined for Customer1 are copied and applied to Customer2. This affects the result returned by the [COUNT Method \(Record\)](devenv-COUNT-Method-Record.md).  
  
## See Also  
 [COPYFILTER Method \(Record\)](devenv-COPYFILTER-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)