---
title: "FAQ about Windows Client and Business Central"
description: Get answers to why the Windows client is no longer supported with Business Central.
author: edupont04
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 04/01/2021
---
# FAQ About the Windows Client and Business Central

The first releases of [!INCLUDE[prod_short](includes/prod_short.md)] on premises included an installed client derived from Dynamics NAV. Starting with 2019 release wave 2, this legacy component, referred to as "the Windows client", will no longer be available for [!INCLUDE[prod_short](includes/prod_short.md)]. Find answers for some of the most common questions here.

## I have heard "modern clients only". What is this about?  
Businesses and users want to be reassured that only the newest, most advanced, and up-to-date tools are being used to access their data. With [!INCLUDE[prod_short](includes/prod_short.md)] 2019 release wave 2, released October 2019, users switch to the **modern experience** in the browser ("the web client"), the Android or iOS mobile apps, or the Windows 10 desktop app, which are available through the respective stores.

Connecting the Windows client to [!INCLUDE[prod_short](includes/prod_short.md)] is not supported in [!INCLUDE[prod_short](includes/prod_short.md)] 2019 release wave 2 and onwards.

## Why is Microsoft discontinuing the Windows client?
Our customers must feel comfortable that the tools they use are fit for new hardware, operating systems, and changing environments. We have accelerated our investment in speed and productivity features for the modern clients, thereby achieving a major milestone in its transformation into a world-class desktop experience for both new and expert users.

While the Windows client was inherently bound to the Windows operating system, the modern clients allow us to reach more customers and more users within an organization, no matter their platform or device of choice. The latest technologies allow us to innovate at a rapid pace and respond to accelerating compliance requirements, the changing technology landscape, and requests from the community. In addition, the lower installation footprint on client devices makes it easier for IT departments and hosters to maintain and support their user base.

## When is the Windows client discontinued in Business Central?
From **October 2019**, with [!INCLUDE[prod_short](includes/prod_short.md)] 2019 release wave 2.

It was first announced in 2018 at various conferences and then with a detailed timeline earlier in 2019. For more information, see [[!INCLUDE[prod_short](includes/prod_short.md)] April 2019 Update and the road ahead](https://community.dynamics.com/business/b/businesscentraldevitpro/posts/business-central-april-2019-release).

## Will the Windows client still be supported in older releases of Business Central and Dynamics NAV?
Yes. You can safely continue to use the Windows client on premises and receive support as long as you follow the lifecycle policy for your on-premises installations of [!INCLUDE[prod_short](includes/prod_short.md)]. For more information, see [Lifecycle FAQ - Dynamics](https://support.microsoft.com/help/17920/lifecycle-faq-dynamics).

The Windows client **remains supported** for the [!INCLUDE[prod_short](includes/prod_short.md)] April 2019 release and all earlier releases of [!INCLUDE[prod_short](includes/prod_short.md)] on premises and Dynamics NAV, in accordance with the support lifecycle process.

## Does this impact me if I use Business Central online?
No. This change only impacts on-premises installations because the Windows client was only available on premises.

## Does this impact me if I use Business Central on premises?
Yes. When you **choose to upgrade** to [!INCLUDE[prod_short](includes/prod_short.md)] 2019 release wave 2 or later, you must switch to access [!INCLUDE[prod_short](includes/prod_short.md)] using one of the modern clients. The most popular choice on desktop computers is the web-browser client where your browser is pointing to an on-premises web server using a URL, such as this example (not active): `https://myserver.mydomain.com/BC170`  

## What if I really want to have an installable component or at least an icon on my desktop?
You can always add a browser shortcut on your desktop or pin the web page with [!INCLUDE[prod_short](includes/prod_short.md)] to your Windows task bar. Alternatively, the [!INCLUDE[prod_short](includes/prod_short.md)] Windows 10 desktop app, which is available from Microsoft Store, is a great way to access [!INCLUDE[prod_short](includes/prod_short.md)] both online and on-premises. To get the app, go to [Microsoft Dynamics 365 [!INCLUDE[prod_short](includes/prod_short.md)]](https://www.microsoft.com/p/microsoft-dynamics-365-business-central/9nblggh4ql79?rtc=1&activetab=pivot:overviewtab) in the store.

## How does this impact mobile?
There is **no impact** on mobile apps for [!INCLUDE[prod_short](includes/prod_short.md)] as they are already part of the modern-client family. For more information about the mobile apps, see [Getting [!INCLUDE[prod_short](includes/prod_short.md)] on Your Mobile Device](/dynamics365/business-central/install-mobile-app).  

## Can I still work with Business Central data in Excel?
Yes. There are multiple ways to work with [!INCLUDE[prod_short](includes/prod_short.md)] and Excel, including the following:

- The Open in Excel feature that downloads any list as an Excel file for your processing or reporting  
- The Edit in Excel feature that allows you to edit almost any list-based data in Excel and publish it back to [!INCLUDE[prod_short](includes/prod_short.md)]  

For more information, see [Viewing and Editing in Excel From [!INCLUDE[prod_short](includes/prod_short.md)]](/dynamics365/business-central/across-work-with-excel). For instructions on how to configure it for on-premises, see [Setting up the Excel Add-In for Editing [!INCLUDE[prod_short](includes/prod_short.md)] Data](administration/configuring-excel-addin.md).

Note that the legacy, COM-based Excel plugin that used to be included on the installation media is no longer supported.

## Can I still use the same Outlook add-in?
Yes. This change does not impact the Outlook add-in. In fact, the modern Outlook add-in is based on the same familiar web experience. For more information, see [Using [!INCLUDE[prod_short](includes/prod_short.md)] as your Business Inbox in Outlook](/dynamics365/business-central/admin-outlook).

## What happened to C/SIDE, the legacy development environment?
In line with the retirement of the Windows client, [!INCLUDE[prod_short](includes/prod_short.md)] 2019 release wave 2 marks a milestone as the first release without the legacy development environment (also known as C/SIDE). The modern developer experience, which is based on Visual Studio Code and the new AL language, supports developing large apps, such as the base application from Microsoft.

Therefore, C/SIDE is discontinued for [!INCLUDE[prod_short](includes/prod_short.md)] going forward. Partners enjoy tremendous productivity and performance gains after moving to the newest tools. For more information, see [Development in AL](./developer/devenv-dev-overview.md).

## Which features are available in the modern clients and where can I find the roadmap?
[!INCLUDE[prod_short](includes/prod_short.md)] is a highly adaptable modern business management solution. It is rich in features and options and is continuously being enhanced. The roadmap is best represented by the release plans, which are updated every six months. For more information, see [Overview of Dynamics 365 [!INCLUDE[prod_short](includes/prod_short.md)] 2019 release wave 2](/dynamics365-release-plan/2019wave2/dynamics365-business-central/).  

## See Also
[FAQ for Developing in AL](developer/devenv-dev-faq.md)  
[Features not implemented in on-premises deployments of [!INCLUDE[prod_long](includes/prod_long.md)]](features-not-implemented-on-premises.md)  
[Business Central Component and System Topology, Additional Components](deployment/product-and-architecture-overview.md#additional-components)  
[Software Lifecycle Policy and Dynamics 365 Business Central On-Premises Updates](terms/lifecycle-policy-on-premises.md)  
[Dynamics 365 Business Central Compliance](/dynamics365/business-central/compliance/compliance-overview)  
[FAQ for Dynamics 365 Update Policies](/dynamics365/get-started/faq-update-policy)  
[Dynamics 365 Resources](https://dynamics.microsoft.com/resources/)  
[Welcome to [!INCLUDE[prod_long](includes/prod_long.md)]](/dynamics365/business-central/index)