---
title: Preparing demonstrations of Business Central
description: Get an overview of your options for setting up demos of Dynamics 365 Business Central online that will help you turn your prospects into customers.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 05/31/2021
---
# Preparing Demonstration Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

As a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] reselling partner, you might want to have an environment that you can show prospects as part of pre-sales demonstrations. Depending on your requirements, you have several different options that are described in this article.  

## Microsoft 365 demo plus Business Central

For repeatable demos that showcase Business Central together with Microsoft apps and services in an independent Azure organization (tenant) that you fully control, get a Microsoft 365 demo account at [https://aka.ms/CDX](https://aka.ms/CDX). You have access to the Customer Digital Experiences site if you are [enrolled with the Microsoft Partner Center](get-started-online.md#step-1-become-a-partner).  

Such Microsoft demo accounts give you environments that you can use for demos and training without the risk of introducing changes to an existing production environment, for example. For more information about demo accounts in general, see [Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products) in the Partner Center documentation.  

### To get a demo environment based on Microsoft 365 content packs

[!INCLUDE [admin_m365demo](../developer/includes/admin_m365demo.md)]

> [!IMPORTANT]
> Environments that are based on Microsoft 365 demo accounts are intended for demonstration and training purposes. If a prospect uses such an environment to help run their business, then they risk losing their company data when the demo environment or the Microsoft 365 demo account expires. If a prospect wants to use [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to help run their business, they should sign up for a trial using their own email account. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

For example, if you sign up for a [trial](https://trials.dynamics.com/Dynamics365/Signup/BusinessCentral) with a Microsoft 365 demo account, you can keep that environment for up to a year. However, if you switch to the actual trial experience in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], that experience will expire after 30 days. At that point, you can [extend the trial](/dynamics365/business-central/admin-extend-trial), or you can return to the CRONUS demonstration experience, which will still be available until your Microsoft 365 demo account expires.

### Customize the demo environment

[!INCLUDE [admin-m365admin](../developer/includes/admin-m365admin.md)]

### Use profiles in Microsoft Edge

If you demo in the new [Microsoft Edge](https://www.microsoft.com/edge) browser, you can easily switch between different browser profiles. That way, you do not have to use private mode for browsing, and you can let Microsoft Edge save passwords and sites to any of your browser profiles, including a Microsoft 365 demo account. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] also performs well in the Microsoft Edge for even better demos. You can also switch the page layout to *Focused* to minimize demo distraction. For more information, see [Microsoft Edge documentation](/deployedge/).  

> [!TIP]
> We recommend that you connect to a low-latency network for a faster response time during demos, and that you always plug in your laptop if you are about to demo anything. Performance impact may vary depending on your device and choice of browser, but being plugged in generally helps overall snappiness.  

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Add a Business Central trial to your prospect's organization

The easiest way to give a prospect a demonstration of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, is to simply ask them to sign up for a trial from the [https://dynamics.microsoft.com/business-central/](https://dynamics.microsoft.com/business-central/) page. This way, the prospect will be able to explore the default version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] on their own or together with you.  

This type of environment can be useful if you want to demonstrate the general user interface, for example, or talk about how they can add capabilities with apps from AppSource.  

> [!NOTE]
> If you want to show the prospect the full capabilities in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you must ask them to change the user experience to Premium in the **Company Information** page. For more information, see [Change Which Features are Displayed](/dynamics365/business-central/ui-experiences) in the business functionality content.

If a prospect has signed up for a free trial, and they use [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to help run their business, then they must decide whether to subscribe within the first 60 days. If they extend their trial once, and they are still not sure, they must contact a partner.

However, in many cases, you will probably prefer to show prospects more tailored experiences with your own trial as described in the [Microsoft 365 demo plus Business Central](#microsoft-365-demo-plus-business-central) section.

<!-- ## Richer experiences

Sometimes, the out-of-the-box demo environment is not what you want to show your prospects. For example, if you want to demonstrate integration with machinery, or your solution is an ISV solution that fully or partially replaces the default experience. In those types of scenarios, the free trial is probably not the best starting point.  

Instead, you might want to set up a dedicated environment with [[!INCLUDE [prod_short](../developer/includes/prod_short.md)] running on Docker](../developer/devenv-running-container-development.md).

Alternatively, you can create a free trial with a Microsoft 365 demo account from [cdx.transform.microsoft.com](https://cdx.transform.microsoft.com), and then create a dedicated environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] that you then apply your solution to, such as by deploying your app straight from Visual Studio Code, or any other configuration changes that you want to make. For inspiration for how to get started, see [Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md).  -->

[!INCLUDE [admin-viral-trial-expiry](../developer/includes/admin-viral-trial-expiry.md)]

## Add Dynamics 365 Sales Professional

Once you have a Microsoft 365 demo account as described in the [To get a demo environment based on Microsoft 365 content packs](#to-get-a-demo-environment-based-on-microsoft-365-content-packs) section, you can use the admin account to also sign up for a trial of Dynamics 365 Sales Professional so that you can demo the integration of the Sales app and [!INCLUDE [prod_short](../includes/prod_short.md)].  

> [!TIP]
> Integration between Business Central and Sales happens through Dataverse. For more information, see [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration) in the business functionality content.

### To add Dynamics 365 Sales Professional to your Microsoft 365 demo account

1. In a dedicated browser window, sign in as the admin account for the Microsoft demo account that you created in the [To get a demo environment based on Microsoft 365 content packs](#to-get-a-demo-environment-based-on-microsoft-365-content-packs) section. For more information, see the [Use profiles in Microsoft Edge](#use-profiles-in-microsoft-edge) section.  

2. Go to the [Microsoft Dynamics 365 Sales Professional marketing page](https://dynamics.microsoft.com/sales/professional/), and choose the **Try free** action, and then follow the guidance in the steps to add the Sales trial to your account.  

    Once the trial is available, proceed to the next step.  
3. In another browser tab, sign into [!INCLUDE [prod_short](../includes/prod_short.md)] at [https://businesscentral.dynamics.com/?redirectedFromSignup=1](https://businesscentral.dynamics.com/?redirectedFromSignup=1).  
4. Choose the ![Lightbulb that opens the Tell Me feature.](../media/search_small.png "Tell me what you want to do") icon, enter **Dataverse Connection Setup**, and then choose the related link.  
5. Follow the steps in the wizard to connect to your Sales trial.  

    To finish setting up the connection, you must run the Sales-specific assisted setup.  
6. Choose the ![Lightbulb that opens the Tell Me feature.](../media/search_small.png "Tell me what you want to do") icon, enter **Dynamics 365 Connection Setup**, and then choose the related link.  
7. Follow the steps in the wizard to connect to your Sales trial.  

## Richer demos with the Customer Engagement content pack

In certain scenarios, you want to demo richer integration capabilities than the Sales Professional app offers. In those cases, you follow the same steps to get a Microsoft 365 as is described in the [To get a demo environment based on Microsoft 365 content packs](#to-get-a-demo-environment-based-on-microsoft-365-content-packs) section. But you choose the more advanced Dynamics 365 Customer Engagement content pack so that you can demo integration with Power Apps, Power Automate, and the Dynamics 365 Sales Enterprise, for example.

### To get richer demo environments with Dataverse and the Customer Engagement content pack

1. Follow the steps in the [To get a demo environment based on Microsoft 365 content packs](#to-get-a-demo-environment-based-on-microsoft-365-content-packs) section. But at step 6, choose the more advanced Dynamics 365 Customer Engagement content pack.

2. Complete step 7 in the procedure where you sign into [!INCLUDE [prod_short](../includes/prod_short.md)] with the new Microsoft 365 tenant's admin credentials.  

    Next, you move to the Power Platform to prepare the demo environment.  
3. Sign into the [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/environments) with the same admin credentials.  
4. In the list of environments, choose the trial environment, and then choose the **Convert to production** action.  

    > [!NOTE]
    > The trial environment will have the Type field set to *Trial (29 days)*. Do not convert the default environment.

    After a few minutes, the trial environment is converted to a production environment, and the Type field changes to *Production*.  
5. Choose the converted environment again, and then choose the **Convert to sandbox** action.  

We recommend that you convert the environment to a sandbox environment for demo purposes. In the sandbox environment, you can:

* Reset the environment without any Dynamics 365 apps, which effectively gives you an empty Dataverse database to connect to using the **Set up Dataverse connection** assisted setup if you want to integrate [!INCLUDE [prod_short](../includes/prod_short.md)] just to Dataverse.

  For more information, see [Reset environment](/power-platform/admin/reset-environment) in the Power Platform docs, and [Integrating with Microsoft Dataverse](/dynamics365/business-central/admin-common-data-service) in the business functionality content for [!INCLUDE [prod_short](../includes/prod_short.md)].
* Reset the environment with specific Dynamics 365 apps with or without sample data to demo to various audiences. For more information, see [Reset environment](/power-platform/admin/reset-environment).  

  For example, when you reset the sandbox environment, you can choose to deploy Sales enterprise and demo integration between [!INCLUDE [prod_short](../includes/prod_short.md)] and the full capabilities of Dynamics 365 Sales. For more information, see [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration#integrating-through-dataverse) in the business functionality content.  

## See also

[Preparing Test Environments of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](test-environment.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Administration of Business Central Online](tenant-administration.md)  
[Data and access when a trial or subscription ends](tenant-administration.md#expire)  
[Deployment of [!INCLUDE[prod_long](../developer/includes/prod_long.md)]](../deployment/Deployment.md)  
[Offer your customers trials of Microsoft products](/partner-center/offer-your-customers-trials-of-microsoft-products)  
