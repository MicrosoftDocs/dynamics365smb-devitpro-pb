---
title: "RecordRef.Name() Method"
description: "Identifies the name of the table"
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# RecordRef.Name() Method
> **Version**: _Available or changed with runtime version 1.0._

Identifies the name of the table


## Syntax
```AL
Name :=   RecordRef.Name()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

## Return Value
*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the table.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Example  

The following example opens a table as a RecordRef variable that is named MyRecordRef. You can specify any table number in the [Open Method \(RecordRef\)](recordref-open-method.md). In this example, the table 18 \(Customer\) is open. The Name method retrieves the name of table 18 and stores it in the varTableName variable. The table number and name are displayed in a message box. 
  
```al
var
    MyRecordRef: RecordRef;
    varTableName: Text;
    Text000: Label 'Table %1 is the %2 table.'; 
begin  
    TableNo := 18;  
    MyRecordRef.Open(TableNo);  
    varTableName := MyRecordRef.Name;  
    Message(Text000, TableNo, varTableName);  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)