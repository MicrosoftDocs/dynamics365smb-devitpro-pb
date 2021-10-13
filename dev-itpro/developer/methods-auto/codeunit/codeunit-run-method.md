---
title: "Codeunit.Run(Integer [, var Record]) Method"
description: "Loads and runs the unit of AL code you specify."
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
# Codeunit.Run(Integer [, var Record]) Method
> **Version**: _Available or changed with runtime version 1.0._

Loads and runs the unit of AL code you specify. To use this method, you can specify a table associated with the codeunit when you defined the codeunit properties. This allows you to pass a variable with the method. The transaction that the codeunit contains is always committed due to the Boolean return value.


## Syntax
```AL
[Ok := ]  Codeunit.Run(Number: Integer [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
An integer data type that identifies the unit of AL code. If the codeunit you specify does not exist, a run-time error occurs. If you run the codeunit with a record from a table other than the one it is associated with, a run-time error occurs.
        
*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
This optional parameter identifies a record. This parameter is a record data type.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

This example runs two codeunits. The first uses a record parameter. The second is defined without a source table.

```al
var
    FiscalYearCloseInstance: Codeunit "Fiscal Year-Close";
    AppMgmtInstance: Codeunit ApplicationManagement;
    AccountRecord: Record "Accounting Period";
begin  
    AccountRecord.Init;  
    if not FiscalYearCloseInstance.Run(AccountRecord) then  
      Error('Codeunit run failed (with record).');  
    if not AppMgmtInstance.Run then  
      Error('Codeunit run failed.');  
end;
```  

## See Also
[Codeunit Data Type](codeunit-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)