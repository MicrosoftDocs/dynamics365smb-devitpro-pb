---
title: "TransferFields Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
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
# TransferFields Method
Copies all matching fields in one record to another record.

## Syntax
```
 Table.TransferFields(var FromRecord: Table, [InitPrimaryKeyFields: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Table](table-data-type.md)  
The record from which to copy.
          
*InitPrimaryKeyFields*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Default: true
If this parameter is true and the records are in the same table, both the timestamp and the Primary Key fields of the destination record will be changed.
If this parameter is true and the records are not in the same table, then the Primary Key fields of the destination record will be changed but the timestamp of the destination record will not be changed.
If this parameter is false, then neither the timestamp nor the Primary Key fields of the destination record are changed.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 **TRANSFERFIELDS** copies fields based on the [Field No. Property](../../properties/devenv-field-no.-property.md) of the fields. For each field in *Record* \(the destination\), the contents of the field that has the same Field No. in *FromRecord* \(the source\) will be copied, if such a field exists.  
  
 The fields must have the same data type for the copying to succeed \(text and code are convertible, other types are not.\) There must be room for the actual length of the contents of the field to be copied in the field to which it is to be copied. If any one of these conditions are not fulfilled, a run-time error will occur.  
  
## Example  
 This example shows how to use the **TRANSFERFIELDS** method together with a BLOB field. If you are copying a record that contains a BLOB field, then you must calculate the BLOB field before it can be copied with the rest of the record. This example requires that you create the following global variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|GLAccountRec|Record|G/L Account|  
|FromRecord|Record|G/L Account|  
  
```  
…  
IF GLAccountRec.Picture.HASVALUE THEN  
  GLAccountRec.CALCFIELDS(Picture);  
GLAccountRec.TRANSFERFIELDS(FromRecord);  
GLAccountRec.INSERT(TRUE);  
```  
  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)