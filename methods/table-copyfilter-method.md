---
title: "CopyFilter Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# CopyFilter Method
Copies the filter that has been set for one field and applies it to another field.

## Syntax
```
 Table.CopyFilter(FromField: Any, Record.ToField: Any)
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*FromField*  
&emsp;Type: [Any](any-data-type.md)  
The field from which the filter will be copied.
          
*Record.ToField*  
&emsp;Type: [Any](any-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The *FromField* and *ToField* parameters must be of the same data type, but they do not have to belong to the same table.  
  
## Example  
 This example requires that you create a Record variable for the **Customer** table named Customer and an Integer variable named Count.  
  
```  
Customer.SETFILTER("No.", '<1000');   
Customer.COPYFILTER("No.", Vendor."No.");   
.  
.  
Count := Vendor.COUNT;  
```  
  
 The filter set for Customer."No." is copied and applied to Vendor."No.". This affects the result of the [COUNT Method \(Record\)](devenv-COUNT-Method-Record.md), which counts how many vendors have a number less than 1000.  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)