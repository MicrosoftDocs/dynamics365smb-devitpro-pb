---
title: Update cycles
description: Learn about the timeline of Business Central online update rollouts. Prepare for both major updates and minor updates with minimal disruption in productivity.  
author: jswymer
ms.topic: article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update, flag, keys
ms.date: 08/19/2025
ms.author: jswymer
ms.reviewer: jswymer
---

# Update cycles 

This article provides an overview of what you need to know about how a major or minor update for [!INCLUDE[prod short](../developer/includes/prod_short.md)] rolls out. It includes key dates, actions you need to take, and answers some common questions.

[!INCLUDE [service-updates](../includes/service-updates.md)]

Microsoft is committed to delivering predictable updates to the service. Updates are continuous, touchless updates that provide new features and functionality. They eliminate the need to do expensive upgrades every few years. Administrators can set a maintenance window for each environment that determines when Microsoft is allowed to update that environment. For more information, see [Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md). Scheduled minor and major updates, and unscheduled critical fixes, respect the maintenance window set on each environment.

You are in control and manage how your organization receives these updates. Microsoft applies updates to each environment based on your configuration. The only exception is how Microsoft maintains the underlying platform with invisible updates during low traffic hours, for example. For more information, see the [service updates](#service-updates) section.  

The Dynamics 365 team designs and develops each new update. Any new update is first validated by the feature team, then validated in combination with the full product. During this time, extensive testing is done on various test topologies. A compatibility checker also runs tests to ensure backward compatibility.  

## Major updates

There are two major update cycles per year, with major releases every April and October. Major updates introduce new features, enhancements, and platform improvements. For each major update cycle, the following periods apply.

### Preview period

The preview period allows for testing new functionality before the version is made available as an update to your environment. Administrators can create a sandbox environment from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] on the preview version or update an existing sandbox to the preview version. A preview version lets you try out new functionality or test compatibility of extensions in a cloud environment. For regular tenants, this period starts a month before the release of the new major version, that is, every March and September. Tenants with the [Partner Sandbox](environment-types.md#partnersandbox) license have access to the [early access preview](preview-environments.md), which runs alongside the entire update period. Learn more in [Preparing for major updates with preview environments](preview-environments.md).

### Update period

The update period starts when a new major version is generally available (GA), typically the first workday of April and October. After general availability, new environments are created on the new major version. The new major version is available as an update to existing environments about a week after general availability, though the exact timing might differ by environment.

The update period lasts for five calendar months, ending in early September for update periods that start in April, and in early March for update periods that start in October. Administrators can reschedule the update to any date within the update period from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. Learn more in [Rescheduling updates](tenant-admin-center-update-management.md).

Scheduled update attempts that don't succeed are automatically rescheduled for seven days later, and administrators can reschedule them to any other date within the update period. Learn more in the [Completed updates](#completed-updates) section.

When a new version is available as update on the environment, [Notification recipients](tenant-admin-center-notifications.md) receive an email notification and environments [enabled with telemetry](telemetry-enable-application-insights.md) receive a signal with the [LC0100 tag](telemetry-environment-lifecycle-trace.md#environment-update-available).

### Grace period

The grace period starts when the update period ends and lasts one month. It occurs every September for the update period starting in April and every March for the update period starting in October. During the grace period, you can't reschedule an update to a later date or to a target version within the environment's current major version. Microsoft automatically reschedules unsuccessful environment updates to be reattempted seven days later. Administrators can only reschedule this attempt to an earlier date or to a different target version within the next major version. To ensure the environment update succeeds during the grace period, Microsoft alerts administrators in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] and might send in-product notifications to end users about the upcoming enforced update period. Learn more in [When Microsoft can't update apps or per-tenant extensions (PTEs)](../developer/app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

> [!TIP]
> We recommend that you keep any apps and per-tenant extensions ready to update at any given time, and that you actively test compatibility. Developers can get tips and guidance in the developer docs here: [Maintain AppSource Apps and Per-Tenant Extensions](../developer/app-maintain.md). Admins can install, update, and uninstall apps in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] as described here: [Managing Apps](tenant-admin-center-manage-apps.md).

### Enforced update period

The enforced period starts when the grace period ends. During this period, any extensions causing the update to the next major version to fail, for example, because of compatibility issues, might be automatically uninstalled from the environment so that the update succeeds. Data belonging to these uninstalled extensions isn't deleted from the environment and can be recovered by installing a compatible extension version after the update succeeds. Learn more in [When Microsoft can't update apps or PTEs](../developer/app-maintain.md#when-microsoft-cant-update-apps-or-ptes).

> [!IMPORTANT]
> It is not possible to [restore](tenant-admin-center-backup-restore.md) an environment to a version that is in its Grace or Enforced update period after an update to a later version has succeeded.

## Minor updates

Minor updates are released every month in which there's no major update release, that is, every month except April and October. These updates contain application changes that are critical improvements to the service, including regulatory updates. Like major updates, minor updates are generally available at the start of each calendar month. After a minor update is general available, new environments use the new minor version by default. The new minor version becomes available as an update to environments on the previous version about a week after general availability. The exact timing can vary by environment.  

## Release plans

Get an overview of the release plans at [Dynamics 365 and Microsoft Power Platform release plans](/dynamics365/release-plans/). For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans, select a release wave under **Dynamics 365**, then look under **SMB** in the table of contents. Learn about new functionality, bug fixes, and improvements shipped in recent versions in [What's new or changed](../whatsnew/overview.md).

## Completed updates

An environment update completes when it succeeds, fails, or is canceled because the update window ends.

An environment might fail to update for various reasons, such as:

- Per-tenant extension compatibility issues  
- AppSource app compatibility issues  
- Internal update issues  

When an update fails or is canceled, the environment restores to the original application version so users can connect to it again. The environment is rescheduled for a new update attempt in seven days. To resolve the issue and retry the update, change the update date to an earlier or current date.

> [!IMPORTANT]
> If a failed update was scheduled by Microsoft services, not an admin, and the target version isn't the latest available, the next update might be rescheduled to use the latest available version. Updates scheduled by administrators aren't rescheduled unless the update period ends for the selected target version.

If Microsoft can't do the update on the selected date, [notification recipients](tenant-admin-center-notifications.md) get an email that the environment update is rescheduled for seven days later. Administrators can change the date in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to any other allowed date, including the current date.

When an update succeeds, the system schedules the next update to target the latest available version and occur at least seven days later. If the successful update targeted the latest available version, the system schedules the next update to target the version planned to become available next and occur automatically on a date when it becomes available.

> [!NOTE]
> <!--The chosen date for a target version is preserved for that version even if the target version and date for an environment's next update are changed later. If when an updates succeeds, the next update scheduled by Microsoft is for a target version that has a chosen date that is in the future already, this chosen date will be when the next update runs rather than the default seven days after completion of the previous update.--> The chosen date for a target version remains the same even if the target version and date for an environment's next update change later. If an update succeeds, and the next update scheduled by Microsoft is for a target version with a date in the future, the future date is used for the next update instead of the default seven days after the previous update finishes.  

The target version and date for an environment's next update can be changed in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. Learn more in [Managing updates in the admin center](tenant-admin-center-update-management.md).

## <a name="postponed"></a>Postponed updates

In critical circumstances, Microsoft might postpone the rollout of updates, for example, if a critical issue is discovered in an upcoming major version. While Microsoft addresses the issue, the updates are postponed. For environments scheduled for postponed update, [notification recipients](tenant-admin-center-notifications.md) receive an email notification, and the notification is displayed in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

If the nature of the issue and the solution aren't known in advance, it's impossible to predict when updates resume. As a result, the email and the notification in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] don't include information about the expected resume date. In these cases, Microsoft prioritizes resuming updates as soon as the issue is resolved. For environments that have an update scheduled to the version for which updates are postponed, [notification recipients](tenant-admin-center-notifications.md) receive another email notification when updates resume. For environments scheduled for postponed update, [notification recipients](tenant-admin-center-notifications.md) get another email when updates resume.  

If you schedule an environment update for a date when updates to the selected target version are postponed, the environment isn't updated. [Notification recipients](tenant-admin-center-notifications.md) get an email notification that the scheduled update didn't run. The update is automatically rescheduled for another attempt seven days later. You can reschedule the update to a different date or target version, or wait until you get an email notification that the updates resume.

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

When you're notified that a new major update is available, test the new version using a copy of your current production data. Copy the production environment to a sandbox environment, and schedule the update for the sandbox environment. To start the update immediately, schedule it for the current date and set **Allow the update to run outside the update window** to **Yes**.  

Microsoft monitors each update of an environment. If we detect any errors during the update, [notification recipients](tenant-admin-center-notifications.md) get an email that describes the detected issues.  

## Service updates

The service components apply to multiple environments, such as all tenants in a region. Microsoft schedules service updates when regional traffic is lower, typically in the evening or at night. Typically, business users don't notice service updates because the service manages traffic so users working in [!INCLUDE [prod_short](../includes/prod_short.md)] aren't affected. These updates don't add or remove functionality.

## Related information

[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[What's new or changed in Business Central](../whatsnew/overview.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
