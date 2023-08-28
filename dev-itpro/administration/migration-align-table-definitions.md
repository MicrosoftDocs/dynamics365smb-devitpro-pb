---
title: Align SQL Table Definitions
description: Learn what table properties need to be the same in on-premises and online database for cloud migration to work.
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual 
ms.date: 11/25/2022
ms.custom: bap-template
---

# Align SQL table definitions

For successful cloud migration and data upgrade, the on-premises source table objects and the corresponding online table objects must have the same definitions for the following properties:

- Primary keys
- Field names and data types

These properties are indicated by an asterisk `*` in the following code snippet:

```al
table id **MyTable
{  
    fields
    {
        field(1;*MyField1; *Integer)
        {    
        }
        field(2;*MyField2; *Integer)
        {    
        }
    }
    
    keys
    {
        key(*Key1; *MyField1)
        {
            Clustered = true;
        }
        key(Key2; MyField2)
        {
        }
    }
```

Other properties of tables, like the following, are either not required to match or the difference can be handled by [table mapping](migration-table-mapping.md) during cloud migration setup.

- Different tables names can be handled by table mapping. In the previous code snippet, the table name is indicated by `**`.  
- Missing fields or extra fields in tables can be handled by table mapping
- Different IDs aren't relevant and don't affect cloud migration
- Different secondary keys aren't relevant and don't affect cloud migration

> [!NOTE]
> These properties must match to upgrade Dynamics NAV to Business Central on-premises.  

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
