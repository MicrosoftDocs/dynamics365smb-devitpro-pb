---
title: "The Migration.json File"
description: "Description of the json file for data migration for AL in Business Central."
author: jswymer
ms.custom: na
ms.date: 03/10/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---
# Migrating Tables and Fields Between Extensions

Data migration allows you to move table and field data between extensions.

## Overview

The move is divided into two phases: development and deployment. However, before you begin, you have to determine the direction of the migration within the dependency graph.

### Determining the migration direction in the dependency Graph

The process to migrate tables and fields to another extension depends on the migration's direction in the dependency graph. The following figure illustrates a simplified extension dependency graph. From top to bottom, an extension is dependent on any extension the below it in the graph.

![Dependency graph](media/extension-dependency-graph.png "Dependency graph")  

Moving objects from Extension Y to Extension X, is considered a *move down*. Typical move-down scenarios include:

- Moving objects from an isolated extension to a shared extension.
- Moving objects from a customized base application with its own ID to an extension on top. 
- Ext Y might not be owned. So, it might not be possible to make modifications to it. An example is the Microsoft Base Application. 

Moving objects from the Base Application extension to Extension X is a *move up*. Typical move-down scenarios include:

- Split an extension in two, with one dependent on the other.
- Move from a code-customized base application with the Microsoft ID to a new extension on top.

#### Development

Development involves making application code changes required for the move. In short, the work involves:

- Creating a new extension that contains replicas of the tables or fields you want to move. This extension is referred to as the *destination extension*.  
- Creating a new version of the existing extension in which the table and fields to be moved have been deleted. This extension is referred to as the *source extension*.

The key to the move is the *migration.json* file. You add the file to project for the source extension. This file provides a pointer to the ID of new base extension where tables and fields are to be moved. The *migration.json* is used in the deployment phase. Its purpose is to transfer ownership of tables and fields in the database from one extension to another. 

#### Deployment

The deployment phase is when the data is migrated to new tables in the database. In the phase, ownership of tables and fields is switched from one extension to another. Deployment involves publishing, syncing, upgrading, and installing extensions.



<!--
## Move a table to another extension


![Move table](media/migrate-table.png "move table")  


### Create a new base extension

The base extension will contain the table and fields that you want to move.

1. Create an AL project for base objects.

2. Add a table object that exactly matches the table object in the original extension.

3. If you are moving selected fields only, delete all other fields from the table. 

4. Compile the first version of this extension.

    Make a note ot the appID of the target extension.

<!--
1. Create an extension for the base table object.
2. Copy the table object code from the original extension to the new extension.
3. In the original table object, delete he fields that I wanted in the table extension.
3. Noted the appId of the new extensions
4. Compiled the first version of this extension.
5. In the original extension, added a migration.json file that included the appId of the target extension:

    ```
    { 
    "apprules": [ 
        { 
            "id": "2f3b6c0a-fb6a-4289-ae8a-ded32a991059" 
        } 
    ] 
    } 
    ```
6. Set up a dependency on the new extension I made for the table object
7. Add a table extension object that extended the table in the new extension
8. Added a field to the table extension object that is identical to the field in the original table.
9. Deleted the original table object.
10. Compiled a new version of the extension
11. Published the target extension first, then the new version of original extension.
12. Uninstalled the old version of the original extension.
13. Synced the target extension. This created an empty table, owned by the target extension.
14. Synced the new version of the original extension. The migrated the data in the table to the target extension tables. The columns in the original table were deleted.
15. Installed the new target extension
16. Upgraded the original extension. Not really necessary in my case.

-->

## Move tables and fields down the dependency graph

This section explains how to migrate tables and fields down the dependency graph. The steps are based on the example illustrated in the following figure. Although your scenario is different, the concept and process are much the same.

![Data migration](media/data-migration-tables-fields.png "data migration") 

In the example, **TableB** and **Field C-1** are customizations. You'll keep these elements in the original extension, but create a new version. You'll move **TableA** and **TableC** into a new, separate extension down the dependency chain.

### Create the destination extension

The destination extension will contain the table and fields that you want to move. In this example, these objects include **TableA** and **TableC**.

1. Create an AL project for the destination extension.

2. Add a table object that exactly matches the table object definition for **TableA** in the source extension.

3. Add a table object that exactly matches the table object definition for **TableC** in the source extension, except don't include field **C-1**.

4. Make a note of the `ID` of the new extension. You'll use this ID in the next task.

    For purposes of the example, the ID is `11111111-aaaa-2222-bbbb-333333333333`.

5. Compile the extension package.

### Create a new version of the source extension

1. In the source extension AL project, add a migration.json file that points to the ID of the target extension.

    ```
    { 
    "apprules": [ 
        { 
            "id": "11111111-aaaa-2222-bbbb-333333333333"
        } 
    ] 
    } 
    ```

    For more information, see [The Migration.json File](devenv-migration-json-file.md).
2. Delete the entire table object for **TableA**.
3. Complete the following steps to migrate**TableC** to the destination extension, but keep field **C-2** in the source extension:  

    1. In the app.json file, set up a dependency on the new destination extension.
    2. Add a table extension object called **TableExtC**.
    3. Add a field definition for field **C-1** that matches its definition in the original **TableC** object.
    4. Delete the original **TableC** object.
4. In the app.json file, increase the `version` value.
5. Compile a new version of the extension package.

### Deploy the extensions

1. Uninstall the old version of the source extension.

2. Publish the new destination extension and new version of source extension.

3. Synchronize the destination extension.

    This step creates an empty table that is owned by the target extension.
4. Synchronize the new version of the source extension.

    This step migrates the data in the original table to the target extension tables. It will also delete the columns in the original table.
5. Install the new target extension.
6. Upgrade the original extension.

## Move tables and fields up the dependency graph

This section explains how to migrate tables and fields up the dependency graph. The steps are based on the example illustrated in the following figure. Although your scenario is different, the concept and process are much the same.

![Data migration](media/migrate-tables-fields-up.png "data migration") 

In the example, **TableB** and **Field C-1** are customizations. You'll move these elements from the original extension to a new extension. This new extension will have a dependency on the original extension. You'll keep **TableA** and **TableC** in the original extension.

To achieve migration, you'll have to create an extension for migration purposes only. After migration is done, you can delete it. This extension, shown as **Ext Z**, temporarily takes ownership of tables and fields from **Ext X**.  

### Create the transition extension (Ext Z v1)

The transition extension will contain replicas of all object definitions in the source extension, except code. In the illustration, these objects include **TableA**, **TableB**, and **TableC** and current field definitions. The transition  extension is **Ext Z**.

1. Create an AL project for the transition extension.

2. Add a table object that exactly matches the table object definitions for **TableA**, **TableB**, and **TableC** in the source extension.

3. Compile the extension package.

3. Make a note of the `ID` of the new extension. You'll use this ID in the next task.

    For purposes of the example, the ID is `11111111-aaaa-2222-bbbb-333333333333`.

### Create an empty version the source extension (Ext X v2)

In this step, you create a new version of the source extension that doesn't contain any objects. It only contains a `migration.json` file that points to **Ext Z**.

1. In the source extension AL project, add a migration.json file that points to the ID of the transition extension **Ext Z**.

    ```
    { 
    "apprules": [ 
        { 
            "id": "11111111-aaaa-2222-bbbb-333333333333"
        } 
    ] 
    } 
    ```

    For more information, see [The Migration.json File](devenv-migration-json-file.md).
2. Delete all objects from the extension. The objects include **TableA**, **TableB**, and **TableC**.

3. In the app.json file, increase the `version` value.
4. Compile a new version of the extension package.

### Create a destination extension (Ext Y v1)

You now create a new extension that contains the customization you want to move from the source. In this example, the customizations include **TableB** and a **TableExtC**.

1. Create an AL project for **Ext Y**.
2. In the app.json file, set up a dependency on the source extension **Ext X**.
3. Add a table definition and code for **TableB** that exactly matches the definition in the original source extension.
4. Add a table extension object called **TableExtC**. Then, add a field definition for field **C-1** that matches its definition in the original **TableC** object of the source extension.
5. Compile the extension package.
6. Make a note of the `ID` of the new extension. You'll use this ID in the next task.

    For purposes of the example, the ID is `44444444-aaaa-5555-bbbb-666666666666`.

### Create a final version of source extension (Ext X v3)

In this step, you create another version of the source extension **Ext X**. This version will contain the objects and code that you want to finally publish.

1. Create an AL project for **Ext Y**.
2. In the app.json file, set up a dependency on the source extension **Ext X**.
3. Add a table definition and code for **TableA** that exactly matches the definition in the original source extension.
4. Add a table object **TableC**. Then, add a field definition for field **C-1** that matches its definition in the original **TableC** object of the source extension.
5. Compile the extension package.

### Create new empty version of transition extension (Ext Z v2)

In this step, you create a new version of **Ext Z** that only contains a `migration.json` file. This `migration.json` file points the IDS of **Ext X** and **Ext Y**. The file is used to release ownership.

1. In the extension AL project, add a migration.json file that points to the IDs of the source extension **Ext X** and destination extension **Ext Y**.

    ```
    { 
    "apprules": [ 
        { 
            "id": "11111111-aaaa-2222-bbbb-333333333333"
        }
        { 
            "id": "44444444-aaaa-5555-bbbb-666666666666"
        }
    ] 
    } 
    ```

    For more information, see [The Migration.json File](devenv-migration-json-file.md).

2. Add a table object that exactly matches the table object definitions for **TableA**, **TableB**, and **TableC** in the source extension.

3. Compile the extension package.

### Deploy the extensions

1. Uninstall the old version of the source extension.

2. Publish the new destination extension and new version of source extension.

3. Synchronize the destination extension.

    This step creates an empty table that is owned by the target extension.
4. Synchronize the new version of the source extension.

    This step migrates the data in the original table to the target extension tables. It will also delete the columns in the original table.
5. Install the new target extension.
6. Upgrade the original extension.

1.Created a new extension with table definitions only, no code or pages. Called ExtZ.



>
## See Also

[JSON Files](devenv-json-files.md)  

