---
title: "List.Remove Method"
description: "Removes the first occurrence of a specified value from the List."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# List.Remove Method
> **Version**: _Available or changed with runtime version 1.0._

Removes the first occurrence of a specified value from the List.


## Syntax
```AL
[Removed := ]  List.Remove(Value: T)
```
## Parameters
*List*  
&emsp;Type: [List](list-data-type.md)  
An instance of the [List](list-data-type.md) data type.  

*Value*  
&emsp;Type: [T](list-data-type.md)  
The value to remove from the List.  


## Return Value
*[Optional] Removed*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if item is successfully removed; otherwise, **false**. This method also returns **false** if item was not found in the List.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[List Data Type](list-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)