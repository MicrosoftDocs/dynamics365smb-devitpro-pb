---
title: "Discontinuing an AppSource app"
description: "Description of how to discontinue an app that is available on AppSource."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/10/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Discontinuing an AppSource app

The following section describes the process that we recommend AppSource partners follow to remove an app from the AppSource marketplace.

## Update the AppSource listing

Update the AppSource listing to inform potential customers that the app should not be installed and that it will not be maintained in the future. The AppSource listing should still remain available to allow you to deploy bug fixes for your existing customers, but also to allow your existing customers to reinstall the app if they have uninstalled it by accident as their business might depend on it.

> [!NOTE]
> As the offer can still be installed by new customers, we recommend switching the listing type to 'Contact Me' in order for you to control who is installing the app, see [Listing Types](readiness/readiness-checklist-e-industries-categories-apptype#listing-type). You can also define custom logic within your app to define who is allowed to install it.

## Notify existing customers (T+1 to T+60)

Notify existing customers through the channels that you consider most appropriate about the fact that the app has been deprecated (day **T**) and that it will removed from the marketplace. If possible, you should recommend alternatives that the customer can use to fulfill the same business scenarios.

## Remove the AppSource listing (T+150)

Remove the listing from AppSource by using the **Stop selling** option in the Partner Center portal. It is your responsibility to maintain the app for the entire period until you click **Stop selling**. You can find more information here [Update existing offers in the commercial marketplace](/azure/marketplace/update-existing-offer#stop-distribution-of-an-offer-or-plan).

You can optionally delete the offer from the Partner Center portal.

## FAQ

### Do I have to uninstall the app for every tenant?

No. It is the responsibility of the partner maintaining the environment to uninstall the app when they see fit.

### Does the customer receive any kind of notification?

The customer does not receive any notification from Business Central about the fact that the offer has been deprecated. It is your responsability to reach out to your customers. If at some point, the app blocks the upgrade of the environment, then the partner maintaining the environment will be notified that the app is blocking upgrade. The partner maintaining the environment, can then decide at that point to uninstall it or to contact you for additional information. For more information, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](app-maintain.md).

## Does the app gets automatically uninstalled from customer environments?

The app will not be automatically uninstalled from customer environments. If the app blocks the upgrade of the environment and the partner maintaining the environment has not unblocked the upgrade by uninstalling the app, the app will be uninstalled automatically. For more information, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](app-maintain.md).

### Are the apps completely removed from Business Central?

Even after you removed your offer from the AppSource marketplace, the apps are still stored in Business Central because there can still be customers using them.

## See Also

[The Lifecycle of Apps and Extensions for Business Central](devenv-app-life-cycle.md)  
[Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](app-maintain.md)  
[App Identity](devenv-app-identity.md)
