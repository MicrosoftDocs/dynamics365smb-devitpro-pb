---
title: "ClearLastError Method"
ms.author: solsen
ms.custom: na
ms.date: 08/01/2018
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
# ClearLastError Method
Removes the last error message from memory.

## Syntax
```
 System.ClearLastError()
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use the [GETLASTERRORTEXT Method](devenv-GETLASTERRORTEXT-Method.md) to determine whether an error has occurred and to see the text in the last error message that was generated. You can then use the CLEARLASTERROR method to remove the last error message from memory. If you subsequently call the GETLASTERRORTEXT method, an empty string is returned. 

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)