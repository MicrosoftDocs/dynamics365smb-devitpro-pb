---
title: "System.ImportObjects Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.ImportObjects Method
Imports application objects from a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 System.ImportObjects(FileName: String [, Format: Integer])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the file from which the objects will be imported.
        
*Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The format in which the objects are represented in the file.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)