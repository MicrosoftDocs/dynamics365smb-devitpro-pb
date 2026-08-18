---
title: Managing Apps
description: Discover how to use the Business Central administration center to manage apps, update environments, and ensure compatibility with the latest features. 
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update, apps, versions, check for updates
ms.date: 05/01/2025
ms.author: jswymer
ms.reviewer: jswymer
---

# Managing Apps

A [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is built as a collection of apps. These apps include Microsoft and non-Microsoft apps, for example, apps from Marketplace. The apps work together to provide customers with a broad set of features to address their various business, market, and industry needs.

You can install apps on your environment as Global App, Per-Tenant Extension (PTE), or DEV extension. For more information, see [app types and scopes](../developer/devenv-extension-types-and-scope.md).

Microsoft, partners, and ISVs frequently release updates for these apps. App updates add new features and fix known problems. To keep your environment up to date and running smoothly, check for and install the latest updates regularly.

To help you manage apps, the administration center includes the **Manage Apps** page. This page supports the following operations for each app type:

|App Type | View | Upload | Install | Update | Uninstall |
|-----|-------------|------|-----------|-----------------|--------|
|Global App|![check mark for feature.](../developer/media/check.png)| | | ![check mark for feature.](../developer/media/check.png) |![check mark for feature.](../developer/media/check.png)|
|Per-Tenant Extensions|![check mark for feature.](../developer/media/check.png)|![check mark for feature.](../developer/media/check.png) | ![check mark for feature.](../developer/media/check.png) | ![check mark for feature.](../developer/media/check.png) |![check mark for feature.](../developer/media/check.png)|
|DEV Extensions|![check mark for feature.](../developer/media/check.png)| |  |  |![check mark for feature.](../developer/media/check.png)|

> [!Note]
> In the current version, you can't install new global apps from the Admin Center, either main apps or their dependencies (library apps). You can install new global apps from the marketplace at [marketplace.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2081646). After you install a global app on your environment, you can manage it from the Admin Center.

## Manage apps

Open the **Manage Apps** page from the environment details page by selecting **Environments** > select the environment > **Manage Apps** icon. Use the dropdown to select the app type (Global, Per-tenant Extension, or Dev Extension). The **Manage Apps** page lists all the apps installed on the environment and indicates whether updates are available. View more details and available actions for an app by going to the **App Details** page by selecting the **App Name** from the overview.

### Upload and install apps

#### Global apps
ISVs can upload new global apps or new versions of existing global apps to the Marketplace to make them available for customers. For more information, see [Add your App to Marketplace](appsource.md).

To install a new global app on your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment, find it on [marketplace.microsoft.com](https://go.microsoft.com/fwlink/?linkid=2081646) and install it from there.

When the ISV uploads a new version of an app installed on your environment to Marketplace, you can update it from the Admin Center. Use the available action in the **Next Update** column on the **Manage Apps** page to update to the latest version of the app that is compatible with the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version of your environment. By default, the update is applied immediately after you accept the confirmation dialog. The users can continue working during update installation, but depending on the app changes coming with the update, they might receive a message asking them to sign out and sign in again. It is therefore recommended that you apply the updates outside of working hours. Select the **Schedule update in the next update window** box in the confirmation dialog when installing an app update to start the update during the next [update window](tenant-admin-center-update-management.md#set-the-update-window-for-each-environment).

> [!Note]
> In the current version, the Admin Center only supports updating global apps to the highest available version that is compatible with the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version of your environment. To update an app to a specific version (that isn't the highest version), use the [Admin Center API](administration-center-api_app_management.md#update-a-global-app).

> [!Important]
> When an ISV [provides a new version of their Marketplace app](appsource.md), Microsoft validates it against all available major and minor versions of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from the lowest supported version as defined by the ISV. If the new app version passes validation, it's made available for environments that are running on a version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that the app passed validation for. If a Marketplace app update isn't in the list, your environment might not yet be running on a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] the newer version of the app was validated for.

A new version of a global app installed on your environment might introduce new dependencies that you must install or require already installed dependent apps to be updated to a newer version for the app update to succeed. In such cases, the **Next Update** column shows **Action Required**. For more information, see [Resolving requirements for app updates](#requirements).

#### Per-Tenant Extensions
Administrators can upload and schedule installation of Per-Tenant Extensions (PTEs) from the **Manage Apps** page in the Admin Center. To upload a new PTE or an update to an existing PTE, choose **Install Extension** on the **Manage Apps** or **App Details** page.

1. Browse for and select the .app package for the PTE. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] automatically determines if the package is a new PTE for the environment or an update to an existing PTE.
1. Choose when to install the PTE after the upload and validation succeed by using the **Deployment schedule**. You can choose to install the PTE immediately, during the environment's next [update window](tenant-admin-center-update-management.md#set-the-update-window-for-each-environment), or during the environment's next minor or major update. If you're installing a new PTE on the environment, choose to install immediately or during the next update window. Scheduling new PTEs to be installed during a future environment update isn't supported.
1. Choose the **Sync Mode** for the scheduled PTE install. For more information, see [Synchronizing Extension Data](../developer/devenv-retaining-data-after-publishing.md).
1. Review and accept the terms and confirm.
1. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] runs some validations on the uploaded .app package and schedules the installation of the app. You can follow progress on the [Operations page](tenant-admin-center-environments.md#opslog) in the Admin Center.
1. After you schedule a new PTE or a new version of an existing PTE to be installed, you can view and cancel scheduled installations from the **App Details** page for the PTE.

##### Considerations and limitations
- You can also manage PTEs by using the **Extension Management** page in the environment. Versions of PTEs scheduled to be installed from this page aren't visible in the Admin Center until after installation succeeds. Likewise, PTE installations scheduled from the Admin Center aren't visible on the Extension Management page in the environment until the installation succeeds. Use exclusively either PTE management tool and avoid mixing use of both tools for the same environment to have a consistent overview of scheduled PTE installations. In 2027 release wave 1, PTE management on the Extension Management page is removed. For more information, see [Deprecated features in the platform](..//upgrade/deprecated-features-platform.md).
- It's possible to have multiple updates to the same PTE scheduled at the same time for different deployment schedules. For example, you can schedule different versions to be installed with the next update window and the next minor update. You can't have multiple versions for the same PTE scheduled for the same deployment schedule.
- You can't schedule the same PTE version for multiple deployment schedules. If you need to change the deployment schedule for a scheduled installation, cancel the scheduled installation and reupload and reschedule the PTE version with the correct deployment schedule.

## <a name="requirements"></a>Resolve requirements for app updates

For apps that have dependencies on other apps, you might have to update or install the dependency apps. The **Requirements for App Updates** page provide this information. The requirements are divided into two categories: **Update requirements** and **Install requirements**.

After you resolve all requirements, the app that you want to update will be ready to install.

### Update requirements

The **Update requirements** category lists existing dependency apps that have updates to be installed. To resolve these requirements, do the following steps for each app:

1. Return to the **Manage Apps** page.
2. Find the app in the list and select **Install update**.
3. Wait for **Available update action** column to change to **Up to date**.

### Install requirements

The **Install requirements** category lists dependency apps that aren't installed yet. For example, a new app was introduced that app update depends on.

You can't, however, install a new app from the **Manage App** page. Use the **Extension Management** page in the client instead. Completing this step resolves the requirement. For more information, see [Installing an Extension](/dynamics365/business-central/ui-extensions#installing-an-extension).

## Update installed apps with environment updates

Installed apps always update when the environment updates to a new major or minor version if the app update is required for the Business Central version the environment is updating to. For example, an app update occurs when the app developer indicates that the installed version of the app isn't compatible with the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version your environment is updating to. Additionally, all apps update to the latest version when an environment updates to a new major version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

Administrators can control whether apps installed on the environment should be updated when [!INCLUDE[prod_short](../developer/includes/prod_short.md)] updates to a new minor version by using the **Apps Update Cadence** setting in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Choose **With minor and major updates** for **Apps Update Cadence** on the Environment Details page. This video gives an overview how you can control when Marketplace apps update automatically on your environment:

>[!VIDEO https://learn-video.azurefd.net/vod/player?id=a3ed0192-c90b-4987-bbb7-1233d74df5d3]

> [!TIP]
> By default, the **Apps Update Cadence** setting is set to **'Default'** on all environments, which means apps installed on an environment automatically update only with major updates (unless an app update is required for the environment to update to a new minor version). The behavior of 'Default' might change in the future. If you want to opt-out of the default setting changing in the future, set the **Apps Update Cadence** to **With major updates**.

The Apps Update Cadence setting doesn't affect updates to per-tenant extensions installed on the environment.

## What happens when an app update is installed?

When you install an app update, the new app version is published, synchronized, and updated in the background. This process usually doesn't take long, and users aren't interrupted. However, we still recommend you to install the updates outside of working hours. Tick the "Schedule update in the next update window" box in the confirmation dialogue when installing an app update to start the update during the next [update window](tenant-admin-center-update-management.md#set-the-update-window-for-each-environment).

## <a name="failure"></a>What do I do when an update fails?

When the installation of an app update fails, the **Available Update Action** column displays the **Update failed** action. Select this action to get more information. The **App Update Details** pane provides some details about update and what might have caused the failure.

Sometimes the update could fail because of a transient problem. Select **Retry** to try to install the update again. If the installation continues to fail, contact your ISV. You can find the support details of each ISV on their app page on Marketplace. Contact Microsoft support if the app publisher is **Microsoft**.

   > [!TIP]
   > When reporting issues to Microsoft Support, always provide the **Operation ID** displayed in the error message. This information helps expedite the investigations.

## Uninstall apps

When an app is no longer needed, you can uninstall it from your environment. We recommend you always test uninstalling the app in a sandbox environment copied from the production environment first to ensure it doesn't disrupt operations or cause problems for environment users. 

You can uninstall installed apps from the **Manage Apps** page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] by using the **Uninstall** action in the **Available Uninstall Action** column in the list of installed apps or by using the **Uninstall** action on the **App Details** page. For apps that you can't uninstall, like Base Application, there's no **Uninstall** action, and the **Available Uninstall Action** column displays "N/A".

When uninstalling an app, it's possible to delete application data as well. This action deletes data in fields and tables created by the application you're uninstalling. If application data is deleted, the only way to recover it afterwards is by performing a [point-in-time restore](tenant-admin-center-backup-restore.md) of the environment. To retain a backup of to-be-deleted application data for longer than the 28-day point-in-time restore period, [export](tenant-admin-center-database-export.md) the environment database before uninstalling the application with deletion of application data.

If other apps depend on the app that you're uninstalling, you must also uninstall those dependent apps. The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] lists dependent apps in the **App Uninstall** pane and asks you to confirm that these apps are to be uninstalled as well.

For PTEs, uninstalling also cancels any scheduled updates to this PTE.

## Preview versions of Marketplace apps

The publisher of a Marketplace app might run a preview for a future version of an already public app, or new app. Preview versions can be installed using a URL including a `PreviewKey` parameter provided by the app publisher, but only in sandbox environments. Preview versions of apps behave differently from public versions of apps in the following ways:

- Preview versions of Marketplace Apps can only be installed using the URL containing the `PreviewKey` parameter that the app publisher can generate.
- It's not possible to install a version of an app that's lower than the latest publicly available version of that app for the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version the Sandbox environment is on. Hence, when installing an app using the URL with the `PreviewKey` parameter, the highest compatible publicly available version of that app might be installed instead, if there's no higher preview version available.
- Preview versions of Marketplace Apps can only be installed on sandbox environments. It's not possible to copy a sandbox environment to a production environment if the sandbox environment has a preview version of a Marketplace app installed. Hence, if you want to copy the sandbox environment to a production environment, you must first either update installed preview apps to public versions or uninstall preview apps.
- Preview versions of Marketplace Apps can be updated to a higher preview or public version. Updating to a higher preview version is only possible using the URL containing the `PreviewKey` parameter. Updating to a higher public version of a preview app can be done from the **Manage Apps** page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].
- Updating a Preview version of an app triggers a ForceSync. This operation allows the app publisher to make breaking changes between preview versions. However, it can lead to data loss if data is written in tables removed in the preview app version you're updating to.
- Installed Preview versions automatically update to the latest publicly available version with the **App Update Cadence** set for the environment if the latest publicly available version is a higher version than the installed Preview version.
- It's not visible in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] or on the **Extension Management** page in the environment that an installed version of an app is a preview version. [Extension Lifecycle Trace Telemetry signals](./telemetry-extension-lifecycle-trace.md) **LC0010** and **LC00022** emitted to the Application Insights resource set up for the environment on which the app is being installed include customDimensions `extensionAvailability` and `extensionPreviewKeyProvided` to indicate whether the signal relates to Preview or Public version of an app.

[Learn more about Preview versions of Marketplace Apps](../developer/devenv-checklist-submission-app-preview.md).

## Related information

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Production and Sandbox Environments](environment-types.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
