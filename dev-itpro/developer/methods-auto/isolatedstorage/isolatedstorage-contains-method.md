---
title: "IsolatedStorage.Contains Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# IsolatedStorage.Contains Method
> **Version**: _Available or changed with runtime version 2.0._

Determines whether the storage contains a value with the specified key.


## Syntax
```
HasValue :=   IsolatedStorage.Contains(Key: String [, DataScope: DataScope])
```
## Parameters
*Key*  
&emsp;Type: [String](../string/string-data-type.md)  
The key to locate in the storage.
        
*DataScope*  
&emsp;Type: [DataScope](../datascope/datascope-option.md)  
The scope in which to check for the existence of a value with the given key. If a value is not passed in, the default value DataScope::Module will be used.  


## Return Value
*HasValue*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if a value with the specified key exists in the storage, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[IsolatedStorage Data Type](isolatedstorage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)