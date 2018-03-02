---
title: "VALUE Function (FieldRef, TestPage Field)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 20c42c77-b5e4-4c8c-bdf1-9d6c42d9f36b
caps.latest.revision: 15
---
# VALUE Function (FieldRef, TestPage Field)
Sets or gets the value of the field that is currently selected.  
  
 This function returns an error if no field is selected.  
  
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
 If you omit NewValue, the function returns the current value of the field.  
  
 If you want to format the value of a FieldRef you must use `FORMAT(FieldRef)` instead of `FORMAT(FieldRef.VALUE)`.  
  
## Example  
 The following example opens table 18, the **Customer** table, a RecordRef variable that is named CustomerRecref. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef for the first field \(No.\). The reference to the field is stored in the MyFieldRef variable. The [ACTIVE Function \(FieldRef\)](ACTIVE-Function--FieldRef-.md) function determines whether the field is enabled. If the field is enabled, then the record that is identified by the number in the CustomerNo variable is selected. The MyFieldRef variable is updated to refer to the second field \(Name\). Then the value in the second field is changed to Contoso. The [MODIFY Function \(RecordRef\)](MODIFY-Function--RecordRef-.md) modifies the record in the table to reflect the change. `MyFieldRef.VALUE` retrieves the new name and displays it in message box. This example requires that you create the following variables and text constant in the **C/AL Globals** windows.  
  
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
 [FieldRef Data Type](FieldRef-Data-Type.md)