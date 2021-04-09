---
title: "RecordRef.DeleteLink Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# RecordRef.DeleteLink Method
> **Version**: _Available or changed with runtime version 1.0._

Deletes a specified link from a record in a table.


## Syntax
```
 RecordRef.DeleteLink(ID: Integer)
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*ID*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the link you want to delete.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 When you add a link to a page or a table, an entry is created in the Record Link system table. Each entry is given an ID. This ID is specified as a parameter in the DeleteLINK method.  
  
## Example  
 The following example deletes a link from a customer record in the Customer table. The code starts by opening table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [Field Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable that is named MyFieldRef for the first field in the table \(No.\). `MyFieldRef.Value` selects record 01121212 from the No. field. This record is initialized in the CustomerNum variable. The [Find Method \(RecordRef\)](recordref-find-method.md) searches for record 01121212. If the record is found, the DeleteLINK method deletes the link that is specified in the varLinkid variable. A message that states that the link is deleted is displayed in a message box. You can verify that the link is deleted in the **Links** FactBox on the Customer List or Customer Card pages. 
   
```al
var
    MyFieldRef: FieldRef;
    CustomerRecRef: RecordRef;
    varLinkid: Integer;
    CustomerNUm: Integer;
    Text000: Label 'The link with id %1 is deleted.;
    Text001: Label 'The customer cannot be found.';
begin  
    CustomerNum := '01121212';  
    varLinkid := 21;  
    CustomerRecref.Open(18);  
    MyFieldRef := CustomerRecref.Field(1);  
    MyFieldRef.Value := CustomerNum;  
    if CustomerRecref.Find('=') then begin  
      CustomerRecref.DeleteLink(varLinkid);  
      Message(Text000, varLinkid);  
    end else
      Message(Text001);  
end;
  
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)