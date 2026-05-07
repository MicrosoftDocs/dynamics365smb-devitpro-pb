---
title: "Codeunit.Run(Text [, var Record]) Method"
description: "Loads and runs the unit of AL code you specify."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Codeunit.Run(Text [, var Record]) Method
> **Version**: _Available or changed with runtime version 17.0._

Loads and runs the unit of AL code you specify. To use this method, you can specify a table associated with the codeunit when you defined the codeunit properties. This allows you to pass a variable with the method. The transaction that the codeunit contains is always committed due to the Boolean return value.


## Syntax
```AL
[Ok := ]  Codeunit.Run(FullyQualifiedName: Text [, var Record: Record])
```
## Parameters
*FullyQualifiedName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The fully qualified name of the codeunit that you want to run. If the codeunit you specify does not exist, a run-time error occurs. If you run the codeunit with a record from a table other than the one it is associated with, a run-time error occurs.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
This optional parameter identifies a record. This parameter is a record data type.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Codeunit data type](codeunit-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)