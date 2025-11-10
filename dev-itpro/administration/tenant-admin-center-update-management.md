---
title: Managing Updates in the Admin Center
description: Use the Business Central administration center to manage environment updates, including setting update windows and update dates.  
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 08/19/2025
ms.author: jswymer
ms.reviewer: jswymer
---

# Managing updates in the Business Central admin center

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments follow a set update schedule to deliver new functionality, improvements, and bug fixes. There are two major update cycles each year, starting in April and October, with minor updates in other months. Learn more in [Major Updates and Minor Updates](update-rollout-timeline.md). Refer to the [release plan](/dynamics365/release-plans/) for an overview of new and upcoming functionality. To learn about new functionality, bug fixes, and improvements in recent versions, see [What's new or changed](../whatsnew/overview.md).

Microsoft manages updates for the application and platform. As an internal admin or partner, use the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to specify the timing of updates for each environment and identify who receives [notifications when an update is available](#notify). Prepare your solution and users by creating preview environments to get familiar with new product functionality. Learn more in [Update cycles](update-rollout-timeline.md).  

## Set the update window for each environment

The update window for an environment defines the hours during the day for the selected time zone in which the environment can be updated. When an update is rolling out, it's applied to an environment within the time frame that the update window defines.

> [!IMPORTANT]
> Updates always start during the update window specified for the environment, but not necessarily right at the start of the update window. Updates that fail to complete before the end of the update window are canceled to ensure the environment is operational during business hours. The update is automatically rescheduled seven days later and [notification recipients](#notify) are informed.

This window helps ensure updates are applied outside of the normal business hours of the organization. Every environment has a default update window that's between 8:00 PM and 6:00 AM local time for the environment's country/region. In countries/regions that have multiple time zones, the system sets a time zone that's close to the geographic center of the country/region as default.

> [!NOTE]
> Desktop users who are signed in to the environment during the update receive an alert in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] before the update starts.

To change the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select the **Name** of the relevant environment to open the environment details.
2. Select the **Update Settings** action, and then select the **Set update window** action.
3. In the **Set update window** pane, specify the time zone, start time, and end time, for the update window for the environment. The update window must be a minimum of six hours.
4. Select **Save**.

This timeslot now becomes the default window when updates are applied to this environment.

## <a name="schedule"></a>Schedule an update

Admins can schedule environment updates to any version higher than the current environment version within the environment's current or next major version from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], even if the chosen version isn't available yet.  

[!INCLUDE [admin-set-update-date](../includes/admin-set-update-date.md)]

When the scheduled update date arrives, the update runs automatically within the update window you specify for this environment. During the update, all users and sign-in attempts to the environment are blocked with the message `Service is under maintenance`.

> [!IMPORTANT]
> The update duration differs depending on the environment. We strongly recommend scheduling the update for a date when it's acceptable for the environment to be inaccessible until the update window ends.  

### Schedule an update to an available version

Available versions are versions released by Microsoft and ready for environments to update to. [Notification recipients](tenant-admin-center-notifications.md) get an email notification when a new version is available.  

To schedule an update:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select the **Name** of the relevant environment to open the environment details.
1. Under **Update Settings**, select the **Modify** action for **Next Update**.
1. In the **Schedule Environment Update** pane, select target version marked as **Available**.

   > [!NOTE]
   > During preview periods, a target version marked as **Preview** appears in the list of available versions for sandbox environments. Ensure you're familiar with the limitations of [preview environments](preview-environments.md) before scheduling an update to a preview version.
   >
   > Notification recipients registered in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] do not receive email notifications regarding availability of a new preview version or execution of an environment update to a preview version (scheduled, succeeded, or failed update). Use the Operations page in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to view details on an environment update to a preview version.

1. Pick a date within the [update period](update-rollout-timeline.md#update-period) for the environment's current major version to schedule the update for.

   > [!NOTE]
   > If you select today's date for the update but the environment's update window is already past, the update starts in the next day's update window.
   >
   > For example, if you change the **Scheduled update date** to the current date at 6 PM, and the update window is set to 1 AM–7 AM, the update doesn't start immediately but starts after 1 AM the next day.
   >
   > To start an update immediately, schedule it for the current date and set **Allow the update to run outside the update window** to **Yes**. If an update is scheduled for the same day, this option lets the update start immediately and allows large updates to run for longer than 24 hours if needed. Updates running in this mode aren't automatically canceled when the update window ends. Avoid using this setting for environments that must be available for users by a specific time.  

1. Select **Schedule Update**.

> [!NOTE]
> <!--The chosen date for a target version is preserved for that version even if the target version and date for an environment's next update are changed later. If when an updates succeeds, the next update scheduled by Microsoft is for a target version for which a date was selected previously, this date will be when the next update runs rather than the default seven days after completion of the previous update.--> The chosen date for a target version remains the same even if the target version and date for an environment's next update change later. If an update succeeds and the next update scheduled by Microsoft is for a target version with a previously selected date, that date is used for the next update instead of the default seven days after the previous update finishes.  

### Schedule an update to a planned version

Planned versions are versions that Microsoft didn't release yet. Administrators can select planned versions within the current and next major version of the environment as the next update. This way, Microsoft doesn't schedule updates on the environment until the chosen planned version is available. A few days after the chosen version is available, the update is scheduled for a date at least seven days later automatically. [Notification recipients](tenant-admin-center-notifications.md) receive an email notification when a new version is available and another when the update is scheduled for the environment. Administrators can change the update date after it's scheduled by following the instructions under **Schedule an update to an available version**.

To schedule an update to a planned version:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select the **Name** of the relevant environment to open the environment details.
1. Under **Update Settings**, select the **Modify** action for **Next Update**.
1. In the **Schedule Environment Update** pane, select the planned target version. Each planned version indicates the month when the version is expected to be available.
1. Select **Schedule Update**.

> [!NOTE]  
> Only versions planned for release during the [update period](update-rollout-timeline.md#update-period) of the environment's current major version can be selected. For example, you can't select planned version 26.5 for an environment on 25.x, because 26.5 releases in September 2025 and the 25.x update period ends in August 2025.

## Cancel a running update

Running updates are cancelled automatically if the update does not succeed before the end of the update window set for the environment. If you need to cancel an update before the end of the update window or an update that has been allowed to run outside the environment's update window, you can do so from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. To cancel a running update, navigate to the **Operation Details** pane from the Environment Details or Operations page and choose **Cancel update** by the operation status.

Cancelling a running update will stop the update process and restore the environment to its state immediately before the update started. Depending on the size of the environment database this process may take more than an hour, during which the environment is not accessible.

## <a name="notify"></a>Get notified of updates

A notification is sent to all notification recipients that are listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] whenever a new version becomes available and whenever an update is scheduled for your environment. Learn more in [Managing Tenant Notifications](tenant-admin-center-notifications.md).

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

## Environments that can't get updated

Sometimes an environment can't get the new update. For example, a per-tenant extension might conflict with the changes in the new version of the base application.  

[!INCLUDE [admin-update-pte](../includes/admin-update-pte.md)]

Learn more in [Completed updates](update-rollout-timeline.md#completed-updates).  

## Related information

[What's new or changed in Business Central](../whatsnew/overview.md)  
[Major Updates of Business Central Online](update-rollout-timeline.md)  
[Prepare for major updates with preview environments](preview-environments.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
