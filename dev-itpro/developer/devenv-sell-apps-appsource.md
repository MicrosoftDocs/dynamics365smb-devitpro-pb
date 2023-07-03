---
title: Selling Business Central apps through AppSource
description: Learn how to enable tranactability in AppSource for Business Central apps.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: bap-template
ms.date: 07/03/2023
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: conceptual
---

# Selling Business Central apps through AppSource

To sell your [!INCLUDE [prod_short](includes/prod_short.md)] app in AppSource, you must define offers and plans in Partner Center, and map those offers to functionality in your app. Once the transact option is enabled, you can define plans, or variants, of the offer. The plans can then be used to sell various levels of functionality, such as Gold, Silver, and Bronze variants at different prices. Plans can also be used for waterfall pricing, that is when selling the same level of functionality with a discount based on the number of users bought. With waterfall pricing, the price per user decreases as the number of users increases.

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, transactability based on credit card payment and per-user licensing is available for AppSource apps. This means that customers can purchase your app directly in AppSource.


## Defining plans

You can configure the subscription plans, pricing details, and more for your transactable SaaS offer. You must make sure to complete the following steps: 

- Under **Setup details**, select the **Yes** option to specify that you’re selling the offer through Microsoft. 
- Under **Microsoft 365 integration**, add the AppSource link to your app listing.


<!--  enable transactability for your app on AppSource, you will need to define offers and plans in Partner Center and map those offers to functionality in your apps. In 2022 release wave 2, AppSource apps for Business Central will be able to opt in to AppSource transactability based on credit card payment and per-user licensing1.

You can also configure the subscription plans, pricing details, and more for your transactable SaaS offer. In particular, make sure you complete the following steps: Under Setup details, select the Yes option to specify that you’re selling the offer through Microsoft. Under Microsoft 365 integration, add the AppSource link to your app listing2.


 Each plan can specify the supported markets, and can have market-specific pricing. Monthly and yearly billing terms are supported, with the customer being able to choose automatic recurrence when they purchase in AppSource. A one month free trial is also an option for publishers.

You can also configure the subscription plans, pricing details, and more for your transactable SaaS offer. In particular, make sure you complete the following steps: Under Setup details, select the Yes option to specify that you’re selling the offer through Microsoft. Under Microsoft 365 integration, add the AppSource link to your app listing2.

-->


Each plan can specify the supported markets, and can have market-specific pricing. Monthly and yearly billing terms are supported, with the customer being able to choose automatic recurrence when they purchase in AppSource. A one-month free trial is also an option for publishers. 

Plans are usually public and surface for all prospect customers on AppSource. However, they can also be made private, in which case they only surface for the customers that the publisher has specified.

Once the publisher has defined the plans to sell, they can map those plans to functionality in their [!INCLUDE [prod_short](includes/prod_short.md)] app. This is done through the `Entitlement` object, that links a license, such as the plan, with [!INCLUDE [prod_short](includes/prod_short.md)] permission sets. Entitlements also allow mapping access to delegated admins, as well as publisher developers, so that these can run the app without any purchased license, for example, to demo, configure, test, or troubleshoot.

> [!NOTE]  
> If the publisher already has existing customers on custom licensing, they shouldn't opt in to using transactability and entitlements until they have implemented side-by-side support, that is the ability to fall-back to their custom licensing for existing customers in a transition period - otherwise those existing customers would be locked out once they upgrade to the app version using entitlements. To implement side-by-side, publishers must create an entitlement mapping `Unlicensed` user to the required permission sets to run their custom licensing check. 

When the app has been updated with entitlements and opted in to transact, it'll surface in AppSource with the different plans and pricing, allowing customers to purchase directly in the AppSource marketplace. Once a number of licenses have been purchased, they appear in the customers Microsoft Admin Center, and can be assigned to individual users.

> [!NOTE]  
> Even if a user has an assigned license (plan) that maps to permission sets through the entitlement for that license, the user must still be granted those permissions inside [!INCLUDE [prod_short](includes/prod_short.md)] to have access. In other words, the license only defines the maximum permission to app functionality paid for, but users with the license might be granted less inside [!INCLUDE [prod_short](includes/prod_short.md)].

## See also

[]()