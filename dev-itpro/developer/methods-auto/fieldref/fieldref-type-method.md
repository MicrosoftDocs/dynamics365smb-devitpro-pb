---
title: "FieldRef.Type() Method"
description: "Gets the data type of the field that is currently selected."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.Type() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the data type of the field that is currently selected.


## Syntax
```AL
Type :=   FieldRef.Type()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Type*  
&emsp;Type: [FieldType](../fieldtype/fieldtype-option.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The code loops through fields 1 to 5 and creates a FieldRef that is named MyFieldRef for each field that is selected. `MyFieldRef.Type` retrieves the data of each field and displays it in a message box. 
 
```al
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    varType: Variant;
    Text000: Label 'Field %1 is a %2 data type.';
begin
    CustomerRecref.Open(Database::Customer);  
    for i := 1 to 5 do begin  
      MyFieldRef := CustomerRecref.Field(i);  
      Message(Text000, i, MyFieldRef.Type);  
    end;  
END;
```  
    
## See Also

[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)