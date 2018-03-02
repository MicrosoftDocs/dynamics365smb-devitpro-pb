---
title: "COPYFILTERS Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4b2e584c-31fc-44f4-94d8-590c53c859f2
caps.latest.revision: 9
manager: edupont
---
# COPYFILTERS Function (Record)
Copies all the filters set by the [SETFILTER Function \(Record\)](SETFILTER-Function--Record-.md) or the [SETRANGE Function \(Record\)](SETRANGE-Function--Record-.md) from one record to another.  
  
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
 This function is used to apply the filters defined for one record to another record. The filters are used as a basis for counting, searching, calculating, or a similar operation.  
  
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
  
 The filters defined for Customer1 are copied and applied to Customer2. This affects the result returned by the [COUNT Function \(Record\)](COUNT-Function--Record-.md).  
  
## See Also  
 [COPYFILTER Function \(Record\)](COPYFILTER-Function--Record-.md)   
 [Record Data Type](Record-Data-Type.md)