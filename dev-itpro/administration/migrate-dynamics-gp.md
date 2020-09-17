---
title: Migrate from Dynamics GP to Business Central online
description: Get a cloud tenant so you can migrate to the cloud from Dynamics GP.

author: jenolson
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge, gp, migration
ms.date: 09/17/2020
ms.author: edupont

---

# Migrate to Business Central Online from Dynamics GP

The **Cloud Migration Management** assisted setup guide in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] can help you migrate data from Dynamics GP. You can migrate data from Dynamics GP 2015 on SQL Server 2012 and later versions of Dynamics GP and SQL Server.  

> [!IMPORTANT]
> Migrating from Dynamics GP using the **Cloud Migration Setup** assisted setup guide is currently only supported for the following markets: United States, Canada, United Kingdom, Australia.

## Migrated data

When you migrate from Dynamics GP, the following information is migrated from Dynamics GP to Business Central online:

1. Chart of Accounts master records

    The account number in Business Central will be mapped from the main account segment from Dynamics GP. Remaining account segments are then defined as [dimensions](/dynamics365/business-central/finance-dimensions/) in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. The assisted setup guide asks the user to enter a segment for *Global Dimension 1* and *Global Dimension 2*. If your chart of accounts in Dynamics GP has more than 2 segments outside of the main segment, the other segments are automatically set up as shortcut dimensions (3-8). You can verify the setup in the **General Ledger Setup** page in Business Central.

    Account Summary transactions are generated and posted for open and history years that were set up in Dynamics GP. The summary amounts are created based on the fiscal periods set up in Dynamics GP.

    Let us look at an example of an account from Dynamics GP:

    |Account in Dynamics GP |Year|Name  |Amount  |
    |-----------------------|----|------|--------|
    |000-1100-00  Cash |Year 2019 |  |  |
    |     |  |Period 1| 250.00 |
    |     |  |Period 2 | 117.00 |
    |     |  |Period 3 |340.00 |
    |000-1100-01  Cash |Year 2019 |  |  |
    |     |  |Period 1| 240.00 |
    |     |  |Period 2 | 102.00 |
    |     |  |Period 3 |501.00 |
    |000-4000-00 Sales |Year 2019 |  |  |
    |     |  |Period 1| 490.00 |
    |     |  |Period 2 | 219.00 |
    |     |  |Period 3 |841.00 |

    The migration creates two accounts in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], number 1100 and number 4000. New dimensions are also added with the names 000, 00, and 01. General journal transactions are created as follows:

    |Transaction date |Account No.|Amount  |Dimensions|
    |-----------------|-----------|--------|----------|
    |1/31/2019        |1100   |250.00 |Dimension 000, 00|
    |1/31/2019        |1100   |240.00 |Dimension 000, 01|
    |1/31/2019        |4000   |490.00 |Dimension 000, 00|
    |2/28/2019        |1100   |117.00 |Dimension 000, 00|
    |2/28/2019        |1100   |102.00 |Dimension 000, 01|
    |2/28/2019        |4000   |219.00 |Dimension 000, 00|
    |3/31/2019        |1100   |340.00 |Dimension 000, 00|
    |3/31/2019        |1100   |501.00 |Dimension 000, 01|
    |3/31/2019        |4000   |841.00 |Dimension 000, 00|

    The data migration generates dimensions on that account based on the different segments. User will see a *Department* dimension with the values *000*, *100*, and *200*, respectively. A second dimension, *Division*, will show the values *00*, *01*, and *02*, respectively.

2. Customer master records and outstanding transactions from the Receivables module

    In the setup wizard, you can choose to migrate all customers from Dynamics GP or only active customers. This allows you to not migrate over customers that have been marked as inactive. We also have added bringing all addresses from the customer over into Business Central. All of the addresses on the customer will be setup as shipping addresses in Business Central. That will allow the end user to choose the address needed when entering transactions after the migration.  

    We also bring over outstanding receivables transactions. These transactions will be brought in with the amount remaining in Dynamics GP. For example, if an invoice for $1000 was entered into Dynamics GP, and it has been partially paid and has a remaining balance of $400, the new invoice created in Business Central will be for $600 as that is the amount remaining to be paid. We bring over all transaction types from Receivables Management.

3. Vendor master records and outstanding transactions from the Payables module

    In the setup wizard, you can choose to migrate all vendors from Dynamics GP or only active vendors. This allows you to not migrate over vendors that have been marked as inactive. We also have added bringing all addresses from the vendor over into Business Central. All of the addresses on the vendor will be setup as order addresses in Business Central. That will allow the end user to choose the address needed when entering transactions after the migration.  

    We also bring over outstanding Payables transactions. These transactions will be brought in with the amount remaining in Dynamics GP. For example, if an invoice for $1000 was entered into Dynamics GP, and it has been partially paid and has a remaining balance of $400, the new invoice created in Business Central will be for $600 as that is the amount remaining to be paid. We bring over all transaction types from Payables Management.

    You can also bring over Open Purchase Orders. When we migrate purchase orders, we are looking at the items and the quantities remaining on those items to determine what we will bring over as an open purchase order. If an item is fully received and invoiced that item will not migrate. By bringing over open purchase orders, you do not have to enter outstanding transactions from the purchase order aspect.

4. Inventory items

    Inventory is imported with the cost valuation method that was selected when the company setup wizard was run. Currently, the data migration brings in the quantity on hand for the items at the time of migration. This quantity is brought into the blank location.

5. Historical data from Receivables, Payables, Sales Order Processing, Purchase Order Processing, and Inventory

    This data can be used in Power BI reports and Power Apps. In Business Central online, the data is included in the SmartList views in the Customers, Vendors, and Items lists. Technically, the data is stored in table extensions.
6. Checkbooks and outstanding transactions in Bank Reconciliation. We strongly recommend that you reconcile your checkbooks before you run the migration process to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as we will bring over transactions that have not been reconciled during the migration process.  

## Diagnostic Run within the Dynamics GP migration tool

We have enhanced the Diagnostic run to do more data validation/verification before the Migration is run so a customer can decrease the chances of a failed migration.

With field length maximum differences between GP and Business Central we want to catch and display warnings. We check item Numbers to look for duplicates based on the character limit of 20. We also look to make sure there are no blank posting accounts that are needed for posting of transactions with the migration.

Here is an example of what you might see when you run a diagnostic run:

:::image type="content" source="../media/gp-migration-diagnostics.png" alt-text="Status of migration run inside Business Central]":::

## Migration tool support for Australia

Starting with 2020 release wave 2, organizations in Australia can migrate from Dynamics GP to an Australian version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online.

The process to run the migration in an Australian [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online is the same as running a migration in the other supported countries. However, there is some setup that needs to be done before the migration can be run. To make the changes to the setup, you must run through the cloud migration wizard. When the wizard setup is complete, and companies are fully set up, you must log into the companies that you are planning to migrate and make the following changes

* With transactions that are being migrated, we bring over totals on the invoices for the customers so GST information is already included in the transactions. You must turn off the GST and Adjustment Mandatory features in the **General Ledger Setup** page to allow the transactions to post during the migration. After the migration is complete, you can turn both GSP and Adjustment Mandatory back on so that new transactions that are entered in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online will use this functionality.

* Within the posting process there is validation to look for a blank VAT business posting group and VAT product posting group. This combination isn't setup by default and is needed for the migration. So add a VAT posting configuration in the **VAT Posting Setup** page with blank values for the **VAT Bus Posting Group** and **VAT Prod. Posting Group** fields.  

## Migrate Dynamics GP to Azure Data Lake

Starting with 2020 release wave 2, you can migrate from Dynamics GP by creating a copy of the Dynamics GP database in Azure Data Lake. To take advantage of this functionality, there are some pieces that must be setup before the migration process. A customer is not required to copy their database to Azure Data Lake, but there are several benefits to being able to do so. For an introduction to Azure Data Lake, see [azure.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2135056).  

To create an Azure Data Lake storage account, you log in to your Azure subscription (or sign up for an Azure subscription). Once logged into the Azure portal, you can create a storage account. Under the **Access Keys** section of the information about your storage account in the Azure portal, you can see the keys that you msut provide in the cloud migration wizard in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. For more information about Azure Data Lake and setting up a storage account, see [Azure documentation](/azure/storage/blobs/data-lake-storage-introduction).  

### To migrate to Azure Data Lake

1. In your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant, choose the :::image type="icon" source="../media/search_small.png" border="false"::: icon, enter **Cloud Migration Management**, and then choose the related link.
2. Choose the **Azure Data Lake** action.

  The **Azure Data Lake Migration Setup** guide takes you through the steps to connect your on-premises Dynamics GP database and your storage in Azure Data Lake. You must have created an Azure Data Lake storage account before launching the assisted setup, and you must have access to the storage account name and storage account key.
3. When the setup completes, you can monitor the progress of moving your data from on-premises to Azure Data Lake in the **Cloud Migration Management** page in [!INCLUDE [prodshort](../developer/includes/prodshort.md)].

If you go back to the Azure portal, you can see the data that was moved from your Dynamics GP database to Azure Data Lake. Under the containers section of the Data Lake storage, a new *gp-database* folder contains the company/system databases, and sub-folders contain the series folder and data files.  

The database folder in Azure Data Lake will always be set as *gp-database*. If you want to rename it, you can do so after the migration has competed. The same applies to the various sub-folders. The folders created follow the standard naming convention of the *series* folders in Dynamics GP. An additional folder, *3rd Party*, will be created, and any files that haven't be mapped to a folder will reside in there. You can modify the content in the folders after the migration has completed.

If an Azure Data Lake migration has already been run in Business Central and you launch a second run, the migration tool will check to see if a *gp-database* folder exists. If you still want to run the migration again, you must delete the *gp-database* folder and its contents before you can run the wizard again.

## See also

[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
