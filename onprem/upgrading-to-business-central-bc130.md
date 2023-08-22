---
title: "Upgrading to Microsoft Dynamics 365 Business Central"
ms.custom: na
ms.reviewer: edupont
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
ms.date: 01/23/2019
---
# Upgrading to [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

This article provides an overview of how to upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. The upgrade process depends on different factors, including on your decision to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises or move your solution online.

## Upgrading to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises

The upgrade process depends on different factors, such as the version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] that you are upgrading from, and the degree to which your solution differs from the standard version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)]. The mains tasks range from converting the database to upgrading application code and data.

Use the following table to determine the procedures that you must complete for your upgrade scenario:

|  Scenario  |  Procedures  |
|------------|--------------|
|Full upgrade from one of the following versions:<ul><li>  [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li></ul>|<ol><li>[Upgrading the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrading the Data](Upgrading-the-Data.md)</li></ol>|
|Full upgrade from one of the following versions:<ul><li>[!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]</li><li>[!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]</li></ul>|<ol><li>Upgrade to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)].</br></br>For more information, see [Upgrading to Microsoft Dynamics NAV 2018](/dynamics-nav/upgrading-to-microsoft-dynamics-nav).</li><li>[Upgrading the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrading the Data: Single-Tenant Deployment](Upgrading-the-Data.md) or [Upgrading the Data: Multitenant Deployment](Upgrading-the-Data-Multitenant.md)</li></ol>|
|Full upgrade from one of the following versions:<ul><li>  [!INCLUDE[nav2009sp1](../developer/includes/nav2009sp1_md.md)]</li><li>[!INCLUDE[nav2009r2](../developer/includes/nav2009r2_md.md)]</li><li>  [!INCLUDE[nav_5](../developer/includes/nav_5_md.md)]</li><li>   [!INCLUDE[nav_4](../developer/includes/nav_4_md.md)]</li></ul>|<ol><li>Upgrade to [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)].</br></br>For more information, see [Upgrading to Microsoft Dynamics NAV 2013](https://go.microsoft.com/fwlink/?LinkId=510382) in the MSDN Library.</br></br>Alternatively, you can upgrade from [!INCLUDE[nav2009sp1](../developer/includes/nav2009sp1_md.md)] or [!INCLUDE[nav2009r2](../developer/includes/nav2009r2_md.md)] to [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)] as described on the [Dynamics NAV Team Blog](https://blogs.msdn.microsoft.com/nav/2014/11/09/cumulative-update-1-for-microsoft-dynamics-nav-2015-has-been-released/).</li><li>[Upgrading the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrading the Data](Upgrading-the-Data.md)</li></ol>After the upgrade, links between interaction records and logged email messages is lost. To resolve this issue, the administrator has to log all mails again to restore the links. For more information, see [Logging Interaction Links are Lost When You Upgrade from Microsoft Dynamics NAV 2009 R2](https://msdn.microsoft.com/library/hh167032%28v=nav.90%29.aspx#LoggingInteractionLinks).|
|Platform-only upgrade of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] or [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to a new platform version, such as with a cummulative update|<ul><li>[Technical Upgrade](Converting-a-Database.md)</li></ul></br>You can also use this procedure to convert a database to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] technical requirements, and then upgrade the application and data later.|  

Before you begin the upgrade process, see [Upgrade Considerations](Upgrade-Considerations.md) for tips about things to consider when you prepare to upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].
<!--
## Automating the Upgrade Process using Sample Windows PowerShell Scripts
You can use [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] scripts to help you upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. You can use automation to upgrade a single [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database as well as multiple [!INCLUDE[navnow](../developer/includes/navnow_md.md)] databases that use the same application. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] provides sample scripts that you can adapt for your deployment architecture.
For more information, see[Automating the Upgrade Process using Sample Windows PowerShell Scripts]().-->  

## Moving to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online

If you want to move your current solution to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, the path depends on your current solution. In all cases, it's a mater of migration rather than upgrade due to the nature of online services. The core scenario is to import existing data to an empty company in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant. For more information, see [Take prospects and customers online](../deployment/deployment.md#take-prospects-and-customers-online).  

Use the following table to determine the procedures that you must complete for your migration scenario:

|  Scenario  |  Procedures  |
|------------|--------------|
|Upgrade from [!INCLUDE[navnow](../developer/includes/navnow_md.md)]|Upgrade the code as described in [Upgrading to Business Central on-premises](#upgrading-to--on-premises) and then move to an online tenant. </br>For more information, see [Upgrading from Dynamics NAV to Business Central online](upgrade-considerations.md#upgrading-from--to--online).|
|Set up a company based on questionnaires|Use RapidStart Services. </br>For more information, see [Setting Up a Company With RapidStart Services](/dynamics365/business-central/admin-set-up-a-company-with-rapidstart?toc=/dynamics365/business-central/dev-itpro/toc.json).|
|Import data from any system|Use Excel or configuration packages to import data. </br>For more information, see [Importing Business Data from Other Finance Systems](/dynamics365/business-central/across-import-data-configuration-packages?toc=/dynamics365/business-central/dev-itpro/toc.json).|
|Import data from Dynamics GP|Use the data migration wizard to import master data. </br>For more information, see [The Dynamics GP Data Migration Extension](/dynamics365/business-central/ui-extensions-dynamicsgp-data-migration?toc=/dynamics365/business-central/dev-itpro/toc.json).|
|Import data from Intuit QuickBooks|Use the data migration wizard to import master data. </br>For more information, see [The QuickBooks Data Migration Extension](/dynamics365/business-central/ui-extensions-quickbooks-data-migration?toc=/dynamics365/business-central/dev-itpro/toc.json).|

## See Also

[Product and Architecture Overview](../deployment/Product-and-Architecture-Overview.md)  
[Migrating to Multitenancy](../deployment/Migrating-to-Multitenancy.md)  
[Deployment](../deployment/Deployment.md)  
