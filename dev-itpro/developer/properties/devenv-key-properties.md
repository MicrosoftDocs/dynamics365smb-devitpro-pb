---
title: Table Key Property Reference in AL
description: Review the AL properties that control table keys and SQL indexes in Dynamics 365 Business Central, with links to details for each property.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Properties for table keys

<!-- this article is manually created -->

Table keys have properties that control their behavior and the corresponding indexes in SQL Server.

[!INCLUDE[properties_note](../includes/properties_note.md)]

| Property | Description |
|----------|-------------|
| [Clustered property](devenv-clustered-property.md) | Specifies whether the key defines the clustered index for the table. |
| [Description property](devenv-description-property.md) | Specifies a description for the key. |
| [Enabled property](devenv-enabled-property.md) | Specifies whether the system maintains indexes for the key. |
| [IncludedFields property](devenv-includedfields-property.md) | Specifies non-key fields to include in the SQL index. |
| [MaintainSIFTIndex property](devenv-maintainsiftindex-property.md) | Specifies whether SQL Server maintains indexed views for the key's `SumIndexFields`. |
| [MaintainSQLIndex property](devenv-maintainsqlindex-property.md) | Specifies whether SQL Server creates an index for the key. |
| [ObsoleteReason property](devenv-obsoletereason-property.md) | Explains why the key is obsolete. |
| [ObsoleteState property](devenv-obsoletestate-property.md) | Specifies whether the key is obsolete. |
| [ObsoleteTag property](devenv-obsoletetag-property.md) | Specifies the version in which the key became obsolete. |
| [SQLIndex property](devenv-sqlindex-property.md) | Specifies the fields and field order of the corresponding SQL Server index. |
| [SumIndexFields property](devenv-sumindexfields-property.md) | Specifies the fields for which the system maintains a SumIndex. |
| [Unique property](devenv-unique-property.md) | Specifies whether key values must be unique. |

## Related information

[Table keys](../devenv-table-keys.md)  
[Table and table extension properties](devenv-table-property-overview.md)  
[Properties](devenv-properties.md)