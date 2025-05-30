---
title: "Codeunit.Run(var Record) Method"
description: "Loads and executes the unit of AL code that you specify."
ms.author: solsen
ms.date: 04/15/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Codeunit.Run(var Record) Method
> **Version**: _Available or changed with runtime version 1.0._

Loads and executes the unit of AL code that you specify.


## Syntax
```AL
[Ok := ]  Codeunit.Run(var Record: Record)
```
## Parameters
*Codeunit*  
&emsp;Type: [Codeunit](codeunit-data-type.md)  
An instance of the [Codeunit](codeunit-data-type.md) data type.  

*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record from the table that is associated with the codeunit.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Transaction semantics

For information about transaction and commit semantics for `Codeunit.Run`, see [Codeunit.Run(Integer [, var Record]) Method](codeunit-run-method.md).

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

## Related information
[Codeunit Data Type](codeunit-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)