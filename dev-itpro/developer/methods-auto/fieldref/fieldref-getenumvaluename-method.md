---
title: "FieldRef.GetEnumValueName Method"
description: "Gets an Enum value (or Option member) name from the Enum metadata for the field that is currently selected."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# FieldRef.GetEnumValueName Method
> **Version**: _Available or changed with runtime version 4.0._

Gets an Enum value (or Option member) name from the Enum metadata for the field that is currently selected.


## Syntax
```AL
The Enum value name :=   FieldRef.GetEnumValueName(Index: Integer)
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*Index*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The index in the list of Enum values to get the Enum value (or Option member) name for. The index is 1-based.  


## Return Value
*The Enum value name*  
&emsp;Type: [String](../string/string-data-type.md)  
The Enum value name.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
procedure GetOptionNo(Value: Text; FieldRef: FieldRef): Integer
    var
        FieldRefValueVar: Variant;
        FieldRefValueInt: Integer;
    begin
        if (Value = '') and (FieldRef.GetEnumValueName(1) = ' ') then
            exit(0);

        FieldRefValueVar := FieldRef.Value();
        FieldRefValueInt := -1;
        if Evaluate(FieldRef, Value) then begin
            FieldRefValueInt := FieldRef.Value();
            FieldRef.Value(FieldRefValueVar);
        end;

        exit(FieldRefValueInt);
    end;
```

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)