---
title: "Record.Insert Method"
description: "Inserts a record into a table without executing the code in the OnInsert trigger."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Record.Insert Method
> **Version**: _Available or changed with runtime version 1.0._

Inserts a record into a table without executing the code in the OnInsert trigger.


## Syntax
```AL
[Ok := ]  Record.Insert()
```

## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

The inserted record will automatically get assigned a SystemId by the platform. To assign a specific SystemId instead of the one assigned by the platform, use [Insert(Boolean, Boolean)](record-insert-boolean-boolean-method.md) instead.

## Example 1

This example shows how to use the Insert method without a return value.  
  
```al
Customer.Init;  
Customer."No." := '1120';  
Customer.Insert();  
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
    if CustomerRec.Insert() then  
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