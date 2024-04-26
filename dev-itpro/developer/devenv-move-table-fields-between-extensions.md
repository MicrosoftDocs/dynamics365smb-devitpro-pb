---
title: Moving tables and fields between extensions
description: Learn how to move tables and fields between extensions in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 04/23/2024
---

# Moving tables and fields between extensions

As extensions mature or as a consequence of an extension initially created as a large monolith, the need to break down the extension and transfer the ownership of tables or fields, including data, becomes apparent. Moving tables and fields between extensions improves maintainability, flexibility, and scalability of the extension. This feature introduces a controlled process for releasing and taking ownership of tables as part of the extension upgrade process.

> [!IMPORTANT]
> This feature is currently not available to partners, but will be with a future update. This documentation is provided to give an overview of the feature and how it works.

## Moving tables between extensions

To prepare to move a table, both the source and destination must contain the implementation of the specific table. Furthermore, the table must have the same schema and public methods in the source and destination extension. The tables must be identical in both extensions, including the table ID, fields, keys, and triggers. Additive changes to the destination are allowed. for example, adding a new field to the table, but all the existing fields must be identical. Then, the table must be moved in a staged process to avoid breaking changes.

In the source table definition, you must add the `MovedTo` property, making sure that it points to the app ID of the destination extension. Likewise, in the destination extension, you must add the `MovedFrom` property, which should point to the app ID of the source extension. When the extensions are published, installed, synched, or upgraded, the platform handles moving the data ownership for the table from the source to the destination extension.

### Avoiding breaking changes

Both the full table and the individual fields can be moved both up and down the dependency chain.

A move can be a breaking change or a nonbreaking change. If a table is moved to one of its own dependencies (also known as moving a table down) and the `PropagateDependency` property is set in the manifest, the move isn't a breaking change and this kind of change can be done without preparation in one stage. This means that in one release, the `ObsoleteStage` property can be set to `Moved`.

In other cases where a move can break any of the dependent extensions, the move of a table must be staged, which means that the `ObsoleteStage` property must be set to `PendingMoved` in the first version and can be set to `Moved` in a later version.

A move is possible if the source (current owner) allows the move. It can be allowed by setting the `ObsoleteStage` property on the table to `Moved` and by setting the `MovedTo` property to the app ID of the destination extension.

If a table is set to `Moved` that table isn't accessible anymore. The table data is preserved until the new destination takes over the table.

Additive changes can be applied to a table during a move, but any destructive change isn't allowed.

Hostile take-over isn't allowed when moving a table, the latest published version of the current app must allow the move. Otherwise, this is considered a hostile takeover and sync of the destination app fails.

> [!NOTE]
> The Name and ID of tables can't be changed during a move.

## Sample code for moving tables between extensions

The following code shows the source and destination tables and how to move a table between extensions.

### Source extension

```al
table 50150 BaseTable50150

{

    ObsoleteState = Moved;

    MovedTo = 'F0000000-0000-0000-0000-000000000001'; // Specifies the app ID of the destination extension

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

    MovedFrom = 'f0000000-0000-0000-0000-000000000003'; // Specifies the app ID of the source extension

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

The goal is to allow developers to move fields between extensions. A field can be moved from a base table to a table extension, or from a table extension to another table extension.

When a field is moved from one extension to another the data follow the move. This means that the data is preserved during moving fields.

The takeover of a field that doesn't exist, creates the field on the table. In this case, there's no data available to move to the destination.

Each move needs changes in the source extension that owns the field and the destination, which takes over the field. To be able to move a field, the owner of the field must first allow a takeover. This is done by setting the `ObsoleteState` property of the field to `Moved` and to set the destination extension app ID.

In this case, the field is considered moved out and no other object can take a reference on this field because it's removed from the extension, the data, however, is preserved until this field is taken over. On the other side in the destination taking over the field, this is identified by adding the `MovedFrom` property. Where the value of this property is the app ID of the source extension, which means if this field already exists on the server, it will be taken over by the new extension. Taking over the field where the source doesn't allow the move is considered a hostile takeover and it's not allowed. In a case of hostile takeover, an error is created during the synchronization of the extension. To validate if a move of a field is valid, the latest version of the source must allow the field to be moved to the new destination.

Moving a field can be combined with moving a table. For example, a table can be moved to a new extension and some of the fields extracted back to the previous owner of the table. To do so, you must first move the table. In the second step, you must search some of the fields to be moved to the new extension, which is the previous owner of the table. You must also create a new table extension object in the previous owner extension and move the fields to that table extension.

> [!IMPORTANT]
> This feature is only available to apps developed by Microsoft.

### Limitations

There are some limitations to moving fields between extensions to be aware of:

- A field, which is part of the primary table key can't be moved.
- A field, which is part of a table key can't be moved.
- The Name and ID of the field must stay the same during the move.

## Sample code for moving fields between extensions

The following sections show the source and destination fields for how to move fields between extensions.

### Source extension

The following code shows the source extension with the fields that are moved to another extension.

```al

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

            MovedTo = 'F0000000-0000-0000-0000-000000000002'; // Specifies the app ID of the destination extension

        }

        field(11; Field11; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002'; // Specifies the app ID of the destination extension

        }

        field(12; Field12; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002'; // Specifies the app ID of the destination extension

        }

        field(102; Field102; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000002'; // Specifies the app ID of the destination extension

        }

    }

}
```

### Destination extension

The following code shows the destination extension with the fields that are moved from another extension.

```al
tableextension 50100 TExtension50100 extends BaseTable50100

{

    fields

    {

        field(10; Field10; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000001'; // Specifies the app ID of the source extension

        }

        field(11; Field11; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000001'; // Specifies the app ID of the source extension

        }

        field(12; Field12; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000001'; // Specifies the app ID of the source extension

        }

        field(20; Field20; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000003'; // Specifies the app ID of the source extension

        }

        field(21; Field21; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000003'; // Specifies the app ID of the source extension

        }

        field(102; Field102; Integer)

        {

            ObsoleteState = Removed;

            MovedFrom = 'F0000000-0000-0000-0000-000000000001'; // Specifies the app ID of the source extension

        }

    }

}
```

## Moving table and fields together

Another scenario could be to move a table to another extension and extract some of the fields to another extension, or to the previous owner of the table. In this case the table, which is moved to one of its owners dependency, keeps some of the fields as a table extension. This means that the move isn't breaking (if the propagate dependency is set in the manifest).

### Source extension

The following code shows the source extension with the table and fields that are moved to another extension.

```al

table 50150 BaseTable50150

{

    ObsoleteState = Moved;

    MovedTo = 'F0000000-0000-0000-0000-000000000001'; // Specifies the app ID of the destination extension

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

Some of the fields are moved to another table extension.

```al	
tableextension 50151 TExtension50151 extends BaseTable50150

{

    fields

    {

        field(50; Field11; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000002'; // Specifies the app ID of the source extension

        }

        field(51; Field12; Integer)

        {

            MovedFrom = 'F0000000-0000-0000-0000-000000000002'; // Specifies the app ID of the source extension

        }

    }

}
```

### Destination extension

The following code shows the destination extension with the table and fields that are moved from another extension.

```al

table 50150 BaseTable50150

{

    MovedFrom = 'f0000000-0000-0000-0000-000000000003'; // Specifies the app ID of the source extension

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

            MovedTo = 'F0000000-0000-0000-0000-000000000003'; // Specifies the app ID of the destination extension

        }

        field(12; Field12; Integer)

        {

            ObsoleteState = Moved;

            MovedTo = 'F0000000-0000-0000-0000-000000000003'; // Specifies the app ID of the destination extension

        }

    }

}

```

## Breaking changes - AppSourceCop rules

Moving a table or a field is a breaking change in most of the cases and should be staged in two steps to make sure that all the extensions referencing the table or the field are fixed before the move is final.

## Nonbreaking changes

If a table is moved to one of its dependencies and it has the `PropagateDependency` setting in the manifest set to `true` then this isn't a breaking change. In this case the table or the fields are available to all the extensions that depended on the extension. Such a move can be done in one step and is seamless to all other extensions.

## See also