---
title: Major updates and minor updates for Business Central online
description: Learn about the timeline for how updates of Business Central online rollout. You can prepare for both major updates and minor updates with minimal disruption of your users' productivity.  
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update, flag, keys
ms.date: 08/26/2024
ms.author: jswymer
ms.reviewer: jswymer
---

# Major updates and minor updates for Business Central online

This article provides an overview of what you need to know about how a major or minor update for [!INCLUDE[prod short](../developer/includes/prod_short.md)] rolls out, and how the underlying service updates. It includes key dates, actions you need to take, and answers some common questions.  

[!INCLUDE [service-updates](../includes/service-updates.md)]

Microsoft is committed to delivering predictable updates to the service. Updates are continuous, touchless updates that provide new features and functionality. They eliminate the need to do expensive upgrades every few years. Administrators can set a maintenance window for each environment that determines when Microsoft is allowed to update that environment. For more information, see [Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md). Scheduled minor and major updates, as well as unscheduled critical fixes, respect the maintenance window set on each environment.

You are in control and manage how your organization receives these updates. Microsoft applies updates to each environment based on your configuration. The only exception is how Microsoft maintains the underlying platform with invisible updates during low traffic hours, for example. For more information, see the [service updates](#service-updates) section.  

The Dynamics 365 team designs and develops each new update. Any new update is first validated by the feature team, then validated in combination with the full product. During this time, extensive testing is done on various test topologies. A compatibility checker also runs tests to ensure backward compatibility.  

## Major updates

There are two major update cycles per year, with major releases every April and October. Major updates introduce new features, enhancements, and platform improvements. For each major update cycle, the following periods apply.

### Preview period

The preview period allows for testing of the new functionality before the version is made available as update to your environment. Administrators can create a Sandbox environment from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] on the new version, for example to try out new functionality or test compatibility of extensions in a cloud environment. This period typically starts a month before the release of the new major version, that is, every March and September. Learn more in [Preparing for major updates with preview environments](preview-environments.md).

### Update period

[This section is prerelease documentation and is subject to change.]

> [!IMPORTANT]
>
> - The 5-month update period is a production-ready preview feature and only applies to [Microsoft-localized environments](../compliance/apptest-countries-and-translations.md).
> - Partner-localized environments have a 60-day update period that is expected to end in the first half of December 2024.
> - Production-ready previews are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520).

The update period starts when a new major version is generally available, typically the first workday of every April and every October. Once the version is generally available, any new environments are created on the new major version. The new major version is made available as update to existing environments around a week after general availability; the exact timing might differ per environment. After a new major version is made available as update on your environment, Microsoft schedules the update to take place around a week later; the exact timing might differ per environment.

The update period lasts for five calendar months, ending in early September for update periods that start in April, and in early March for update periods that start in October. Administrators can reschedule the update to any date within the update period from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. Learn more about [rescheduling updates](tenant-admin-center-update-management.md).

Scheduled update attempts that don't succeed are automatically rescheduled for seven days later, and administrators can reschedule them to any other date within the update period. Learn more in the [failed updates and rescheduling](#failed-updates-and-rescheduling) section.

When a new version is available as update on the environment, [Notification recipients](tenant-admin-center-notifications.md) receive an email notification and environments [enabled with telemetry](telemetry-enable-application-insights.md) receive a signal with the [LC0100 tag](telemetry-environment-lifecycle-trace.md#environment-update-available-for-scheduling).

### Grace period

[This section is prerelease documentation and is subject to change.]

> [!IMPORTANT]
>
> - The 5-month update period is a production-ready preview feature and only applies to [Microsoft-localized environments](../compliance/apptest-countries-and-translations.md).
> - Partner-localized environments have a 3-month update period that is expected to end in the first half of March 2025.
> - Production-ready previews are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520).

The grace period starts when the update period ends and lasts for one month. It takes place every September for the update period that starts in April and every March for the update period that starts in October. During the grace period, it isn't possible to reschedule an update to a later date; Microsoft automatically reschedules environment updates that don't succeed for seven days later. Administrators can only reschedule this new attempt to an earlier date. To ensure action is taken during the grace period to ensure the environment update succeeds, Microsoft alerts administrators in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] and might send in-product notifications to end-users about the upcoming enforced update period. Learn more in [When Microsoft can't update apps or PTEs](../developer/app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

> [!TIP]
> We recommend that you keep any apps and per-tenant extensions ready to update at any given time, and that you actively test compatibility. Developers can get tips and guidance in the developer docs here: [Maintain AppSource Apps and Per-Tenant Extensions](../developer/app-maintain.md). Admins can install, update, and uninstall apps in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] as described here: [Managing Apps](tenant-admin-center-manage-apps.md).

### Enforced update period

The enforced period starts when the grace period ends. During this period, any extensions causing the update to the next major version to fail, for example, because of compatibility issues, might be automatically uninstalled from the environment so that the update succeeds. Data belonging to these uninstalled extensions isn't deleted from the environment and can be recovered by installing a compatible extension version after the update succeeds. Learn more in [When Microsoft can't update apps or PTEs](../developer/app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

## Minor updates

Minor updates are released every month in which there's no major update release, that is, every month except April and October. These updates contain application changes that are critical improvements to the service, including regulatory updates. Similar to major updates, minor updates are made generally available in the beginning of each calendar month. After a minor update is general available, new environments are created on the new minor version. The new minor version is made available as update to environments on the previous version around a week after general availability; the exact timing might differ per environment. When a new minor version is made available as update on your environment, Microsoft schedules the update to take place around a week later; the exact timing might differ per environment.

It isn't possible to skip versions; environments that aren't on the latest version when a new minor version becomes available have to update to every intermediate version before they can update to the latest version. It might take up to an hour for the next version to become as available as update on your environment upon completing an update to a version that isn't the latest generally available.

> [!IMPORTANT]
> For 2024 release wave 2, minor updates are optional but not skippable as part of the public preview for [flexible update management](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/manage-environment-updates-more-flexibly.md). This only applies to [Microsoft-localized environments](../compliance/apptest-countries-and-translations.ms).
>
> [Partner-localized environments](../compliance/apptest-countries-and-translations.ms) are not part of the public preview; for these environments minor updates are required and not skippable. As in previous release waves and similar to how major updates roll out, minor updates have a 28-day update period followed by a 3-month grace period for these environments.
>
> Once the changes that are part of [flexible update management](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/manage-environment-updates-more-flexibly.md) are generally available minor updates will be optional on all environments, and administrators will be able to skip versions by changing the target version for a scheduled update from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].

## Release plans

Get an overview of the release plans at [Dynamics 365 and Microsoft Power Platform release plans](/dynamics365/release-plans/). For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans, select a release wave under **Dynamics 365**, then look under **SMB** in the table of contents.

## Schedule updates

When the update becomes available for your environment, a notification email is sent to all [notification recipients](tenant-admin-center-notifications.md) registered in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. A notification about the update availability is also shown in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] itself.  

Starting this day, you can use the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to [schedule the date](tenant-admin-center-update-management.md#schedule) when you prefer the update to happen.  

[!INCLUDE [admin-set-update-date](../includes/admin-set-update-date.md)]

When the scheduled update date arrives, the update runs automatically within the update window that you specified for this environment. All users are from this environment, and all attempts to sign in during the update are blocked with the message `Service is under maintenance`.  

> [!IMPORTANT]
> The update duration differs depending on the environment. We strongly recommend scheduling the update for a date when it would be acceptable for the environment to be inaccessible until the end of its update window.

For more information, see [Set the update window for each environment](tenant-admin-center-update-management.md#set-the-update-window-for-each-environment).  

> [!NOTE]
> When you select a current date for your update, but the update window defined for this environment has already passed, the update will start within that time window, but on the day after the one that you defined for your environment.
>
> For example, if you're changing the **Scheduled update date** to the current date at 6 PM, and your update window is set to 1 AM - 7 AM, the update will not start immediately, but after 1 AM on the next day.  

### Delayed scheduling of updates

In some cases, even after the update is available in your area, you're still not able to set the update date (schedule environment update). This condition can happen for one of the following reasons:  

- Your environment isn't yet updated to the latest minor update of the previous version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. All environments must be updated to the last available minor update of the previous version before they can be scheduled for the next major version. You can check the version information in the **Troubleshooting** section of the **Help and Support** page in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and in the **Version Management** section in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. For more information, see [Version numbers in Business Central](version-numbers.md).  

    Microsoft actively works on updating all environments to the latest minor update as soon as possible. In most cases, your environment will be scheduled for the major update soon. You get a chance to change the date to the one that fits you better. In the unlikely situation that your environment is updated to the last minor update close to or after the last selectable update date, you still get at least seven days to schedule the update.  

- You created a new sandbox environment as a copy of your production environment. In this case, the sandbox environment is created on the same version as the production environment it was copied from. If your newly created sandbox environment is running on the last minor update of the previous version, Microsoft schedules it for update automatically within one hour.  

    You receive email notification and should see the notification in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] when it happens. The scheduled update date for this environment is set to seven days from the current date. This scheduled date gives you enough time to change the date to one that fits you better, including the current date.  

- Your per-tenant extensions aren't compatible with the next major update.  

    [!INCLUDE [admin-update-pte](../includes/admin-update-pte.md)]

- The AppSource apps that are installed in your environment aren't yet available for the next major version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)].  

    While most AppSource apps are kept up to date by the app providers, a particular app might need more time to prepare for the next major update and isn't yet available for it. In this situation, contact the app owner to understand their availability plans.  

> [!TIP]
> Make sure every tenant has the right contacts set up to get email notification. Learn more in [Managing Tenant-Specific Notifications](tenant-admin-center-notifications.md).

## Failed updates and rescheduling

An environment might fail to update for various reasons, such as:

- Per-tenant extension compatibility issues  
- AppSource app compatibility issues  
- Internal update issues  

Any environment that fails to update will be automatically restored to the original application version so that users can connect to it again. The environment is then automatically rescheduled for a new update attempt in seven days. If you consider the issue resolved and want to try the update again, change the update date to an earlier date or the current date.  

If Microsoft can't do the update on the selected date, you'll be notified by email that the environment update is rescheduled for seven days later. You can change that date in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to any other allowed date, including the current date.

## <a name="postponed"></a>Postponed updates

In critical circumstances, Microsoft can decide to postpone the rollout of the updates, such as if a critical issue is discovered in the upcoming major version. While Microsoft is working on addressing the issue, the updates will be postponed. You'll receive email notification, and you'll see the notification displayed in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. The **Version Management** section for each environment will show the update rollout state as *Postponed*.  

If we don't know the nature of the issue and the solution in advance, we can't predict when the updates will resume again. As a result, the email and the notification in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] won't contain the information about the expected resume date. In these extreme cases, Microsoft actively works on resuming updates as a matter of highest priority once the issue is addressed. You receive another email notification when updates resume. The last available date is prolonged by the number of days that the update was postponed.  

If it happens that you schedule the update of an environment to a date when the updates are postponed, the environment won't be updated. Microsoft won't send a separate notification. You can reschedule the update to a later date, or you can wait until you receive an email notification that the updates resumed. All environments that missed their scheduled update date are rescheduled automatically to run the update within seven days from the date the updates were resumed. You can change that date to any other allowed date, including the current date.  

If you didn't explicitly set a date for your environment update in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], this environment is picked up for updating automatically, shortly after the updates resume. The update will still be executed within the specified update time window.  

## Prepare, test, and learn before a major update

You can prepare yourself, users, and any customizations by trying out the new major version before your production environment is updated. The following sections provide recommendations for how to prepare for an update.  

> [!IMPORTANT]
> We strongly recommend that you test any critical business scenarios before your production environments are updated to the new major or minor version.

### Prepare for major updates by enabling select features earlier

Some new features can be switched on ahead of time on sandbox and production environments, giving you time to test and prepare for change. Most times, you can switch on features several weeks before preview environments for the major update are available.

When Microsoft releases features or feature design improvements as part of minor updates, some of these features are optional until the following major update. Administrators can turn these optional features on or off from the **Feature Management** page.

Learn more in [Feature Management](feature-management.md).  

### Prepare for major updates with preview environments

[!INCLUDE [admin-previews](../developer/includes/admin-previews.md)]

Learn more in [Prepare for major updates with preview environments](preview-environments.md).  

### Prepare for major updates just before the production environment is updated

As soon as you're notified that the new major update is available, you can test the new version. Just create a sandbox environment that you then schedule to be updated. Start by copying your production environment into a sandbox on the same version as your production environment. All newly created environments are automatically included in the update process within one hour. You'll get notified that the update is available, and you'll be able to schedule the newly created sandbox for update within one hour after it was created. By default, the newly created environments are scheduled to run the update within seven days from the date they were created. But, you can change that date to any other allowed date, including the current date.  

If you change the update date to the current date, the update starts within the closest available update time window you specified for the environment. If you want to start the update of your sandbox environment immediately, you can set the update time window for this sandbox environment to be 24 hours.  

Microsoft monitors each update of an environment. If we detect any errors during the update, you receive an email notification that describes the detected issues.  

Any environments that fail to update due to per-tenant extension compatibility issues or any other issues are automatically restored to the original application version. Within one hour, they're automatically rescheduled for another update attempt. The scheduled update date is automatically set to seven days in the future to give you time to resolve the issues. If you address the compatibility issues sooner, you can change the date to an earlier date, including the current date. This pattern repeats until the environment is updated successfully.  

> [!IMPORTANT]
> Changing date to an earlier date might be blocked up to 24 hours after the last failed attempt to update.

## Service updates

The service components apply to multiple environments, such as all tenants in a region. So Microsoft schedules those updates to a time when traffic is lower in each region, typically during the evening or night. Typically, these service updates are transparent to any users, as the service is designed to manage traffic in a way that any users still working in [!INCLUDE [prod_short](../includes/prod_short.md)] aren't affected by these service updates.  

These updates don't add or remove functionality, and they're transparent to business users.

## See also

[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[What's new or changed in Business Central](../whatsnew/overview.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
