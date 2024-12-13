---
title: Migrate Dynamics SL data to the cloud
description: Learn how to migrate to the cloud from Dynamics SL using an assisted setup guide in Business Central online. Move historical data to Azure Data Lake.
author: lcontreras
ms.topic: conceptual
ms.devlang: al
ms.reviewer: 
ms.search.keywords: cloud, edge, SL, migration
ms.search.form: 4003
ms.date: 12/13/2024
ms.author: jswymer
---
# Dynamics SL data migrated to Business Central online

This article provides an overview of the Dynamics SL data that can be migrated to Business Central online by cloud migration tools. You configure the actual data to migrate either globally or per company as part of the cloud migration setup using the **SL Company Migration Configuration** page.

## Fiscal periods

The **GL Setup** > **Fiscal Info** periods in Dynamics SL are migrated to Business Central as *accounting periods*. Any years marked as *historical* in Dynamics SL come over to Business Central as *open* and must be closed in Business Central. If any adjustments need to be made to historical years after migrating, those adjustments can be done before closing the year.

## Chart of Accounts master records

The account number in Business Central is mapped from the account in Dynamics SL. The Dynamics SL subaccount segments are then defined as [dimensions](/dynamics365/business-central/finance-dimensions/) in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. The **SL Company Migration Configuration** asks you to enter a segment for *Global Dimension 1* and *Global Dimension 2*. If your Dynamics SL subaccounthas more than two segments outside of the main segment, the other segments are automatically set up as shortcut dimensions (3-8). You can verify the setup in the **General Ledger Setup** page in Business Central.

Let us look at an example of an account from Dynamics SL, using the year 2022 as an example:

:::image type="content" source="../media/SL_Data_migration_Fiscal_Info-01.png" alt-text="Chart of Accounts master records":::

<!--broken-->

The migration creates two accounts in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], number 1100 and number 4000. New dimensions are also added with the names 00, and 01. General journal transactions are created as follows:

|Transaction date |Account No.|Amount  |Dimensions|
|-----------------|-----------|--------|----------|
|1/31/2022        |1100   |250.00 |Dimension 00, 00|
|1/31/2022        |1100   |240.00 |Dimension 00, 01|
|1/31/2022        |4000   |490.00 |Dimension 00, 00|
|2/28/2022        |1100   |117.00 |Dimension 00, 00|
|2/28/2022        |1100   |102.00 |Dimension 00, 01|
|2/28/2022        |4000   |219.00 |Dimension 00, 00|
|3/31/2022        |1100   |340.00 |Dimension 00, 00|
|3/31/2022        |1100   |501.00 |Dimension 00, 01|
|3/31/2022        |4000   |841.00 |Dimension 00, 00|

The data migration generates dimensions on that account based on the different subaccount segments. Users see a *Department* dimension with the values *00*, *10*, and *20*, respectively. A second dimension, *Division*, shows the values *00*, *01*, and *02*, respectively.

General ledger (GL) account summary transactions are generated and posted for open and history years that were set up in Dynamics SL. The summary amounts are created based on the fiscal periods set up in Dynamics SL. In the **SL Company Migration Configuration** page, you can select the oldest historical year you want migrated to Business Central. For example, if 2019, 2020, and 2021 are historical years in Dynamics SL, you could select that the oldest historical year you want migrated is 2020. Summary transactions for 2019 wouldn't be migrated to Business Central.

## Customer master records and outstanding transactions from the Receivables module

In the **SL Company Migration Configuration** page, you can choose to migrate all customers from Dynamics SL or only active customers. This action allows you to not migrate  customers marked as inactive. All addresses from the customer are also brought over into Business Central. The addresses on the customer are set up as shipping addresses in Business Central. Doing so allows the end user to choose the address needed when entering transactions after the migration.

Posting group created by the SL Migration is called "SL".

We also bring over outstanding receivables transactions. These transactions are brought in with the amount remaining in Dynamics SL. For example, if an invoice for $1000 was entered into Dynamics SL, and it has been partially paid and has a remaining balance of $400, the new invoice created in Business Central is for $600 because that's the amount remaining to be paid. We bring over all transaction types from Receivables Management.

## Vendor master records and outstanding transactions from the Payables module

In the **SL Company Migration Configuration** page, you can choose to migrate all vendors from Dynamics SL or only active vendors. This action allows you not to migrate over vendors marked as inactive. All addresses from the vendor are brought over into Business Central. All vendor addresses from the vendor are migrated to Business Central. The vendor's Remit To Address is set to the main address for the vendor. All other vendor addresses are set up as Order addresses in Business Central, which allows the end user to choose the address needed when entering transactions after the migration.

Posting group created by the SL Migration tool is called “SL”.

We also bring over outstanding Payables transactions. These transactions are brought in with the amount remaining in Dynamics SL. For example, if an invoice for $1000 was entered into Dynamics SL, and it has been partially paid and has a remaining balance of $400, the new invoice created in Business Central is for $600 because that's the amount remaining to be paid. We bring over all transaction types from Payables Management.

## Inventory items

Inventory is imported with the cost valuation method that is set in Dynamics SL at the time the migration is run. Location information and the quantity on hand for each Item is migrated. If serial or lot information is tracked on an Item, that information is also migrated.  

Posting group created by the SL Migration tool is called “SL”

In the **SL Company Migration Configuration** page, you can select if you want to migrate historical information from Dynamics SL into Business Central. This migrated data is then visible in list pages found under the corresponding entities and navigating to **Dynamics SL Detail Snapshot**. You can indicate if you want to migrate GL detail, Receivables, Payables, Sales Order Processing, Purchase Order Receipts, and Inventory transactions. The data is stored in extension tables in Business Central.  Data stored in those tables can be used in Power BI reports, Power Apps, or other non-Microsoft reporting tools. The tables containing the SL Historical Snapshot data are as follows:

- SL Hist. Batch
- SL Hist. GLTran
- SL Hist. APDoc
- SL Hist. APTran
- SL Hist. APAdjust
- SL Hist. APDoc
- SL Hist. APTran
- SL Hist. APAdjust
- SL Hist. INTran
- SL Hist. PurchOrd
- SL Hist. PurOrdDet
- SL Hist. POReceipt
- SL Hist. POTran
- SL Hist. SOHeader
- SL Hist. SOLine
- SL Hist. SOShipHeader
- SL Hist. SOShipLine
- SL Hist. SOType

You can limit the amount of data migrated in the snapshot by entering the latest year in SL that you want to be brought over.  Enter this year in the **Oldest Snapshot Year** field on the **SL Company Migration Configuration** page.  

The **SL Historical Snapshot** will run as a background process after the migration is complete. The status of the SL Historical Snapshot data can be viewed in Fact boxes on the **Cloud Migration Management** page.

## Next steps

- [Prepare and plan for cloud migration](cloud-migration-plan-prepare-SL.md)
- [Run cloud migration setup](migration-setup-SL.md)
- [Run data migration](migration-data-replication.md)
- [Run data upgrade](migration-data-upgrade-SL.md)
- [Complete cloud migration](migration-finish-SL.md)  

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-SL-overview.md)  
[Compare work in Dynamics SL to Business Central](migrate-dynamics-SL-videos.md)  
[FAQ about migrating to Business Central Online from on-premises solutions](faq-migrate-data.md)  
