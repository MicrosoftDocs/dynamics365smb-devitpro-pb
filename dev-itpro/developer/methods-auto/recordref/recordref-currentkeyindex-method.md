---
title: "RecordRef.CurrentKeyIndex Method"
description: "Gets or sets the current key of the table referred to by the RecordRef. The current key is set or returned as a number. This first key = 1, and so on. If RecordRef does not have an active record, CURRENTKEYINDEX will return -1. If this value is then passed to KEYINDEX, an index out of bounds error will occur. Therefore it is important to implement a check of the RecordRef parameter."
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
# RecordRef.CurrentKeyIndex Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the current key of the table referred to by the RecordRef. The current key is set or returned as a number. This first key = 1, and so on. If RecordRef does not have an active record, CURRENTKEYINDEX will return -1. If this value is then passed to KEYINDEX, an index out of bounds error will occur. Therefore it is important to implement a check of the RecordRef parameter.


## Syntax
```
[CurrentKeyIndex := ]  RecordRef.CurrentKeyIndex([NewKeyIndex: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*[Optional] NewKeyIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the new key.  


## Return Value
*[Optional] CurrentKeyIndex*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number of the current key.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example loops through four tables \(36-39\) opens each table as a RecordRef variable that is named MyRecordRef. The CurrentKeyIndex method retrieves the current key index of the tables. The name of the table and the current key index of each table are displayed in a message box. Each table is close before the next one is opened. 

```al
var
    MyRecordRef: RecordRef;
    CurrentKeyIndex: Integer;
    i: Integer;
    varFromTable: Integer;
    varToTable: Integer;
    Text000: Label 'Table: %1  Current key index: %2';
begin
    varFromTable := 36;  
    varToTable := 39;  
    for i := varFromTable to varToTable do begin  
      MyRecordRef.Open(i);  
      CurrentKeyIndex := MyRecordRef.CurrentKeyIndex;  
      Message(Text000, MyRecordRef.Name, CurrentKeyIndex);  
      MyRecordRef.Close;  
    end;  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)