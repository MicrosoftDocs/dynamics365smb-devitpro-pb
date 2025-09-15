---
title: "RecordRef.Truncate([Boolean]) Method"
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
# RecordRef.Truncate([Boolean]) Method
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
[Ok := ]  RecordRef.Truncate([ResetAutoIncrement: Boolean])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

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

## Example

The following example demonstrates how to truncate all records in a table and capture the optional return value to avoid a runtime error when truncate isn't supported.

```al
procedure ExampleTruncate_RecordRef()
var
    RecRef: RecordRef;
    Ok: Boolean;
begin
    RecRef.Open(50101);
    Ok := RecRef.Truncate(true);
    RecRef.Close();
    if Ok then
        Message('RecordRef: Truncate succeeded and AutoIncrement reset.')
    else
        Message('RecordRef: Truncate not supported; consider DeleteAll.');
end;
```

The following example demonstrates how to truncate records matching a filter (in this case the table's "Location Code" field). This approach is only recommended when the majority of records match the filter because Truncate is most efficient in such scenarios.

```al
procedure ExampleTruncateFiltered_RecordRef()
var
    RecRef: RecordRef;
    Ok: Boolean;
begin
    RecRef.Open(50101);
    // Field number 2 corresponds to Location Code in this table
    RecRef.Field(2).SetFilter('Red');
    Ok := RecRef.Truncate(false);
    RecRef.Close();
    if Ok then
        Message('RecordRef: Filtered truncate (Location=Red) succeeded (AutoIncrement preserved).')
    else
        Message('RecordRef: Filtered truncate not supported; consider deleting manually.');
end;
```

## See Also
[RecordRef data type](recordref-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)