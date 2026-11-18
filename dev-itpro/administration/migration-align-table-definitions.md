---
title: Align SQL Table Definitions for Cloud Migration
description: Learn which SQL table definitions must match between Business Central on-premises and online databases before you run cloud migration.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer

ms.topic: concept-article
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---

# Align SQL table definitions

For successful cloud migration replication, the on-premises source tables and the corresponding online destination tables must have matching definitions for the following properties:

- Primary keys
- Field names and data types

Replication also checks field lengths and reports incompatible lengths as column-mapping errors.

In the following example, `MyField1` is the primary-key field. The fields being migrated must have matching names and data types in the source and destination, including the primary-key fields.

```al
table 50100 MyTable
{
    fields
    {
        field(1; MyField1; Integer)
        {
        }
        field(2; MyField2; Integer)
        {
        }
    }

    keys
    {
        key(Key1; MyField1)
        {
            Clustered = true;
        }
        key(Key2; MyField2)
        {
        }
    }
```

Other properties of tables, like the following, are either not required to match or the difference can be handled by table mapping during cloud migration setup. Learn more in [Define cloud migration table mappings](migration-table-mapping.md).

- Different table names can be handled by table mapping. In the previous code snippet, the table name is `MyTable`.
- A subset of fields can be mapped to a different table or table extension. The fields being moved must still have matching names and data types.
- Table and field IDs don't have to match for SQL replication.
- Secondary keys don't have to match for SQL replication.

> [!NOTE]
> These rules apply to cloud migration replication, not to an on-premises application or data upgrade. An on-premises upgrade has separate requirements for preserving table and field identities and handling schema changes. Learn more in [Supported upgrade paths to Business Central releases](../upgrade/upgrade-paths.md).

## Next steps

[Define cloud migration table mappings](migration-table-mapping.md)
