---
title: "IncludedFields Property"
description: "Sets the fields that are included as non-key columns in the index on SQL Server."
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
# IncludedFields Property
> **Version**: _Available or changed with runtime version 8.0._

Sets the fields that are included as non-key columns in the index on SQL Server.

## Applies to
-   Table Key

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

A comma-separated list of field names.

## Syntax

```al
IncludedFields = Field1,Field2;
```

## Remarks

You can't use this property on primary keys or clustered secondary keys ([Clustered](devenv-clustered-property.md) property is **true**).

Using this property can improve query performance. For more information, see [Table Keys](../devenv-table-keys.md).

## See Also

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  