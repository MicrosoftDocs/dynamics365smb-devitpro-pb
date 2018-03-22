---
title: "COPYFILTER Method (Record)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 5660e407-78e6-4bb8-a98a-abca3ecff7d6
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COPYFILTER Method (Record)
Copies the filter that has been set for one field and applies it to another field.  
  
## Syntax  
  
```  
  
Record.COPYFILTER(FromField, ToRecord.ToField)  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record from which to copy the filter.  
  
 *FromField*  
 Type: Field  
  
 The field from which the filter will be copied.  
  
 *ToRecord.ToField*  
 Type: Record.Field  
  
 The record and field to which you want to apply the copied filter.  
  
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
 [COPYFILTERS Method \(Record\)](devenv-COPYFILTERS-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)