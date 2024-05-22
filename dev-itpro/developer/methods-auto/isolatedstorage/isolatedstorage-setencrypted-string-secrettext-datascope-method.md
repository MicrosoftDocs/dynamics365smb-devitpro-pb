---
title: "IsolatedStorage.SetEncrypted(Text, SecretText [, DataScope]) Method"
description: "Encrypts and sets the value associated with the specified key."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# IsolatedStorage.SetEncrypted(Text, SecretText [, DataScope]) Method
> **Version**: _Available or changed with runtime version 13.0._

Encrypts and sets the value associated with the specified key. The input string cannot exceed a length of 215 plain characters; be aware that special characters take up more space.


## Syntax
```AL
[Ok := ]  IsolatedStorage.SetEncrypted(Key: Text, Value: SecretText [, DataScope: DataScope])
```
## Parameters
*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
The key of the value to set.  

*Value*  
&emsp;Type: [SecretText](../secrettext/secrettext-data-type.md)  
The value that will be associated with the specified key.  

*[Optional] DataScope*  
&emsp;Type: [DataScope](../datascope/datascope-option.md)  
The scope of the stored data. If a value is not passed in, the default value DataScope::Module will be used.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the value was saved successfully, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[IsolatedStorage Data Type](isolatedstorage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)