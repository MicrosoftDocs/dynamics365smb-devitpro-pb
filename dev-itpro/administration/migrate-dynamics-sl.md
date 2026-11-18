---
title: "Dynamics SL Cloud Migration: Supported Data"
description: Learn which Dynamics SL data migrates to Business Central online, including accounting periods, customers, vendors, inventory, projects, and history.
author: lcontreras
ms.topic: upgrade-and-migration-article
ms.devlang: al
ms.search.keywords: cloud, edge, SL, migration
ms.search.form: 4003
ms.date: 11/17/2026
ms.author: jswymer
ai-usage: ai-assisted
---
# Dynamics SL data migrated to Business Central online

This article provides an overview of the Dynamics SL data that can be migrated to Business Central online by cloud migration tools. You configure the actual data to migrate either globally or per company after completing cloud migration setup using the **SL Company Migration Configuration** page. Learn more in [Configure Dynamics SL company migration](migrate-sl-configure-companies.md).

## Migration of fiscal periods

The **GL Setup** > **Fiscal Info** periods in Dynamics SL migrate to Business Central as *accounting periods*. Years marked as *historical* in Dynamics SL come over to Business Central as *open* and must be closed in Business Central. Adjustments to historical years can be made before closing the year.

## Chart of accounts master records

The account number in Business Central maps from the account in Dynamics SL. The Dynamics SL subaccount segments are defined as *dimensions* in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. The **SL Company Migration Configuration** page asks you to select segments in **Dimension 1** and **Dimension 2** for the global dimensions. If your Dynamics SL subaccount has more than two segments, the other segments are automatically set up as shortcut dimensions (3–8). Verify the setup on the **General Ledger Setup** page in Business Central. Learn more in [Work with dimensions](/dynamics365/business-central/finance-dimensions).

Consider the following accounts from Dynamics SL that use the year 2022 as an example:

:::image type="content" source="../media/SL_Data_migration_Fiscal_Info-01.png" alt-text="Example Dynamics SL cash and sales accounts with subaccount balances for three fiscal periods.":::

The migration creates two accounts in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], number 1100 and number 4000. If the subaccount segments are named Department and Division, dimensions with those names are also added. General journal transactions are created as follows:

|Transaction date |Account No.|Amount  |Dimensions|
|-----------------|-----------|--------|----------|
|1/31/2022        |1100   |250.00 |Department 00, Division 00|
|1/31/2022        |1100   |240.00 |Department 00, Division 01|
|1/31/2022        |4000   |-490.00 |Department 00, Division 00|
|2/28/2022        |1100   |117.00 |Department 00, Division 00|
|2/28/2022        |1100   |102.00 |Department 00, Division 01|
|2/28/2022        |4000   |-219.00 |Department 00, Division 00|
|3/31/2022        |1100   |340.00 |Department 00, Division 00|
|3/31/2022        |1100   |501.00 |Department 00, Division 01|
|3/31/2022        |4000   |-841.00 |Department 00, Division 00|

The data migration generates dimensions based on the different subaccount segments. In this example, users see a *Department* dimension with the value *00*. A second dimension, *Division*, shows the values *00* and *01*.

The general ledger (GL) account summary transactions are generated for open and history years that were set up in Dynamics SL and posted unless you disable auto posting. Transactions aren't generated if you select master data only. The summary amounts are created based on the fiscal periods set up in Dynamics SL. On the **SL Company Migration Configuration** page, you can select the oldest historical year you want migrated to Business Central. For example, if 2019, 2020, and 2021 are historical years in Dynamics SL, you could select that the oldest historical year you want migrated is 2020. Summary transactions for 2019 wouldn't be migrated to Business Central.

## Customer master records and outstanding transactions from the Receivables module

In the **SL Company Migration Configuration** page, choose to migrate all customers from Dynamics SL or only active customers. This action lets you exclude customers marked as inactive. All customer addresses are also brought over into Business Central and set up as shipping addresses. This setup allows the end user to choose the needed address when entering transactions after the migration.

The default customer posting group created by the SL migration is called **SL**. If you migrate customer classes, the customer posting group is set from the customer's class instead.

The migration also brings over outstanding receivables transactions unless you select master data only. These transactions are brought in with the amount remaining in Dynamics SL. For example, if an invoice for $1,000 was entered into Dynamics SL, and it has been partially paid and has a remaining balance of $400, the invoice journal entry created in Business Central is for $400 because that's the amount remaining to be paid. Only released documents with a nonzero balance in eligible posted or completed batches are migrated. Depending on the Dynamics SL document type, the migration creates invoices, payments, credit memos, or finance charge memos.

## Vendor master records and outstanding transactions from the Payables module

On the **SL Company Migration Configuration** page, choose to migrate all vendors from Dynamics SL or only active vendors. This action lets you exclude vendors marked as inactive. The vendor's main address is brought over from the Dynamics SL vendor record, and purchase order addresses are set up as order addresses. This setup allows the end user to choose the needed address when entering transactions after the migration.

The default vendor posting group created by the SL migration tool is called **SL**. If you migrate vendor classes, the vendor posting group is set from the vendor's class instead.

The migration also brings over outstanding payables transactions unless you select master data only. These transactions are brought in with the amount remaining in Dynamics SL. For example, if an invoice for $1,000 was entered into Dynamics SL, and it has been partially paid and has a remaining balance of $400, the invoice journal entry created in Business Central is for $400 because that's the amount remaining to be paid. Released vouchers, credit adjustments, debit adjustments, and prepayments with a nonzero balance in posted batches are migrated as invoices, credit memos, or payments.

## Migration of inventory items

Inventory is imported with a costing method based on the valuation method in Dynamics SL. FIFO, LIFO, average cost, and standard cost map to the corresponding Business Central methods. Specific identification maps to FIFO, and user-specified cost maps to Average. Location information and the quantity on hand for each item are migrated unless you select master data only. Serial and lot tracking settings are migrated. Serial or lot numbers for quantities on hand are migrated when numbers are assigned on receipt.

The default posting group created by the SL migration tool is called **SL**. If you migrate product classes, the inventory posting group is set from the item's product class instead.

On the **SL Company Migration Configuration** page, you can choose to migrate historical information from Dynamics SL into Business Central. This migrated data is then visible from the **SL Historical** actions on the corresponding customer, vendor, and general ledger account pages. You can choose GL, receivables, payables, purchase order receipt, and inventory transactions. The **AR Transactions** option also includes sales order history. The data is stored in extension tables in Business Central. Data stored in those tables can be used in Power BI reports, Power Apps, or other non-Microsoft reporting tools. The tables containing the SL Historical Snapshot data are as follows:

- `SL Hist. Batch`
- `SL Hist. GLSetup`
- `SL Hist. GLTran Archive`
- `SL Hist. APDoc Archive`
- `SL Hist. APTran Archive`
- `SL Hist. APAdjust`
- `SL Hist. ARDoc Archive`
- `SL Hist. ARTran Archive`
- `SL Hist. ARAdjust`
- `SL Hist. INTran Archive`
- `SL Hist. LotSerT Archive`
- `SL Hist. PurchOrd`
- `SL Hist. PurOrdDet`
- `SL Hist. POReceipt`
- `SL Hist. POTran`
- `SL Hist. SOHeader`
- `SL Hist. SOLine`
- `SL Hist. SOShipHeader`
- `SL Hist. SOShipLine`
- `SL Hist. SOType`

You can limit the data migrated in the snapshot by entering the earliest year in SL that you want to bring over. Enter this year in the **Oldest Snapshot year** field on the **SL Company Migration Configuration** page.

The **SL Historical Snapshot** runs as a background process after the migration is complete. The status of the SL Historical Snapshot data can be viewed in FactBoxes on the **Cloud Migration Management** page.

## Project master records from the Project Controller module

On the **SL Company Migration Configuration** page, select the option to migrate **Project Controller** master data, which includes **Projects**, **Tasks**, and **Resources**.

- **Resources** include project employees in **Active** status and, optionally, **Hold** status. Equipment resources migrate only in **Active** status.
- **Projects** are eligible for migration if they are in either **Active** or **Plan** status, based on the configuration settings.
- **Tasks** can be migrated only if they are in an **Active** status, based on the configuration settings.

## Open purchase and sales orders

On the **SL Company Migration Configuration** page, enable **Open Purchase Orders** or **Open Sales Orders** to migrate orders. Both options are off by default. Purchase orders require migrated vendors, and sales orders require migrated customers.

The migration creates purchase orders from regular Dynamics SL orders with open or purchase order status and includes open lines. Sales orders must have open status and an order type with sales order behavior. Sales order lines migrate only when their backordered quantity is greater than zero.

## Cash Manager accounts and balances

Enable **Cash Manager** to migrate active cash accounts as bank accounts. This option is off by default and requires **General Ledger**. Unless you select **Cash Accounts** in **Master Data Only**, the migration also creates journal entries for nonzero current cash balances, calculated from receipts less disbursements after the Dynamics SL Cash Manager setup's past start date.

## Next steps

- [Prepare and plan for cloud migration from Dynamics SL](cloud-migration-plan-prepare-sl.md)
- [Run cloud migration setup for Dynamics SL migration](migration-setup-sl.md)
- [Data replication overview](migration-data-replication.md)
- [Upgrade data for Dynamics SL cloud migration](migration-data-upgrade-sl.md)
- [Complete Dynamics SL cloud migration to Business Central online](migration-finish-sl.md)

## Related information

[Dynamics SL migration to Business Central online: End-to-end overview](migrate-sl-overview.md)

[Compare work processes in Dynamics SL to Business Central](migrate-dynamics-sl-videos.md)

[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)
