---
title: "Database.LastUsedRowVersion() Method"
description: "Gets the last used RowVersion from the database."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Database.LastUsedRowVersion() Method
> **Version**: _Available or changed with runtime version 10.0._

Gets the last used RowVersion from the database.


## Syntax
```AL
RowVersion :=   Database.LastUsedRowVersion()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Return Value
*RowVersion*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
The last used RowVersion in the database.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)