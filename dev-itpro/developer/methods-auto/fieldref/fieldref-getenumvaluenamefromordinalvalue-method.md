---
title: "FieldRef.GetEnumValueNameFromOrdinalValue(Integer) Method"
description: "Gets an Enum value (or Option member) name from the Enum metadata for the field that is currently selected."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.GetEnumValueNameFromOrdinalValue(Integer) Method
> **Version**: _Available or changed with runtime version 4.0._

Gets an Enum value (or Option member) name from the Enum metadata for the field that is currently selected.


## Syntax
```AL
The Enum value name or empty if the ordinal value doesn't exist :=   FieldRef.GetEnumValueNameFromOrdinalValue(Ordinal: Integer)
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*Ordinal*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The Enum value's ordinal value to get the Enum value (or Option member) name for.  


## Return Value
*The Enum value name or empty if the ordinal value doesn't exist*  
&emsp;Type: [Text](../text/text-data-type.md)  
The Enum value name.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

```al
procedure OptionNoExists(var FieldRef: FieldRef; OptionValue: Text): Boolean
    var
        OptionNo: Integer;
    begin
        if Evaluate(OptionNo, OptionValue) then
            exit((FieldRef.GetEnumValueNameFromOrdinalValue(OptionNo) <> '') or ((FieldRef.GetEnumValueNameFromOrdinalValue(OptionNo) = '') and (OptionNo = 0)));

        exit(false);
    end;
```
## Related information
[FieldRef Data Type](fieldref-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)