---
title: "Database.LockTimeoutDuration([Integer]) Method"
description: "Gets or sets the current lock timeout duration in seconds."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.LockTimeoutDuration([Integer]) Method
> **Version**: _Available or changed with runtime version 16.0._

Gets or sets the current lock timeout duration in seconds. Setting a lock timeout of 0 or less disables the lock timeout.


## Syntax
```AL
[LockTimeoutDuration := ]  Database.LockTimeoutDuration([LockTimeoutDuration: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*[Optional] LockTimeoutDuration*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new setting for the lock timeout duration in seconds.  


## Return Value
*[Optional] LockTimeoutDuration*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The lock timeout duration in seconds.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database data type](database-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)