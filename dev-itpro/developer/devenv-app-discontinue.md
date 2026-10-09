---
title: Discontinuing a Marketplace App
description: Learn how to stop distributing a Marketplace app, notify existing customers, preserve support during the wind-down, and manage installations.
author: SusanneWindfeldPedersen
ms.date: 10/09/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Discontinue a Marketplace app

The following sections describe the process that Marketplace partners can follow to remove an app from the Marketplace.

In this timeline, T is the date you deprecate the app, and the offsets are measured in days.

## Update the Marketplace listing

Update the Marketplace listing to inform potential customers that the app shouldn't be installed and that it will not be maintained in the future. The Marketplace listing should still remain available to allow you to deploy bug fixes for your existing customers, but also to allow your existing customers to reinstall the app if they have uninstalled it by accident as their business might depend on it.

> [!NOTE]
> Because new customers can still install the offer, switch the listing type to **Contact Me** to remove the storefront's self-service acquisition path and route prospects to you. **Contact Me** isn't an access-control or licensing mechanism. Customers who know the app ID can still install the app through supported APIs or a direct installation URL. Add entitlement logic to the app if you must restrict its use. Learn more in [Listing types](readiness/readiness-checklist-e-industries-categories-apptype.md#listing-type).

## Notify existing customers (T+1 to T+60)

Notify existing customers through the channels that you consider most appropriate. Explain that the app is deprecated and that you plan to stop its distribution. If possible, recommend alternatives that customers can use for the same business scenarios.

## Stop distributing the Marketplace offer (T+150)

When the wind-down period ends, select **Stop distribution** on the offer overview in Partner Center. This action prevents new acquisition. Existing installations can continue to run, but customers can't redownload or redeploy the stopped offer. Maintain the app until you stop its distribution. Learn more in [Update an existing offer in the commercial marketplace](/azure/marketplace/update-existing-offer#stop-distribution-of-an-offer-or-plan).

After distribution stops, the offer remains visible in Partner Center with a **Not available** status.

## Frequently asked questions about discontinuing an app

### Do I have to uninstall the app for every tenant?

No. It's the responsibility of the partner maintaining the environment to uninstall the app when they see fit.

### How should customers be notified?

Plan to notify customers directly when you deprecate an offer. If the app later blocks an environment update, the partner who maintains the environment receives information about the blocking app and can uninstall it or contact you. Learn more in [Maintain Marketplace apps and per-tenant extensions in Business Central online](app-maintain.md).

### Does the app get automatically uninstalled from customer environments?

Stopping distribution doesn't automatically uninstall the app from customer environments. However, during an enforced-update period, the service might automatically uninstall an extension that continues to block the environment update. The extension's data is retained so that it can be recovered by installing a compatible version. Learn more in [Maintain Marketplace apps and per-tenant extensions in Business Central online](app-maintain.md).

### Is the app removed from Business Central?

Even after you remove your offer from Marketplace, the app remains stored in Business Central because customers might still use it.

## Related information

[The lifecycle of apps and extensions for Business Central](devenv-app-life-cycle.md)  
[Maintain Marketplace apps and per-tenant extensions in Business Central online](app-maintain.md)  
[Understand app identity for AL apps](devenv-app-identity.md)  
