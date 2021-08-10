---
title: "Discontinuing an AppSource extension"
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

# Discontinuing an AppSource extension

The following section describes the process that we recommend AppSource partners follow to remove an extension from the AppSource marketplace.

## Update the AppSource listing

Update the AppSource listing to inform potential customers that the extension should not be installed and that it will not be maintained in the future. The AppSource listing should remain available to allow existing customers to reinstall the extension if they have uninstalled it by accident as their business might depend on it.

## T+1-T+60 - Notify existing customers 

Notify existing customers through the channels that you consider most appropriate about the fact that the extension has been deprecated and that it will removed from the marketplace. If possible, you should recommend alternatives that the customer can use to fulfill the same business scenarios.

## T+150 - Remove the AppSource listing

Remove the listing from AppSource by using the **Stop selling** option in the Partner Center portal. You can find more information here [Update existing offers in the commercial marketplace](https://docs.microsoft.com/en-us/azure/marketplace/update-existing-offer#stop-distribution-of-an-offer-or-plan).

You can optionally delete the offer from the Partner Center portal.

## FAQ

### Do I have to uninstall all the extension for every tenant?

No. It is the responsibility of the partner maintaining the environment to uninstall the extension when they see fit.

### Does customer receive any kind of notification?

The customer does not receive any notification about the fact that the offer has been deprecated. If at some point, the extension blocks the upgrade of the environment, the partner maintaining the environment will be notified that the extension is blocking upgrade. The partner maintaining the environment, can decide at that point to uninstall it or to contact you for additional information.


## See Also

[The Lifecycle of Apps and Extensions for Business Central](devenv-app-life-cycle.md)  
[Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](app-maintain.md)  
[App Identity](devenv-app-identity.md)