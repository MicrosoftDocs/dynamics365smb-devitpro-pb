---
title: "RecordRef.HasLinks Method"
description: "Determines whether a record contains any links."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# RecordRef.HasLinks Method
> **Version**: _Available or changed with runtime version 1.0._

Determines whether a record contains any links.


## Syntax
```
Ok :=   RecordRef.HasLinks()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the record contains any links, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The link can be a link to a website, a file stored on the local computer or on a remote computer, or a link to a [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] page.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [Field Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable for field 1 \(No.\) and stores the value in the MyFieldRef variable. The [Value Method \(FieldRef, TestPage Field\)](../fieldref/fieldref-value-method.md) selects record number 20000. The HasLinks method determines whether the selected record has any links. The method returns **No** because there are no links in the record. 
 
```al
var
    CustomerRecref: RecordRef;
    MyFieldRef: FieldRef;
    varHasLinks: Boolean;
    Text000: Label 'Does this record have one or more links? %1.';
begin   
    CustomerRecref.Open(18);  
    MyFieldRef := CustomerRecref.Field(1);  
    MyFieldRef.Value := '20000';  
    varHasLinks := CustomerRecref.HasLinks;  
    Message(Text000, varHasLinks);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)