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
ms. search.keywords: cloud, edge, gp
ms.date: 02/19/2020
ms.author: jenolson

---

# Migrate to Business Central Online from Dynamics GP

The **Cloud Migration Management** assisted setup guide in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] can help you migrate data from Dynamics GP. You can migrate data from Dynamics GP 2015 on SQL Server 2012 and later versions of Dynamics GP and SQL Server.  

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
    |000-1100-10  Cash |Year 2019 |  |  |
    |     |  |Period 1| 240.00 |
    |     |  |Period 2 | 102.00 |
    |     |  |Period 3 |501.00 |
    |000-4000-00 Sales |Year 2019 |  |  |
    |     |  |Period 1| 490.00 |
    |     |  |Period 2 | 219.00 |
    |     |  |Period 3 |841.00 |

    The migration creates two accounts in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], number 1100 and number 4000. New dimensions are also added with the names 000, 00, and 10. General journal transactions are created as follows:

    |Transaction date |Account No.|Amount  |Dimensions|
    |-----------------|-----------|--------|----------|
    |1/31/2019        |1100   |250.00 |Dimension 000, 00|
    |1/31/2019        |1100   |240.00 |Dimension 000, 10|
    |1/31/2019        |4000   |490.00 |Dimension 000, 00|
    |2/28/2019        |1100   |117.00 |Dimension 000, 00|
    |2/28/2019        |1100   |102.00 |Dimension 000, 10|
    |2/28/2019        |4000   |219.00 |Dimension 000, 00|
    |3/31/2019        |1100   |340.00 |Dimension 000, 00|
    |3/31/2019        |1100   |501.00 |Dimension 000, 10|
    |3/31/2019        |4000   |841.00 |Dimension 000, 00|

    The data migration generates dimensions on that account based on the different segments. User will see a *Department* dimension with the values *000*, *100*, and *200*, respectively. A second dimension, *Division*, will show the values *00*, *01*, and *02*, respectively.

2. Customer master records and outstanding transactions from the Receivables module

    In the setup wizard, you can choose to migrate all customers from Dynamics GP or only active customers. This allows you to not migrate over customers that have been marked as inactive. We also have added bringing all addresses from the customer over into Business Central. All of the addresses on the customer will be setup as shipping addresses in Business Central. That will allow the end user to choose the address needed when entering transactions after the migration.  

    We also bring over outstanding receivables transactions. These transactions will be brought in with the amount remaining in Dynamics GP. For example, if an invoice for $1000 was entered into Dynamics GP, and it has been partially paid and has a remaining balance of $400, the new invoice created in Business Central will be for $600 as that is the amount remaining to be paid. We bring over all transaction types from Receivables Management.

3. Vendor master records and outstanding transactions from the Payables module

    In the setup wizard, you can choose to migrate all vendors from Dynamics GP or only active vendors. This allows you to not migrate over vendors that have been marked as inactive. We also have added bringing all addresses from the vendor over into Business Central. All of the addresses on the vendor will be setup as order addresses in Business Central. That will allow the end user to choose the address needed when entering transactions after the migration.  

    We also bring over outstanding Payables transactions. These transactions will be brought in with the amount remaining in Dynamics GP. For example, if an invoice for $1000 was entered into Dynamics GP, and it has been partially paid and has a remaining balance of $400, the new invoice created ii Business Central will be for $600 as that is the amount remaining to be paid. We bring over all transaction types from Payables Management.

4. Inventory items

    Inventory is imported with the cost valuation method that was selected when the company setup wizard was run. Currently, the data migration brings in the quantity on hand for the items at the time of migration. This quantity is brought into the blank location.

5. Historical data from Sales Order Processing, Purchase Order Processing, and Inventory

    This data can be used in Power BI reports and Power Apps. In Business Central online, the data is included in the SmartList views in the Customers, Vendors, and Items lists. Technically, the data is stored in table extensions.

## See also

[Migrating On-Premises Data to Business Central Online](migrate-data.md)  
