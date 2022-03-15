---
title: "ColumnStoreIndex Property"
description: "Sets the fields that are added to the ColumnStore index inside SQL Server."
ms.author: solsen
ms.custom: na
ms.date: 03/03/2022
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
# ColumnStoreIndex Property
> **Version**: _Available or changed with runtime version 8.0._

Sets the fields that are added to the ColumnStore index inside SQL Server.

## Applies to
-   Table

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value
A comma-separated list of field names.

## Syntax

```al
ColumnStoreIndex = Field1,Field2;
```

## Remarks
The property creates a nonclustered columnstore index on the table in SQL server. There can be only one nonclustered columnstore index on a table.

Using a nonclustered columnstore index can improve the performance for analytical queries on large tables. 

For more information, see [Columnstore indexes: Overview](/sql/relational-databases/indexes/columnstore-indexes-overview).

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Table Keys](../devenv-table-keys.md)  
