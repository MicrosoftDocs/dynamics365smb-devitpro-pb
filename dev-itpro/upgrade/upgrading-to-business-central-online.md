---
title: "Upgrading to Microsoft Dynamics 365 Business Central Online"
description: Describes how to upgrade to Business Central Online
ms.custom: na
ms.reviewer: edupont
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
ms.date: 10/01/2020
---
# Upgrading to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Online

If you want to move your current solution to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, the path depends on your current solution. In most cases, it's a matter of migration rather than upgrade due to the nature of online services. The core scenario is to import existing data to an empty company in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant. For more information, see [Take prospects and customers online](../deployment/deployment.md#take-prospects-and-customers-online).  

Use the following table to determine the procedures that you must complete for your migration scenario:

|  Scenario  |  Procedures  |
|------------|--------------|
|Upgrade from [!INCLUDE[navnow](../developer/includes/navnow_md.md)]|Upgrading from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online is fully supported, but there are a number of considerations that you must make.</br>For more information, see [Upgrading from Dynamics NAV to Business Central online](upgrade-considerations.md#online).|
|Set up a company based on questionnaires|Use RapidStart Services. </br>For more information, see [Setting Up a Company With RapidStart Services](/dynamics365/business-central/admin-set-up-a-company-with-rapidstart?toc=/dynamics365/business-central/dev-itpro/toc.json).|
|Import data from any system|Use Excel or configuration packages to import data. </br>For more information, see [Importing Business Data from Other Finance Systems](/dynamics365/business-central/across-import-data-configuration-packages?toc=/dynamics365/business-central/dev-itpro/toc.json).|
|Import data from Dynamics GP|Use the data migration wizard to import master data. </br>For more information, see [Migrate to Business Central Online from Dynamics GP](../administration/migrate-dynamics-gp.md).|
|Import data from Intuit QuickBooks|Use the data migration wizard to import master data. </br>For more information, see [The QuickBooks Data Migration Extension](/dynamics365/business-central/ui-extensions-quickbooks-data-migration?toc=/dynamics365/business-central/dev-itpro/toc.json).|

## Upgrading to the latest version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

[!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, is a managed environment where Microsoft manages the upgrade process. You can specify upgrade windows in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], and Microsoft will notify you if your tenant runs into problems during the upgrade. For more information, see [How often is [!INCLUDE[prod_short](../developer/includes/prod_short.md)] updated?](../faq.yml#how-often-is--updated).  

> [!NOTE]
> The concept of technical upgrades that you might have been used to in on-premises deployments is not supported in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online.

## See Also

[Migrating On-Premises Data to Business Central Online](../administration/migrate-data.md)  
[Upgrading to [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](upgrading-to-business-central.md)  
[Upgrading to [!INCLUDE[prod_long](../developer/includes/prod_long.md)] On-Premises](upgrading-to-business-central-on-premises.md)  
[The Lifecycle of Apps and Extensions for Business Central](../developer/devenv-app-life-cycle.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Administration of Business Central Online](../administration/tenant-administration.md)  
[Product and Architecture Overview](../deployment/Product-and-Architecture-Overview.md)  
[Deployment](../deployment/Deployment.md)  
