---
title: Skip API data upgrade in cloud migration
description: This article explains things you can skip the API data upgrade during cloud migration and complete it after going live
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 12/12/2023
ms.custom: bap-template
author: jswymer
---

# Skip API data upgrade in cloud migration

When running the data upgrade during cloud migration, you can experience a long running upgrade because of the API upgrade. To prevent this condition, you can skip the API data upgrade during cloud migration, and then run it after going live on the tenant. Skipping the API data upgrade is done on per-company basis, and the only consequence is that the company starts using APIs later after you schedule the upgrade.

There are two ways to skip the API data upgrade during cloud migration. One way is to disable it as part of the on-premises upgrade process. The other way is to disable using cloud migration management in the Business Central online environment.

## Skip from the online environment

Before you can do this task, you have to cloud migration setup and data replication. <!-- I disabled it before data rep, but after data rep, it was enabled again>

1. Sign in to [Business Cental online](https://businesscentral.dynamics.com).
1. Search for and open the **Cloud Migration Management** page.
1. Select the **Manage API Upgrade** action to open the **API upgrade overview** page. 
1. To disable the API data upgrade for a company, do the following steps:

   1. On the **API upgrade overview** page, select the company in the **Company Name** column.

      The **API Data Upgrade List** opens in a new browser tab. 
      
   1. On the **API Data Upgrade List** page, select **Disable API Data Upgrades** > **OK**.
  
      You can close the **API Data Upgrade List** tab after you make the selection. 
1. Repeat the previous step for each company you want to disable the API data upgrade.

   The **API upgrade overview** page doesn't show the changes until it's refreshed (select (<kbd>F5</kbd>).


## Skip from on-premises upgrade

You can use the following SQL query to skip upgrade for a single company:

```sql
DECLARE @UpgTag nvarchar(250);  
SET @UpgTag = UPPER('MS-469217-DisableAPIDataUpgrade-20230411')  
  
INSERT INTO [dbo].[Upgrade Tags$63ca2fa4-4f03-4f2b-a480-172fef340d3f] (Tag, [Tag Timestamp], [Skipped Upgrade], Company)  
VALUES (  
    UPPER(@UpgTag),  
    '1753-01-01 00:00:00.000',  
    1,  
    UPPER('SetCompanyName')  
);  
```

You can use the following SQL query to skip upgrade for all companies:

```sql
DECLARE @UpgTag nvarchar(250);  
  
SET @UpgTag = UPPER('MS-469217-DisableAPIDataUpgrade-20230411')  
  
INSERT INTO [dbo].[Upgrade Tags$63ca2fa4-4f03-4f2b-a480-172fef340d3f] (Tag, [Tag Timestamp], [Skipped Upgrade], Company)  
SELECT  
    UPPER(@UpgTag),  
    'SetDate',  
    1,  
    UPPER([Name])  
FROM  
    Company   
WHERE  
    UPPER([Name]) NOT IN (  
        SELECT [Company]   
        FROM [Upgrade Tags$63ca2fa4-4f03-4f2b-a480-172fef340d3f]   
        WHERE Tag = UPPER(@UpgTag)  
    )
```

## Complete API data upgrade after going live

1. Sign in to [Business Cental online](https://businesscentral.dynamics.com).
1. Search for and open the **Cloud Migration Management** page.
1. Select the **Manage API Upgrade** action to open the **API Upgrade overview** page. 

   Companies that weren't upgraded have the **API Upgrade Status** of **Disabled**.
    
1. To run the API data upgrade for a company, do the following steps:

   1. On the **API upgrade overview** page, select the company name.

      The **API Data Upgrade List** opens in a new browser tab. 
      
   1. On the **API Data Upgrade List** page, select all entities, and then select **Reset** > **"Schedule Upgrades** > **Yes**.

      A job queues entry is created and opened.
   
   1. Schedule the job queue entry to run. [Learn more](/dynamics365/business-central/admin-job-queues-schedule-tasks).
  
1. Repeat the previous step for each company you want to run the API data upgrade.

You can check the status of job queue entries on the **API Upgrade Overview** page and restart a job queue entry if it fails. When you restart a job queue entry, it continues at the point where it stopped. It's safe to rerun the job queue entry because it commits and releases any locks and shouldn't cause any performance degradation.

## Next steps

[Run data upgrade](migration-data-upgrade.md)  
