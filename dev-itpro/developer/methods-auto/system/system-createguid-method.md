---
title: "System.CreateGuid Method"
description: "Creates a new unique GUID."
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
# System.CreateGuid Method
> **Version**: _Available or changed with runtime version 1.0._

Creates a new unique GUID. The value can then be assigned to a GUID data type or a text data type. Use the text data type if you want to compare the GUID to another text string.


## Syntax
```AL
Guid :=   System.CreateGuid()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.


## Return Value
*Guid*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)