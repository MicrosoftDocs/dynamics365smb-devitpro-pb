---
title: "System.ClearLastError Method"
description: "Removes the last error message from memory."
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
# System.ClearLastError Method
> **Version**: _Available or changed with runtime version 1.0._

Removes the last error message from memory.


## Syntax
```AL
 System.ClearLastError()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You can use the [GetLastErrorText Method](../../methods-auto/system/system-getlasterrortext-method.md) to determine whether an error has occurred and to see the text in the last error message that was generated. You can then use the ClearLastError method to remove the last error message from memory. If you subsequently call the [GetLastErrorText Method](../../methods-auto/system/system-getlasterrortext-method.md), an empty string is returned. 


## See Also

[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)