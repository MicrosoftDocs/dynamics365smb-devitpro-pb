---
title: "RecordRef.CurrentKey Method"
description: "Gets the current key of the table referred to by the RecordRef."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# RecordRef.CurrentKey Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current key of the table referred to by the RecordRef. The current key is returned as a string.


## Syntax
```AL
CurrentKey :=   RecordRef.CurrentKey()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*CurrentKey*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the current key of the record.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  

```al
var
    RecRef: RecordRef;
    Text000: Label 'The current key in the "%1" table is "%2".';
begin
    RecRef.Open(18);  
    Message(Text000,RecRef.Caption,RecRef.CurrentKey);
end;  
```  
  
 `RecRef.Open(18)` - Opens table 18 or causes a run-time error if table 18 does not exist.  
  
 `RecRef.Caption` - Returns the caption of the table.  
  
 `RecRef.CurrentKey` - Returns the caption of the current key in the table.  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)