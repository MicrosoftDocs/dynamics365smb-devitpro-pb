---
title: "HasLinks Method"
ms.author: solsen
ms.custom: na
ms.date: 04/15/2020
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
# HasLinks Method
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
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable for field 1 \(No.\) and stores the value in the MyFieldRef variable. The [VALUE Method \(FieldRef, TestPage Field\)](../fieldref/fieldref-value-method.md) selects record number 20000. The HASLINKS method determines whether the selected record has any links. The method returns **No** because there are no links in the record. 
 
```   
var
    CustomerRecref: RecordRef;
    MyFieldRef: FieldRef;
    varHasLinks: Boolean;
    Text000: Label 'Does this record have one or more links? %1.';
begin   
    CustomerRecref.OPEN(18);  
    MyFieldRef := CustomerRecref.FIELD(1);  
    MyFieldRef.VALUE := '20000';  
    varHasLinks := CustomerRecref.HASLINKS;  
    MESSAGE(Text000, varHasLinks);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)