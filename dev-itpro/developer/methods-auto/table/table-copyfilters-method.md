---
title: "CopyFilters Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
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
# CopyFilters Method
Copies all the filters set by the SETFILTER function (Record) or the SETRANGE function (Record) from one record to another.

## Syntax
```
 Table.CopyFilters(var FromRecord: Table)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Table](table-data-type.md)  
The record from which you want to copy filters.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)