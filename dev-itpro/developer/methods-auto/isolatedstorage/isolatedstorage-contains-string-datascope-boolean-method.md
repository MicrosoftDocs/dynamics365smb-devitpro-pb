---
title: "IsolatedStorage.Contains(Text [, DataScope], var Boolean) Method"
description: "Determines whether the storage contains a value with the specified key."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IsolatedStorage.Contains(Text [, DataScope], var Boolean) Method
> **Version**: _Available or changed with runtime version 13.0._

Determines whether the storage contains a value with the specified key.


## Syntax
```AL
HasValue :=   IsolatedStorage.Contains(Key: Text [, DataScope: DataScope], var isSecret: Boolean)
```
## Parameters
*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
The key to locate in the storage.  

*[Optional] DataScope*  
&emsp;Type: [DataScope](../datascope/datascope-option.md)  
The scope in which to check for the existence of a value with the given key. If a value is not passed in, the default value DataScope::Module will be used.  

*isSecret*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the value is stored as a SecretText, otherwise **false**.  


## Return Value
*HasValue*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if a value with the specified key exists in the storage, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[IsolatedStorage Data Type](isolatedstorage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)