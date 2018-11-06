---
title: "Reset Method"
ms.author: solsen
ms.custom: na
ms.date: 11/06/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Reset Method
Removes all filters, including any special filters set by MARKEDONLY, and changes the current key to the primary key. Also removes any marks on the record and clears any AL variables on the record.

## Syntax
```
 Table.Reset()
```

## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 **RESET** does not reset filters in filter group 1. For more information about filter groups, see [FILTERGROUP Method \(Record\)](../../methods/devenv-filtergroup-method-record.md).  
  
## Example  
 This example requires that you create the following global variables and text constants.  
  
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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)