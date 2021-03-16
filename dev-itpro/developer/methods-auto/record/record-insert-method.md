---
title: "Insert Method"
description: Describes the Insert method in Business Central
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# Insert Method
Inserts a record into a table.


## Syntax
```
[Ok := ]  Record.Insert([RunTrigger: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the code in the OnInsert Trigger is executed. If this parameter is false, the code in the OnInsert trigger is not executed. The default value is false.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The inserted record will automatically get assigned a SystemId by the platform. To assign a specific SystemId instead of the one assigned by the platform, use [Insert(Boolean, Boolean)](record-insert-boolean-boolean-method.md) instead.

## Example 1

This example shows how to use the Insert method without a return value.  
  
```al
Customer.Init();  
Customer."No." := '1120';  
Customer.Insert(true);  
```  
  
If customer 1120 already exists, then a run-time error occurs.  
  
## Example 2
  
This example shows how to use the Insert method with a return value.

```al
var
    CustomerRec: Record Customer;
    Text000: Label 'Customer no: %1 inserted.';
    Text001: Label 'Customer no: %1 already exists.';
begin
    CustomerRec.Init();  
    CustomerRec."No." := '1120';  
    if CustomerRec.Insert(true) then  
      Message(Text000, CustomerRec."No.")  
    else  
      Message(Text001, CustomerRec."No.");
end;
```

No run-time error occurs if customer 1120 already exists.  

## See Also

[SystemId Field](../../devenv-table-system-fields.md#systemid)  
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)