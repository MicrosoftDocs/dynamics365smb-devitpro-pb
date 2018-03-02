---
title: "ACTIVE Method (FieldRef)"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8dbe2401-6f58-4e13-85f5-3fb5db9228d1
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ACTIVE Method (FieldRef)
Checks whether the field that is currently selected is enabled.  

## Syntax  

```  

Ok := FieldRef.ACTIVE  
```  

#### Parameters  
 *FieldRef*  
 Type: FieldRef  

 Refers to the current field.  

## Property Value/Return Value  
 Type: Boolean  

 **True** if the field is enabled; otherwise, **false**.  

## Remarks  
 Each field in a record can be set as enabled or disabled in the table description.  

 You cannot use a disabled field because disabled fields cannot contain data.  

 This method is like the [FIELDACTIVE Method \(Record\)](devenv-FIELDACTIVE-Method-Record.md) method.  

## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named Recref. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) uses Recref to create a FieldRef variable that is named MyFieldRef. MyFieldRef sets a reference to the first field \(field 1\) in the table. The [SETRANGE Method \(FieldRef\)](devenv-SETRANGE-Method-FieldRef.md) sets a filter that selects record 30000. The [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md) selects the record and then loops through fields1 through 6. For each field, the ACTIVE method determines whether the field is enabled. If the field is enabled, a message that states that the field is enabled is displayed. Otherwise, a message that states that the field is not enabled is displayed.  

> [!NOTE]  
>  You can use the name of the table instead of the table number to open the table by using the following syntax: Recref.OPEN\(DATABASE::Customer\).  

 This example requires that you create the following global variables and text constantss.  

|Variable name|DataType|  
|-------------------|--------------|  
|Recref|RecordRef|  
|MyFieldRef|FieldRef|  
|i|Integer|  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|Field %1 is enabled.|  
|Text001|Field %1 is not enabled.|  

```  

Recref.OPEN(18);  
MyFieldRef := Recref.FIELD(1);  
MyFieldRef.SETRANGE('30000');  
Recref.FIND('-');  
FOR i := 1 TO 5 DO BEGIN  
  MyFieldRef := Recref.FIELDINDEX(i);  
  IF MyFieldRef.ACTIVE THEN  
    MESSAGE(Text000, i)  
  ELSE BEGIN  
    MESSAGE(Text001, i)  
  END;  
END;  

```  

## See Also  
 [FieldRef Data Type](../datatypes/devenv-fieldref-data-type.md)
