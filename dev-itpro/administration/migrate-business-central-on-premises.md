---
title: Migrate to Business Central online from on-premises
description: Get a cloud tenant so you can migrate to the cloud from your on-premises deployment of Business Central.

author: jenolson
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms. search.keywords: cloud, edge,
ms.date: 02/17/2021
ms.author: edupont

---

# Migrate to Business Central Online from Business Central On-premises

Your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises solution can have an identical twin in a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online tenant. Use this twin to migrate to the cloud, or use it to connect to intelligent cloud scenarios. The migration can be started quite easily from the assisted setup wizard in your on-premises solution.  

> [!NOTE]
> [!INCLUDE [bc-cloud-versions](../includes/bc-cloud-versions.md)] Alternatively, you can upgrade to the current version and then migrate to the cloud. For more information, see [Supported Upgrade Paths to Business Central Releases](../upgrade/upgrade-paths.md).

To verify that you are running on a version that supports this migration, in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], open the environment that you intend to migrate your data to, and then choose the **Apps** action. Make sure that these apps have the latest updates installed:

* Intelligent Cloud Base
* Business Central Intelligent Cloud

If you are migrating from an earlier supported version, you must also make sure that the following apps are updated:

* Business Central Cloud Migration – Previous Release
* Business Central Cloud Migration – Previous Release [code for your country-specific version]

For more information, see [Managing Apps](tenant-admin-center-manage-apps.md).  

## Migrating data from extensions

When your on-premises solution is connected to the cloud, it is highly recommended that you test the impact of any extension in a sandbox environment before you install the extensions in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] production tenant to help avoid any data failures or unintended consequences.  

In order to support data migration, tables and table extensions must specify if data from that table must be migrated or not. By default, the **ReplicateData** property is set to *Yes* so that, by default, any extension that is installed in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cloud tenant will have all its tables migrated.  

In certain circumstances, you may want to not migrate all data. Here are a few examples:

* The extension is installed in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant but not in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises solution

    In this case, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will attempt to migrate the data but show a warning. Since the extension is not installed on-premises, any table related to that extension table will not migrate, and warning notifications will appear in the cloud migration status page.

    If you own the extension, we recommend that you set the **ReplicateData** property to *No* on the extension tables. If you do not, and if you want data to migrate, install the extension in both your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cloud tenant and your on-premises solution. If you do not want data to migrate, uninstall the extension from your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cloud tenant.  

* The extension references a base table

    This can cause your base table to appear empty when you view data in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cloud tenant. If that happens, uninstall the extension from your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] cloud tenant, and then run the cloud migration process again.

### Data that is not migrated

During the data migration process, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] does not migrate most system tables, users, and permissions.  

## Upgrading to a new version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

If you upgrade to a new version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on-premises, including a cumulative update, then you must update the extensions as well. Depending on your on-premises solution, your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] tenant contains different extensions for the cloud migration. For more information, see [Business Central Intelligent Cloud Extensions](/dynamics365/business-central/ui-extensions-data-replication?toc=/dynamics365/business-central/dev-itpro/toc.json).  

> [!IMPORTANT]
> In your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online tenant, install, publish, or upgrade the **Intelligent Cloud Base** extension first, and then the product-specific extension or extensions.

Also, at the end of the upgrade, you must make sure that the `applicationVersion` field in the `ndo$tenantdatabaseproperty` table is set to the right version. If the field is blank, or if it is set to an older version than the migration tool supports, the migration cannot run. For more information, see [Post-upgrade tasks](../upgrade/upgrade-unmodified-application-v14-v17.md#post-upgrade-tasks).  

## See also

[Migration On-premises Data to Business Central online](migrate-data.md)  
[Connect to the Intelligent Cloud from On-Premises](./migration-tool.md)  
[Managing your Intelligent Cloud Environment](./migration-management.md)  
[ReplicateData Property](../developer/properties/devenv-replicatedata-property.md)  
[Intelligent Insights with Business Central](/dynamics365/business-central/about-intelligent-cloud)  
[Migrate Legacy Help to the [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Format](../upgrade/migrate-help.md)  
[Upgrading from Dynamics NAV to Business Central Online](../upgrade/Upgrade-Considerations.md#online)  
[Important Information and Considerations for Before Upgrading to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Spring 2019](../upgrade/Upgrade-Considerations.md)