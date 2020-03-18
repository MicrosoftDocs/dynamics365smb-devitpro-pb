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

Data migration allows you to move table and field data between extensions. The concepts and processes in this article apply to large-scale and small-scale data migrations. A large-scale migration is typically upgrade scenario, like upgrading from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version 14 to version 16. Small-scale migrations are scenarios where you want to move a limited number of objects from one extension to another.

## Overview

The move is divided into two phases: development and deployment. However, before you begin, you have to determine the direction of the migration within the dependency graph.

### Determining the migration direction in the dependency graph

The process to migrate tables and fields to another extension depends on the migration's direction in the dependency graph. The following figure illustrates a simplified extension dependency graph. From top to bottom, an extension is dependent on any extension the below it in the graph.

![Dependency graph](media/extension-dependency-graph.png "Dependency graph")  


##### When to move down

Moving objects from Extension Y to Extension X, is considered a *move down*. Typical move-down scenarios include:

- Splitting an extension.

    You want to move common tables to a separate extension that other extensions can have a dependency on.
- Transitioning from a customized customized base application extension with own ID to the Microsoft Base Application.

    You have a customized base application extension with its own ID. You want to transition to the Microsoft Base Application. In this case, customizations remain in the current extension. Base objects are removed and ownership transferred to Microsoft Base Application.

- [add more]
<!--
- Moving objects to an extension that depends on an extension that you don't own, like the Microsoft Base Application or System Application.-->
##### When to move up

Moving objects from the Base Application extension to Extension X is a *move up*. Typical move-up scenarios include:

- Splitting an extension in two, with one dependent on the other.

- Upgrading from C/AL to AL

    [add more]
- Transitioning from a customized customized base application extension with Microsoft ID to the Microsoft Base Application.

    You have a customized base application extension with the Microsoft ID. You want to transition to the Microsoft Base Application. In this case, customizations are moved out of the base application up to extensions. The customization objects are removed from the custom base application and ownership transferred to the new extensions.

- [add more]

#### Development

Development involves making application code changes required for the move. In short, the work involves:

- Creating a new extension that contains replicas of the tables or fields you want to move. This extension is referred to as the *releasing extension*.  
- Creating a new version of the existing extension in which the table and fields to be moved have been deleted. This extension is referred to as the *receiving extension*.

The key to the move is the *migration.json* file. You add the file to project for the releasing extension. This file provides a pointer to the ID of new base extension where tables and fields are to be moved. The *migration.json* is used in the deployment phase. Its purpose is to transfer ownership of tables and fields in the database from one extension to another. For more information, see [Migration.json File](devenv-migration-json-file.md).

#### Deployment

The deployment phase is when the data is migrated to new tables in the database. In this phase, ownership of tables and fields is switched from one extension to another. Deployment involves publishing, syncing, upgrading, and installing extensions.

The order that you synchronize extensions is important:

- The receiving extensions must be synchronized first.
- The releasing extensions, those extensions that include the migration.json file, must be synchronized last.

## Move tables and fields down the dependency graph

This section explains how to migrate tables and fields down the dependency graph. The steps are based on the example illustrated in the following figure. Although your scenario is different, the concept and process are much the same.

![Data migration](media/data-migration-tables-fields.png "data migration") 

In the example, **TableB** and **Field C-1** are customizations. You'll keep these elements in the original extension, but create a new version without **TableA** and **TableC**. You'll move **TableA** and **TableC** down the dependency chain to a new, separate extension.

### Create the receiving extension (Ext Y)

The receiving extension will contain the table and fields that you want to move. In this example, these objects include **TableA** and **TableC**.

1. Create an AL project for the receiving extension.

2. Add a table object definition for **TableA** that exactly matches its definition in the releasing extension **Ext X**.

3. Add a table object definition for **TableC** that exactly matches it is the releasing extension **Ext X**, except don't include field **C-1**.

4. Make a note of the `ID` of the new extension. You'll use this ID in the next task.

    For purposes of the example, the ID is `11111111-aaaa-2222-bbbb-333333333333`.

5. Compile the extension package.

### Create a new version of the releasing extension (Ext X v2)

1. In the releasing extension AL project, add a migration.json file that points to the ID of the target extension.

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
3. Complete the following steps for **TableC**.

    1. In the app.json file, set up a dependency on the new receiving extension **Ext Y**.
    2. Add a table extension object **TableExtC**.
    3. In table extension object **TableExtC**, add a field definition for field **C-1** that matches its definition in the original **TableC** object.
    4. Delete the original **TableC** object.
4. In the app.json file, increase the `version` value.
5. Compile a new version of the extension package.

### Deploy the extensions

1. Uninstall the old version of the releasing extension **Ext X**.

2. Publish the new receiving extension **Ext Y** and releasing extension version **Ext X v2**.

3. Synchronize the receiving extension **Ext Y**.

    This step creates empty database tables for **TableA** and **TableC** that are owned by the receiving extension **Ext Y**.

    > [!IMPORTANT]
    > The receiving extension must always be synchronized first.

4. Synchronize the new version of the releasing extension **Ext Y**.

    This step does the following:
    - Migrates the data from the original tables **TableA** and **TableC** to the receiving extension tables.
    - Deletes the original tables  **TableA** and **TableC** owned by the releasing extension **Ext X**.
    - Deletes column **C-1** from the releasing table **Ext X**.
5. Install the receiving extension **Ext Y**.
6. Run a data upgrade the new releasing extension version **EXT X v2**.

## Move tables and fields up the dependency graph

This section explains how to migrate tables and fields up the dependency graph. The steps are based on the example illustrated in the following figure. Although your scenario is different, the concept and process are much the same.

![Data migration](media/migrate-tables-fields-up-overview.png "data migration")

In the example, **TableB** and **Field C-1** are customizations. You'll move these elements from the original releasing extension up to a new extension. This new extension will have a dependency on the original extension. You'll keep **TableA** and **TableC** in the original extension.

To accommodate data migration, you'll have to create an extension that is only used for deployment. This extension is **Ext Z** in the figure. There are two stages of deployment:

![Data migration](media/migrate-tables-fields-up.png "data migration")

- In the first stage, **Ext Z** temporarily takes ownership of tables and fields from **Ext X**.
- In the second stage, **Ext Z** releases ownership to extensions **Ext X** and **Ext Y**. You delete transition extension when you finish deployment.

### Create the transition extension (Ext Z v1)

The transition extension will contain replicas of all object definitions in the releasing extension, except logic code. In the illustration, these objects include **TableA**, **TableB**, and **TableC** and current their field definitions. The transition extension is **Ext Z**.

1. Create an AL project for the transition extension.

2. Add a table object that exactly matches the table object definitions for **TableA**, **TableB**, and **TableC** in the releasing extension.

3. Compile the extension package.

3. Make a note of the `ID` of the new extension. You'll use this ID in the next task.

    For purposes of the example, the ID is `11111111-aaaa-2222-bbbb-333333333333`.

### Create an empty version the releasing extension (Ext X v2)

In this step, you create a new version of the releasing extension that doesn't contain any objects. It only contains a `migration.json` file that points to **Ext Z**.

1. In the releasing extension AL project, add a migration.json file that points to the ID of the transition extension **Ext Z**.

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

### Create a receiving extension (Ext Y v1)

You now create a new extension that contains the customization you want to move from the releasing. In this example, the customizations include **TableB** and a **TableExtC**.

1. Create an AL project for **Ext Y**.
2. In the app.json file, set up a dependency on the releasing extension **Ext X**.
3. Add a table definition and code for **TableB** that exactly matches the definition in the original releasing extension.
4. Add a table extension object called **TableExtC**. Then, add a field definition for field **C-2** that matches its definition in the original **TableC** object of the releasing extension.
5. Compile the extension package.
6. Make a note of the `ID` of the new extension. You'll use this ID in the next task.

    For purposes of the example, the ID is `44444444-cccc-5555-dddd-666666666666`.

### Create a final version of releasing extension (Ext X v3)

In this step, you create another version of the releasing extension **Ext X**. This version will contain the objects and code that you want to finally publish.

1. Create an AL project for **Ext X**.
2. Add a table definition and code for **TableA** that exactly matches the definition in the original releasing extension.
3. Add a table object for **TableC** and field definition for **C-1** that matches the definitions in the original **TableC** object of the releasing extension.
3. In the app.json file, increase the `version` value.
4. Compile the extension package.

### Create new empty version of transition extension (Ext Z v2)

In this step, you create a new version of **Ext Z** that only contains a `migration.json` file. This `migration.json` file points the IDS of **Ext X** and **Ext Y**. The file is used to release ownership.

1. In the extension AL project, add a migration.json file that points to the IDs of the releasing extension **Ext X** and receiving extension **Ext Y**.

    ```
    { 
    "apprules": [ 
        { 
            "id": "11111111-aaaa-2222-bbbb-333333333333"
        }
        { 
            "id": "44444444-cccc-5555-dddd-666666666666"
        }
    ] 
    } 
    ```

    For more information, see [The Migration.json File](devenv-migration-json-file.md).

2. Delete the object definitions for **TableA**, **TableB**, and **TableC**.
3. In the app.json file, increase the `version` value.
4. Compile the extension package.

### Deploy the extensions

1. Uninstall the current version of the releasing extension **Ext X**.
2. Complete the following steps for the first stage of deployment:

    1. Publish the transition extension **Ext Z** and empty version of **Ext X v2**.
    2. Synchronize the transition extension **Ext Z**.
    
       This step creates empty database tables **TableA**, **TableB**, and **TableC** that are owned by **Ext Z**.

       > [!IMPORTANT]
        > Extensions receiving table objects must be synced first. Extension releasing/giving away table objects must be synced last.

    3. Synchronize the releasing extension **Ext X v1**.

        This step migrates data from **TableA**, **TableB**, and **TableC** owned by **Ext X** to the tables owned by **Ext Z**.
2. Complete the following steps for the second stage of deployment:

    1. Publish the next version for **Ext Z v2** and **Ext X v3**, and the first version of **Ext Y**.
    2. Synchronize the extensions in the following order: **Ext X**, **Ext Y**, and **Ext Z**.
    
    This step creates empty tables **TableA**, **TableB**, and **TableC** in the database. The tables are owned by **Ext Z**.
    3. Synchronize the releasing extension **Ext X v1**.

        This step migrates data from the original tables **TableA**, **TableB**, and **TableC** owned by **Ext X** to the matching tables owned by **Ext Z**.
    
        This step migrates the data in the original table to the target extension tables. It will also delete the columns in the original table.
5. Install the new target extension.
6. Upgrade the original extension.

<!--
PS C:\Windows\system32> Publish-NAVApp bc160 -Path "C:\Users\jswymer\Documents\AL\ExtX\Default publisher_ExtX_1.0.0.0.app" -SkipVerification
PS C:\Windows\system32> Sync-NAVApp bc160 -Name extx
PS C:\Windows\system32> install-NAVApp bc160 -Name extx
PS C:\Windows\system32> Publish-NAVApp bc160 -Path "C:\Users\jswymer\Documents\AL\ExtZ\Default publisher_ExtZ_1.0.0.0.app" -SkipVerification
PS C:\Windows\system32> Publish-NAVApp bc160 -Path "C:\Users\jswymer\Documents\AL\ExtX-1\Default publisher_ExtX_1.0.0.1.app" -SkipVerification
PS C:\Windows\system32> Sync-NAVApp bc160 -Name extZ
PS C:\Windows\system32> Sync-NAVApp bc160 -Name extX -Version 1.0.0.1
PS C:\Windows\system32> Publish-NAVApp bc160 -Path "C:\Users\jswymer\Documents\AL\ExtZ-1\Default publisher_ExtZ_1.0.0.2.app" -SkipVerification
PS C:\Windows\system32> Publish-NAVApp bc160 -Path "C:\Users\jswymer\Documents\AL\ExtX - 2\Default publisher_ExtX_1.0.0.2.app" -SkipVerification
PS C:\Windows\system32> Publish-NAVApp bc160 -Path "C:\Users\jswymer\Documents\AL\ExtY\Default publisher_ExtY_1.0.0.0.app" -SkipVerification
PS C:\Windows\system32> Sync-NAVApp bc160 -Name extX -Version 1.0.0.2
PS C:\Windows\system32> Sync-NAVApp bc160 -Name extY -Version 1.0.0.0
PS C:\Windows\system32> Sync-NAVApp bc160 -Name extZ -Version 1.0.0.2
PS C:\Windows\system32> uninstall-NAVApp bc160 -Name extX -Version 1.0.0.0
PS C:\Windows\system32> Start-NAVAppDataUpgrade bc160 -Name extX -Version 1.0.0.2
PS C:\Windows\system32> install-NAVApp bc160 -Name extY -Version 1.0.0.0
PS C:\Windows\system32> Start-NAVAppDataUpgrade bc160 -Name extX -Version 1.0.0.2
-->

## See Also

[JSON Files](devenv-json-files.md)  
