---
title: "Upgrading to Microsoft Dynamics 365 Business Central On-Premises"
ms.custom: na
ms.reviewer: edupont
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
ms.date: 04/01/2020
---
# Upgrading to [!INCLUDE[prodlong](../developer/includes/prodlong.md)] On-Premises

The upgrade process depends on different factors, such as the version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] that you are upgrading from, and the degree to which your solution differs from the standard version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)]. The mains tasks range from converting the database to upgrading application code and data.

Use the following table to determine the procedures that you must complete for your upgrade scenario:

|  Scenario  |  Tasks  |
|------------|--------------|
|Full upgrade from one of the following versions:<ul><li>  [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]</li><li>[!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]</li><li>[!INCLUDE[nav2017](../developer/includes/nav2017.md)]</li><li>[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]</li><li>[!INCLUDE[prodshort](../developer/includes/prodshort.md)] October 2018</li></ul>|From these versions, you can upgrade directly to the latest version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] by following these tasks:<ol><li>[Upgrade the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrade the Data](Upgrading-the-Data.md)</li></ol>|
|Full upgrade from one of the following versions:<ul><li>[!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]</li><li>[!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]</li></ul>|<ol><li>Upgrade to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)].</br></br>For more information, see [Upgrading to Microsoft Dynamics NAV 2018](/dynamics-nav/upgrading-to-microsoft-dynamics-nav).</li><li>Upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].<ol><li>[Upgrade the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrade the Data: Single-Tenant Deployment](Upgrading-the-Data.md) or [Upgrade the Data: Multitenant Deployment](Upgrading-the-Data-Multitenant.md)</li></ol></li></ol>|
|Full upgrade from one of the following versions:<ul><li>  [!INCLUDE[nav2009sp1](../developer/includes/nav2009sp1_md.md)]</li><li>[!INCLUDE[nav2009r2](../developer/includes/nav2009r2_md.md)]</li><li>  [!INCLUDE[nav_5](../developer/includes/nav_5_md.md)]</li><li>   [!INCLUDE[nav_4](../developer/includes/nav_4_md.md)]</li></ul>|There are two different upgrade paths to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], depending on the version you are upgrading from. For [!INCLUDE[nav_5](../developer/includes/nav_5_md.md)] and [!INCLUDE[nav_4](../developer/includes/nav_4_md.md)], you must go through [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]. For [!INCLUDE[nav2009sp1](../developer/includes/nav2009sp1_md.md)] and [!INCLUDE[nav2009r2](../developer/includes/nav2009r2_md.md)], you can choose to go through [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)] or [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]<br /><br />**Through [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]**<ol><li>Upgrade to [!INCLUDE[nav7long](../developer/includes/nav7long_md.md)].</br></br>For more information, see [Upgrading to Microsoft Dynamics NAV 2013](https://go.microsoft.com/fwlink/?LinkId=510382) in the MSDN Library.</li><li>Upgrade to [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)].</br></br>For more information, see [Upgrading to Microsoft Dynamics NAV 2018](/dynamics-nav/upgrading-to-microsoft-dynamics-nav).</li><li>Upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].<ol><li>[Upgrade the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrade the Data: Single-Tenant Deployment](Upgrading-the-Data.md) or [Upgrade the Data: Multitenant Deployment](Upgrading-the-Data-Multitenant.md)</li></ol></li></ol><br /><br />**Through [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]**<ol><li>Upgrade to [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)].</br></br>For more information, see  [Dynamics NAV Team Blog](https://blogs.msdn.microsoft.com/nav/2014/11/09/cumulative-update-1-for-microsoft-dynamics-nav-2015-has-been-released/).</li><li>Upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].<ol><li>[Upgrade the Application Code](Upgrading-the-Application-Code.md)</li><li>[Upgrade the Data: Single-Tenant Deployment](Upgrading-the-Data.md) or [Upgrade the Data: Multitenant Deployment](Upgrading-the-Data-Multitenant.md)</li></ol></li></ol>After the upgrade, links between interaction records and logged email messages is lost. To resolve this issue, the administrator has to log all mails again to restore the links. For more information, see [Logging Interaction Links are Lost When You Upgrade from Microsoft Dynamics NAV 2009 R2](https://msdn.microsoft.com/library/hh167032%28v=nav.90%29.aspx#LoggingInteractionLinks).|
|Platform-only upgrade of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] or [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to a new platform version, such as with a cummulative update|<ul><li>[Technical Upgrade](Converting-a-Database.md)</li></ul></br>You can also use this procedure to convert a database to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] technical requirements, and then upgrade the application and data later.|  

Before you begin the upgrade process, see [Important Information and Considerations for Before Upgrading ](Upgrade-Considerations.md) for tips about things to consider when you prepare to upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)].
<!--
## Automating the Upgrade Process using Sample Windows PowerShell Scripts
You can use [!INCLUDE[wps_2](../developer/includes/wps_2_md.md)] scripts to help you upgrade to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. You can use automation to upgrade a single [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database as well as multiple [!INCLUDE[navnow](../developer/includes/navnow_md.md)] databases that use the same application. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] provides sample scripts that you can adapt for your deployment architecture.
For more information, see[Automating the Upgrade Process using Sample Windows PowerShell Scripts]().-->  

## See Also

[Upgrading to [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](upgrading-to-business-central.md)  
[Upgrading to [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Online](upgrading-to-business-central-online.md)
[Product and Architecture Overview](../deployment/Product-and-Architecture-Overview.md)  
[Migrating to Multitenancy](../deployment/Migrating-to-Multitenancy.md)  
[Deployment](../deployment/Deployment.md)  
