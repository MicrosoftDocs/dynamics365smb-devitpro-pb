---
title: "Record.ReadIsolation([IsolationLevel]) Method"
description: "Gets or sets the read isolation level."
ms.author: solsen
ms.custom: na
ms.date: 01/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.ReadIsolation([IsolationLevel]) Method
> **Version**: _Available or changed with runtime version 11.0._

Gets or sets the read isolation level.


## Syntax
```AL
[ReadIsolation := ]  Record.ReadIsolation([ReadIsolation: IsolationLevel])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] ReadIsolation*  
&emsp;Type: [IsolationLevel](../isolationlevel/isolationlevel-option.md)  
The read isolation level.  


## Return Value
*[Optional] ReadIsolation*  
&emsp;Type: [IsolationLevel](../isolationlevel/isolationlevel-option.md)  
The read isolation level.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For more information about read isolation level on record instances, see [Record instance isolation level](../../devenv-read-isolation.md).

## Example

The following example shows AL code with SQL isolation level hints annotated on database reads, with record instance isolation level used to override the transaction's isolation level.

```al
local procedure UsingReadIsolation()
var
    cust: Record Customer;
    otherCust: Record Customer;
    curr: Record Currency;
begin
    cust.FindFirst(); // READUNCOMMITTED

    // Heighten isolation level for Customer table.
    cust.LockTable();

    // Explicitly select another isolation level than the transaction's.
    otherCust.ReadIsolation := IsolationLevel::ReadUncommitted;

    otherCust.FindSet(); // READUNCOMMITTED
end;
```

## See Also
[Record instance isolation level](../../devenv-read-isolation.md)  
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)