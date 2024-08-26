---
title: "Database.AlterKey(KeyRef, Boolean) Method"
description: "Alter a table's key in SQL, either disabling or enabling it."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.AlterKey(KeyRef, Boolean) Method
> **Version**: _Available or changed with runtime version 13.0._

Alter a table's key in SQL, either disabling or enabling it. Any alteration only pertains to the current transaction and will be reverted at the end of the current transaction. Any alteration will fail if it's called on System or non-SQL based tables. Disabling clustered or unique keys is also not supported and will fail at runtime.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 Database.AlterKey(KeyRef: KeyRef, Enable: Boolean)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*KeyRef*  
&emsp;Type: [KeyRef](../keyref/keyref-data-type.md)  
A keyref of the key to alter.  

*Enable*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Whether to enable or disable a key. Keys that are created as disabled cannot be enabled.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)