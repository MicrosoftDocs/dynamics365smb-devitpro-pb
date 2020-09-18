---
title: "Lifecycle of apps and extensions"
description: "Overview of the process of updating an app for Business Central, how to update it."
author: edupont04

ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 08/24/2020
---

# The Lifecycle of Apps and Extensions for Business Central

When you build an app or extension to [!INCLUDE[prodshort](includes/prodshort.md)] and get that published to AppSource, it becomes an app like so many others - the app itself can be updated, and the platform that it sits on, [!INCLUDE[prodshort](includes/prodshort.md)] online itself, will also get updated. But what happens after your app gets published?

When your app has passed all of our validations and has gone live to App Source, customers can install your extension and use it for their business. But you are expected to keep it compliant with the service and update it if something changes.  

The following sections describe the different upgrade scenarios that we have seen play out as we update [!INCLUDE[prodshort](includes/prodshort.md)]. For more information about your responsibility for keeping your app updated and the resources that are available to you, see [Maintain AppSource Apps and Per-Tenant Extensions](app-maintain.md).  

## Scenario 1: Business Central service update

You don't need to make any bug fixes, feature adds, or app changes to your app. It continues to work fine without any interaction on your part.  

### Impact of service updates

The monthly service upgrades to [!INCLUDE[prodshort](includes/prodshort.md)] do not impact your app. Your app just gets moved along and no upgrade code from your app needs to get used. [!INCLUDE[prodshort](includes/prodshort.md)] itself gets upgraded on your tenant, and once complete, the customer sees no difference with your app.

## Scenario 2: App update

You (our partner) add some features to your app and also some minor bug fixes. The app is submitted for validation. The app passes validation and gets checked into the service. This is now the active app for any new tenants and also for existing tenants that have never had your app installed before

### Impact of app updates

Customers can either do an uninstall and then reinstall on their own, or they can ask their partner do it on their behalf from the Extension Management window within [!INCLUDE[prodshort](includes/prodshort.md)]. Otherwise, they would have to wait until our every 6-month major release. That is the only time we do a force upgrade of extensions (except for critical bug hotfix extension updates)

## Scenario 3: Reported bugs in your app

You (our partner) has various customers report some bugs that are impacting their usage of the app. The bugs aren't critical but they are important. The partner makes the fixes in the app and resubmits for validation. The app passes validation and gets checked into the service. This is now the active app for any new tenants and also for existing tenants that have never had your app installed before

### Impact of bugs

We still do not force the upgrade of this app to this latest version on all of the tenants. Some tenants may not be using the functionality that includes this bug and continue to work fine on the current version of the app. Therefore, you should work directly with all of the impacted customer tenants to uninstall and reinstall to get the latest app version that contains fixes for the bug.

## Scenario 4: Critical bug in your app

Critical bug within the app is found in tenants. These tenants cannot do their day to day work due to this bug. This fits into our hotfix scenario as it is critical. A support ticket is related to this case. The partner immediately provides a fixed app for validation. The validation team makes this top priority and does validation ASAP. Fixed app passes validation and gets checked into the service. All tenants with the app are refreshed automatically by the Microsoft team to this fixed version.

## Scenario 5: Microsoft feature breaks your app

Microsoft has to break your app file for a needed [!INCLUDE[prodshort](includes/prodshort.md)] core change. Some reasons for breaking could be security, bugs in the underlying code, high priority feature adds, and so on. Keep in mind, we do our very best to not break your app through our changes. We try and find proper ways of doing the changes without breaking your app. However, if we can't find a proper (non-breaking) way, then we could break your app. This won't be as likely in a minor update release (unless a security change is required on our part and that is the change that breaks you), but it can be more likely in our major (every 6-month) releases.

### Impact of breaking changes

Here is our process when this takes place:

- First of all, Microsoft will not make a breaking change in the production environment at any point. Therefore, existing tenants are not expected to see this breaking change occur.
- When we make a breaking change, we do it in a build branch that is for a future release (monthly service minor or major release)
- We notify the partner in advance and give the partner ample time to fix their app, get it validated, and have it ready
- The fixed app will already be in our service and slotted as required for when your tenant is to be moved to the [!INCLUDE[prodshort](includes/prodshort.md)] release that has the app breaking change
- As a result, the customer (tenant owner) should never see their [!INCLUDE[prodshort](includes/prodshort.md)] break. Because the tenant gets moved from one monthly service update of [!INCLUDE[prodshort](includes/prodshort.md)] to another, the tenant is being upgraded to the release of ours that breaks the specific app. However, our service detects that there is a new required version of that app (your fixed version). Therefore, we auto install the fixed version of the app for the tenant

## Conclusions

You're responsible for your app. You own the process of updating the app and providing upgrade code if the schema changes between versions of the app.  
If a customer uninstalls your app, and then installs it again later, then when they install the app the second time, they get the latest version from AppSource.  

### How Microsoft handles your app

When Microsoft upgrades a tenant with a service update, your app is tested against the new service version. If the app breaks, Microsoft rolls back to the previous healthy state. Your customer never learns that anything was about to break.  

When a tenant uninstalls and reinstalls an extension via the Extension Management page or AppSource, there is platform logic that determines whether an *Install* or an *Upgrade* must take place. We detect which version of the extension the tenant previously had installed and perform the appropriate action. Therefore, the result of manually uninstalling/installing the extension is the exact same as an automated upgrade.  

Additionally, there will not be any data loss during uninstall, install, or upgrade actions. Data for extensions is stored in its own tables in the tenant database. Before an extension gets installed, it first get synchronized on the tenant database. This step is implicit and happens automatically when a tenant installs an extension. This synchronization process creates the database tables for the extension. Once the extension is installed and the tenant is using it, extension-specific data will get stored in these tables.  

When an extensions gets uninstalled, these tables do not get removed. Therefore, when the extension gets reinstalled (or upgraded), the data is still available. You do not need to worry about data loss for choosing the uninstall/install route. However, do keep in mind that if any actions are being performed on the tenant while the extension is uninstalled, the extension's events and such will not be firing, and your app may miss the creation of new data. Try to perform the uninstall/install while the tenant is not online.  

For more information, see [When apps or PTEs cannot be updated by Microsoft](app-maintain.md#when-apps-or-ptes-cannot-be-updated-by-microsoft).  

## See Also

[Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  
[Upgrading Extensions](devenv-upgrading-extensions.md)  
[Add your App to AppSource](../administration/appsource.md)  
[Checklist for Submitting Your App](devenv-checklist-submission.md)  
[Upgrading AppSource Apps in Production](devenv-upgrade-appsource-app-in-prod.md)  
[Maintain AppSource Apps and Per-Tenant Extensions](app-maintain.md)  
