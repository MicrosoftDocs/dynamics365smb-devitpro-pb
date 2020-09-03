---
title: "FAQ about developer and IT-Pro experiences"
description: Get answers to some of your questions about deploying or administering Business Central.
author: edupont04
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 09/03/2020
---

# FAQ for Dynamics 365 Business Central

The following sections guide you to frequently asked questions about [!INCLUDE[prodshort](includes/prodshort.md)].

- Visit [FAQ about Developing in AL](developer/devenv-dev-faq.md) for questions and answers related to developing extensions in AL.
- Visit [FAQ on Managing and submitting your business central offer](developer/app-faq-offer.md) in Partner Center.
- Visit [FAQ about Library and Dependency Apps](developer/app-faq-dependencies-libraries.md) to learn about differences between library and dependency apps.
- Visit [FAQ about Updating your App](developer/app-faq-update.md) to get answers to questions on tenants, versioning, and compatibility.
- Visit [FAQ about Testing your App](developer/app-faq-test.md) to learn about testing before submitting an app.
- Visit [FAQ about Update Lifecycle for AppSource Apps](developer/devenv-update-app-life-cycle-faq.md) for questions and answers related to the validation process.
- Visit [FAQ about Connecting to the Intelligent Cloud from On-Premises Solutions](administration/faq-intelligent-cloud.md) to learn about what is supported.
- Visit [FAQ about the Windows Client](faq-win-cli.md) to learn about support for the [!INCLUDE[prodshort](includes/prodshort.md)] Windows client.
- Visit [FAQ about Signing Up and Using](/dynamics365/business-central/across-faq) for questions about signing up for and using [!INCLUDE[prodshort](includes/prodshort.md)] in the business functionality content for.


Working with processes and UI in [!INCLUDE[prodshort](includes/prodshort.md)] here you can find answers to some of the most frequently asked questions:

- Visit [Copy Paste FAQ](/dynamics365/business-central/ui-copy-paste) for tips on copying and pasting.
- Visit [Tell Me FAQ](/dynamics365/business-central/ui-search-faq) for guidance on using search.
- Visit [List Views FAQ](/dynamics365/business-central/ui-views-faq) to find answers on list views.
- Visit [Searching and Filtering FAQ](/dynamics365/business-central/ui-search-filter-faq) to learn about setting filters on data.

Below find some of our top-most frequently asked questions for developer and ITPro experiences.

## Is [!INCLUDE[prodshort](includes/prodshort.md)] available in my country?

[!INCLUDE[prodshort](includes/prodshort.md)] is available in a limited number of markets, but new countries are added through Microsoft-led localization or through partner-led localization on a quarterly basis. For more information, see [Countries and Translations Supported](compliance/apptest-countries-and-translations.md).  

## How often is [!INCLUDE[prodshort](includes/prodshort.md)] updated?

[!INCLUDE [prodshort](developer/includes/prodshort.md)] online is governed by [Microsoft's Modern Lifecycle Policy](https://support.microsoft.com/help/30881). This means continuous service updates and a major update every 6 months. For more information, see [Dynamics 365 Business Central Service Compliance](/dynamics365/business-central/compliance/compliance-service-compliance) and [Dynamics 365 release schedule and early access](/dynamics365/get-started/release-schedule).  

You can get an overview of new and upcoming changes in the [Dynamics 365 release plans](https://aka.ms/businessappsreleasenotes).  

For information about lifecycle support for [!INCLUDE [prodshort](includes/prodshort.md)] on-premises, see [Software Lifecycle Policy and Dynamics 365 Business Central On-Premises Updates](terms/lifecycle-policy-on-premises.md).  

## How often are production databases backed up?

Databases are protected by automatic backups that are retained for 30 days. As an administrator, you cannot access or manage these backups because they are managed automatically by Microsoft. For more information about the underlying technology, see [Automatic backups](/azure/sql-database/sql-database-automated-backups).

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

For [!INCLUDE [prodshort](developer/includes/prodshort.md)] online, there is a limit to how much database storage capacity we allow each tenant to use for their environments (databases). If a tenant exceeds this limit, we limit administrative actions that create additional environments. Exceeding the storage limit will not interrupt transaction processing within the existing environments.

The maximum database size for each [!INCLUDE [prodshort](developer/includes/prodshort.md)] customer's tenant is 80 GB. The limit is applied to the entire Azure Active Directory  tenant, including all environments of type production or sandbox, not to individual environments. Customers can purchase additional database capacity through their CSP partner. 

When customers purchase additional [!INCLUDE [prodshort](developer/includes/prodshort.md)] production environments, their overall, tenant-wide database capacity quota is extended by 4 GB.  

## Is the Windows client supported?

The first releases of Business Central on premises included an installed client derived from Microsoft Dynamics NAV. Starting with 2019 release wave 2, this legacy component, referred to as "the Windows client", will no longer be available for [!INCLUDE[prodshort](includes/prodshort.md)]. For more information, see [FAQ About the Windows Client and Business Central](faq-win-cli.md).  

## What's going on with the Help?

If you have a background with [!INCLUDE [navnow_md](developer/includes/navnow_md.md)], you will find that in-product Help is very different in [!INCLUDE [prodshort](developer/includes/prodshort.md)]. For more information, see [[!INCLUDE[prodlong](developer/includes/prodlong.md)] User Assistance Model](user-assistance.md).

## See Also

[FAQ for Developing in AL](developer/devenv-dev-faq.md)  
[Features not implemented in on-premises deployments of [!INCLUDE[prodlong](includes/prodlong.md)]](features-not-implemented-on-premises.md)  
[Software Lifecycle Policy and Dynamics 365 Business Central On-Premises Updates](terms/lifecycle-policy-on-premises.md)  
[Dynamics 365 Business Central Compliance](/dynamics365/business-central/compliance/compliance-overview)  
[FAQ for Dynamics 365 Update Policies](/dynamics365/get-started/faq-update-policy)  
[Dynamics 365 Resources](https://dynamics.microsoft.com/resources/)  
[Welcome to [!INCLUDE[prodlong](includes/prodlong.md)]](/dynamics365/business-central/index)  
