---
title: "FieldRef.Relation Method"
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
# FieldRef.Relation Method
> **Version**: _Available from runtime version 1.0._

Finds the table relationship of a given field.


## Syntax
```
TableNumber :=   FieldRef.Relation()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*
&emsp;Type: [FieldRef](fieldref-data-type.md)
An instance of the [FieldRef](fieldref-data-type.md) data type.

## Return Value
*TableNumber*
&emsp;Type: [Integer](../integer/integer-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  
 You can use this method for several purposes such as to determine lookups or to check to see if you have permission to read from a table.  
  
 This method is similar to the [RELATION Method \(Record\)](../../methods-auto/record/record-relation-method.md).  
  
## Example  
 The following example opens table 37, the Sales Line table, as a RecordRef variable and creates a reference to field 2 \(Sell-to Customer No.\). The [FieldRef Data Type](../../datatypes/devenv-fieldref-data-type.md) of field 2 is stored in the MyFieldRef variable. The RELATION method retrieves the number of the table that has a relation with the Sell-To-Customer field \(field 2\). The table number is stored the varRelation variable and displayed in the message box. 

```
var
    MyFieldRef: FieldRef;
    SaleRecref: RecordRef;
    varRelation: Integer;
    Text000: Label 'Field 2 in the Sales Line (37) table has a relation with table %1.';
begin
    SaleRecref.OPEN(37);  
    MyFieldRef := SaleRecref.FIELD(2);  
    varRelation := MyFieldRef.RELATION;  
    Message(Text000, varRelation);  
end;
```  
  
## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)