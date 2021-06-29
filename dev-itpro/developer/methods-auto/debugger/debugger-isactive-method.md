---
title: "Debugger.IsActive Method"
description: "Indicates whether the debugger is active."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Debugger.IsActive Method
> **Version**: _Available or changed with runtime version 1.0 until version 4.0 where it was deprecated._

Indicates whether the debugger is active.


## Syntax
```
Ok :=   Debugger.IsActive()
```


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When the debugger is activated, it is in one of the following states:  
  
- Attached to a session.
- Waiting to attach to a session.  

## See Also

[Debugger Data Type](debugger-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)