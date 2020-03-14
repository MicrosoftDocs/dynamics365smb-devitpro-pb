---
title: "The Migration.json File"
description: "Description of the json file for data migration for AL in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/10/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---
# Migrating Tables and Fields Between Extensions

Data migration allows you to move table and field data between extensions.

## Overview

The move is divided into two phases: development and deployment. However, before you begin, you have to determine the direction of the migration within the dependency graph.

### Determining the migration direction in the dependency Graph

The process to migrate tables and fields to another extension depends on the migration's direction in the dependency graph. The following figure illustrates a simplified extension dependency graph, where each upper extension is dependent on the lower extension.

![Dependency graph](media/extension-dependency-graph.png "Dependency graph")  

Moving tables or fields from Extension Y to Extension X, is considered a *move down*. Moving tables or fields from the Base Application extension to Extension X is a *move up*.

#### Development

Development involves making application code changes required for the move. In short, the work involves:

- Creating a new extension that contains a replica of the tables or fields you want to move. This extension is referred to as the *base extension*.  
- Creating a new version of the existing extension in which the table and fields to be moved have been deleted. Other fields are reworked into table extension objects. This extension is referred to as the *original extension*.

The key to the move is the *migration.json* file. This file provides a pointer to the ID of new base extension where tables and fields are to be moved. You add it to project for the new version of the original extension.

#### Deployment

The deployment phase is when the actual data is migrated to new tables in the database. Deployment involves publishing, syncing, upgrading, and installing extensions.



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


## Move a table or field Down to another extension

This section explains how to migrate tables and fields down the dependency graph. The steps are based on the example illustrated in the following figure. Although your scenario is different, the concept and process are much the same.

![Data migration](media/data-migration-tables-fields.png "data migration") 

In the example, **TableB** and **Field C-1** in **TableC** are customizations that you want to move out into a separate extension. 

### Create a new base extension

The base extension will contain the table and fields that you want to move.

1. Create an AL project for base objects.

2. Add a table object that exactly matches the table object in the original extension.

3. If you're moving selected fields only, delete all other fields from the table. 

4. Compile the first version of this extension.

    Make a note ot the appID of the target extension.

### Create a new version of the original extension

1. In the original extension project, add a migration.json file that includes ID of the target extension:

    ```
    { 
    "apprules": [ 
        { 
            "id": "2f3b6c0a-fb6a-4289-ae8a-ded32a991059" 
        } 
    ] 
    } 
    ```

2. If you're moving an entire table object, delete the table object.

3. If you're moving fields, do the following steps:

    1. Set up a dependency on the new base extension
    2. Add a table extension object that extends the table in the base extension.
    3. Add the fields definitions from the original table object.
    4. Delete the original table object.
4. Compile a new version of the extension.

### Deploy the extensions

1. Uninstall the old version of the original extension.

2. Publish the target extension and new version of original extension.

3. Synchronize the target extension.

    This step creates an empty table that is owned by the target extension.
4. Synchronize the new version of the original extension.

    This step migrates the data in the original table to the target extension tables. It will also delete the columns in the original table.
5. Install the new target extension.
6. Upgrade the original extension.

## Move Tables and Fields Up

<!--Move Up

1.Created a new extension with table definitions only, no code or pages. Called ExtZ.



>
## See Also

[JSON Files](devenv-json-files.md)  

