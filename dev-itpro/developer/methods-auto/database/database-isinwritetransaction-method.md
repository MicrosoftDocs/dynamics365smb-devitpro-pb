---
title: "Database.IsInWriteTransaction() Method"
description: "Checks whether or not you are in a write transaction."
ms.author: solsen
ms.custom: na
ms.date: 02/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.IsInWriteTransaction() Method
> **Version**: _Available or changed with runtime version 11.0._

Checks whether or not you are in a write transaction.


## Syntax
```AL
WriteTransactionStatus :=   Database.IsInWriteTransaction()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Return Value
*WriteTransactionStatus*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
A Boolean indicating if you are in a write transaction.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)