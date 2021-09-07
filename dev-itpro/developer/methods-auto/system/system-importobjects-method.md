---
title: "System.ImportObjects(String [, Integer]) Method"
description: "Imports application objects from a file."
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
# System.ImportObjects(String [, Integer]) Method
> **Version**: _Available or changed with runtime version 1.0 until version 1.0 where it was deprecated._

Imports application objects from a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 System.ImportObjects(FileName: String [, Format: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the file from which the objects will be imported.
        
*[Optional] Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The format in which the objects are represented in the file.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)