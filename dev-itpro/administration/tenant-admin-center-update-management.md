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

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments follow a structured update schedule based on the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] [roadmap](https://dynamics.microsoft.com/roadmap/business-central/). There are two major updates a year, in April and October, with minor updates rolled out every month except during those two months. Learn more in [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md) and the [Dynamics 365 Release Plans](/dynamics365/release-plans/).

Microsoft manages updates for the base application and platform. As an internal administrator or as a partner, you use the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to specify the timing of updates for each environment and who receives [notifications of when an update is available](#notify). You can also help prepare your solution and your users by creating preview environments so that you can get acquainted with new functionality in the product. Learn more in [Major Updates and Minor Updates](update-rollout-timeline.md).  

## Set the update window for each environment

The update window for an environment defines the hours during the day for the selected time zone in which the environment can be updated. When an update is rolling out, it's applied to an environment within the time frame that the update window defines.

> [!IMPORTANT]
> Updates always start during the update window specified for the environment, but not necessarily right at the start of the update window. Updates that fail to complete before the end of the update window are canceled to ensure the environment is operational during business hours. The update is automatically rescheduled seven days later and [notification recipients](#notify) are informed.

This window helps ensure updates are applied outside of the normal business hours of the organization. Every environment has a default update window that's between 8:00 PM and 6:00 AM local time for the environment's country/region. In countries/regions that have multiple time zones, the system sets a time zone that's close to the geographic center of the country/region as default.

<!--
 The default time zone is set based on the environment localization and may differ from the administrator's time zone in countries that span multiple time zones.
-->
> [!NOTE]
> Desktop users who are signed in during the update receive an alert in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] before the update starts.

To change the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Update Settings** action, and then choose the **Set update window** action.
3. In the **Set update window** pane, specify the time zone, start time, and end time, for the update window for the environment. The update window must be a minimum of six hours.
4. Choose **Save**.

This timeslot now becomes the default window when updates are applied to this environment.

## <a name="schedule"></a>Schedule an update date

Once an update is available, you can choose a specific date that each environment is updated.  

[!INCLUDE [admin-set-update-date](../includes/admin-set-update-date.md)]

Learn more in [Schedule updates](update-rollout-timeline.md#schedule-updates).  

To schedule an update date:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
1. Choose the **Update Settings** action, and then choose the **Set update date** action.
1. In the **Schedule Environment Update** pane, specify the update date.

    > [!NOTE]  
    > You can choose to ignore the environment's update window when scheduling a specific update by switching **Allow the update to run outside the update window** to **Yes**. If an update is scheduled for the same day, this option lets it start immediately, and lets large upgrades run for longer than 24 hours if necessary. Updates running in this mode aren't automatically canceled when the update window ends. Using this setting for environments that need to be available for users by a certain time isn't recommended.

1. Choose **Schedule Update**.

If the administrator is unable to pick a date for the update, then the update is applied automatically within a default date range. The default date range is communicated in advance to tenant administrators through administrative notifications. You can choose to override the default date range with a custom date by following the steps that are provided in **To schedule an update**. 

## <a name="notify"></a>Get notified of updates

For updates that tenant administrators can schedule, a notification is sent to all notification recipients that are listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Learn more in [Managing Tenant Notifications](tenant-admin-center-notifications.md).

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
