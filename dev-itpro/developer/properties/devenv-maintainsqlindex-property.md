---
title: "MaintainSqlIndex Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# MaintainSqlIndex Property
> **Version**: _Available from runtime version 1.0._

Sets a value that indicates whether a SQL Server index that corresponds to the fields part of the Dynamics 365 Business Central key should be created.

## Applies to
-   Table Key


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

Set to **True** to create the SQL Server index on the field list defined in the key property. If set to **false**, no index is created. The default is **true**.  

## Syntax

```AL
key(<key name>;<comma-separated field list>) { MaintainSqlIndex=[false|true]; }
```

## Remarks

In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], you can use a key to sort data in a table by the set of fields specified in the key. SQL Server can sort data without an index on the fields to be sorted. However, if an index exists, sorting by the fields matching the index will be faster, but modifications to the table will be slower. The more indexes there are on a table, the slower the modifications become.  
  
In situations where a key must be created to allow only occasional sorting (for example, when running infrequent reports), set this property to **false** to prevent slow modifications to the table.  

This property is mostly used in the case where the key definition is for a SIFT index. Here, the developer can control if only the SIFT index shall be created (set MaintainSQLIndex = false) or if a SQL index should also be created (MaintainSQLIndex = true).

> [!NOTE]  
> You cannot disable this property on the primary key of a table. This key is always created in SQL Server.  
  
## See Also

[Properties](devenv-properties.md)