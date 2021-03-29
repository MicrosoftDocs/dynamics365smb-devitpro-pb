---
title: "Database.LockTimeout Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# Database.LockTimeout Method
> **Version**: _Available or changed with runtime version 1.0._

Determines whether the lock time-out setting is set to On. You can also use this method to override the default setting.


## Syntax
```
[LockTimeout := ]  Database.LockTimeout([LockTimeout: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*LockTimeout*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new setting for whether the lock time-out is on.  


## Return Value
*LockTimeout*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
This value shows whether to use a lock time-out.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method has been designed specifically for use in long-running processes that should not be terminated because of a lock time-out, for example batch jobs that run overnight.  

When the AL code has finished running, the default setting is used again. This method does not change the duration of a lock time-out.  

## See Also

[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)