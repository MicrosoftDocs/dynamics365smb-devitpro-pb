---
title: Replicating On-Premises Data | Microsoft Docs
description: Learn how to set up data replication from on-premises to your Business Central tenant so you can connect to the intelligent cloud.
author: bmeier94

ms.reviewer: edupont
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms. search.keywords: cloud, edge
ms.date: 10/01/2019
ms.author: bmeier

---
# Replicating On-Premises Data to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

Data replication is the process of securely migrating data from your on-premises SQL Server instance to your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. The process uses the Azure Data Factory (ADF) to migrate the data between databases directly, meaning it does not look at any permissions within the applications you are transferring data between, only SQL permissions.  

In order for the data migration to take place, you must successfully complete the **Intelligent Cloud Setup** assisted setup wizard in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. Once the wizard is complete and data replication is activated, an initial data replication will happen at the scheduled time. Alternatively, you can trigger the data replication process manually.  

Data is replicated between the two systems on a per-table basis, and success and failures are tracked for each table. If a table fails to replicate, the error will be captured, and the replications moves on to the next table until completed. Tables will fail to replicate if they cannot be found, or if the schema does not match between the cloud and the on-premises tables.  

If a table fails to replicate, a blocker is placed on the  table in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. It is meant as a way for the service to inform you that the data you are viewing has not replicated to prevent you from viewing data that may be out of date. At no point will there be an impact on your on-premises SQL Server data.  

The initial data replication time can vary depending factors such as the amount of data to replicate, your SQL Server configuration, and your connection speeds. The initial replication will take the longest amount of time to complete because all data is replicating. After the initial replication, only changes in data will be replicated so they should run more quickly.  

## Data replication from Business Central on-premises

Your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution can have an identical twin in a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenant. The data replication can be started quite easily from the assisted setup wizard in your on-premises solution. For more information, see [Connect to the Intelligent Cloud from On-Premises](about-intelligent-edge.md).  

### Replicating data from extensions

When your on-premises solution is connected to the intelligent cloud, it is highly recommended that you test the impact of any extension in a sandbox environment before you install the extensions in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production tenant to help avoid any data failures or unintended consequences.  

In order to support data replication, tables and table extensions must specify if data from that table must be replicated or not. By default, the **ReplicateData** property is set to *Yes* so that, by default, any extension that is installed in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant will have all its tables replicated.  

In certain circumstances, you may want to not replicate all data. Here are a few examples:

- The extension is installed in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant but not in the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises solution

    In this case, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] will attempt to replicate the data but fail. Since the extension is not installed on-premises, any table related to that extension table will fail to replicate, and blocker notifications will appear on pages that are associated with those tables.

    If you own the extension, we recommend that you set the **ReplicateData** property to *No* on the extension tables. If you do not, and if you want data to replicate, install the extension in both your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant and your on-premises solution. If you do not want data to replicate, uninstall the extension from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant.  

- The extension references a base table

    This can cause your base table to appear empty when you view data in your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant. If that happens, uninstall the extension from your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] cloud tenant, and then run the data replication process again.

### Data that is not replicated

During the data replication process, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] does not replicate most system tables, users, and permissions.  

## Data replication from Dynamics GP

When using the intelligent cloud replication for Dynamics GP 2018 R2, the following information is replicated from Dynamics GP to Business Central online:

- Chart of Accounts master records as of the time of the replication

    The chart of accounts will be set up as the main account segment from Dynamics GP, and the additional segments will be set up as dimensions in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]
- Account Balance as of the time of the replication

    The account balances are brought over as a sum amount of the balances grouped by the main account number.

    Let’s take a look at an example using Fabrikam data in Dynamics GP:

    |Account number|Account name|Amount|
    |--------------|------------|------|
    |000-1100-00|Cash|100.00|
    |100-1100-00|Cash Admin|200.00|
    |200-1100-00|Cash Accounting|200.00|
    |000-1100-01|Cash West|200.00|
    |000-1100-02|Cash Midwest|100.00|

    Because the account number's main segment in Dynamics GP is defined as the second segment, the data replication creates new accounts in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] based on the number *1100* in this example. The data replication process then sets up an account in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as shown in the following table:  

    |Account number|Account name|Amount|
    |--------------|------------|------|
    |1100|Cash|800.00|

    The data replication generates dimensions on that account based on the different segments. User will see a *Department* dimension with the values 000, 100, and 200 respectively. Another dimension, *Division*, will show the values 00, 01, and 02 respectively.

- Customer master records and outstanding transactions from the Receivables module

    These transactions will be brought in as the amount remaining in Dynamics GP.

- Vendor master records and outstanding transactions from the Payables module

    These transactions will be brought in as the amount remaining in Dynamics GP.
- Inventory items

    Inventory is imported with the cost valuation method that was selected when the company setup wizard was run. Currently, the data replication brings in the quantity on hand for the items at the time of migration. This quantity is brought into the blank location.

- Historical data from Sales Order Processing, Purchase Order Processing, and Inventory

     This data can be used in Power BI reports and Power Apps. In [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, the data is included in the SmartList views in the **Customers**, **Vendors**, and **Items** lists. Technically, the data is stored in table extensions.  

<!-- ## Data replication from Dynamics SL

When using the intelligent cloud replication for Dynamics SL 2018 CU 1, the following information is replicated from Dynamics SL to [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online:

- Chart of Accounts master records as of the time of the replication
- Account Balance as of the time of the replication
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

If you upgrade to a new version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], including a cumulative update, then you must update the extensions as well. Depending on your on-premises solution, your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] tenant contains different extensions for the intelligent insights. For more information, see [Business Central Intelligent Cloud Extensions](/dynamics365/business-central/ui-extensions-data-replication?toc=/dynamics365/business-central/dev-itpro/toc.json).  

> [!IMPORTANT]
> You must always install, publish, or upgrade the **Intelligent Cloud Base Extension** extension first, and then the product-specific extension or extensions. Also, if your on-premises solution is [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises, then you must update the extensions both on-premises and online.

## See also

[Connect to the Intelligent Cloud from On-Premises](about-intelligent-edge.md)  
[Managing your Intelligent Cloud Environment](manage-intelligent-edge.md)  
[ReplicateData Property](../developer/properties/devenv-replicatedata-property.md)  
[Intelligent Insights with Business Central](/dynamics365/business-central/about-intelligent-cloud)  
