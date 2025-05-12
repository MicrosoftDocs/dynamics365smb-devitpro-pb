---
title: "RecordRef.ReadIsolation([IsolationLevel]) Method"
description: "Gets or sets the read isolation level."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RecordRef.ReadIsolation([IsolationLevel]) Method
> **Version**: _Available or changed with runtime version 11.0._

Gets or sets the read isolation level.


## Syntax
```AL
[ReadIsolation := ]  RecordRef.ReadIsolation([ReadIsolation: IsolationLevel])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*[Optional] ReadIsolation*  
&emsp;Type: [IsolationLevel](../isolationlevel/isolationlevel-option.md)  
The read isolation level.  


## Return Value
*[Optional] ReadIsolation*  
&emsp;Type: [IsolationLevel](../isolationlevel/isolationlevel-option.md)  
The read isolation level.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)