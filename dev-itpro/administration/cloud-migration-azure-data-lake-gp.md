---
title: Copy Dynamics GP Data to Azure Data Lake Storage
description: Copy Dynamics GP data to Azure Data Lake Storage for historical reference, configure the storage account connection, and monitor progress in Business Central.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.collection: 
ms.date: 11/17/2026
ms.custom: bap-template
ai-usage: ai-assisted
---
# Copy Dynamics GP data to Azure Data Lake

You can copy Dynamics GP data to Azure Data Lake for future reference after migration to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online. This optional copy gives you access to historical data that isn't migrated to Business Central. It doesn't replace the SQL Server backups used for migration or recovery. Learn more in [Introduction to Azure Data Lake Storage](/azure/storage/blobs/data-lake-storage-introduction).

To create an Azure Data Lake storage account, sign in to your Azure subscription and create a storage account with **Enable hierarchical namespace** selected. Learn more in [Create a storage account to use with Azure Data Lake Storage](/azure/storage/blobs/create-data-lake-storage-account).

In the storage account resource menu, select **Security + networking** > **Access keys** > **Show keys** to get the key required by the Business Central setup guide. Treat the storage account key as a secret. Learn more in [Manage storage account access keys](/azure/storage/common/storage-account-keys-manage).

## Prerequisites

- You have an Azure Data Lake Storage Gen2 account and access to its name and account key.
- Cloud migration is set up and enabled for Dynamics GP. Learn more in [Run cloud migration setup for Dynamics GP migration](migration-setup-gp.md).
- No other replication run is in progress.
- You have the **SUPER** permission set to use the **Azure Data Lake** action on **Cloud Migration Management**.

<a name="move-to-azure-data-lake"></a>
## Copy data to Azure Data Lake

1. Sign in to your [Business Central online](https://businesscentral.dynamics.com) tenant.
1. Search for and open **Cloud Migration Management**.
1. Select **Azure Data Lake** to open the **Azure Data Lake Migration Setup** guide.
1. Review and accept the warning and privacy notice.
1. Enter **Storage Account Name** and **Storage Account Key**, then select **Next** > **Finish**.

Monitor progress on **Cloud Migration Management**.

If you go back to the Azure portal, you can see the data that was copied from your Dynamics GP database to Azure Data Lake. Under the containers section of the Data Lake storage, a new *gp-database* folder contains the company/system databases, and subfolders contain the series folder and data files.

The database folder in Azure Data Lake is always set to *gp-database*. If you want to rename it, you can do so after the migration completes. The same applies to the various subfolders. The folders created follow the standard naming convention of the *series* folders in Dynamics GP. Another folder, *3rd Party*, is created, and any files that haven't been mapped to a folder reside in this folder. You can modify the content in the folders after the migration completes.

If an Azure Data Lake migration has already run in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] company, and you launch a second run, the migration tool checks to see if a *gp-database* folder exists. To copy the data to the same storage account again, you must delete the existing *gp-database* folder and its contents first.

> [!WARNING]
> Preserve any copied data you need before deleting the folder and its contents.

After the copy completes, you can use the GP data files for historical reference without maintaining the original server.

## Next steps

- [Run cloud migration setup](migration-setup-gp.md)
- [Run data replication](migrate-data-replication-run.md)
- [Run data upgrade](migration-data-upgrade-gp.md)
- [Complete cloud migration](migration-finish-gp.md)  

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)  
