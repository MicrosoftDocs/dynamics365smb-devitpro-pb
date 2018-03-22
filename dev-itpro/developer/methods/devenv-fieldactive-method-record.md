---
title: "FIELDACTIVE Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 690eaf66-a44c-4834-9ff2-099f05db2c04
caps.latest.revision: 10
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FIELDACTIVE Method (Record)
Checks whether a field is enabled.  

## Syntax  

```  

Ok := Record.FIELDACTIVE(Field)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The record that contains the field to check.  

 *Field*  
 Type: Field  

 The field that you want to check.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the field is enabled; otherwise, **false**.  

## Remarks  
 Each field in a record can be set as enabled or disabled in the table description. You cannot use a disabled field because disabled fields cannot contain data.  

## Example  
 This example requires that you create the following global variable and text constants.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  

|Text constant name|ENU value|  
|------------------------|---------------|  
|Text000|Atlanta|  
|Text001|The field is not marked as enabled.|  

```  
CustomerRec."Address 2" := Text000;  
// If the Address 2 field has not been marked as enabled, then this   
// statement causes a run-time error.  
// You can avoid this error by performing the following test.  
IF CustomerRec.FIELDACTIVE("Address 2") THEN  
  CustomerRec."Address 2" := Text000  
ELSE  
  MESSAGE(Text001);  
```  

## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)
