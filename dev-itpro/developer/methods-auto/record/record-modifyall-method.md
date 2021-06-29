---
title: "Record.ModifyAll Method"
description: "Modifies a field in all records within a range that you specify."
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
# Record.ModifyAll Method
> **Version**: _Available or changed with runtime version 1.0._

Modifies a field in all records within a range that you specify.


## Syntax
```
 Record.ModifyAll(Field: Any, NewValue: Any [, RunTrigger: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field that you want to modify.
          
*NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
The value that you want to assign to Field in all records. The data type of NewValue must match the data type of Field.
          
*[Optional] RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the code in the OnModify Trigger is executed. If this parameter is false (default), the code in the OnModify trigger is not executed.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If no filter is set, the field is modified in all records in the table. If a filter is set, the fields are modified only in the records which fall within the range specified by the filter. Records where the field is already equal to the new value are also updated. 

The `OnValidate` field trigger is never run when `ModifyAll` is used. Using ModifyAll() is recommended if field validation is not wanted or needed. Otherwise, [Record.Modify Method](record-modify-method.md) can be used.

## Example

```al
var
    customerRec: record Customer;

begin
    // The result of this statement:  
    customerRec.ModifyAll("Statistics Group", 2);  
    // is equivalent to:  
    if customerRec.Find('-') then
        repeat  
            customerRec."Statistics Group" := 2;  
            customerRec.Modify;  
        until customerRec.Next = 0;  
end;

```

## See Also

[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)  