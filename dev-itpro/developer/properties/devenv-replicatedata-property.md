---
title: "ReplicateData property"
description: "Specifies if the table should be replicated."
ms.author: solsen
ms.date: 10/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ReplicateData Property
> **Version**: _Available or changed with runtime version 2.0._

Specifies if the table should be replicated.

## Applies to
-   Table

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property

**True** if the table data is replicated to the cloud service otherwise, **false**. The default is **true**.  

## Syntax

```AL
ReplicateData = false;
```

## Remarks

The `ReplicateData` property is used when migrating data from a Business Central on-premises environment to an online environment. The property specifies whether the data in the on-premises table is replicated to a table in the cloud service as part of cloud migration. When set to `true`, the table's data is included in the replication process for migrating to the cloud. Learn more in [Determine what data to migrate to the cloud](../../administration/cloud-migration-plan-prepare.md#extension-data).

## Related information  

[Properties](devenv-properties.md)  
[Table Properties](devenv-table-properties.md)  
