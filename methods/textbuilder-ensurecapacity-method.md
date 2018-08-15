---
title: "EnsureCapacity Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
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
# EnsureCapacity Method
Ensures that the capacity of this instance of StringBuilder is at least the specified value.

## Syntax
```
[Ok := ]  TextBuilder.EnsureCapacity(NewCapacity: Integer)
```
## Parameters
*TextBuilder*  
&emsp;Type: [TextBuilder](textbuilder-data-type.md)  
An instance of the [TextBuilder](textbuilder-data-type.md) data type.  
*NewCapacity*  
&emsp;Type: [Integer](integer-data-type.md)  
The minimum capacity to ensure.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TextBuilder Data Type](textbuilder-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)