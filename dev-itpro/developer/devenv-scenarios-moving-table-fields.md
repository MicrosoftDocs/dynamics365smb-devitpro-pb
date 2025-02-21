---
title: The development process for moving tables or fields
description: A step-by-step guide on how to implement different scenarios for moving tables or fields
author: SusanneWindfeldPedersen
ms.author: sodragon
ms.reviewer: solsen
ms.topic: conceptual
ms.date: 02/03/2025
---

# The development process for moving tables or fields

This article provides a step-by-step process for moving tables or fields between extensions in [!INCLUDE [prod_short](includes/prod_short.md)]. It covers various scenarios, including moving tables or fields down to a dependency, up to a dependent, or to a non-dependent extension. The article includes instructions on handling dependencies and publishing extensions to AppSource, ensuring a smooth transition without breaking changes. Learn more about the concepts and prerequisites in [Move tables and fields between extensions](devenv-move-table-fields-between-extensions.md).


## Overview

Moving tables or fields between extensions is a process that consists of three main steps:

1. The source and destination apps are modified or created to specify the moves.
2. The move is performed on a [!INCLUDE [prod_short](includes/prod_short.md)] on-premises instance or a sandbox by a series of lifecycle operations.
3. The extensions are submitted to AppSource, so that they can be installed to customers.

## Move scenarios

A move is defined by a source and destination extension. The source extension must declare a table or field as *moved out* and the destination extension takes it over. Depending on the relationship between the source and destination, the following three scenarios can be defined:

- [Move down](#move-down) - The destination extension is a *dependency* of the source.
- [Move up](#move-up) - The destination extension is a *dependent* of the source.
- [Lateral move](#lateral-move) - The destination extension *isn't a dependent or a dependency* of the source.

Each scenario requires slightly different substeps in each of the steps of the development process. In the following sections, these steps are described in detail for each scenario.

## Move down

### Extension structure - move down

It's possible to move a table or a field to an existing or to a new dependency.

We assume an extension `Dependent` with the table `MyTable` and an extension, which is a dependency named `Dependency`. We also assume that they both start with a version of '1.0.0.0'. Graphically, the extensions look like this:

```
   ┌───────────────────────┐
   │  Extension Dependent  │
   │      (MyTable)        │
   └───────┬───────────────┘
           │ depends on
   ┌───────▼────────┐
   │  Dependency    │
   └────────────────┘
```

In the next sections, we will go through how to move `MyTable` from `Dependent` to `Dependency`.

### Extension `Dependent` - avoid breaking changes

> [!NOTE]
> This step can be skipped if `Dependency` is a direct dependency and the `propagateDependencies` property is `true` on the source extension.

1. Mark `MyTable` as moved by setting the `ObsoleteState` property to `PendingMove` and the `ObsoleteReason` property to indicate the move.
2. Set the `MovedTo` property to the new location in `Dependency`.
3. Bump the version to '1.5.0.0'.
4. Publish the extension to the environment in Visual Studio Code.


```al
table 50100 MyTable
{
    ObsoleteState = PendingMove;
    ObsoleteReason = 'Moved to Dependency extension';
    MovedTo = 'app ID of Dependency';
    ...
}
```

### Changes to extension `Dependent`

1. Mark `MyTable` as moved by setting the `ObsoleteState` property to `Moved` and the `ObsoleteReason` property to indicate the move.
2. Update the `app.json` file to include `Dependency` with version `2.0.0.0` as a dependency.
3. Bump the version to '2.0.0.0'

```al
table 50100 MyTable
{
    ObsoleteState = Moved;
    ObsoleteReason = 'Moved to Dependency extension';
    MovedTo = 'app ID of Dependency';
}
```

The `app.json` file should look like this:

```json
{
    "dependencies": [
        {
            "id": "dependency-app-id",
            "name": "Dependency",
            "publisher": "PublisherName",
            "version": "2.0.0.0"
        }
    ],
    "propagateDependencies": true
}
```

### Changes to `Dependency`

1. Create `MyTable` in Dependency with the same ID and structure as it had in **Extension Dependent**. Nonbreaking changes can be added between moves (for example, adding a field).
2. Set the `MovedFrom` property to point towards `Dependent`.
3. Bump the version to '2.0.0.0'

The code for `MyTable` in `Dependency` should look like this:

```al
table 50100 MyTable
{
    MovedFrom = 'app ID of Dependent';
    // Table definition as it was in Extension Dependent
}
```

### Full publishing order

For each extension, set the `dependencyPublishingOption` to `Ignore` in the relevant `launch.json` configuration file.

1. Set both `Dependent` and `Dependency` to version '1.0.0.0', if not already published.
2. Update `Dependent` with version '1.5.0.0'.
3. Update `Dependency` with version '2.0.0.0' (Takes over the table).
4. Update `Dependent` with version '2.0.0.0'.

## Move Up

### Extension structure - move up

It's possible to move a table or a field to an existing or new dependent extension. We assume an extension `Dependency` with the table `MyTable` and an extension which is a dependent named `Dependent`. We also assume both start with a version of '1.0.0.0'. Graphically, the extensions look like this:

```
   ┌───────────────────────┐
   │  Extension Dependent  │
   └───────┬───────────────┘
           │ depends on
   ┌───────▼────────┐
   │   Dependency   │
   │    (MyTable)   │ 
   └────────────────┘
```

In the next sections, we will go through how to move `MyTable` from `Dependency` to `Dependent`.

### Extension `Dependency` - avoid breaking changes

1. Mark `MyTable` as moved by setting the `ObsoleteState` property to `PendingMove` and the `ObsoleteReason` property to indicate the move.
2. Set the `MovedTo` property to the new location in `Dependent`.
3. Bump the version to '1.5.0.0'.
4. Publish the extension to the environment in Visual Studio Code.

The code for `MyTable` in `Dependency` should look like this:

```al
table 50100 MyTable
{
    ObsoleteState = PendingMove;
    ObsoleteReason = 'Moved to Dependent extension';
    MovedTo = 'app ID of Dependent';
    ...
}
```

### Changes to extension `Dependency`

1. Mark `MyTable` as moved by setting the `ObsoleteState` property to `Moved` and the `ObsoleteReason` property to indicate the move.
3. Bump the version to `2.0.0.0`

```al
table 50100 MyTable
{
    ObsoleteState = Moved;
    ObsoleteReason = 'Moved to Dependent extension';
    MovedTo = 'app ID of Dependent';
    ...
}
```

### Changes to `Dependent`

1. Create `MyTable` in `Dependent` with the same ID and structure as it had in `Dependency`. Nonbreaking changes can be added between moves (for example, adding a field).
2. Set the `MovedFrom` property to point towards `Dependency`.
3. Update the `app.json` file to include `Dependency` as a dependency if not already present.
4. Bump the version to '2.0.0.0'.

```al
table 50100 MyTable
{
    MovedFrom = 'app ID of Dependent';
    // Table definition as it was in Extension Dependent
}
```
```json
{
    "dependencies": [
        {
            "id": "dependency-app-id",
            "name": "Dependency",
            "publisher": "PublisherName",
            "version": "2.0.0.0"
        }
    ],
    "propagateDependencies": true
}
```

### Publishing order

For every extension, set `dependencyPublishingOption` to `Ignore` in the relevant`launch.json` configuration file.

1. `Dependent` and `Dependency` version '1.0.0.0', if not already published
3. `Dependency` with version '1.5.0.0'
4. `Dependency` with version '2.0.0.0' - Gives up the table
5. `Dependent` with version '2.0.0.0' - Takes over the table

## Lateral move

A lateral move requires the same process as you can read about in [Move up](#move-up). However, further changes might be required to deal with objects that the table or field that's being moved depends on, for example, enums used as types of fields. That's because after a lateral move, it must be possible to resolve the moved table or field in both the source and destination extensions. Learn more in [Handling dependencies of moved tables or fields](#handling-dependencies-of-moved-tables-or-fields).

## Publishing to AppSource

### Validation sign in

Extensions that move out table or fields are validated to not cause a breaking change without proper obsoletion. On extensions that take over, a full validation happens to ensure that the source extensions exist, that they move out everything to the correct destination, and that there are no schema breaking changes.

### Order of submissions

The rule of thumb when publishing extensions that perform a move to AppSource, is to first submit the source extension and then submit the destination extension. The publishing orders from previous sections can also be used as the submission order for submitting to AppSource. Moves are allowed within a single submission or across submissions. For example, in a *move down* scenario it's possible to submit the source extension, which moves a table and the destination dependency as a library app. It's also possible to submit them in two separate submissions.

### Validation across target releases

When you submit an extension with any move, its validity is checked across all the possible releases of [!INCLUDE [prod_short](includes/prod_short.md)] where this extension could be installed. For example, if the `application` property in the extension is '24.0.0.0' and the latest release of [!INCLUDE [prod_short](includes/prod_short.md)] is '26.0.0.0', then the move needs to be valid across all of these releases.

## Handling dependencies of moved tables or fields

When you move a table or a field, they might depend on other objects which need to be moved in tandem. In the example below, it isn't possible to move the table using the lateral scenario without also moving the enum because then it would be impossible to resolve the type of its field.

```al
enum 50100 MyEnum
{
    Extensible = true;
    value(0; None) { Caption = 'None'; }
    value(1; Option1) { Caption = 'Option 1'; }
    value(2; Option2) { Caption = 'Option 2'; }
}

table 50100 MyTable
{
    fields
    {
        field(1; MyField; Enum MyEnum)
        {
            Caption = 'My Field';
        }
    }
}
```

### Handling dependent objects

In order for the move to be successful, `MyEnum` needs to be resolvable in both the source and destination extensions. This can be achieved by creating a common dependency extension for both the source and destination, and then moving the dependent objects to that extension.

For the example above:

1. In version '1.5.0.0' of the source extension, set the enum to `ObsoleteState = Pending` and describe that it'll be moved in the `ObsoleteReason` property.
2. Create a new extension `Common Dependency` where you move the enum.
3. In the next version of the source extension, add the dependency to `Common Dependency`, delete the enum and set the table as `ObsoleteState= Moved`.
4. In the next version of the destination extension, add the dependency to `Common Dependency`.

```
         ┌─────────────────────────┐         ┌─────────────────────────┐
         │      Source             │         │     Destination         │
         │    Extension            │         │     Extension           │
         │  (MyTable moved)        │         │   (Takes over MyTable)  │
         └───────┬─────────────────┘         └──────────┬──────────────┘
                 │                                      │
                 └───────────────┬──────────────────────┘
                                 │
                                 ▼
                     ┌─────────────────────────┐
                     │   Common Dependency     │
                     │    (Contains MyEnum)    │
                     └─────────────────────────┘
```


## Handling the definitions of moved out tables or fields

The AL source code of moved elements must be kept in the source destinations in order to validate the moves. Some recommendations for managing this code are given in the next sections.

### Moving a table

When tables are moved out, their files can be moved to a directory of moved objects and keeping them there. It isn't yet possible to remove these definitions, but grouping them together will allow for this in the future.

### Moving a field

When fields are moved out, a new table extension can be created in the source extension to contain only the moved fields. This ensures that they can be removed more easily in the future and that they don't clutter the code of fields which aren't moved.

## Related information

[Move tables and fields between extensions](devenv-move-table-fields-between-extensions.md)  