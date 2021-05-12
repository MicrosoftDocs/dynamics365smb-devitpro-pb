---
title: "RecordRef.GetPosition Method"
description: "Gets a string that contains the primary key of the current record."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# RecordRef.GetPosition Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a string that contains the primary key of the current record.


## Syntax
```
String :=   RecordRef.GetPosition([UseNames: Boolean])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.

*UseNames*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Indicates whether a reference to the field caption or the field number should be returned. The UseCaptions parameter is optional. If it is set to true (default value) or if it is empty, then the returned string contains references to field captions in the table with which the record is associated. If the parameter is set to false, then field numbers are used instead.  


## Return Value
*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The name or number of the field that contains the primary key.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works just like the [GetPosition Method \(Record\)](../library.md).  
  
## Example  
 The following example opens the Customer table as a RecordRef that is named RecRef. The RecordRef variable uses the GetPosition method to retrieve the position of the primary key. The *UseCaptions* parameter is set to **true** so the caption of the field that contains the primary key is returned. If you set *UseCaptions* to **false**, the number of the field is returned. 
   
```al
var
    RecRef: RecordRef;
    varPrimaryKey: Text;
    Text000: Label 'The primary key is: %1.';
begin    
    RecRef.Open(Database::Customer);  
    varPrimaryKey := RecRef.GetPosition(True);  
    Message(Text000, varPrimaryKey);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)