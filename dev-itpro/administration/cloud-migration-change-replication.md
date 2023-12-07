---
title: Change the way data is replicated to Business Central online
description: Learn how to use the replication properties to include or exclude specific tables from cloud migration.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.collection: 
ms.date: 11/17/2023
ms.custom: bap-template 
---

# Change how data is replicated to Business Central online


In this article, you learn how to use the **Change how the data is replicated** feature in Business Central online. This feature allows you to include or exclude specific tables from cloud migration and specify whether to replace the full table with data from the on-premises table or to update and insert only the missing records.

## Considerations before you start

This is an expert feature that can lead to incorrectly replicated data or losing access to the tenant. The default settings were defined after careful consideration. Make sure you fully understand the application functionality you want to change so that you include or exclude all related tables.

We strongly advise against modifying **Permissions** related tables because **Permissions** from on-premises and online aren't compatible. We recommend setting up the permissions again by using the online permission sets. Replicating permissions can lead to losing access or to some application features not working properly. If you lose access, delete and create the environment again or use point-in-time restore to the point before replication.

## Prerequisite

- [Run cloud migration setup](migration-setup.md)

## Change how data is replicated 

1. Search for and open the **Cloud Migration Management** page.
1. In the action bar of the **Cloud Migration Management** page, select **...** (Show the rest) >  **More options** > **Actions** > **Change how the data is replicated**.

1. The **Select tables to migrate** page opens to display the tables that are included in the migration for the companies you chose to include in the cloud migration setup.

   :::image type="content" source="../developer/media/cloud-migration-change-replication.svg" alt-text="Shows a screenshot of the page for changing how table data replicates for to the cloud.":::

   Each table is listed by its name, company, and ID, plus the following fields that specify how its data will be migrated: 
 
   |Field|Description|How to change this setting|
   |-|-|-|
   |Replicate data| If this check box is selected, then the table and its data are included in the migration to the online tenant. If this check box is cleared, the table and its data are excluded from cloud migration. |To include a table in the cloud migration, select the table in the list, then select the **Include in migration** action. To exclude a table, select the table in the list, select the arrowhead next to the **Include in migration** action, then select **Exclude from migration**. <br><br>**TIP:** Use the <kbd>Shift</kbd> and <kbd>Crtl</kbd> keys when selecting tables to change multiple tables at once.
   |Preserve the cloud data|If the check box is selected, then data already included in records of the online table remains. Only records in the on-premises table that are missing in in the online table are copied. If the check box is cleared, the all data in table in the cloud will be deleted before copying the data from on-premises database.|To preserve data in the table in the cloud, select the table in the list, then select the **Preserve data** action. To delete the data in the online table during cloud replication, select the table in the list, select the arrowhead next to the **Preserve data** action, then select **Clear data before migration** (this will clear the **Preserve the cloud data** check box). Clear data before migration**<br><br>**TIP:** Use the <kbd>Shift</kbd> and <kbd>Ctrl</kbd> key when selecting tables to change multiple tables at once.|

   Use the **Company Name** and **Table Name** fields to filter the list and help you find specific tables.

   |Field|Description|
   |-|-|
   |Company Name|Select the company you want to filter on or select *All** to filter on all companies that are included in the cloud migration. Select **Per database tables** to filter on only tenant-level tables that on aren't specific to a company.|
   |Table Name|Find tables whose names contain the text that you enter, making it easier to find the related tables.|

   
   To view a history of changes done with the timestamps so you can see when the change to the properties was made

## Next steps

[Run and manage data replication](migrate-data-replication-run.md)  
