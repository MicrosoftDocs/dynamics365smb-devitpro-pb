---
title: "RESET Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 19ad65e2-f7df-452f-8565-88ca537625da
caps.latest.revision: 11
manager: edupont
---
# RESET Function (Record)
Removes all filters, including any special filters set by **MARKEDONLY**, and changes the current key to the primary key. Also removes any marks on the record and clears any C/AL variables on the record.  
  
## Syntax  
  
```  
  
Record.RESET  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that you want to reset.  
  
## Remarks  
 **RESET** does not reset filters in filter group 1. For more information about filter groups, see [FILTERGROUP Function \(Record\)](FILTERGROUP-Function--Record-.md).  
  
## Example  
 This example requires that you create the following variables and text constants in the C/AL Globals window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|Count1|Integer|Not applicable|  
|Count2|Integer|Not applicable|  
  
|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|Before RESET: %1.\\|  
|Text001|After RESET: %2.|  
  
```  
CustomerRec.SETFILTER("No.", '10000');  
CustomerRec.SETRANGE("Salesperson Code", 'PS');  
CustomerRec.MARKEDONLY(TRUE);   
Count1 := CustomerRec.COUNT; // Count marked customers in the range.  
CustomerRec.RESET;  
Count2 := CustomerRec.COUNT; // Count all customers.  
MESSAGE(Text000 + Text001, Count1, Count2);  
```  
  
 Messages similar to the following are displayed:  
  
 **Before RESET: 0**  
  
 **After RESET: 68**  
  
 The example shows that **RESET** removed all filters.  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)