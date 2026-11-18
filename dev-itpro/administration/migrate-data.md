---
title: Business Central Online Data Migration Overview
description: Learn to set up cloud data migration to Business Central online from supported Dynamics versions and Business Central on-premises, managed by Azure Data Factory.
author: jswymer
ms.topic: overview
ms.reviewer: solsen
ms.search.keywords: cloud, edge
ms.search.form: 2502, 4003
ms.date: 11/17/2026
ms.author: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Migrate on-premises data to Business Central online

Organizations that run their workloads on-premises but are looking to move to the cloud can easily migrate to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online. By moving to the cloud, users get the benefits of cloud scenarios such as machine learning, Power BI, and Power Automate to drive suggested actions.

If you're not familiar with [!INCLUDE [prod_short](../includes/prod_short.md)] online, learn more in [Business Central trials and subscriptions](/dynamics365/business-central/across-preview?toc=/dynamics365/business-central/dev-itpro/toc.json).

## Supported migration paths

[!INCLUDE [bc-cloud-products](../includes/bc-cloud-products.md)]

If a customer is migrating from a non-SQL source, you can use configuration packages and templates to migrate their data to [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises. After that, use the cloud migration tool to switch to [!INCLUDE [prod_short](../includes/prod_short.md)] online. Learn more in [Set up company configuration packages](set-up-standard-company-configuration-packages.md).

> [!TIP]
> Customers coming from QuickBooks can use apps from Microsoft to move to [!INCLUDE [prod_short](../includes/prod_short.md)] online. Learn more in [Change from a QuickBooks app to Dynamics 365 Business Central](/dynamics365/business-central/across-quickbooks-to-business-edition).

## Next steps

The migration process, including the data flow and tasks that must be done to prepare and run the cloud migration, is similar for Business Central, Dynamics GP, and Dynamics SL. But there are some differences. To continue, select the link that matches your on-premises product:

### Full data migration

Use these paths for a full migration of supported business data to Business Central online:

- [Business Central on-premises to online migration](migrate-business-central-on-premises.md)
- [Dynamics GP migration to Business Central online](migrate-gp-overview.md)
- [Dynamics SL migration to Business Central online](migrate-sl-overview.md)
- [Migrate Dynamics NAV to Business Central online](migrate-nav.md)

### Reimplementation from Business Central 14

Use this path if you want a fresh start without carrying forward legacy customizations:

- [Business Central 14 reimplementation (preview)](migrate-bc14-reimplementation.md): Migrates selected business data from Business Central 14, including master data, opening balances, setup, and supported open transactions. It can also migrate selected historical data.

### Custom migrations

Use this path to migrate from any SQL-based source:

- [Custom migration from any SQL source](cloud-migration-custom-migration.md)

### Learn more

- [Forrester Report: Total economic impact of a migration to Business Central](https://go.microsoft.com/fwlink/?linkid=2292320)

## Related information

[FAQ about migrating to the cloud from on-premises solutions](faq-migrate-data.md)
