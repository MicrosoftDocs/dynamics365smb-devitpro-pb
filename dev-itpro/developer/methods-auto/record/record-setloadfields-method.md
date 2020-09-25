---
title: "Record.SetLoadFields Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.SetLoadFields Method
Sets the fields to be initially loaded when the record is retrieved from its data source. This will overwrite fields previously selected for initial load.


## Syntax
```
[Ok := ]  Record.SetLoadFields([Fields: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Fields*  
&emsp;Type: [Any](../any/any-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all fields are selected for subsequent loads; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Calling SetLoadFields on a record without passing any fields will reset the fields selected to load to the default, where all readable normal fields are selected for load.

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## Example

This example uses the SetLoadFields method to speedup the calculation of the mean for values of the **Standard Cost** field in the **Item** table. Instead of loading all fields, only the **Standard Cost** is loaded. The other fields aren't needed for the calculation, so they're not loaded.

```
procedure ComputeArithmeticMean(): Decimal;
var
    item: Record Item;
    acc: Decimal;
    cou: Integer;
begin
    item.SetLoadFields(item."Standard Cost");
    if (item.FindSet()) then begin
        repeat
            acc += item."Standard Cost";
            cou += 1;
        until (item.Next = 0)
    end else
        exit(0);

    exit(acc / cou);
end;
```

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)