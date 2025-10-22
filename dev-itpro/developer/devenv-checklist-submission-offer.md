---
title: AppSource Business Central Offer FAQ
description: Describes the most common questions about AppSource app offers for Business Central.
author: qutreson
ms.date: 10/08/2025
ms.reviewer: solsen
ms.topic: faq
ms.author: qutreson
ms.custom: sfi-ropc-nochange
---

# AppSource Business Central offer FAQ

This article addresses some of the most frequently asked questions around AppSource app offers.

## When is it okay to change the offer type of my offer?

There exist two types of offers for [!INCLUDE[prod_short](../includes/prod_short.md)] in AppSource: `connect` apps and `add-on` apps. It's possible to change an offer type from `connect` to `add-on` by following the steps listed in the dedicated entry below. However, we don't recommend changing an offer from `add-on` to `connect` since it would be a breaking change for all other extensions depending on the apps in this offer.

Learn more in about the offer types for [!INCLUDE[prod_short](../includes/prod_short.md)] in [App type, contact type, and customer leads](readiness/readiness-checklist-e-industries-categories-apptype.md).

## How to change the offer type from 'connect' app to 'add-on' app?

When changing a `connect` app to an `add-on` app, you should:
- Navigate to your offer listing in the AppSource marketplace, and copy the URL for your offer
- Retrieve the App ID assigned by the service to your offer: the App ID can be found as `<appId>` in `https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.<publisherId>%7CAID.<offerId>%7CPAPPID.<appId>`
- Use this App ID in the `app.json` of the main extension uploaded to your offer

> [!NOTE]  
> The App ID is used as part of the URL of the offer listing and is used as a key to retrieve to customer review left on the offer listing. Not preserving the App ID means that the offer URL will change and customer reviews will be lost.

## How to automatically update my offer using Partner Center submission API?

It's possible to automatically submit apps to AppSource from our DevOps setup by using the [Partner Center Ingestion API](/azure/marketplace/azure-app-apis). <!--Learn more in this blog post [Automatic AppSource Submission of Business Central apps](https://freddysblog.com/2022/09/22/automatic-appsource-submission-of-business-central-apps). -->

## How do I install an offer with 'Contact Me' listing type on a customer environment?

Offers using 'Contact Me' as listing type can't be directly installed from the AppSource marketplace. When choosing 'Contact Me' on the offer listing, the customer is asked to share their information with Microsoft through your customer relationship management (CRM) system. These customer details, along with the offer name, ID, and marketplace source are sent to the CRM system, which you configured for your offer in Partner Center.

Based on this information, you can then build the install URL for your offer and share it with the customer:

`https://businesscentral.dynamics.com/[TenantID]/?noSignUpCheck=1&filter='ID' IS '[AppID]'&page=2503` 

Where

- `[TenantID]` is the Microsoft Entra ID of the customer's environment, and
- `[AppID]` is the app ID defined in the manifest of the main extension for this offer.

Learn more about listing types in [App type, contact type, and customer leads](.\readiness\readiness-checklist-e-industries-categories-apptype.md).


## Related information

[Technical validation checklist](devenv-checklist-submission.md)
