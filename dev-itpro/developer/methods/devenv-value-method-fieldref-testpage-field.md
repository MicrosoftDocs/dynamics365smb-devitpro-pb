---
title: "VALUE Method (FieldRef, TestPage Field)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 20c42c77-b5e4-4c8c-bdf1-9d6c42d9f36b
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# VALUE Method (FieldRef, TestPage Field)
Sets or gets the value of the field that is currently selected.  
  
 This method returns an error if no field is selected.  
  
## Syntax  
  
```  
  
[CurrValue :=] FieldRef.VALUE([NewValue])  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef or TestPage Field  
  
 Refers to the current field.  
  
 NewValue  
 Type: Variant  
  
 The new value that you want to set for the field.  
  
## Property Value/Return Value  
 Type: Variant  
  
 The current value of the field.  
  
## Remarks  
 If you omit NewValue, the method returns the current value of the field.  
  
 If you want to format the value of a FieldRef you must use `FORMAT(FieldRef)` instead of `FORMAT(FieldRef.VALUE)`.  
  
## Example  
 The following example opens table 18, the **Customer** table, a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef for the first field \(No.\). The reference to the field is stored in the MyFieldRef variable. The [ACTIVE Method \(FieldRef\)](devenv-ACTIVE-Method-FieldRef.md) method determines whether the field is enabled. If the field is enabled, then the record that is identified by the number in the CustomerNo variable is selected. The MyFieldRef variable is updated to refer to the second field \(Name\). Then the value in the second field is changed to Contoso. The [MODIFY Method \(RecordRef\)](devenv-MODIFY-Method-RecordRef.md) modifies the record in the table to reflect the change. `MyFieldRef.VALUE` retrieves the new name and displays it in message box. This example requires that you create the following global variables and text constants.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|CustomerNo|Code|  
  
|Text constant name|ConstValue|  
|------------------------|----------------|  
|Text000|Customer name has changed to %1.|  
  
```  
CustomerNo := '50000';  
CustomerRecref.OPEN(18);  
MyFieldRef := CustomerRecref.FIELD(1);  
IF MyFieldRef.ACTIVE THEN BEGIN  
  MyFieldRef.VALUE(CustomerNo);  
  MyFieldRef := CustomerRecref.FIELD(2);  
  MyFieldRef.VALUE('Contoso');  
  CustomerRecref.MODIFY;  
  MESSAGE(Text000, MyFieldRef.VALUE);  
END  
  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)