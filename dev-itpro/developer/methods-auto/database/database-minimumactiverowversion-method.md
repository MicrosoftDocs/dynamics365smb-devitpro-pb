---
title: "Database.MinimumActiveRowVersion() Method"
description: "Returns the lowest active RowVersion in the database."
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
# Database.MinimumActiveRowVersion() Method
> **Version**: _Available or changed with runtime version 10.0._

Returns the lowest active RowVersion in the database. This is the lowest RowVersion for an uncomitted row, meaning rows with a lower timestamp than this value are guaranteed to be comitted. If there are no active transactions, this value is equal to LastUsedRowVersion + 1.


## Syntax
```AL
RowVersion :=   Database.MinimumActiveRowVersion()
```
> [!NOTE]
> This method can be invoked without specifying the data type name.

## Return Value
*RowVersion*  
&emsp;Type: [BigInteger](../biginteger/biginteger-data-type.md)  
The lowest active RowVersion in the database.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Database Data Type](database-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)