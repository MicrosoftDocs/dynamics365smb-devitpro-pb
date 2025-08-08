---
title: "Record.Truncate([Boolean]) Method"
description: "Deletes all records in a table that fall within a specified range, in an efficient maner."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Truncate([Boolean]) Method
> **Version**: _Available or changed with runtime version 16.0._

Deletes all records in a table that fall within a specified range, in an efficient maner.
Keep in mind that Truncate allows for less concurrency than DeleteAll, as the entire table will be locked until the transaction is committed.

Truncate with a filter should only be used when the majority of the table is being deleted, as otherwise DeleteAll will be more efficient.

Truncate is currently not supported in the following cases:
- Temporary tables, system tables, and tables of type other than Normal.
- When running within a try function.
- Tables that have a security filter applied.
- When the current filters contain flow fields, or use a high number of marked records.
- When the OnAfter/OnBefore events are subscribed for the table.
- Tables with media fields.

In this case, it is recommended to use DeleteAll instead. 


## Syntax
```AL
[Ok := ]  Record.Truncate([ResetAutoIncrement: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] ResetAutoIncrement*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies if the AutoIncrement column should be reset to start from the initial value, or if it should stay at the current value.
Tables without an AutoIncrement field ignore this parameter. The default is **true**.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the table supports truncate; otherwise, **false**.
 If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record data type](record-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)