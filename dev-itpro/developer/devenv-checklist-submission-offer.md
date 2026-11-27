---
title: Marketplace Business Central Offer FAQ
description: Find answers about Business Central Marketplace package types, app identity, automated submissions, and installation for Contact me listings.
author: SusanneWindfeldPedersen
ms.date: 11/27/2026
ms.reviewer: solsen
ms.topic: faq
ms.author: solsen
ms.custom: sfi-ropc-nochange
ai-usage: ai-assisted
---

# Marketplace Business Central offer FAQ

This article addresses some of the most frequently asked questions around Marketplace app offers.

## When can I change my offer's package type?

The [!INCLUDE[prod_short](../includes/prod_short.md)] offer type in Marketplace supports two package types: **Connect** apps and **Add-on** apps. If you're considering a change from **Connect** to **Add-on**, review the guidance in the next section. Don't change from **Add-on** to **Connect** because it would be a breaking change for other extensions that depend on the apps in the offer.

Learn more about the package types for [!INCLUDE[prod_short](../includes/prod_short.md)] in [App type, contact type, and customer leads](readiness/readiness-checklist-e-industries-categories-apptype.md).

> [!NOTE]
> The Product Ingestion API doesn't allow package-type changes after an offer is created. Before converting an existing offer, confirm the supported approach with [Partner Center support](devenv-checklist-submission-channels.md). Learn more in [Product Ingestion API for Dynamics 365 Business Central](/partner-center/marketplace-offers/product-ingestion-api-dynamics-365-business-central).

## How do I change my offer's package type from Connect to Add-on?

If Partner Center support confirms that conversion is supported for your existing offer, preserve the app identity as follows:

1. Go to your offer listing in Marketplace and copy the URL.
2. Retrieve the app ID assigned by the service to your offer. For a listing URL in the following format, the app ID is the value identified by `<AppId>`: `https://appsource.microsoft.com/en-us/product/dynamics-365-business-central/PUBID.<PublisherId>%7CAID.<OfferId>%7CPAPPID.<AppId>`.
3. Use this app ID in the `app.json` file of the main extension uploaded to your offer.

> [!NOTE]
> The app ID forms part of the offer listing URL and is used as a key to retrieve customer reviews left on the listing. If the app ID changes, the offer URL changes and customer reviews are lost.

## How to automatically update my offer using Partner Center submission API?

You can automate app submissions to Marketplace from your DevOps setup by using the [Partner Center submission API](/azure/marketplace/azure-app-apis). Business Central support in the [Product Ingestion API](/partner-center/marketplace-offers/product-ingestion-api-dynamics-365-business-central) is currently in public preview. <!--Learn more in this blog post [Automatic Marketplace Submission of Business Central apps](https://freddysblog.com/2022/09/22/automatic-appsource-submission-of-business-central-apps). -->

## How do I install an offer with 'Contact Me' listing type on a customer environment?

The **Contact me** listing option collects customer contact information instead of starting an installation from Marketplace. You can find leads in the **Referrals** workspace in Partner Center. You can also send leads to a configured customer relationship management (CRM) system or another supported destination, but a CRM connection is optional. Lead information includes customer details, the offer name, ID, and marketplace source.

Based on this information, you can then build the install URL for your offer and share it with the customer:

```text
https://businesscentral.dynamics.com/<TenantId>/<EnvironmentName>/?noSignUpCheck=1&filter='ID'%20IS%20'<AppId>'&page=2503
```

Replace the placeholders as follows:

- `<TenantId>` is the Microsoft Entra tenant ID of the customer's organization.
- `<EnvironmentName>` is the name of the customer's Business Central environment. URL-encode spaces as `%20`.
- `<AppId>` is the app ID defined in the manifest of the main extension for this offer.

Learn more about listing types in [App type, contact type, and customer leads](readiness/readiness-checklist-e-industries-categories-apptype.md).


## Related information

[Technical validation checklist](devenv-checklist-submission.md)
