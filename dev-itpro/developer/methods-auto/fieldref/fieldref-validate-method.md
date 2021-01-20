---
title: "FieldRef.Validate Method"
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
# FieldRef.Validate Method
> **Version**: _Available from runtime version 1.0._

Use this method to enter a new value into a field and have the new value validated by the properties and code that have been defined for that field.


## Syntax
```
 FieldRef.Validate([NewValue: Any])
```
## Parameters
*FieldRef*
&emsp;Type: [FieldRef](fieldref-data-type.md)
An instance of the [FieldRef](fieldref-data-type.md) data type.

*NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value to insert in the field.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The VALIDATE method first checks any [TableRelation Property](../../properties/devenv-tablerelation-property.md), and then executes the [OnValidate \(Fields\) Trigger](../../triggers/devenv-onvalidate-fields-trigger.md) of the field.  

 If you omit *NewValue*, the method validates the current value.  

 This method is like the [VALIDATE Method \(Record\)](../../methods-auto/record/record-validate-method.md).  

## Example  
 The following example opens table 17 \(G/L Entry\) as a RecordRef that is named EntryRecref. The [FINDFIRST Method \(RecordRef\)](../../methods-auto/recordref/recordref-findfirst-method.md) searches for the first record in the table. The [FIELD Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) sets the field to 3, which is the G/L Account No. field. The **VALIDATE** method validates and inserts the specified value \(1210\) into the field. The [MODIFY Method \(RecordRef\)](../../methods-auto/recordref/recordref-modify-method.md) modifies the table. A message that indicates the G/L Account No. field has changed is displayed. To show that the code in the **OnValidate** trigger is executed, design the **G/L Entry** table and add the following code to the **G/L Account No. – OnValidate** trigger: `Message('The OnValidate trigger is called.');`  

 ```
var
    MyFieldRef: FieldRef;
    EntryRecref: RecordRef;
    Text000: Label 'The G/L Account No. for record %1 is %2.';
    Text001: Label 'The G/L Account No. for record %1 has changed to %2.';
begin
    EntryRecref.OPEN(17);  
    if EntryRecref.FINDFIRST then begin  
      MyFieldRef := EntryRecref.FIELD(3);  
      Message(Text000, EntryRecref.RECORDID, MyFieldRef.VALUE);  
      MyFieldRef.VALIDATE('1210');  
      EntryRecref.MODIFY;  
      Message(Text001, EntryRecref.RECORDID, MyFieldRef.VALUE);  
    end;  
end;
```  


## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)