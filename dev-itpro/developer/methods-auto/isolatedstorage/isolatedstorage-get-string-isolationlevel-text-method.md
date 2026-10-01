---
title: "IsolatedStorage.Get(Text, IsolationLevel, var Text) Method"
description: "Gets the value associated with the specified key, applying the specified isolation level to the read."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IsolatedStorage.Get(Text, IsolationLevel, var Text) Method
> **Version**: _Available or changed with runtime version 18.0._

Gets the value associated with the specified key, applying the specified isolation level to the read.


## Syntax
```AL
[Ok := ]  IsolatedStorage.Get(Key: Text, ReadIsolation: IsolationLevel, var Value: Text)
```
## Parameters
*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
The key of the value to get. If the specified key is not found an error will be reported.  

*ReadIsolation*  
&emsp;Type: [IsolationLevel](../isolationlevel/isolationlevel-option.md)  
The isolation level applied to the read. For example, IsolationLevel::UpdLock locks the key row so it can be safely read, modified, and written back within the same transaction.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The value that is associated with the specified key.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the value was retrieved successfully, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[IsolatedStorage data type](isolatedstorage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)