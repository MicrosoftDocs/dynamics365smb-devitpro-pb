---
title: "TESTFIELD Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: b5cfa429-f702-4305-80c1-b6ba13c77d65
caps.latest.revision: 8
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# TESTFIELD Method (Record)
Tests whether the contents of a field match a given value.  
  
## Syntax  
  
```  
  
Record.TESTFIELD(Field, [Value])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the field that you want to test.  
  
 *Field*  
 Type: Field  
  
 The field that you want to test.  
  
 *Value*  
 Type: Any  
  
 The value that you want to compare to *Field*. The data type of this parameter must match the data type of *Field*. If you include this optional parameter and the contents of *Field* do not match, then an error message is displayed. If you omit this parameter and the contents of *Field* is zero or blank \(empty string\), then an error message is displayed.  
  
## Remarks  
 If the contents of the field differ from the given value, then an error message is displayed.  
  
## Example  
 This example shows how to use the **TESTFIELD** method without the *Value* parameter. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec."No." := '';  
CustomerRec.TESTFIELD("No.")  
```  
  
 The following error message is displayed:  
  
 **You must specify No. in Customer No.=''.**  
  
## Example  
 This example shows how to use the **TESTFIELD** method with the *Value* parameter. This example requires that you create the following global variable.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
  
```  
CustomerRec."No." := 'AAA 1050';  
CustomerRec.TESTFIELD("No.",'1000')  
```  
  
 If No. is not 1000, then the following message is displayed:  
  
 **No. must be 1000 in Customer No.='AAA 1050'.**  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)