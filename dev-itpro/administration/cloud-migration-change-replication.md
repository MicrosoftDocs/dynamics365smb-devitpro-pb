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

In this article, you learn how to use the **Change how the data is replicated** feature to:

- Include or exclude the specific tables from cloud migration. 
- Specify whether to replace the full table with the data from the on-premises table or to update and insert only the missing records.


## Considerations before you start

This is an expert feature. Using this functionality can lead to incorrectly replicated data or losing access to the tenant. The default settings were defined after careful consideration. Make sure that you fully understand the application functionality that you want to change so that you include or exclude all related tables. 

We strongly advise that you don't modify **Permissions** related tables, because **Permissions** from on-premises and online aren't compatible. We recommend setting up the permissions again by using the online permission sets. Replicating permissions can lead to losing access or to some application features not working properly. If you lose access, delete and create the environment again or use point-in-time restore to the point before replication.

## Prerequisite

- [Run cloud migration setup](migration-setup.md)

## Change how data is replicated 

1. Search for and open the **Cloud Migration Management** page.
1. In the action bar of the **Cloud Migration Management** page, select **...** (Show the rest) >  **More options** > **Actions** > **Change how the data is replicated**.

1. The **Select tables to migrate** page opens to display the tables that are included in the migration for the companies you chose to include in the cloud migration setup.

   :::image type="content" source="../developer/media/cloud-migration-change-replication.svg" alt-text="Shows a screenshot of the page for changing how table data replicates for to the cloud.":::

   Each table is listed by its name, company, and ID, plus the following fields that specify the how its data will be migrated: 
 
   |Field|Description|How to change|
   |-|-|-|
   |Replicate data|If this check box is selected, then the table and its data are included in the migration to the online tenant. If this check box is cleared, the table and its data are excluded from the Include in cloud migration. | To include a table in the cloud migration, select the table in the list, then select **Include in migration** action. To exclude a table, select the table in the list, select the arrowhead next to the **Include in migration** action, then select **Exclude from migration**.|
   |Preserve the cloud data|If the check box is selected, then a delta sync is done between the on-premises and online table. Data already in the online table remains and only changes in the on-premises table from the last sync are replicated online. If the checnkbox is cleared, the all data in table in the cloud will be deleted before copying the data from on-premises database.|To preserve data in the table in the cloud, select the table in the list, then select the **Preserve data** action. To delete the data in the table in the cloud during replication, select the table in the list, select the arrowhead next to the **Preserve data** action, then select **Clear data before migration**.|

   To change the settings for a table, use the 

   Use the **Company Name** and **Table Name** fields to filter the list and find specific tables.

   |Field|Description|
   |-|-|
   |Company Name|Select the company you want to filter on or select *All** to filter on all companies that are included in the cloud migration. Select **Per database tables** to filter on only tenant-level tables that on aren't specific to a company.|
   |Table Name|Find tables whose names contain the text that you enter, making it easier to find the related tables.|

1. To change how data is replicated for a table, select the table in the list, then thuse the following actions




Preserve data action will keep the data in the database, if the value is set to false then it will delete the SaaS table before making the initial replication from SaaS. Action can be used on the multiple records
Reset to default will reset all changes for the selected records to their initial values. 
Show history can show you the history of changes done with the timestamps so you can see when the change to the properties was made
Table name field will allow you to filter to the tables that contain a part of the value typed, so it is easy to find the related tables
Company name can set the filter for the selected company

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
