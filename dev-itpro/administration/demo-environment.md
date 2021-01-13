---
title: Preparing demonstrations of Business Central
description: Get an overview of your options for setting up demos of Dynamics 365 Business Central online that will help you turn your prospects into customers.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 11/20/2020
---
# Preparing Demonstration Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

As a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] reselling partner, you might want to have an environment that you can show prospects as part of pre-sales demonstrations. Depending on your requirements, you have several different options that are described in this article.  

## Microsoft 365 demo plus Business Central

For repeatable demos that showcase Business Central together with Microsoft apps and services in an independent Azure organization (tenant) that you fully control, get a Microsoft 365 demo account that you create on [https://aka.ms/CDX](https://aka.ms/CDX), which has replaced demos.microsoft.com. You have access to the site if you are [enrolled with the Microsoft Partner Center](get-started-online.md#step-1-become-a-partner).  

Such Microsoft demo accounts give you environments that you can use for demos and training without the risk of introducing changes to an existing production environment, for example. For more information about demo accounts in general, see [Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products) in the Partner Center documentation.  

### To get a demo environment based on Microsoft 365 content packs

[!INCLUDE [admin_m365demo](../developer/includes/admin_m365demo.md)]

> [!IMPORTANT]
> Environments that are based on Microsoft 365 demo accounts are intended for demonstration and training purposes. If a prospect uses such an environment to help run their business, then they risk losing their company data when demo environment or the Microsoft 365 demo account expires. If a prospect wants to use [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to help run their business, they should sign up for a trial using their own email account. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

<!-- For example, if you sign up for a [trial](https://trials.dynamics.com/Dynamics365/Signup/BusinessCentral) with a Microsoft 365 demo account, you can keep that environment for up to a year. However, if you switch to the actual trial experience in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], that experience will expire after 30 days. At that point, you can [extend the trial](/dynamics365/business-central/admin-extend-trial), or you can return to the CRONUS demonstration experience, which will still be available until your Microsoft 365 demo account expires.-->

### Customize the demo environment

[!INCLUDE [admin-m365admin](../developer/includes/admin-m365admin.md)]

### Use profiles in Microsoft Edge

If you demo in the new [Microsoft Edge](https://www.microsoft.com/edge) browser, you can easily switch between different browser profiles. That way, you do not have to use private mode for browsing, and you can let Microsoft Edge save passwords and sites to any of your browser profiles, including a Microsoft 365 demo account. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] also performs well in the Microsoft Edge for even better demos. You can also switch the page layout to *Focused* to minimize demo distraction. For more information, see [Microsoft Edge documentation](/deployedge/).  

> [!TIP]
> We recommend that you connect to a low-latency network for a faster response time during demos, and that you always plug in your laptop if you are about to demo anything. Performance impact may vary depending on your device and choice of browser, but being plugged in generally helps overall snappiness.  

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Adding a Business Central trial to your prospect's organization

The easiest way to give a prospect a demonstration of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, is to quite simply ask them to sign up for a trial from the [https://dynamics.microsoft.com/business-central/](https://dynamics.microsoft.com/business-central/) page. This way, the prospect will be able to explore the default version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on their own or together with you.  

This type of environment can be useful if you want to demonstrate the general user interface, for example, or talk about how they can add capabilities with apps from AppSource.  

> [!NOTE]
> If you want to show the prospect the full capabilities in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you must ask them to change the user experience to Premium in the **Company Information** page. For more information, see [Change Which Features are Displayed](/dynamics365/business-central/ui-experiences).

If a prospect has signed up for a free trial, and they use [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to help run their business, then they must decide whether to subscribe within the first 60 days. If they extend their trial once, and they are still not sure, they must contact a partner.

However, in many cases, you will probably prefer to show prospects more tailored experiences with your own trial as described in the [Microsoft 365 demo plus Business Central](#microsoft-365-demo-plus-business-central) section.

<!-- ## Richer experiences

Sometimes, the out-of-the-box demo environment is not what you want to show your prospects. For example, if you want to demonstrate integration with machinery, or your solution is an ISV solution that fully or partially replaces the default experience. In those types of scenarios, the free trial is probably not the best starting point.  

Instead, you might want to set up a dedicated environment with [[!INCLUDE [prod_short](../developer/includes/prod_short.md)] running on Docker](../developer/devenv-running-container-development.md).

Alternatively, you can create a free trial with a Microsoft 365 demo account from [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com), and then create a dedicated environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] that you then apply your solution to, such as by deploying your app straight from Visual Studio Code, or any other configuration changes that you want to make. For inspiration for how to get started, see [Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md).  -->

## See also

[Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Deployment of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../deployment/Deployment.md)  
[Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products)  
