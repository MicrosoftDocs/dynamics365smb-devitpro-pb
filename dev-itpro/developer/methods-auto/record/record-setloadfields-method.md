---
title: "Record.SetLoadFields([Any,...]) Method"
description: "Sets the fields to be initially loaded when the record is retrieved from its data source."
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
# Record.SetLoadFields([Any,...]) Method
> **Version**: _Available or changed with runtime version 6.0._

Sets the fields to be initially loaded when the record is retrieved from its data source. This will overwrite fields previously selected for initial load.


## Syntax
```AL
[Ok := ]  Record.SetLoadFields([Fields: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Fields*  
&emsp;Type: [Any](../any/any-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Calling SetLoadFields on a record without passing any fields will reset the fields selected to load to the default, where all readable normal fields are selected for load.

It is not necessary to include the following fields, because they are always selected for loading: Primary key, SystemId, and data audit fields (SystemCreatedAt, SystemCreatedBy, SystemModifiedAt, SystemModifiedBy).  

Depending on the runtime version, the runtime may require extra fields to be selected for loading. Which extra fields to specify depends on the state of the record and table or table extension definition. For example, fields that are filtered upon are always loaded, fields that are referred to in calcformulas in the current table or table extension definition, and so on.

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## Example

This example uses the SetLoadFields method to speedup the calculation of the mean for values of the **Standard Cost** field in the **Item** table. Instead of loading all fields, only the **Standard Cost** is loaded. The other fields aren't needed for the calculation, so they're not loaded.

```al
procedure ComputeArithmeticMean(): Decimal;
var
    Item: Record Item;
    SumTotal: Decimal;
    Counter: Integer;
begin
    Item.SetLoadFields(Item."Standard Cost");
    if Item.FindSet() then begin
        repeat
            SumTotal += Item."Standard Cost";
            Counter += 1;
        until Item.Next() = 0;
        exit(SumTotal / Counter);
    end;
end;
```

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
