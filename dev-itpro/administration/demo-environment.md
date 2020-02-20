---
title: Preparing demonstrations of Business Central
description: Get an overview of your options for setting up demos of Dynamics 365 Business Central
author: edupont04
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 01/30/2020
---
# Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

As a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] reselling partner, you might want to have an environment that you can show prospects as part of pre-sales demonstrations. Depending on your requirements, you have a number of different options that are described in this article.  

## Out-of-the-box demonstration environments

The easiest way to give a prospect a demonstration of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, is to quite simply ask them to [sign up for a trial](https://trials.dynamics.com/Dynamics365/Signup/BusinessCentral). This way, the prospect will be able to explore the default version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on their own or together with you.  

This type of environment can be useful if you want to demonstrate the general user interface, for example, or talk about how they can add capabilities with apps from AppSource.  

> [!NOTE]
> If you want to show the prospect the full capabilities in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you must ask them to change the user experience to Premium in the **Company Information** page. For more information, see [Change Which Features are Displayed](/dynamics365/business-central/ui-experiences).

### Your own trial

If you want to use a trial experience that gives you more control over the experience and allows you to demonstrate the native integration with Outlook and other services, services, such as Power Automate or Dynamics 365 Sales, then you can sign up for a free trial yourself. This gives you an environment without the risk of introducing changes to an existing customer environment and before you have set up a customer-partner relationship in the Partner Center, for example.  

You can do that with your company email, but it's far better to get yourself an Office 365 demo account that you create on [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com/), which has replaced *demos.microsoft.com*. You have access to the site if you are enrolled with the Microsoft Partner Center. For more information, see [Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products) in the Partner Center documentation.  

For example, if you sign up for a [trial](https://trials.dynamics.com/Dynamics365/Signup/BusinessCentral) with an Office 365 demo account, you can keep that environment for up to a year. However, if you switch to the actual trial experience in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], that experience will expire after 30 days. At that point, you can [extend the trial](/dynamics365/business-central/admin-extend-trial), or you can return to the CRONUS demonstration experience, which will still be available until your Office 365 demo account expires.  

This type of environment can be useful for repeatable demos that rely on Office 365 integration, for example.  

#### To get a trial environment based on Microsoft 365 content packs

[!INCLUDE [admin_m365demo](../developer/includes/admin_m365demo.md)]

## Prepare for major updates with preview environments

About two months before a major update, you can try out new functionality in preview environments. For more information, see [Prepare for major updates with preview environments](preview-environments.md).  

## Richer experiences

Sometimes, the out-of-the-box demo environment is not what you want to show your prospects. For example, if you want to demonstrate integration with machinery, or your solution is an ISV solution that fully or partially replaces the default experience. In those types of scenarios, the free trial is probably not the best starting point.  

Instead, you might want to [deploy [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises](../deployment/deployment-scenarios.md) with your customizations or other solutions. Or you could set up a dedicated environment based on the [[!INCLUDE [prodshort](../developer/includes/prodshort.md)] container-based image on Docker](../developer/devenv-running-container-development.md).  

Alternatively, you can create a free trial with an Office 365 demo account from [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com), and then create a dedicated environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] that you then apply your solution to, such as by deploying your app straight from Visual Studio Code, or any other configuration changes that you want to make. For inspiration for how to get started, see [Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](test-environment.md).  

## See also

[Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](test-environment.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Deployment of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/Deployment.md)  
[Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products)  
