---
title: "RecordRef.GetView Method"
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
# RecordRef.GetView Method
> **Version**: _Available from runtime version 1.0._

Returns a string that describes the current sort order, key, and filters on a table.


## Syntax
```
String :=   RecordRef.GetView([UseNames: Boolean])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true (default) or omitted, the returned string contains references to field captions in the table with which the record is associated. If this parameter is false, the returned string contains references to field numbers in the table with which the record is associated.  


## Return Value
*String*
&emsp;Type: [String](../string/string-data-type.md)
The string format is the same as the SourceTableView property on pages.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 If the [SetView Method \(RecordRef\)](recordref-setview-method.md) has been executed, the *String* parameter will return the value set by SetView.  
  
 This method works the same way as the [GetView Method \(Record\)](recordref-getview-method.md).  
  
## Example  
 The following example opens the Customer table as a RecordRef variable that is named RecRef. The RecRef variable uses the GetView method to retrieve the field that the table is sorted on and stores the value in the varView variable. The Customer table does not have any filters and keys set so no filters or keys are displayed. The *UseCaptions* parameter is set to **true** so the name of the field is displayed. If you set the *UseCaptions* to **false**, the field number will be displayed. 
 
```al
var
    RecRef: RecordRef;
    varView: Text;
    Text000: Label 'The current view of the table is: %1';
begin    
    RecRef.Open(Database::Customer);  
    varView := RecRef.GetView(True);  
    Message(Text000, varView);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)