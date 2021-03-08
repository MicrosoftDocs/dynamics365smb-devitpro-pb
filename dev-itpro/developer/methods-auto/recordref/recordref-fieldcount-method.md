---
title: "RecordRef.FieldCount Method"
ms.author: solsen
ms.custom: na
ms.date: 03/05/2021
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
# RecordRef.FieldCount Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the number of fields in the table that is currently selected or returns the number of fields that have been defined in a key. Returns an error if no table or no key is selected.


## Syntax
```
Count :=   RecordRef.FieldCount()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

## Return Value
*Count*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The number of fields in the table.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example loops through tables 3 through 5 and displays the number of fields that are defined in each table. The code starts by opening table 3 \(Payment Terms\) as a RecordRef variable that is named MyRecordRef. MyRecordRef variable uses the FieldCount method to retrieve the number of fields that are defined in the table and stores it in the varFieldCount variable. The name of each table and the total number of fields in the table are displayed in a message box. The table that is open is closed before the next one is open. 

```al
var
    MyRecordRef: RecordRef;
    varFieldCount: Integer;
    Text000: Label 'The %1 table contains %2 field\(s\).\\';
begin    
    for i := 3 to 5 do begin  
      MyRecordRef.Open(i);  
      varFieldCount := MyRecordRef.FieldCount;  
      Message(Text000, MyRecordRef.Name, varFieldCount);  
      MyRecordRef.Close;  
     end;  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)