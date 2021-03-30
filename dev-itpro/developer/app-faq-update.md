---
title: "FAQ about Updating your Business Central App"
description: "Get answers to some of your questions about updating your app for Dynamics 365 Business Central"
author: freddyk
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: edupont
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: freddyk
---

# FAQ about Updating your Business Central App

This section contains answers to frequently asked questions about updating your app for [!INCLUDE[prod_short](../includes/prod_short.md)].

## Is it the same process for an app update as the first version?

Yes. You upload the updated app file into Partner Center and submit as normal. It goes through a more scaled-back validation process than your original version, but it does get validated. If it fails validation, it comes back to you for fixing. If it passes validation, it gets checked into [!INCLUDE[prod_short](includes/prod_short.md)].

## What are some "need to know" considerations with an updated app?

When you submit an updated version of your app, you must increase the version number in the app's json/manifest  files. [!INCLUDE[prod_short](includes/prod_short.md)] doesn’t allow overwrites. So we need the version number increased for us to check the updated app into our service upon it passing validation.

Never change the app's App ID in the json/manifest files. This is must stay the same across versions for various reasons, not least for upgrade reasons.

## When is my updated app available for tenants to install?

As soon as your updated app passes validation and is checked into our service, it then becomes the active version (for whatever the current [!INCLUDE[prod_short](includes/prod_short.md)] version is at that time). Even though your offer might still show as in progress in Partner Center, the updated app is active and ready to install. Also, even though your version number in AppSource might show as older, tenants will still get this latest updated version. For example, your updated version might be version 1.0.0.5. And in AppSource it might still show 1.0.0.1. Tenants will get the version 1.0.0.5.

## What version of Business Central is my updated app compatible with?

When you submit your app for validation, we validate it against the latest version at that point in time. Once the app passes validation, it is then checked into our service and configured for that version of [!INCLUDE[prod_short](includes/prod_short.md)], unless a newer version has been released in the meanwhile. For example, if you submit your app and the latest version of [!INCLUDE[prod_short](includes/prod_short.md)] at that time is 16.1, your app will then be compatible and configured for 16.1. When versions 16.2, 16.3, and so on roll out, your app is automatically configured for the latest version. Tenants that are on earlier versions of [!INCLUDE[prod_short](includes/prod_short.md)] will not get that updated version. They still however can install the previous versions of your app. They will get the version of your app that is configured for the version of [!INCLUDE[prod_short](includes/prod_short.md)] that their tenant is on.

## When tenants have their Business Central version upgraded, do apps ever get automatically updated?

For minor releases, we do not auto-update apps. This is because of customer feedback and them not wanting their apps auto updated. The only exception to this is if an app will be broken in a minor release due to changes in the base product. In this case, we configure that app in our service as required. When tenants then get upgraded to that minor release, if they have that app, it then gets updated automatically. This is to avoid the app being broken for the customer.

For major releases, we do auto-update every app on every tenant to the app’s latest available version. We consider major releases to be our "refresh" releases.

## How do tenants that already have an existing version of my app get my latest updated version?

By uninstalling and reinstalling the app. When doing the reinstall, it calls into our service and finds the latest active version of an app. There is a new **Manage Apps** page in the [!INCLUDE [prodadmincenter](includes/prodadmincenter.md)] that will soon allow updating of AppSource apps without having to do uninstall and reinstall.

## Do I have to submit an updated version of my app for the major releases?

No. The only reason you would need to submit an updated version of your app for a major release is if your app is going to be broken in that release. If your app will not be broken, then your latest available version of the app will be rolled over to that major release.

## How frequent should I submit updated versions of my app?

We recommend that you bundle more bug fixes and features so that your app doesn't have to be updated frequently. This has been voiced by our [!INCLUDE[prod_short](includes/prod_short.md)] customers. They do not want to be constantly updating their apps in their tenants. We recommend a minimum 1-month app update cadence.

## What if I have a critical hotfix?

We treat critical hotfixes with the utmost importance. We do have a process around this. Additional information on this hotfix process can be found [here](devenv-update-app-life-cycle-faq.md#what-if-a-customer-reports-a-critical-bug-in-my-app-and-needs-an-immediate-hotfix-version-of-my-app).

## If I make changes to the library app, must I also submit an update for the AppSource app?

You would upload the updated library app to Partner Center, leave the main app as is, and submit for validation. We then see that the main app has not changed and only validate the library app.

## But wouldn’t I need to change the dependency in my main app’s json to reference the updated library app file? 

No. The version number in the dependency listing in the json file to an app is a minimum version. The main app is essentially saying, "I need version 1.0.0.1 or greater" of the library app. For example, the AppSource app lists version 1.0.0.1 for the library app, and that means that it can also use version 1.0.0.2.

## Why don't I see the updated version of my app in my sandbox tenant?

Your tenant is on an older version of [!INCLUDE[prod_short](includes/prod_short.md)] and has not yet been upgraded to the latest version of [!INCLUDE[prod_short](includes/prod_short.md)]. The latest updated version of your app is only compatible with the latest [!INCLUDE[prod_short](includes/prod_short.md)] version and later. If you upgrade your tenant to the latest version, you can then update your app.

## See also

[FAQ about Managing and Submitting your Business Central Offer](app-faq-offer.md)  
[FAQ about Library & Dependency Apps in Business Central](app-faq-dependencies-libraries.md)  
[Update Lifecycle for AppSource Apps FAQ](devenv-update-app-life-cycle-faq.md)  
[The Lifecycle of Apps and Extensions for Business Central](devenv-app-life-cycle.md)  
