---
title: "RemoveAt Method"
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
# RemoveAt Method
Removes the element at the specified index of the List.

## Syntax
```
[Ok := ]  List.RemoveAt(Index: Integer)
```
## Parameters
*List*  
&emsp;Type: [List](list-data-type.md)  
An instance of the [List](list-data-type.md) data type.  

*Index*  
&emsp;Type: [Integer](integer-data-type.md)  
The one-based index of the element to remove.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the index was within the valid range, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[List Data Type](list-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)