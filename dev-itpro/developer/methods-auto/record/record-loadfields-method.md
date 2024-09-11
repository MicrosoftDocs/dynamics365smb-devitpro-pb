---
title: "Record.LoadFields(Any,...) Method"
description: "Accesses the table's corresponding data source and loads the values of the specified fields on the record."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Record.LoadFields(Any,...) Method
> **Version**: _Available or changed with runtime version 6.0._

Accesses the table's corresponding data source and loads the values of the specified fields on the record.


## Syntax
```AL
[Ok := ]  Record.LoadFields(Fields: Any,...)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Fields*  
&emsp;Type: [Any](../any/any-data-type.md)  
The FieldNo's of the fields to be loaded.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if all values were loaded on the record; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks

This method will trigger a [JIT load](../../devenv-partial-records.md#jit) of the specified fields. The method allows for triggering the JIT load on multiple fields. If the fields are already loaded, another load will not be triggered. Using this method instead of relying on implicit JIT loads lets you develop for more explicit error handling when a load fails.

> [!NOTE]
> You must not use the method LoadFields on fields with FieldClass FlowFilter or FlowField. Otherwise a runtime error will occur.

This method is part of the partial records capability for improving performance. For more information, see [Using Partial Records](../../devenv-partial-records.md).

## See Also

[Using Partial Records](../../devenv-partial-records.md)  
[Record Data Type](record-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)