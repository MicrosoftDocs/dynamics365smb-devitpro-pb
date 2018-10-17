---
title: "Get Method"
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
# Get Method
Gets the value associated with the specified key.

## Syntax
```
[Ok := ]  IsolatedStorage.Get(Key: String, var Value: Text)
```
## Parameters
*Key*  
&emsp;Type: [String](string-data-type.md)  
The key of the value to get. If the specified key is not found an error will be reported.
        
*Value*  
&emsp;Type: [Text](text-data-type.md)  
The value that is associated with the specified key.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the value was retrieved successfully, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[IsolatedStorage Data Type](isolatedstorage-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)