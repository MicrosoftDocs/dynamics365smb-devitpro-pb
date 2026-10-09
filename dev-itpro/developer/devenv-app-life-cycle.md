---
title: Lifecycle of Apps and Extensions
description: Learn how Marketplace apps behave during service and app updates, how administrators install updates, and how extension data is retained.
author: SusanneWindfeldPedersen
ms.topic: overview
ms.author: solsen
ms.date: 10/08/2026
ms.reviewer: solsen
---

# The lifecycle of apps and extensions for Business Central

When you build an app or extension for [!INCLUDE[prod_short](includes/prod_short.md)] and publish it to Marketplace, both the app and the online service receive updates. This article explains what happens after publication.

When your app passes all of the validations and goes live on Marketplace, customers can install your extension and use it for their business. But you need to keep it compliant with the service and update it if something changes.

The following sections describe the different upgrade scenarios that play out as we update [!INCLUDE[prod_short](includes/prod_short.md)]. Learn more about your responsibility for keeping your app updated and the resources that are available to you in [Maintain Marketplace apps and per-tenant extensions](app-maintain.md).

## Scenario 1: Business Central service update

You don't need to make any bug fixes, feature additions, or other changes to your app. It continues to work without any action on your part.

### Impact of service updates

Monthly service updates don't require changes to your app or run the app's upgrade code. [!INCLUDE[prod_short](includes/prod_short.md)] updates the tenant, and the app continues to work without visible changes.

## Scenario 2: App update

You (our partner) add some features to your app and also some minor bug fixes. The app is submitted for validation. The app passes validation and is checked into the service. This is now the active app for any new tenants and also for existing tenants that have never had your app installed before.

### Impact of app updates

Internal and delegated administrators can update Marketplace apps from the [[!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]](../administration/tenant-admin-center-manage-apps.md). Marketplace apps update to the latest compatible version during major environment updates. If **Apps Update Cadence** is set to **With minor and major updates**, they also update during minor environment updates. Regardless of cadence, a required compatible app update can be installed when necessary for an environment update.

## Scenario 3: Reported bugs in your app

You (our partner) have various customers report some bugs that are impacting their usage of the app. The bugs aren't critical but they're important. The partner makes the fixes in the app and resubmits for validation. The app passes validation and gets checked into the service. This is now the active app for any new tenants and also for existing tenants that have never had your app installed before.

### Impact of bugs

The service doesn't force an upgrade of this app to the latest version on all tenants. Some tenants might not use the functionality that contains the bug and can continue to use the current version. Work with impacted customers and their administrators to install the available update from **Manage Apps**.

## Scenario 4: Critical bug in your app

If a bug breaks core functionality, causes data loss or corruption, or prevents customers from performing time-critical tasks, create a support ticket and provide a fixed app for validation through Partner Center. Work with support and the Marketplace validation team on the appropriate escalation. If the fixed app passes validation, it becomes available for environment administrators to install.

## Scenario 5: Microsoft feature breaks your app

Microsoft might need to make a core [!INCLUDE[prod_short](includes/prod_short.md)] change that isn't compatible with your app. Reasons can include security fixes, bugs in underlying code, and product changes. Microsoft tests installed apps against upcoming service versions and works with publishers to make compatible app versions available before affected environments update.

### Impact of breaking changes

If an app update is required for an environment update, the service installs the compatible app version. If an incompatibility remains unresolved, the service can delay the environment update during the supported period. During an enforced-update period, the service might uninstall an extension that continues to block the update. The extension data is retained so that it can be recovered by installing a compatible version.

## Maintain and update your app

You're responsible for your app. You own the process of updating the app and providing upgrade code if the schema changes between versions of the app. If a customer uninstalls your app and installs it again later, they get the latest available version from Marketplace.

### How Microsoft handles your app

When Microsoft prepares a service update, it tests installed apps for compatibility. The environment update can install required compatible app updates. If an app continues to block an enforced update, the service might uninstall it while retaining its data.

When a tenant reinstalls an extension through the **Extension Management** page or Marketplace, the platform examines the retained uninstall record and data version. Reinstalling a newer version can run the upgrade path. Reinstalling the same version runs a reinstall path. If the app data wasn't retained, the platform treats the app as a new installation.

By default, uninstalling an extension retains its application data, which allows a later compatible version to reuse or upgrade that data. Data can be lost if the administrator chooses to delete application data or schema, or if a supported update operation performs a destructive schema or data migration. Before an extension is installed, it synchronizes with the tenant database. This automatic synchronization creates the database tables for the extension. After installation, extension-specific data is stored in these tables.

When an extension is uninstalled with application data retained, its data remains available for a later reinstall or upgrade. If the administrator chooses to delete application data or clean the schema, the app's data or database artifacts are removed. While the extension is uninstalled, its event subscribers and code don't run. The app might therefore miss changes that occur during that period. Plan the uninstall and reinstall for a maintenance window.

Learn more in [When apps or PTEs can't be updated by Microsoft](app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

## Related information

[Publishing and installing an extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Retaining table data after publishing](devenv-retaining-data-after-publishing.md)  
[Upgrading extensions](devenv-upgrading-extensions.md)  
[Add your app to Marketplace](../administration/appsource.md)  
[Checklist for submitting your app](devenv-checklist-submission.md)  
[Upgrading Marketplace apps in production](devenv-upgrade-appsource-app-in-prod.md)  
[Maintain Marketplace apps and per-tenant extensions](app-maintain.md)  
