---
title: "FieldRef.OptionMembers() Method"
description: "Gets the list of options that are available in the field that is currently selected."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.OptionMembers() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the list of options that are available in the field that is currently selected.


## Syntax
```AL
OptionMembers :=   FieldRef.OptionMembers()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*OptionMembers*  
&emsp;Type: [Text](../text/text-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

All the options for this field are returned as a comma-separated string. This method returns an error if no field is selected.  
If the field is not an option an empty string is returned.
  
## Example

The following example opens the Item table with a RecordRef variable named `ItemRecref` and it then creates a reference to field 19 \(Price/Profit Calculation\), which is an Options field. The `OptionMembers` method retrieves the options in the field and displays them as a comma-separated list.

```al
codeunit 50112 RetrieveOptions
{
    trigger OnRun()
    var
        MyFieldRef: FieldRef;
        ItemRecref: RecordRef;
        OptionMembers: Text;
    begin
        ItemRecref.Open(Database::Item);
        MyFieldRef := ItemRecref.Field(19);
        OptionMembers := MyFieldRef.OptionMembers;
        Message(' %1', OptionMembers);
    end;
}
```

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)