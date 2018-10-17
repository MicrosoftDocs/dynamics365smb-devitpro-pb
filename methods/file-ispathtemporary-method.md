---
title: "IsPathTemporary Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
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
# IsPathTemporary Method
Validates whether the given path is located in the current users temporary folder within the current service.

## Syntax
```
[Ok := ]  File.IsPathTemporary(Name: String)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*Name*  
&emsp;Type: [String](string-data-type.md)  
The name of the file, including the path.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the name point to a location is the users temporary folder within the current service; **false** otherwise.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)