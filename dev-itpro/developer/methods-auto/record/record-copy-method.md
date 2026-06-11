---
title: "Record.Copy(Record [, Boolean]) Method"
description: "Copies a specified record's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record."
ms.author: solsen
ms.date: 06/04/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.Copy(Record [, Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Copies a specified record's filters, views, automatically calculated FlowFields, marks, fields, and keys that are associated with the record from a table or creates a reference to a record.


## Syntax
```AL
 Record.Copy(FromRecord: Record [, ShareTable: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*FromRecord*  
&emsp;Type: [Record](record-data-type.md)  
The record to copy.  

*[Optional] ShareTable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the method copies filters, views, automatically calculated FlowFields, marks, fields, and keys of the record or creates a reference to a temporary record. If FromRecord and Record are both temporary and ShareTable is true, then the COPY method causes Record to reference the same table as FromRecord. If ShareTable is true, then both Record and FromRecord must be temporary; otherwise an error will occur. The default value is false. If you specify false, only filters, marks, and keys are copied.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The behavior of the `Copy` method depends on the `ShareTable` parameter and whether the source and target records are temporary:

- **`ShareTable` is `false` (default):** The method copies the current record's field values, filters, sorting, marks, field load info, read behavior, and automatically calculated FlowFields from the source record to the target record. The two records are fully independent afterward — changes to one don't affect the other. This works regardless of whether the source or target is temporary.

- **`ShareTable` is `true`:** The method shares the underlying temporary table data between the source and target records so that both records point to the same in-memory data. Both the source and target records must be temporary. If either record isn't temporary, a runtime error occurs.

### Copy from a temporary record to a non-temporary record

When you call `Copy` with the default `ShareTable` value of `false`, copying from a temporary record to a non-temporary record is fully supported. The target record receives the current field values, filters, marks, and keys from the temporary source record. Because `ShareTable` is `false`, no table data reference is shared — the target record gets an independent copy of the buffer.

If you set `ShareTable` to `true` in this scenario, a runtime error occurs because the target record isn't temporary.

> [!NOTE]
> When copying from a temporary record to a non-temporary record (or vice versa), the result set enumerator is invalidated on the target record. Any active `FindSet` or `Find` loop on the target record won't continue after the copy.

## Example

This example shows how to copy a record and its filters from a temporary record to a non-temporary record.

```al
procedure CopyFromTemp()
var
    TempCustomer: Record Customer temporary;
    Customer: Record Customer;
begin
    TempCustomer.SetRange("Country/Region Code", 'US');
    TempCustomer.SetFilter(Name, '@*Adatum*');

    // Copies field values, filters, marks, and keys from the temporary record.
    Customer.Copy(TempCustomer);

    // Customer now has the same filters and field values.
    // Use FindSet to query the database with the copied filters.
    if Customer.FindSet() then
        repeat
            // Process non-temporary records matching the filters.
        until Customer.Next() = 0;
end;
```

## Related information
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)