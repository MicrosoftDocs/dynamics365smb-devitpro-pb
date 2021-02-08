---
title: "RecordRef.SetLoadFields Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# RecordRef.SetLoadFields Method
> **Version**: _Available from runtime version 6.0._

Sets the fields to be initially loaded when the record is retrieved from its data source. This will overwrite fields previously selected for initial load.


## Syntax
```
[Ok := ]  RecordRef.SetLoadFields([Fields: Integer,...])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*Fields*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks
Calling SetLoadFields on a recordref without passing any fields will reset the fields selected to load to the default, where all readable normal fields are selected for load.

It is not necessary to include the following fields: Primary key, SystemId, and Audit fields (SystemCreatedAt, SystemCreatedBy, SystemModifiedAt, SystemModifiedBy) since they are always selcted for loading.

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## Example

This code example uses the SetLoadFields method to speedup the calculation of the mean for values in a table field. The other fields aren't needed for the calculation, so they're not loaded.

```
procedure ComputeAritmeticMean(MyRecordRef: RecordRef; FieldNo: Integer): Decimal
var
    SumTotal: Decimal;
    Counter: Integer;
begin
    MyRecordRef.SetLoadFields(FieldNo);
    if MyRecordRef.FindSet() then begin
        repeat
            SumTotal := MyRecordRef.Field(FieldNo).Value;
            Counter += 1;
        until MyRecordRef.Next() = 0;
        exit(SumTotal / Counter);
    end;
end;
```

## See Also
[Using Partial Records](../../devenv-partial-records.md)  
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)