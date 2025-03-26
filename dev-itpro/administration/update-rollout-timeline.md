---
title: Update cycles
description: Learn about the timeline for how updates of Business Central online rollout. You can prepare for both major updates and minor updates with minimal disruption of your users' productivity.  
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update, flag, keys
ms.date: 08/26/2024
ms.author: jswymer
ms.reviewer: jswymer
---

# Update cycles 

This article provides an overview of what you need to know about how a major or minor update for [!INCLUDE[prod short](../developer/includes/prod_short.md)] rolls out. It includes key dates, actions you need to take, and answers some common questions.

[!INCLUDE [service-updates](../includes/service-updates.md)]

Microsoft is committed to delivering predictable updates to the service. Updates are continuous, touchless updates that provide new features and functionality. They eliminate the need to do expensive upgrades every few years. Administrators can set a maintenance window for each environment that determines when Microsoft is allowed to update that environment. For more information, see [Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md). Scheduled minor and major updates, as well as unscheduled critical fixes, respect the maintenance window set on each environment.

You are in control and manage how your organization receives these updates. Microsoft applies updates to each environment based on your configuration. The only exception is how Microsoft maintains the underlying platform with invisible updates during low traffic hours, for example. For more information, see the [service updates](#service-updates) section.  

The Dynamics 365 team designs and develops each new update. Any new update is first validated by the feature team, then validated in combination with the full product. During this time, extensive testing is done on various test topologies. A compatibility checker also runs tests to ensure backward compatibility.  

## Major updates

There are two major update cycles per year, with major releases every April and October. Major updates introduce new features, enhancements, and platform improvements. For each major update cycle, the following periods apply.

### Preview period

The preview period allows for testing of the new functionality before the version is made available as update to your environment. Administrators can create a Sandbox environment from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] on the new version, for example to try out new functionality or test compatibility of extensions in a cloud environment. This period typically starts a month before the release of the new major version, that is, every March and September. Learn more in [Preparing for major updates with preview environments](preview-environments.md).

### Update period

The update period starts when a new major version is generally available, typically the first workday of every April and every October. Once the version is generally available, any new environments are created on the new major version. The new major version is made available as update to existing environments around a week after general availability; the exact timing might differ per environment.

The update period lasts for five calendar months, ending in early September for update periods that start in April, and in early March for update periods that start in October. Administrators can reschedule the update to any date within the update period from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. Learn more in [Rescheduling updates](tenant-admin-center-update-management.md).

Scheduled update attempts that don't succeed are automatically rescheduled for seven days later, and administrators can reschedule them to any other date within the update period. Learn more in the [failed updates and rescheduling](#failed-updates-and-rescheduling) section.

When a new version is available as update on the environment, [Notification recipients](tenant-admin-center-notifications.md) receive an email notification and environments [enabled with telemetry](telemetry-enable-application-insights.md) receive a signal with the [LC0100 tag](telemetry-environment-lifecycle-trace.md#environment-update-available-for-scheduling).

### Grace period

The grace period starts when the update period ends and lasts for one month. It takes place every September for the update period that starts in April and every March for the update period that starts in October. During the grace period, it isn't possible to reschedule an update to a later date or to a target version within the environment's current major version; Microsoft automatically reschedules environment updates that don't succeed to be reattempted seven days later. Administrators can only reschedule this new attempt to an earlier date or to a different target version within the next major version. To ensure action is taken during the grace period to ensure the environment update succeeds, Microsoft alerts administrators in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] and might send in-product notifications to end-users about the upcoming enforced update period. Learn more in [When Microsoft can't update apps or PTEs](../developer/app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

> [!TIP]
> We recommend that you keep any apps and per-tenant extensions ready to update at any given time, and that you actively test compatibility. Developers can get tips and guidance in the developer docs here: [Maintain AppSource Apps and Per-Tenant Extensions](../developer/app-maintain.md). Admins can install, update, and uninstall apps in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] as described here: [Managing Apps](tenant-admin-center-manage-apps.md).

### Enforced update period

The enforced period starts when the grace period ends. During this period, any extensions causing the update to the next major version to fail, for example, because of compatibility issues, might be automatically uninstalled from the environment so that the update succeeds. Data belonging to these uninstalled extensions isn't deleted from the environment and can be recovered by installing a compatible extension version after the update succeeds. Learn more in [When Microsoft can't update apps or PTEs](../developer/app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

## Minor updates

Minor updates are released every month in which there's no major update release, that is, every month except April and October. These updates contain application changes that are critical improvements to the service, including regulatory updates. Similar to major updates, minor updates are made generally available in the beginning of each calendar month. After a minor update is general available, new environments are created on the new minor version by default. The new minor version is made available as an update to environments on the previous version around a week after general availability; the exact timing might differ per environment.

## Release plans

Get an overview of the release plans at [Dynamics 365 and Microsoft Power Platform release plans](/dynamics365/release-plans/). For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans, select a release wave under **Dynamics 365**, then look under **SMB** in the table of contents. To learn about new functionality, bug fixes, and improvements shipped in recent versions, see [What's new or changed](../whatsnew/overview.md).

## Completed updates

Environment updates complete when the environment is updated successfully, when the environment update fails, or when the update is cancelled because the update window for the environment ended.

An environment might fail to update for various reasons, such as:

- Per-tenant extension compatibility issues  
- AppSource app compatibility issues  
- Internal update issues  

When an update fails or is cancelled, the environment is automatically restored to the original application version so that users can connect to it again. The environment is then automatically rescheduled for a new update attempt in seven days. If you consider the issue resolved and want to try the update again, change the update date to an earlier date or the current date.

> [!IMPORTANT]
> If the target version and update date for a failed update were selected by Microsoft services and not modified by an administrator, and the target version is not the latest available version, the next update may be rescheduled to update to the latest available version. Updates scheduled by administrators are not rescheduled to a different version, unless the update period for the chosen target version has ended.

If Microsoft can't do the update on the selected date, [notification recipients](tenant-admin-center-notifications.md) are notified by email that the environment update is rescheduled for seven days later. Administrators can change that date in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to any other allowed date, including the current date.

When an update succeeds, the next update is scheduled to the latest available version of [!INCLUDE[prod short](../developer/includes/prod_short.md)] to take place at least seven days later. If the successful update was to the latest available version of [!INCLUDE[prod short](../developer/includes/prod_short.md)], the version that is planned to become available next is picked for the next update, and will automatically be scheduled for a date when it becomes available.

> [!NOTE]
> The chosen date for a target version is preserved for that version even if the target version and date for an environment's next update are changed later. If when an updates succeeds, the next update scheduled by Microsoft is for a target version that has a chosen date that is in the future already, this chosen date will be when the next update runs rather than the default seven days after completion of the previous update.

The target version and date for an environment's next update can be changed in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], see [Managing updates in the admin center](tenant-admin-center-update-management.md).

## <a name="postponed"></a>Postponed updates

In critical circumstances, Microsoft can decide to postpone the rollout of the updates, such as if a critical issue is discovered in the upcoming major version. While Microsoft is working on addressing the issue, the updates will be postponed. For environments that have an update scheduled to the version for which updates are postponed, [notification recipients](tenant-admin-center-notifications.md) will receive an email notification and you'll see the notification displayed in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].

If we don't know the nature of the issue and the solution in advance, we can't predict when the updates will resume again. As a result, the email and the notification in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] won't contain the information about the expected resume date. In these cases, Microsoft actively works on resuming updates as a matter of highest priority once the issue is addressed. For environments that have an update scheduled to the version for which updates are postponed, [notification recipients](tenant-admin-center-notifications.md) receive another email notification when updates resume.

If it happens that you schedule the update of an environment for a date when the updates to the selected target version are postponed, the environment won't be updated. [Notification recipients](tenant-admin-center-notifications.md) will receive an email notification informing them that the scheduled update did not run and the update will automatically be rescheduled for another attempt seven days later. You can reschedule the update to a different date or target version, or you can wait until you receive an email notification that the updates resumed.

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

As soon as you're notified that the new major update is available, you can test the new version with a copy of your current production data. Copy the production environment to a sandbox environment and schedule the update for the sandbox environment. To start the update immediately, schedule it for the current date and set **Allow the update to run outside the update window** to **Yes**.

Microsoft monitors each update of an environment. If we detect any errors during the update, [notification recipients](tenant-admin-center-notifications.md) receive an email notification that describes the detected issues.  

## Service updates

The service components apply to multiple environments, such as all tenants in a region. So Microsoft schedules those updates to a time when traffic is lower in each region, typically during the evening or night. Typically, these service updates are transparent to any users, as the service is designed to manage traffic in a way that any users still working in [!INCLUDE [prod_short](../includes/prod_short.md)] aren't affected by these service updates.  

These updates don't add or remove functionality, and they're transparent to business users.

## Related information

[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[What's new or changed in Business Central](../whatsnew/overview.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
