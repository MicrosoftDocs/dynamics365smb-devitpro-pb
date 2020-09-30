---
title: "System.ClearLastError Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# System.ClearLastError Method
Removes the last error message from memory.


## Syntax
```
 System.ClearLastError()
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use the [GETLASTERRORTEXT Method](../../methods-auto/system/system-getlasterrortext-method.md) to determine whether an error has occurred and to see the text in the last error message that was generated. You can then use the CLEARLASTERROR method to remove the last error message from memory. If you subsequently call the [GETLASTERRORTEXT Method](../../methods-auto/system/system-getlasterrortext-method.md), an empty string is returned. 

 
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)