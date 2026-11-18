---
title: Define Cloud Migration Table Mappings in Business Central
description: Learn how to use cloud migration table mapping to rename a table during cloud migration or to move a subset of fields to a different table or table extension.
author: jswymer 
ms.author: jswymer 
ms.reviewer: jswymer

ms.topic: how-to
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---
# Define cloud migration table mappings

Cloud migration table mapping in Business Central can be used to rename the table during the cloud migration or to move a subset of fields to a different table or table extension. Table mapping is a process that allows you to define the relationship between source tables in an on-premises database and destination tables in the online environment. In other words, table mapping lets you specify which tables in the on-premises database are migrated to which tables in the online environment.

> [!TIP]
> You can use the **Import** and **Export** actions to import or export the definition done in the UI.

## Design constraints

It's not possible to have multiple source tables mapping to the same destination table. The destination table must have a single on-premises source table.

For example, the following mappings together aren't supported:

|Source table|Destination table|
|-|-|
|Customer|MyTable|
|MyTable|MyTable|

But the following mappings are supported:

|Source table|Destination table|
|-|-|
|Customer|Customer|
|Customer|MyTable|

This limitation also applies to tables that are automatically included into the replication, which means tables enabled for cloud migration by the [ReplicateData property](../developer/properties/devenv-replicatedata-property.md). If these tables exist in the on-premises database, they're automatically included in the cloud migration. So, no table mappings can define these tables as the destination table.

## Rename the table during the cloud migration

This scenario supports adding the prefix or changing the table name during cloud migration.

For example, suppose the Business Central on-premises table is named `My Custom Table`. But in Business Central online, the name needs a three-letter prefix or suffix, so the table name is `ABC My Custom Table`.

### Prerequisites

- The keys in on-premises table and online table must match.
- The online target table must have the [ReplicateData property](../developer/properties/devenv-replicatedata-property.md) set to `true`.

### Create the table mapping for renaming

1. Sign in to [Business Central online](https://businesscentral.dynamics.com).
1. [!INCLUDE[open-search](../developer/includes/open-search.md)], enter **Cloud Migration Management**, and then choose the related link.
1. Select **Manage table mappings** to open **Migration Table Mapping**. In the previous interface, select **Manage Custom Tables**.
1. Set the following fields:

   |Fields|Value|
   |-|-|
   |**Target Table Type**| **Table**|
   |**Extension Name**|Set to the name of the extension that contains the table. |
   |**Table Name**|Set to the table in the extension. Setting these three fields specifies the target table.|
   |**Source Table Name**|Enter the full name as it appears in SQL. Business Central parses the values. <br /><br />C/AL table example: `[CRONUS COMPANY$ABC My Custom Table]` <br /><br />AL table example: `[CRONUS COMPANY$ABC My Custom Table$437dbf0e-84ff-417a-965d-ed2bb9650972]`. The GUID `437dbf0e-84ff-417a-965d-ed2bb9650972` is the extension ID, which in this case is for base app. |

The following figure illustrates an example of the **Migration Table Mapping** page for an AL table:

:::image type="content" source="../media/table-mapping-move-al.png" alt-text="Screenshot of migration table mapping for an AL table." lightbox="../media/table-mapping-move-al.png":::

## Move a set of fields out of the main table to another table or table extension

> [!NOTE]
> This type of table mapping is only supported for cloud migrations from Business Central. Dynamics GP and SL don't support table extensions.

For example, suppose that you've added two custom fields to the `Customer` table in Business Central on-premises. You want to move these two custom fields to a table extension in Business Central online. If you define a table extension mapping, then the engine will move a subset of fields to the table extension.

### Prerequisites

Fields to be moved to a table extension must have the same name and type as in the source table in the Business Central. If the name is different, the fields are ignored by the engine, and won't be moved to Business Central online.

### Create the table mapping for moving fields

1. Follow the steps in [Add multiple table mappings](#add-multiple-table-mappings), setting **Type** to **Table Extension**. If the source table is a per-database table, clear **Data Per Company** in the **Source Table** section before saving.

You must use **Add Table Mappings**. You can't create a table-extension mapping by inserting a row directly.

The following figure illustrates an example of the **Migration Table Mapping** page for a C/AL table:

:::image type="content" source="../media/table-mapping-move-cal.png" alt-text="Screenshot of migration table mapping for a C/AL source table." lightbox="../media/table-mapping-move-cal.png":::

## Add multiple table mappings

Follow these steps if you need multiple table mappings.

1. On the **Migration Table Mapping** page, select **Add Table Mappings**.  
1. On the **Add Migration Table Mappings** page, in the **Source Table** section, enter the table name in the **Name** field.

   It's best to enter the full name as it appears in SQL Management Studio as in the following examples: 

   C/AL table: `[CRONUS COMPANY$ABC My Custom Table]`

   AL table: `[CRONUS COMPANY$ABC My Custom Table$437dbf0e-84ff-417a-965d-ed2bb9650972]`

   The GUID `437dbf0e-84ff-417a-965d-ed2bb9650972` is the extension ID, which in this case is for base app.

1. To set the target table, go to the **Target Table** section and set the **Type** to **Table** or **Table Extension**.

    The list shows all the tables available for mapping to the target table. You can filter the list by setting extensions in the **Extension Names** field.
1. Select all target tables or table extensions that you want to map from the source table.

   The following figure illustrates an example of the **Add Migration Table Mappings** page:

   :::image type="content" source="../media/table-mapping-multiple.png" alt-text="Screenshot of selecting multiple target tables for a migration mapping." lightbox="../media/table-mapping-multiple.png":::

1. Choose **OK** to save the mappings. Closing with **Cancel** doesn't insert them.

   After you choose **OK**, the multiple table mappings are inserted. This step is useful when you want to split a single source table into multiple table extensions.

## Provide table mappings programmatically

We recommend that you provide the table mappings programmatically. To do table mappings programmatically, subscribe to the `OnInsertDefaultTableMappings` event from codeunit 4001 `"Hybrid Cloud Management"`.

Table mappings will be inserted after the setup wizard is completed or if you run the **Restore Default Mappings** from **Migration Table Mapping** page.

## Next steps

[Run data migration setup](migration-setup.md)

## Related information

[Migrate Data](migrate-data.md)  
