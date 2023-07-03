---
title: Enabling transact on AppSource apps
description: Learn how to enable tranactability in AppSource for Business Central apps.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.custom: bap-template
ms.date: 03/07/2023
ms.reviewer: na
ms.service: dynamics365-business-central
ms.topic: conceptual
---

# Enabling transact on AppSource apps

To enable transactability in AppSource for Business Central apps, publishers must opt in to selling through Microsoft on their existing offer in Partner Center. Once the transact option is enabled, publishers can define plans, or variants, of their offer. Plans can then be used to sell various levels of functionality, such as Gold, Silver, and Bronze variants at different prices. Plans can also be used for waterfall pricing, that is when selling the same level of functionality with a discount based on the number of users bought.

Each plan can specify the supported markets, and can have market-specific pricing. Monthly and yearly billing terms are supported, with the customer being able to choose automatic recurrence when they purchase in AppSource. A one-month free trial is also an option for publishers. 

Plans are usually public and surface for all prospect customers on AppSource. However, they can also be made private, in which case they only surface for customers that the publisher has specified.

Once the publisher has defined the plans to sell, they can map those plans to functionality in their Business Central app. This is done through the Entitlement object, that links a license, such as the plan, with Business Central permission sets. Entitlements also allow mapping access to delegated admins, as well as publisher developers, so that these can run the app without any purchased license, for example, to demo, configure, test, or troubleshoot.

Note that if the publisher already has existing customers on custom licensing, they shouldn't opt in to using transactability and entitlements until they have implemented side-by-side support, that is the ability to fall-back to their custom licensing for existing customers in a transition period - otherwise those existing customers would be locked out once they upgrade to the app version using entitlements. To implement side-by-side, publishers must create an entitlement mapping `Unlicensed` user to the required permission sets to run their custom licensing check. 

When the app has been updated with entitlements and opted in to transact, it'll surface in AppSource with the different plans and pricing, allowing customers to purchase directly in the AppSource marketplace. Once a number of licenses has been purchased, they appear in the customers Microsoft Admin Center, and can be assigned to individual users.

Note that even if a user has an assigned license (plan) that maps to permission sets through the entitlement for that license, the user must still be granted those permissions inside Business Central to have access. In other words, the license only defines the maximum permission to app functionality paid for, but users with the license might be granted less inside Business Central.