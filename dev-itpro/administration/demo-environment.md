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
ms.date: 11/10/2020
---
# Preparing Demonstration Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

As a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] reselling partner, you might want to have an environment that you can show prospects as part of pre-sales demonstrations. Depending on your requirements, you have a number of different options that are described in this article.  

## Out-of-the-box demonstration environments

The easiest way to give a prospect a demonstration of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, is to quite simply ask them to [sign up for a trial](https://trials.dynamics.com/Dynamics365/Signup/BusinessCentral). This way, the prospect will be able to explore the default version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on their own or together with you.  

This type of environment can be useful if you want to demonstrate the general user interface, for example, or talk about how they can add capabilities with apps from AppSource.  

> [!NOTE]
> If you want to show the prospect the full capabilities in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you must ask them to change the user experience to Premium in the **Company Information** page. For more information, see [Change Which Features are Displayed](/dynamics365/business-central/ui-experiences).

If a prospect has signed up for a free trial, and they use [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to help run their business, then they must decide whether to subscribe within the first 60 days. If they extend their trial once, and they are still not sure, they must contact a partner.

However, in many cases, you will probably prefer to show prospects more tailored experiences with your own trial.

### Your own trial

If you want to use a trial experience that gives you more control over the experience and allows you to demonstrate the native integration with Outlook and other services, services, such as Power Automate or Dynamics 365 Sales, then you can sign up for a free trial yourself. This gives you an environment without the risk of introducing changes to an existing customer environment and before you have set up a customer-partner relationship in the Partner Center, for example.  

You can do that with your company email, but it's far better to get yourself a Microsoft 365 demo account that you create on [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com/), which has replaced *demos.microsoft.com*. You have access to the site if you are enrolled with the Microsoft Partner Center. For more information, see [Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products) in the Partner Center documentation.  

For example, if you sign up for a [trial](https://trials.dynamics.com/Dynamics365/Signup/BusinessCentral) with a Microsoft 365 demo account, you can keep that environment for up to a year. However, if you switch to the actual trial experience in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], that experience will expire after 30 days. At that point, you can [extend the trial](/dynamics365/business-central/admin-extend-trial), or you can return to the CRONUS demonstration experience, which will still be available until your Microsoft 365 demo account expires.  

This type of environment can be useful for repeatable demos that rely on Microsoft 365 integration, for example.  

> [!TIP]
> If you demo in the new [Microsoft Edge](https://www.microsoft.com/edge) browser, you can easily switch between different browser profiles. That way, you do not have to use private mode for browsing, and you can let Edge save passwords and sites to any of your browser profiles. [!INCLUDE [prodshort](../developer/includes/prodshort.md)] also performs well in the new Edge for even better demos. You can also switch the page layout to *Focused* to minimize demo distraction. For more information, see [Microsoft Edge documentation](/deployedge/).  

We also recommend that you connect to a low-latency network for a faster response time during demos, and that you always plug in your laptop if you are about to demo anything. Performance impact may vary depending on your device and choice of browser, but being plugged in generally helps overall snappiness.  

#### To get a trial environment based on Microsoft 365 content packs

[!INCLUDE [admin_m365demo](../developer/includes/admin_m365demo.md)]

> [!IMPORTANT]
> Environments that are based on Microsoft 365 demo accounts are intended for demonstration and training purposes. If a prospect uses such an environment to help run their business, then they risk losing their company data when the Microsoft 365 demo account expires. If a prospect wants to use [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to help run their business, they should sign up for a trial using their own email account. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Prepare for major updates with preview environments

About two months before a major update, you can try out new functionality in preview environments. For more information, see [Prepare for major updates with preview environments](preview-environments.md).  

## Richer experiences

Sometimes, the out-of-the-box demo environment is not what you want to show your prospects. For example, if you want to demonstrate integration with machinery, or your solution is an ISV solution that fully or partially replaces the default experience. In those types of scenarios, the free trial is probably not the best starting point.  

Instead, you might want to [deploy [!INCLUDE [prodshort](../developer/includes/prodshort.md)] on-premises](../deployment/deployment-scenarios.md) with your customizations or other solutions. Or you could set up a dedicated environment with [[!INCLUDE [prodshort](../developer/includes/prodshort.md)] running on Docker](../developer/devenv-running-container-development.md).

Alternatively, you can create a free trial with a Microsoft 365 demo account from [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com), and then create a dedicated environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] that you then apply your solution to, such as by deploying your app straight from Visual Studio Code, or any other configuration changes that you want to make. For inspiration for how to get started, see [Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](test-environment.md).  

## See also

[Preparing Test Environments of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](test-environment.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Deployment of [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/Deployment.md)  
[Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products)  
