---
title: "FieldRef.Number Method"
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
# FieldRef.Number Method
> **Version**: _Available from runtime version 1.0._

Gets the number of a field as an integer.


## Syntax
```
No :=   FieldRef.Number()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*
&emsp;Type: [FieldRef](fieldref-data-type.md)
An instance of the [FieldRef](fieldref-data-type.md) data type.

## Return Value
*No*
&emsp;Type: [Integer](../integer/integer-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method is like the [FIELDNO Method \(Record\)](../../methods-auto/record/record-fieldno-method.md) method.  
  
## Example  
 The following example displays the caption and the field number of the first 10 fields in the Location table. The Location table is open as a [RecordRef Data Type](../../datatypes/devenv-recordref-data-type.md) object and the reference is stored in the LocationRecref variable. The FieldIndex variable that stores the field index is initialized to 0. The LocationRecref variable uses the [FIELDINDEX Method \(RecordRef\)](../../methods-auto/recordref/recordref-fieldindex-method.md) to create a FieldRef that is named MyFieldRef for the specified field index. MyFiledRef now references the field that is specified by the FieldIndex. MyFieldref is then used to display the number and caption of the field The [NUMBER Method \(FIELDREF\)](../../methods-auto/fieldref/fieldref-number-method.md) method retrieves the field number. This is repeated for the first ten fields in the table.
 
```
var
    MyFieldRef: FieldRef;
    LocationRecref: RecordRef;
    FieldIndex: Integer;
begin
    LocationRecref.OPEN(DATABASE::Location);  
    FieldIndex := 0;  
    repeat  
      FieldIndex  := FieldIndex + 1;  
      MyFieldRef := LocationRecref.FIELDINDEX(FieldIndex);  
      Message('Field Number: %1  Field Caption: %2.' , MyFieldRef.NUMBER, MyFieldRef.CAPTION);  
    until FieldIndex = 10;  
end;
```  
  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)