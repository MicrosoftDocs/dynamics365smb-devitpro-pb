---
title: "Delete Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Delete Method
Deletes the value with the specified key from the isolated storage.

## Syntax
```
[Ok := ]  IsolatedStorage.Delete(Key: String, [DataScope: DataScope])
```
## Parameters
*Key*  
&emsp;Type: [String](string-data-type.md)  
The key of the value to remove.
        
*DataScope*  
&emsp;Type: [DataScope](datascope-option.md)  
The scope from which to remove the value with the given key. If a value is not passed in, the default value DataScope::Module will be used.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the value with the given key was successfully deleted from isolated storage, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[IsolatedStorage Data Type](isolatedstorage-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)