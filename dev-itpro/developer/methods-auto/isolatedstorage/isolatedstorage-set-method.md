---
title: "IsolatedStorage.Set(String, String [, DataScope]) Method"
description: "Sets the value associated with the specified key."
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
# IsolatedStorage.Set(String, String [, DataScope]) Method
> **Version**: _Available or changed with runtime version 2.0._

Sets the value associated with the specified key.


## Syntax
```AL
[Ok := ]  IsolatedStorage.Set(Key: String, Value: String [, DataScope: DataScope])
```
## Parameters
*Key*  
&emsp;Type: [String](../string/string-data-type.md)  
The key of the value to set.
        
*Value*  
&emsp;Type: [String](../string/string-data-type.md)  
The value that will be associated with the specified key.
        
*[Optional] DataScope*  
&emsp;Type: [DataScope](../datascope/datascope-option.md)  
The scope of the stored data. If a value is not passed in, the default value DataScope::Module will be used.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the value was saved successfully, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The **Set** method initiates a write transaction, which means that it cannot be succeeded by code that opens a modal page. If you want to open a modal page, it must be done before the **Set** method is called.

## See Also
[IsolatedStorage Data Type](isolatedstorage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)