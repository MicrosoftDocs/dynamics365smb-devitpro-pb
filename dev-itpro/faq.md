---
title: "FAQ about developer and IT-Pro experiences"
description: Get answers to some of your questions about deploying or administering Business Central.
author: edupont04
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 12/12/2019
---
# Frequently Asked Questions for Dynamics 365 Business Central Developer and ITPro Experiences

This section contains answers to frequently asked questions about developing for and administering [!INCLUDE[prodlong](includes/prodlong.md)].  

> [!TIP]
> If you are looking for frequently asked questions about signing up for and using [!INCLUDE[prodshort](includes/prodshort.md)], see [Frequently Asked Questions](/dynamics365/business-central/across-faq) in the business functionality content for [!INCLUDE[prodshort](includes/prodshort.md)].

## Is [!INCLUDE[prodshort](includes/prodshort.md)] available in my country?

[!INCLUDE[prodshort](includes/prodshort.md)] is available in a limited number of markets, but new countries are added through Microsoft-led localization or through partner-led localization on a quarterly basis. For more information, see [Countries and Translations Supported](compliance/apptest-countries-and-translations.md).  

## How often is [!INCLUDE[prodshort](includes/prodshort.md)] updated?

[!INCLUDE [prodshort](developer/includes/prodshort.md)] online is governed by [Microsoft's Modern Lifecycle Policy](https://support.microsoft.com/help/30881). This means continuous service updates and a major update every 6 months. For more information, see [Dynamics 365 Business Central Service Compliance](/dynamics365/business-central/compliance/compliance-service-compliance) and [Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule).  

You can get an overview of new and upcoming changes in the [Dynamics 365 release plans](https://aka.ms/businessappsreleasenotes).  

For information about lifecycle support for [!INCLUDE [prodshort](includes/prodshort.md)] on-premises, see [Software Lifecycle Policy and Dynamics 365 Business Central On-Premises Updates](terms/lifecycle-policy-on-premises.md).  

## How often are production databases backed up?

Databases are protected by automatic backups. Full database backups are done weekly, differential database backups are done hourly, and transaction log backups are done every five minutes. Automatic backups are retained for 14 days.

As an administrator, you you cannot access or manage these backups because they are managed automatically by Microsoft. For more information about the underlying technology, see [Learn about automatic SQL Database backups](/azure/sql-database/sql-database-automated-backups).

## Can I request a copy of the backup of my production database?

No, but from the Business Central administration center, you can export the database for Business Central online environments as .bacpac files to an Azure storage container. For more information, see [Exporting Databases](administration/tenant-admin-center-database-export.md).  

## Can I get training in Business Central?

Yes, you can. You can find free eLearning content on the [Microsoft Learn site](/learn/browse/?products=dynamics-business-central). As a partner, you also have access to the Dynamics Learning Portal, where you can find older eLearning courses for [!INCLUDE[prodshort](includes/prodshort.md)]. For more information, see the [Microsoft Dynamics 365 training page](/dynamics365/get-started/training/index#dynamics-365-partners).  

## How do I help my customer configure their environment?

You can find guidance for setting up [!INCLUDE [prodshort](developer/includes/prodshort.md)] in the application content. For more information, see [Setting Up Business Central](/dynamics365/business-central/setup).  

You can also find relevant content on the [Microsoft Learn site](/learn/browse/?products=dynamics-business-central).

For more information, see [Take prospects and customers online](deployment/deployment.md#take-prospects-and-customers-online)

## How can I troubleshoot my customers' online tenants?

You can use the **Help and Support** page in your customers' tenants to find technical information, and they can use that page to contact you. You can also create a sandbox environment and use Visual Studio Code to debug that. For more information, see [Managing Technical Support](administration/manage-technical-support.md).  

## How does Microsoft handle database sizes?

For [!INCLUDE [prodshort](developer/includes/prodshort.md)] online, there is a limit to how much data we allow each tenant to store in the environment (database). If a tenant exceeds this limit, we contact the partner and work with them to reduce the size of the data.  

The limit for the size of each environment's data in [!INCLUDE [prodshort](developer/includes/prodshort.md)] is currently set to 80 GB.

## Is the Windows client supported?
The first releases of Business Central on premises included an installed client derived from Microsoft Dynamics NAV. Starting with 2019 release wave 2, this legacy component, referred to as "the Windows client", will no longer be available for [!INCLUDE[prodshort](includes/prodshort.md)]. For more information, see [FAQ About the Windows Client and Business Central](faq-win-cli.md).  

## See Also

[FAQ for Developing in AL](developer/devenv-dev-faq.md)  
[Features not implemented in on-premises deployments of [!INCLUDE[prodlong](includes/prodlong.md)]](features-not-implemented-on-premises.md)  
[Software Lifecycle Policy and Dynamics 365 Business Central On-Premises Updates](terms/lifecycle-policy-on-premises.md)  
[Dynamics 365 Business Central Compliance](/dynamics365/business-central/compliance/compliance-overview)  
[FAQ for Dynamics 365 Update Policies](/dynamics365/get-started/faq-update-policy)  
[Dynamics 365 Resources](https://dynamics.microsoft.com/resources/)  
[Welcome to [!INCLUDE[prodlong](includes/prodlong.md)]](/dynamics365/business-central/index)  
