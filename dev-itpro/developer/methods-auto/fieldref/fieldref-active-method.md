---
title: "Active Method"
ms.author: solsen
ms.custom: na
ms.date: 09/24/2019
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
# Active Method
Checks whether the field that is currently selected is enabled.


## Syntax
```
Ok :=   FieldRef.Active()
```
> [!NOTE]  
> This method can be invoked using property access syntax.  

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Each field in a record can be set as enabled or disabled in the table description.  You cannot use a disabled field because disabled fields cannot contain data.  

This method is like the [FIELDACTIVE Method \(Record\)](../../methods-auto/record/record-fieldactive-method.md). 


## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named Recref. The [FIELD Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) uses Recref to create a FieldRef variable that is named MyFieldRef. MyFieldRef sets a reference to the first field \(field 1\) in the table. The [SETRANGE Method \(FieldRef\)](../../methods-auto/fieldref/fieldref-setrange-method.md) sets a filter that selects record 30000. The [FIELD Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) selects the record and then loops through fields 1 through 6. For each field, the ACTIVE method determines whether the field is enabled. If the field is enabled, a message that states that the field is enabled is displayed. Otherwise, a message that states that the field is not enabled is displayed.  

> [!NOTE]  
>  You can use the name of the table instead of the table number to open the table by using the following syntax: 

```
Recref.OPEN\(DATABASE::Customer\)
```


 This example requires that you create the following global variables and text constants.  

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
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)