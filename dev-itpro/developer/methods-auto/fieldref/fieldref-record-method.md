---
title: "FieldRef.Record Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.Record Method
> **Version**: _Available from runtime version 1.0._

Gets the RecordRef of the field that is currently selected. This method returns an error if no field is selected.


## Syntax
```
Record :=   FieldRef.Record()
```

## Parameters
*FieldRef*
&emsp;Type: [FieldRef](fieldref-data-type.md)
An instance of the [FieldRef](fieldref-data-type.md) data type.

## Return Value
*Record*
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example opens the Item table as a RecordRef variable that is named ItemRecref, creates a reference to field 1 \(No.\), and stores the value in the variable named MyFieldRef. The RECORD method uses the MyFieldRef variable to return the RecordRef of field 1 and stores the reference in a variable named MyRecRef. `MyRecRef.NUMBER` returns the table that the selected field belongs to. 

```
var
    MyFieldRef: FieldRef;
    ItemRecref: RecordRef;
    MyRecRef: RecordRef;
    Text000: Label 'The selected field is from table %1.';
begin
    ItemRecref.OPEN(DATABASE::Item);  
    MyFieldRef := ItemRecref.FIELD(1);  
    MyRecRef := MyFieldRef.RECORD;  
    MESSAGE(Text000, MyRecRef.NUMBER);  
end;
```  
  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)