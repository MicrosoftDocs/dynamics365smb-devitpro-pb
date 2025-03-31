---
title: Managing Updates in the Admin Center
description: Use the Business Central administration center to manage environment updates, including setting update windows and update dates.  
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 08/26/2024
ms.author: jswymer
ms.reviewer: jswymer
---

# Managing updates in the Business Central admin center

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments follow a set update schedule to deliver new functionality, improvements, and bug fixes to environments. There are two major update cycles a year, starting every April and October, with minor updates released in every other month. Learn more in [Major Updates and Minor Updates](update-rollout-timeline.md). You can always refer to the [release plan](/dynamics365/release-plans/) for an overview of new and upcoming functionality. To learn about new functionality, bug fixes, and improvements shipped in recent versions, see [What's new or changed](../whatsnew/overview.md).

Microsoft manages updates for the application and platform. As an internal administrator or as a partner, you use the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to specify the timing of updates for each environment and who receives [notifications of when an update is available](#notify). You can also help prepare your solution and your users by creating preview environments so that you can get acquainted with new functionality in the product. Learn more in [Update Cycles](update-rollout-timeline.md).  

## Set the update window for each environment

The update window for an environment defines the hours during the day for the selected time zone in which the environment can be updated. When an update is rolling out, it's applied to an environment within the time frame that the update window defines.

> [!IMPORTANT]
> Updates always start during the update window specified for the environment, but not necessarily right at the start of the update window. Updates that fail to complete before the end of the update window are canceled to ensure the environment is operational during business hours. The update is automatically rescheduled seven days later and [notification recipients](#notify) are informed.

This window helps ensure updates are applied outside of the normal business hours of the organization. Every environment has a default update window that's between 8:00 PM and 6:00 AM local time for the environment's country/region. In countries/regions that have multiple time zones, the system sets a time zone that's close to the geographic center of the country/region as default.

> [!NOTE]
> Desktop users who are signed in to the environment during the update receive an alert in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] before the update starts.

To change the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Update Settings** action, and then choose the **Set update window** action.
3. In the **Set update window** pane, specify the time zone, start time, and end time, for the update window for the environment. The update window must be a minimum of six hours.
4. Choose **Save**.

This timeslot now becomes the default window when updates are applied to this environment.

## <a name="schedule"></a>Schedule an update

Administrators can schedule environment updates to any version higher than the current environment version within the environment's current and next major version from the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], regardless of whether the chosen version has been made available already. 

[!INCLUDE [admin-set-update-date](../includes/admin-set-update-date.md)]

When the scheduled update date arrives, the update runs automatically within the update window that you specified for this environment. All users are from this environment, and all attempts to sign in during the update are blocked with the message `Service is under maintenance`.  

> [!IMPORTANT]
> The update duration differs depending on the environment. We strongly recommend scheduling the update for a date when it would be acceptable for the environment to be inaccessible until the end of its update window.

### Schedule an update to an available version

Available versions are versions that have been released by Microsoft, and are ready for environments to be updated to. [Notification recipients](tenant-admin-center-notifications.md) receive an email notification whenever a new version becomes available.

> [!IMPORTANT]
> Choosing a target version for an environment's next update is expected to be available by the end of April 2025 for environments on version 25.5 or higher.

To schedule an update:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
1. Under **Update Settings**, choose the **Modify** action for **Next Update**.
1. In the **Schedule Environment Update** pane, choose an available target version and pick a date within the [update period](update-rollout-timeline.md#update-period) for the environment's current major version to schedule the update for.

    > [!NOTE]
    > When you select a current date for your update, but the update window defined for this environment has already passed, the update will start within that time window, but on the day after the one that you defined for your environment.
    >
    > For example, if you're changing the **Scheduled update date** to the current date at 6 PM, and your update window is set to 1 AM - 7 AM, the update will not start immediately, but after 1 AM on the next day.
    >
    > To start an update immediately, schedule it for the current date and set **Allow the update to run outside the update window** to **Yes**. If an update is scheduled for the same day, this option lets it start immediately, and lets large updates run for longer than 24 hours if necessary. Updates running in this mode aren't automatically canceled when the update window ends. Using this setting for environments that need to be available for users by a certain time isn't recommended.

1. Choose **Schedule Update**.

> [!NOTE]
> The chosen date for a target version is preserved for that version even if the target version and date for an environment's next update are changed later. If when an updates succeeds, the next update scheduled by Microsoft is for a target version for which a date was selected previously, this date will be when the next update runs rather than the default seven days after completion of the previous update.

### Schedule an update to a planned version

Planned versions are versions that have not yet been released by Microsoft. Administrators can choose planned versions within the current and next major version of the environment as next update. This way, no updates will be scheduled on the environment by Microsoft until the chosen planned version becomes available. Within a few days after the chosen version becomes available, the update will be scheduled for a date at least seven days later automatically. [Notification recipients](tenant-admin-center-notifications.md) receive an email notification whenever a new version becomes available, and another when the update has been scheduled for the environment. Administrators can still change the date for the update after it has been scheduled by following instructions above, under **Schedule an update to an available version**.

To schedule an update to a planned version:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
1. Under **Update Settings**, choose the **Modify** action for **Next Update**.
1. In the **Schedule Environment Update** pane, choose planned target version. For each planned version, the month in which the version is expected to become available is indicated.
1. Choose **Schedule Update**.

> [!NOTE]  
> Only versions that are planned to be released during the [update period](update-rollout-timeline.md#update-period) for the environment's current major version can be selected. For example, it is not possible to select planned version 26.5 for an environment on version 25.x as version 26.5 is planned to be released in September 2025 while the update period for 25.x ends in August 2025.

## <a name="notify"></a>Get notified of updates

A notification is sent to all notification recipients that are listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] whenever a new version becomes available and whenever an update is scheduled for your environment. Learn more in [Managing Tenant Notifications](tenant-admin-center-notifications.md).

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

## Environments that can't get updated

Sometimes an environment can't get the new update. For example, a per-tenant extension might conflict with the changes in the new version of the base application.  

[!INCLUDE [admin-update-pte](../includes/admin-update-pte.md)]

Learn more in [Failed updates and rescheduling](update-rollout-timeline.md#failed-updates-and-rescheduling).  

## Related information

[What's new or changed in Business Central](../whatsnew/overview.md)  
[Major Updates of Business Central Online](update-rollout-timeline.md)  
[Prepare for major updates with preview environments](preview-environments.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
