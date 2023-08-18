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

To sell your [!INCLUDE [prod_short](includes/prod_short.md)] app through AppSource, you must first define offers and plans in Partner Center, and map those offers to functionality in your app. Once the transact option is enabled, you can define plans, or variants, of the offer. The plans can then be used to sell various levels of functionality, such as Gold, Silver, and Bronze variants at different prices. Plans can also be used for waterfall pricing, that is when selling the same level of functionality with a discount based on the number of users bought. With waterfall pricing, the price per user decreases as the number of users increases. For each plan, you define the market specifically. The markets supported are the same as the markets supported for Business Central.

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, transactability based on credit card payment and *per-user licensing* is available for AppSource apps. This means that customers can purchase your app directly in AppSource. The purchase is then automatically provisioned in the customer's Microsoft Admin Center, and the customer can assign the app to individual users.

For pricing, you can optionally decide to define minimum and maximum number of users for the plan. And for billing terms, you can decide to offer monthly and yearly billing, with the option for the customer to choose recurring billing. Under **Free Trial**, you can optionally define a free trial period for the plan. The free trial period is one month, and is automatically enabled for the customer when they purchase the plan in AppSource. Should the customer choose to cancel the subscription during the free trial period, they will not be charged.

The following steps outline the process of enabling tranactability for your app, assuming that you already have an existing offer in AppSource. If you don't have an existing offer in AppSource, read more here.

- In Partner Center, on your existing offer, under **Setup details**, select the option called **Would you like to sell through Microsoft?**, choose the **Yes, I would like to sell through Microsoft and have Microsoft host transactions on my behalf** option to opt into transactability.  
    > [!IMPORTANT]  
    > <insert include file here>
- Once you have enabled transactability, you can define plans for your offer. In Partner Center, on your offer, select the **Plan overview** tab, and then choose **Add plan**. For more information, see [Plans overview]()
- When you have defined the plans, you can map these plans to functionality in your app. You do this by creating entitlements in your app, which map the license to object entitlements. For more information, see [Entitlements]() 
- Having opted into tranactability, defined plans, and mapped these plans to functionality in your app by using entitlements, you can now publish your app.
- When customers buy your app, they get a license for the plan, and they can go to the Microsoft 365 admin center, and then choose Licenses, and then they can see the license for the app, which they can assign to users.
- 
<!--
**Notes**

Use the Plans + Pricing tab in Partner Center for Business Central apps

In Partner Center, there's a Marketplace offers section - where you create a New offer, and select Dynamics 365 Business Central offer. This article explains how you enable transactability for an existing app.

On the offer, you have an overview of publish status, validation and more

In the Setup details, you now have a new option called **Would you like to sell through Microsoft?**, choose the **Yes, I would like to sell through Microsoft and have Microsoft host transactions on my behalf** option to opt into transactability.

In the left pane, you'll now have a new tab called **Plan overview**. Plans are defined as the different sellable SKUs.
The Pricing model is a per-user model, where you can define the price per user (each Microsoft Entra tenant user) per month or per year. The plan can either be public, which means that it's shown in AppSource, or private, which means that it's only shown to customers that the publisher has specified.

Each plan has a unique ID (Service ID), which is a combination of the publisher tenant identity, the offer identity and the plan identity.

**Tie the plan/SKU into my app** - granting access

Entitlements in the app that map the license to object entitlements, which are basically permission sets.

On the entitlement object, choose Type = PerUserOfferPlan, and then you specify the Id, which is the Service ID of the plan that you defined in Partner Center.

This also means that when you create a new plan, you have to update your app to include the new service ID in the entitlements.

When customers buy your app, they get a license for the plan, and they can go to the Microsoft 365 admin center, and then choose Licenses, and then they can see the license for the app, which they can assign to users.






-->










## Defining plans

You can configure the subscription plans, pricing details, and more for your transactable SaaS offer. You must make sure to complete the following steps: 

- Under **Setup details**, select the **Yes** option to specify that you’re selling the offer through Microsoft. 
- Under **Microsoft 365 integration**, add the AppSource link to your app listing.

Plans are usually public and surface for all prospect customers on AppSource. However, they can also be made *private*, in which case they only surface for the customers that the publisher has specified.

Each plan can specify the supported markets, and can have market-specific pricing. Monthly and yearly billing terms are supported, with the customer being able to choose automatic recurrence when they purchase in AppSource. A one-month free trial is also an option for publishers. 

Once the publisher has defined the plans to sell, they can map those plans to functionality in their [!INCLUDE [prod_short](includes/prod_short.md)] app. This is done through the `Entitlement` object, that links a license, such as the plan, with [!INCLUDE [prod_short](includes/prod_short.md)] permission sets. Entitlements also allow mapping access to delegated admins, as well as publisher developers, so that these can run the app without any purchased license, for example, to demo, configure, test, or troubleshoot.

> [!NOTE]  
> If the publisher already has existing customers on custom licensing, they shouldn't opt in to using transactability and entitlements until they have implemented side-by-side support, that is the ability to fall-back to their custom licensing for existing customers in a transition period - otherwise those existing customers would be locked out once they upgrade to the app version using entitlements. To implement side-by-side, publishers must create an entitlement mapping `Unlicensed` user to the required permission sets to run their custom licensing check. 

When the app has been updated with entitlements and opted in to transact, it'll surface in AppSource with the different plans and pricing, allowing customers to purchase directly in the AppSource marketplace. Once a number of licenses have been purchased, they appear in the customers Microsoft Admin Center, and can be assigned to individual users.

> [!NOTE]  
> Even if a user has an assigned license (plan) that maps to permission sets through the entitlement for that license, the user must still be granted those permissions inside [!INCLUDE [prod_short](includes/prod_short.md)] to have access. In other words, the license only defines the maximum permission to app functionality paid for, but users with the license might be granted less inside [!INCLUDE [prod_short](includes/prod_short.md)].

## See also

[FAQ about the Microsoft commercial marketplace](/partner-center/marketplace/marketplace-faq-publisher-guide)  