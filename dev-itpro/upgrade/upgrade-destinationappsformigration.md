---
title: "DestinationAppsForMigration"
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# DestinationAppsForMigration

DestinationAppsForMigration is a [!INCLUDE[server](../developer/includes/server.md)] instance setting. It's primarily used when upgrading from version 14. It's part of data upgrade process for transitioning application features from C/AL to AL extensions.

## What this setting does

The DestinationAppsForMigration setting serves the following purposes:


1. Supports moving entire tables from C/AL to AL.

    When you transition your solution from C/AL to AL, you can move entire tables from the C/AL application to separate AL extensions. In the tenant database, the ownership of the tables must be transferred to the extensions. The DestinationAppsForMigration setting is used to do this transfer, which is done when the tenant is synchronized. As a result, in the database, the table names will be suffixed with the ID of the extension. For example, `[dbo].[CRONUS International Ltd_$VAT Clause]` changes to `[dbo].[CRONUS International Ltd_$VAT Clause$437dbf0e-84ff-417a-965d-ed2bb9650972]`. In this case, `437dbf0e-84ff-417a-965d-ed2bb9650972` is the extension's ID.

    To successfully move a table automatically: This scenario requires that:

    - Table ID in AL must be the same ID as was in the C/AL. 
    - The table definition (schema) must match the existing schema. Or, if there are schema changes, they must be additive only.

        If this condition isn't met, it won't prohibit the move to the extension. But, the data upgrade may fail because of the breaking changes.
    
2. Runs upgrade code and installs extensions automatically during upgrade.

    The server instance essentially runs the Start-NAVDataUpgrade cmdlet. However, unlike normally, it doesn't invoke the OnInstall codeunit. It invokes the upgrade codeunit directly instead.
    
    When you run the data upgrade on a tenant, the server runs the upgrade code for the base and system application extensions. These extensions will then be automatically installed on the tenant.

3. Enables republishing and reinstalling extensions that haven't been built on the latest platform. For example, extensions that haven't been compiled on version 15 or 16.

    These extensions don't include base or system application dependencies in their manifests (app.json file). These extensions typically include the third-party extensions used on your version 14 solution. The DestinationAppsForMigration setting will resolve references to the Microsoft base application and system application for the extensions. When an extension is published, the system will automatically modify its manifest to include a dependency on the base and system applications.

    The destinationappsformigration process only inserts dependencies, which allows you to resolve dependencies. If the extension introduces breaking changes, it will fail.

> [!TIP]
> If you moving a table and fields from one extension to another, this move is considered an AL to AL move. For this move, you use the migration.json file. For more information, see [Migrating Tables and Fields Between Extensions](../developer/devenv-migrate-table-fields.md).

## How to set it up

You can only set the DestinationAppsForMigration by using the Set-NAVServerConfiguration cmdlet. To specify an extension, you must know the extension's ID, name, and publisher. The following code snippet shows the syntax for setting the DestinationAppsForMigration:

```
Set-NAVServerConfiguration -ServerInstance <server instance name> -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"<GUID>, "name":"<Extension name>", "publisher": "<Publisher>"},{"appId":"<GUID>, "name":"<Extension name>", "publisher": "<Publisher>"}]'
```
For example, the following command specifies the Microsoft system and base applications and a custom extension named My Extension.

```
Set-NAVServerConfiguration -ServerInstance <server instance name> -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"},{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"},{"appId":"e3d1b010-7f32-4370-9d80-0cb7e304b6f0", "name":"My Extension", "publisher": "Me"}]'
```

> [!IMPORTANT]
> The order of the extensions is important. You specify the extensions according to the dependency graph. For example, the system application must be before the base application.

## FAQ

### What extensions should I include?

In short, include any new extension, or in other words, any extensions that have never published and installed on the tenant. Typically:

- New extensions for existing objects that were moved from C/AL. The base application and system application are good examples.
- New extensions that add new objects to the application.  
- Old extensions that are still compiled on version 14. Third-party extensions for which you don't have access to source code would typically fall into this category.

### My extension only includes new objects that were never in C/AL. Can I include this extension? 

Yes. You can use this mechanism to install any extension together with the Microsoft system or base application. For example, Microsoft publishes extensions for upgrade tests and the library assert that had no objects in the C/AL base application.

### My extension is standalone, that is, it's not dependent on the system or base application. Can or should I include it?

It depends. For the setting to have any effect, you also include the system and base applications. If you use global triggers, you can add it to the list so it can listen to the triggers.

### How many extensions can I include?

As many as you like. There's no limit or performance impact.

## See Also

[JSON Files](../developer/devenv-json-files.md)  
[Migrating Tables and Fields Between Extensions](../developer/devenv-migrate-table-fields.md) 
