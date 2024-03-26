---
title: Moving tables and fields between extensions
description: Learn how to move tables and fields between extensions in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: conceptual
ms.date: 03/26/2024
ms.custom: 
---

# Moving tables and fields between extensions

As extensions mature or as a consequence of an extension initially created as a large monolith, the need to break down the extension and transfer the ownership of tables or fields, including data, becomes apparent. Moving tables and fields between extensions improves maintainability, flexibility, and scalability of the extension. This feature introduces a controlled process for releasing and taking ownership of tables as part of the extension upgrade process.

> [!IMPORTANT]
> This feature is only available to apps developed by Microsoft.

## Moving tables between extensions

To prepare moving a table, both the source and destination must contain the implementation of the specific table. Furthermore, the table must have the same schema and public methods in the source and destination extension. The tables must be identical in both extensions, including the table ID, fields, keys, and triggers. Then, the table must be moved in a staged process to avoid breaking changes.

In the source table definition, you must add the `MovedTo` property, making sure that it points to the app ID of the destination extension. Likewise, in the destination extension, you must add the `MovedFrom` property, which should point to the app ID of the source extension. When the extensions are published, installed, or upgraded, the platform will handle moving the data ownership for the table from the source to the destination extension.

### Avoiding breaking changes

To avoid breaking changes from the table move, the source table must remain for a period and act as a proxy for downstream dependencies, and the compiler will issue a warning to update dependencies to include the destination extension. This proxy only works for a dependent extension, which means that prior to moving a table, all dependencies from the source extensions own code must also be obsoleted and moved to the destination extension (or be removed).

Initially, only the full table can be moved, not individual fields. Tables can be moved both up and down the dependency chain.

A move can be a breaking change or a non-breaking change. If a table is moved to one of its own dependencies (aka moving a table down) and the `PropagateDependency` property is set in the manifest, the move isn't a breaking change and this kind of change can be done without preparation in one stage. This means that in one release, the `ObsoleteStage` property can be set to `Moved`.

In other cases where a move can break any of the dependent extensions, the move of a table must be staged, which means that the `ObsoleteStage` property must be set to `PendingMoved` in the first version and can be set to `Moved` in a later version.

A move is possible if the source (current owner) allows the move. This can be done by setting the `ObsoleteStage` property on the table to `Moved` and by setting the `MovedTo` property to the app ID of the destination extension.

If a table is set to `Moved` that table isn't accessible anymore. The table data will be preserved until the new destination takes over the table.

Additive changes can be applied to a table during a move, but any destructive change aren't allowed.

Hostile take-over isn't allowed when moving a table, the latest published version of the current app must allow the move. Otherwise, this will be considered a hostile takeover and sync of the destination app will fail.

> [!NOTE]
> The Name and ID of tables can't be changed during a move.

## Sample code

The following sections show the source and destination tables for how to move a table between extensions.

### Source extension

```al
table 50150 BaseTable50150

{

    ObsoleteState = Moved;

    MovedTo = 'F0000000-0000-0000-0000-000000000001';

    fields

    {

        field(1; MyField; Integer)

        {

        }

        field(10; Field10; Integer)

        {

        }

        field(11; Field11; Integer)

        {

        }

        field(12; Field12; Integer)

        {

        }

    }

}
```

### Destination extension

```al

table 50150 BaseTable50150

{

    MovedFrom = 'f0000000-0000-0000-0000-000000000003';

    fields

    {

        field(1; MyField; Integer)

        {

        }

        field(10; Field10; Integer)

        {

        }

        field(11; Field11; Integer)

        {

        }

        field(12; Field12; Integer)

        {

        }

    }

}
```

## Moving fields between extensions

The goal is to allow developers to move fields between extensions. A field can be moved from a base table to a table extension or from a table extension to another table extension.

When a field is moved from one extensions to another the data will follow the move. This means that the data is preserved during moving fields

The takeover of a field that is not exist currently will create the field on the table. In this cases there is no data available to move to the destination.

Each move needs changes in the source extension currently owning the field and the destination which will take over the field. To be able to move a field first the owner of the field must allows a takeover. This will be done by setting the obsolete propery of the field to "Moved" and also needs to set the destination extension Apple ID.

In this case the field is considered moved out and no other object can take a reference on these fields this field is simply removed from this app but the data will be preserved until this field is taken over. On the other side in in the destination taking over our field is identified by adding the property called "MovedFrom". Where the value of this property is the app ID of the source extension which means if this field already exist on the server it will be taken over by the new extension. Taking over the field where the source does not allow the move is a hostile takeover and it is not allowed in such cases an error will be created during the synchronization of the app. To validate if a move of a field is valid the latest version of the source must allow the feild to be moved to the new destination.

Moving a field can be combined with moving a table so for example a table can be moved to a new extension and some of the fields extracted back to the previous owner of the table. To do so first you need to move the table. In the second step you must search some of the fields to be moved to the new extension which is the previous owner of the table you also need to create a new table extension object in the previous owner and move the fields to that table extension.



Important : this feature is available only to the apps developed by Microsoft

Limitations:

A field that is part of the primary key cannot be moved

A field which is part of a key cannot be moved

Name and Id of field should stay the same during the move

Sample code

Source app

table 50100 BaseTable50100

{

    fields

    {

        field(1; MyField; Integer)

        {

        }

        field(10; Field10; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002';

        }

        field(11; Field11; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002';

        }

        field(12; Field12; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002';

        }

        field(102; Field102; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002';

        }

    }

}
Destination:

tableextension 50100 TExtension50100 extends BaseTable50100

{

    fields

    {

        field(10; Field10; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000001';

        }

        field(11; Field11; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000001';

        }

        field(12; Field12; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000001';

        }

        field(20; Field20; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000003';

        }

        field(21; Field21; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000003';

        }

        field(102; Field102; Integer)

        {

            ObsoleteState = Removed;

            MovedFrom = 'F0000000-0000-0000-0000-000000000001';

        }

    }

}
Using Move table and fields together

We can move a table to another extension and extract some of the fields to another extension or to the previous owner of the table

In this case we have a table which is moved to one of its owners dependency and keeps some of the fields as a table extension. This means that this move is not breaking (if propagate dependency is set in the manifest).

Source app

table 50150 BaseTable50150

{

    ObsoleteState = Moved;

    MovedTo = 'F0000000-0000-0000-0000-000000000001';

    fields

    {

        field(1; MyField; Integer)

        {

        }

        field(10; Field10; Integer)

        {

        }

        field(11; Field11; Integer)

        {

        }

        field(12; Field12; Integer)

        {

        }

    }

}



tableextension 50151 TExtension50151 extends BaseTable50150

{

    fields

    {

        field(50; Field11; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000002';

        }

        field(51; Field12; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000002';

        }

    }

}
Destination

table 50150 BaseTable50150

{

    MovedFrom = 'f0000000-0000-0000-0000-000000000003';

    fields

    {

        field(1; MyField; Integer)

        {

        }

        field(10; Field10; Integer)

        {

        }

        field(11; Field11; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000003';

        }

        field(12; Field12; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000003';

        }

    }

}
AppSource cop rules:

Moving a table or a field is a breaking change in most of the cases and should be staged in 2 steps to make sure that all the extensions refrencing the table or the field are fixed before the move is final.

None-breaking changes :

If a table is moved to one of its dependencies and it has "PropagateDependency" in the manifest set to true then this is not a breaking change. In this case the table or the fields are available to all the extensions that depended on this app. Such a move would be done in one step and would be seamless to all other extensions.