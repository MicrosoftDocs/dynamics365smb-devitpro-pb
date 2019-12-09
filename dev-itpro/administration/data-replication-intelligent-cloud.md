---
title: Migration On-Premises Data | Microsoft Docs
description: Learn how to set up cloud data migration from on-premises to your Business Central tenant so you can migrate to the cloud version of Business Central.
author: bmeier94

ms.reviewer: edupont
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 12/09/2019
ms.author: bmeier

---
# Migrating On-Premises Data to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

Data migration is the process of securely migrating data from your on-premises SQL Server instance to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.  

In order for the data migration to take place, you must successfully complete the **Cloud Migration Setup** assisted setup wizard in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. Once the wizard is complete and data migration is activated, an initial data migration will happen at the scheduled time. Alternatively, you can trigger the data migration process manually.  

Data is migrated between the two systems on a per-table basis, and success and failures are tracked for each table. If a table fails to migrate, the error will be captured, and the migration moves on to the next table until completed. Tables will fail to migrate if they cannot be found, or if the schema does not match between the cloud and the on-premises tables.  

The initial data migration time can vary depending factors such as the amount of data to migrate, your SQL Server configuration, and your connection speeds. The initial migration will take the longest amount of time to complete because all data is migrating. After the initial migration, only changes in data will be migrated so they should run more quickly.  You do not need to run the migration process more than once if you don't want to, but if you are running the migration while users are still using the on-premises system you will need to run at least one more migration in order to ensure all data was moved to the cloud before you start transacting in the cloud tenant.  

## Data Migration from Business Central on-premises

Your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution can have an identical twin in a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant. The data migration can be started quite easily from the assisted setup wizard in your on-premises solution. For more information, see [Connect to the Intelligent Cloud from On-Premises](about-intelligent-edge.md).  

### Migrating data from extensions

When your on-premises solution is connected to the cloud, it is highly recommended that you test the impact of any extension in a sandbox environment before you install the extensions in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production tenant to help avoid any data failures or unintended consequences.  

In order to support data migration, tables and table extensions must specify if data from that table must be migrated or not. By default, the **ReplicateData** property is set to *Yes* so that, by default, any extension that is installed in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant will have all its tables migrated.  

In certain circumstances, you may want to not migrate all data. Here are a few examples:

- The extension is installed in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant but not in the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution

    In this case, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will attempt to migrate the data but show a warning. Since the extension is not installed on-premises, any table related to that extension table will not migrate, and warning notifications will appear in the cloud migration status page.

    If you own the extension, we recommend that you set the **ReplicateData** property to *No* on the extension tables. If you do not, and if you want data to migrate, install the extension in both your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant and your on-premises solution. If you do not want data to migrate, uninstall the extension from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant.  

- The extension references a base table

    This can cause your base table to appear empty when you view data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. If that happens, uninstall the extension from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, and then run the cloud migration process again.

### Data that is not migrated

During the data migration process, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] does not migrate most system tables, users, and permissions.  

## Data migration from Dynamics GP

When using the cloud migration for Dynamics GP 2018 R2 or later, the following information is migrated from Dynamics GP to Business Central online:

- Chart of Accounts master records as of the time of the migration

    The chart of accounts will be set up as the main account segment from Dynamics GP, and the additional segments will be set up as dimensions in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]
- Account Balance as of the time of the migration

    The account balances are brought over as a sum amount of the balances grouped by the main account number.

    Let’s take a look at an example using Fabrikam data in Dynamics GP:

    |Account number|Account name|Amount|
    |--------------|------------|------|
    |000-1100-00|Cash|100.00|
    |100-1100-00|Cash Admin|200.00|
    |200-1100-00|Cash Accounting|200.00|
    |000-1100-01|Cash West|200.00|
    |000-1100-02|Cash Midwest|100.00|

    Because the account number's main segment in Dynamics GP is defined as the second segment, the data migration creates new accounts in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] based on the number *1100* in this example. The data migration process then sets up an account in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as shown in the following table:  

    |Account number|Account name|Amount|
    |--------------|------------|------|
    |1100|Cash|800.00|

    The data migration generates dimensions on that account based on the different segments. User will see a *Department* dimension with the values 000, 100, and 200 respectively. Another dimension, *Division*, will show the values 00, 01, and 02 respectively.

- Customer master records and outstanding transactions from the Receivables module

    These transactions will be brought in as the amount remaining in Dynamics GP.

- Vendor master records and outstanding transactions from the Payables module

    These transactions will be brought in as the amount remaining in Dynamics GP.

- Inventory items

    Inventory is imported with the cost valuation method that was selected when the company setup wizard was run. Currently, the data migration brings in the quantity on hand for the items at the time of migration. This quantity is brought into the blank location.

- Historical data from Sales Order Processing, Purchase Order Processing, and Inventory

     This data can be used in Power BI reports and Power Apps. In [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, the data is included in the SmartList views in the **Customers**, **Vendors**, and **Items** lists. Technically, the data is stored in table extensions.  

<!-- ## Data replication from Dynamics SL

When using the cloud migration for Dynamics SL 2018 CU 1, the following information is migrated from Dynamics SL to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online:

- Chart of Accounts master records as of the time of the migration
- Account Balance as of the time of the migration

- Customer master records and outstanding transactions from the Receivables module

    These transactions will be brought in as the amount remaining in Dynamics SL.
- Vendor master records and outstanding transactions from the Payables module

    These transactions will be brought in as the amount remaining in Dynamics SL.

- Inventory items

    Inventory is imported with the Quantity on Hand for the items when the company setup wizard was run. This quantity is brought into the blank location.

- Historical data from Sales Order Processing, Purchase Order Processing, and Inventory

     This data can be used in Power BI reports and Power Apps. In [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, the data is included in the SmartList views in the **Customers**, **Vendors**, and **Items** lists. Technically, the data is stored in table extensions.  
-->

## Upgrading to a new version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)]

If you upgrade to a new version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], including a cumulative update, then you must update the extensions as well. Depending on your on-premises solution, your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] tenant contains different extensions for the cloud migration. For more information, see [Business Central Intelligent Cloud Extensions](/dynamics365/business-central/ui-extensions-data-replication?toc=/dynamics365/business-central/dev-itpro/toc.json).  

> [!IMPORTANT]
> You must always install, publish, or upgrade the **Intelligent Cloud Base Extension** extension first, and then the product-specific extension or extensions. Also, if your on-premises solution is [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises, then you must update the extensions both on-premises and online.

## See also

[Connect to the Intelligent Cloud from On-Premises](about-intelligent-edge.md)  
[Managing your Intelligent Cloud Environment](manage-intelligent-edge.md)  
[ReplicateData Property](../developer/properties/devenv-replicatedata-property.md)  
[Intelligent Insights with Business Central](/dynamics365/business-central/about-intelligent-cloud)  
