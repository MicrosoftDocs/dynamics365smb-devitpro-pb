---
title: "TRANSFERFIELDS Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: cf8ea256-0b4a-4b1a-9570-3c8a47ee9ef4
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TRANSFERFIELDS Method (Record)
Copies all matching fields in one record to another record.  
  
## Syntax  
  
```  
  
Record.TRANSFERFIELDS(FromRecord [, InitPrimaryKeyFields])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record to which you want to copy the contents of the fields in *FromRecord*.  
  
 *FromRecord*  
 Type: Record  
  
 The record from which to copy.  
  
 *InitPrimaryKeyFields*  
 Type: Boolean  
  
 Default: **true**  
  
 If this parameter is **true** and the records are in the same table, both the timestamp and the Primary Key fields of the destination record will be changed.  
  
 If this parameter is **true** and the records are not in the same table, then the Primary Key fields of the destination record will be changed but the timestamp of the destination record will not be changed.  
  
 If this parameter is **false**, then neither the timestamp nor the Primary Key fields of the destination record are changed.  
  
## Remarks  
 **TRANSFERFIELDS** copies fields based on the [Field No. Property](../properties/devenv-Field-No.-Property.md) of the fields. For each field in *Record* \(the destination\), the contents of the field that has the same Field No. in *FromRecord* \(the source\) will be copied, if such a field exists.  
  
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
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)