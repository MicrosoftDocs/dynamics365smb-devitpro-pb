---
title: Dynamics GP Data Migration to Business Central Online
description: Learn which Dynamics GP master records, outstanding transactions, and historical data you can migrate to Business Central online and how to select them.
author: jenolson
ms.topic: concept-article
ms.devlang: al
ms.reviewer: jswymer
ms.search.keywords: cloud, edge, gp, migration
ms.search.form: 4003
ms.date: 11/17/2026
ms.author: jswymer
ai-usage: ai-assisted
---
# Dynamics GP data migrated to Business Central online

This article provides an overview of the Dynamics GP data that can be migrated to Business Central online by cloud migration tools. You configure the actual data to migrate either globally or per company as part of the cloud migration setup using the **GP Company Migration Configuration** page.

## Migrated fiscal periods

The *fiscal periods setup* in Dynamics GP is migrated to Business Central as *accounting periods*. Any years marked as *historical* in Dynamics GP come over to Business Central as *open* and must be closed in Business Central. If any adjustments need to be made to historical years after migrating, those adjustments can be done before closing the year.  

## Chart of accounts master records

The account number in Business Central is mapped from the main account segment from Dynamics GP. Remaining account segments are then defined as [dimensions](/dynamics365/business-central/finance-dimensions) in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. The **GP Company Migration Configuration** page asks you to enter a segment for **Dimension 1** and **Dimension 2** in the **Per Company** section. If your chart of accounts in Dynamics GP has more than two segments outside of the main segment, the other segments are automatically set up as shortcut dimensions (3-8). You can verify the setup in the **General Ledger Setup** page in Business Central.

> [!NOTE]
> Dynamics GP unit accounts, which store nonfinancial metrics, correspond to statistical accounts in Business Central. When you use the migration tool, these accounts and their balances are automatically migrated.

Let us look at an example of an account from Dynamics GP, using the year 2022 as an example:

|Account in Dynamics GP |Year|Name  |Amount  |
|-----------------------|----|------|--------|
|000-1100-00  Cash |Yes 2022 |  |  |
|     |  |Period 1| 250.00 |
|     |  |Period 2 | 117.00 |
|     |  |Period 3 |340.00 |
|000-1100-01  Cash |Yes 2022 |  |  |
|     |  |Period 1| 240.00 |
|     |  |Period 2 | 102.00 |
|     |  |Period 3 |501.00 |
|000-4000-00 Sales |Yes 2022 |  |  |
|     |  |Period 1| 490.00 |
|     |  |Period 2 | 219.00 |
|     |  |Period 3 |841.00 |

The migration creates two accounts in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], number 1100 and number 4000. Dimension values are also added: 000 for the first segment, and 00 and 01 for the last segment. General journal transactions are created as follows:

|Transaction date |Account No.|Amount  |Dimensions|
|-----------------|-----------|--------|----------|
|1/31/2022        |1100   |250.00 |Dimension 000, 00|
|1/31/2022        |1100   |240.00 |Dimension 000, 01|
|1/31/2022        |4000   |490.00 |Dimension 000, 00|
|2/28/2022        |1100   |117.00 |Dimension 000, 00|
|2/28/2022        |1100   |102.00 |Dimension 000, 01|
|2/28/2022        |4000   |219.00 |Dimension 000, 00|
|3/31/2022        |1100   |340.00 |Dimension 000, 00|
|3/31/2022        |1100   |501.00 |Dimension 000, 01|
|3/31/2022        |4000   |841.00 |Dimension 000, 00|

The data migration generates dimensions based on the different segments. For example, if the first segment is named *Department* and the last segment is named *Division*, users see a Department dimension with the value 000 and a Division dimension with the values 00 and 01.

General ledger (GL) account summary transactions are generated for open and history years that were set up in Dynamics GP and posted unless you disable auto posting. The summary amounts are created based on the fiscal periods set up in Dynamics GP. In the **GP Company Migration Configuration** page, you can select the oldest historical year you want migrated to Business Central. For example, if 2019, 2020, and 2021 are historical years in Dynamics GP, you could select that the oldest historical year you want migrated is 2020. Summary transactions for 2019 wouldn't be migrated to Business Central.

## Customer master records and outstanding transactions from the Receivables module

In the **GP Company Migration Configuration** page, you can choose to migrate all customers from Dynamics GP or only active customers. This action allows you to not migrate over customers marked as inactive. All addresses from the customer are also brought over into Business Central. The addresses on the customer are set up as shipping addresses in Business Central. Doing so allows the end user to choose the address needed when entering transactions after the migration.  

In the **GP Company Migration Configuration** page, you can also choose to migrate posting accounts on customer classes. If you choose this option, posting accounts defined on *customer classes* in Dynamics GP are migrated to Business Central as *customer posting groups*. If a customer is assigned to a customer class in Dynamics GP, the customer will be assigned to the corresponding customer posting group after migrating.

The migration tools also bring over outstanding receivables transactions when you migrate transactions, not just master data. These transactions are brought in with the amount remaining in Dynamics GP. For example, if an invoice for $1000 was entered into Dynamics GP, and it has been partially paid and has a remaining balance of $400, the invoice journal entry created in Business Central is for $400 because that's the amount remaining to be paid. All transaction types from Receivables Management are mapped to invoice, payment, or credit memo journal entries in Business Central.

### Generating recurring sales lines

The migration tools can automatically create recurring sales lines in Business Central based on sales accounts already set up in Dynamics GP. The option to create recurring sales lines is available on the **GP Company Migration Configuration** and **GP Company Migration Settings** pages and is turned off by default. The General Ledger module must also be enabled.

When enabled, the migration tools conduct the following evaluation process:

- If a customer has a sales account assigned, create a recurring sales line for that customer.
- If no customer-level account exists but the customer's class has one and customer class migration is enabled, create a recurring sales line for that customer using the class account.
- If neither of these options supplies a sales account, use the default from **Posting Accounts Setup** in Dynamics GP, if available.

Each recurring line includes a description based on the Dynamics GP account and dimensions, is linked to the correct GL account, and is configured to automatically insert on customer quotes, orders, invoices, and credit memos.

## Vendor master records and outstanding transactions from the Payables module

In the **GP Company Migration Configuration** page, you can choose whether to migrate inactive and temporary vendors from Dynamics GP. Inactive vendors are excluded by default, while temporary vendors are included. Vendor addresses are migrated to Business Central. The vendor's primary address becomes the main address for the vendor, and the remit-to address becomes a remit-to address. The primary address and other addresses that aren't the remit-to address are set up as order addresses in Business Central, which allows the end user to choose the address needed when entering transactions after the migration.

In the **GP Company Migration Configuration** page, you can also choose to migrate posting accounts on vendor classes. If you choose this option, posting accounts defined on *vendor classes* in Dynamics GP are migrated to Business Central as *vendor posting groups*. If a vendor is assigned to a vendor class in Dynamics GP, the vendor is assigned to the corresponding vendor posting group after migrating.

Active vendor EFT bank information is migrated to Business Central as vendor bank accounts. If a vendor's remit-to address contains active EFT bank information in Dynamics GP, it's used as the **Preferred Bank Account Code** on the vendor in Business Central. If no active EFT bank information exists for the remit-to address, the primary address's active EFT bank information is used instead.

The migration tools also bring over outstanding payables transactions when you migrate transactions, not just master data. These transactions are brought in with the amount remaining in Dynamics GP. For example, if an invoice for $1000 was entered into Dynamics GP, and it has been partially paid and has a remaining balance of $400, the invoice journal entry created in Business Central is for $400 because that's the amount remaining to be paid. All transaction types from Payables Management are mapped to invoice, payment, or credit memo journal entries in Business Central.

In US environments, 1099 vendor information and amounts can be migrated to Business Central. On the **GP Company Migration Configuration** page, turn on **Migrate Vendor 1099** to migrate this information. The tax type and 1099 box number are mapped to the Business Central IRS 1099 form box setup, and the Federal ID number is migrated to the vendor record. In addition, the 1099 box amounts are migrated for each 1099 vendor. If you select to migrate 1099 information, you must also indicate the calendar year in **1099 Tax Year**. The first supported year for migrating 1099 information is 2022.

You can also bring over open purchase orders. When migrating purchase orders, the migration tools use the items and the quantities remaining on those items to determine what to bring over as an open purchase order. If an item is fully received and invoiced, that item isn't migrated as an outstanding purchase order line. By bringing over open purchase orders, you don't have to enter the migrated outstanding purchase order transactions manually. Open purchase order migration requires the General Ledger, Payables, and Inventory modules.

### Generating recurring purchase lines

The migration tools can automatically create recurring purchase lines in Business Central based on purchasing accounts already set up in Dynamics GP. The option to create recurring purchase lines is available on the **GP Company Migration Configuration** and **GP Company Migration Settings** pages and is turned off by default. The General Ledger module must also be enabled.

When enabled, the migration tools conduct the following evaluation process:

- If a vendor has a purchasing account assigned, create recurring purchase lines for that vendor, including any additional purchasing accounts assigned to the vendor.
- If no vendor-level account exists but the vendor's class has one and vendor class migration is enabled, create recurring purchase lines for that vendor using the class account and any additional class purchasing accounts.
- If neither of these options supplies a purchasing account, use the default from **Posting Accounts Setup** in Dynamics GP, if available.

Each recurring line includes a description based on the Dynamics GP account and dimensions. The line is linked to the correct GL account and is configured to automatically insert on vendor quotes, orders, invoices, and credit memos.

## Inventory item master records

Inventory is imported with the cost valuation method that is set in GP at the time the migration is run. Location information and the quantity on hand for each item are migrated unless you select master data only. If serial or lot information is tracked on an item, that information is also migrated.

In the **GP Company Migration Configuration** page, you can choose to migrate posting accounts on item classes. If you choose this option, posting accounts that are defined on *item classes* in Dynamics GP are migrated to Business Central as *inventory posting groups*. If an item is assigned to an item class in Dynamics GP, the item will be assigned to the corresponding inventory posting group after migrating. If you only want to migrate active items, you can choose to exclude inactive items in the **GP Company Migration Configuration** page. Also, you can choose if you don't want to migrate discontinued items.  

## Inventory units of measure

In Business Central, there isn't a direct equivalent to the **Unit of Measure Schedules** table (IV40201) found in Dynamics GP. Schedules aren't actually units of measure; they're an ID in Dynamics GP that holds a group of units of measure. Business Central doesn't have UofM Schedules. It only stores units of measure that would be in the GP table IV40202. However, Business Central does allow you to set up and manage multiple units of measure for items.

You can define a base unit of measure for each item and then create alternate units of measure for purchasing, production, or sales. These alternate units of measure can be used to specify how many units of the base unit of measure are handled in different processes.
Learn more in [Set up item units of measure](/dynamics365/business-central/inventory-how-setup-units-of-measure).

## Checkbook transaction and master data

You can choose to migrate all checkbooks from Dynamics GP or only active checkbooks. Unless you select bank master data only, the migration tools create a journal entry for a nonzero last reconciled balance and migrate nonzero unreconciled bank transactions to Business Central so that you can reconcile your checkbooks after migrating. Any posted cash receipt should also be deposited in GP before migrating, because undeposited receipts aren't migrated.

## GP historical snapshot

On the **GP Company Migration Configuration** page, you can select if you want to migrate historical information from GP into Business Central. This migrated data is then visible in list pages found under the corresponding entities by selecting **GP Detail Snapshot**. You can indicate if you want to migrate GL detail, receivables, payables, purchase order receipts, and inventory transactions. The **AR Transactions** option also includes Sales Order Processing history. The data is stored in extension tables in Business Central. Data stored in those tables can be used in Power BI reports, Power Apps, or other non-Microsoft reporting tools. Tables containing the GP historical snapshot data include:

- Hist. G/L Account
- Hist. Gen. Journal Line
- Hist. Payables Document
- Hist. Receivables Document
- Hist. Sales Trx. Header
- Hist. Sales Trx. Line
- Hist. Purchase Recv. Header
- Hist. Purchase Recv. Line
- Hist. Inventory Trx. Header
- Hist. Inventory Trx. Line

You can limit the amount of data migrated in the snapshot by entering the earliest year in GP that you want brought over. Enter this year in the **Oldest Snapshot year** field on the **GP Company Migration Configuration** page. The selected year and later years are included.

The GP historical snapshot runs as a background process after the migration is complete. You can view its status in FactBoxes on the **Cloud Migration Management** page.

## Next steps

- [Run cloud migration setup for Dynamics GP migration](migration-setup-gp.md)
- [Configure Dynamics GP company migration](migrate-gp-configure-companies.md)
- [Run and manage data replication](migrate-data-replication-run.md)
- [Upgrade data for Dynamics GP cloud migration](migration-data-upgrade-gp.md)
- [Validate Dynamics GP data migration](migrate-gp-validation.md)
- [Complete Dynamics GP cloud migration to Business Central online](migration-finish-gp.md)

## Related information

[Dynamics GP migration to Business Central online: End-to-end overview](migrate-gp-overview.md)  
[Compare work processes in Dynamics GP to Business Central](migrate-dynamics-gp-videos.md)

[FAQ about migrating to Business Central online from on-premises solutions](faq-migrate-data.md)
