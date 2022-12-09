---
title: Managing Updates in the Admin Center
description: Use the Business Central administration center to manage environment updates, including setting update windows and update dates.  
author: edupont04

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 05/31/2022
ms.author: edupont
---

# Managing Updates in the Business Central Admin Center

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments are updated according to the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] [roadmap](https://dynamics.microsoft.com/roadmap/business-central/) with two major updates in April and October each year, and monthly, minor updates. For more information, see [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md) and the [Dynamics 365 Release Plans](/dynamics365/release-plans/).

Updates of the base application and platform are managed by Microsoft. As an internal administrator or as a partner, you use the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to specify the timing of updates for each environment and who receives [notifications of when an update is available](#notify). You can also help prepare your solution and your users by creating preview environments so that you can get acquainted with new functionality in the product. For more information, see [Major Updates and Minor Updates](update-rollout-timeline.md).  

## Set the update window for each environment

The update window for an environment defines the hours during the day for the selected time zone in which the environment can be updated. When an update is rolling out&mdash;monthly or major update&mdash;it will be applied to an environment within the time frame that the update window defines.

This window helps ensure updates are applied outside of the normal business hours of the organization. Every environment has a default update window that's between 8:00 PM and 6:00 AM local time for the environment's country. In countries that have multiple time zones, the system sets a time zone that's close to the geographic center of the country as default.

<!--
 The default time zone is set based on the environment localization and may differ from the administrator's time zone in countries that span multiple time zones.
-->
> [!NOTE]
> Desktop users who are signed in during the update will receive an alert in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] before the update starts.

To change the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Update Settings** action, and then choose the **Set update window** action.
3. In the **Set update window** pane, specify the time zone, start time, and end time, for the update window for the environment. The update window must be a minimum of six hours.
4. Choose **Save**.

This timeslot now becomes the default window when updates will be applied to this environment.

## <a name="schedule"></a>Schedule an update date

Once an update is available, you can choose a specific date that each environment is updated.  

[!INCLUDE [admin-set-update-date](../includes/admin-set-update-date.md)]

For more information, see [Schedule updates](update-rollout-timeline.md#schedule-updates).  

To schedule an update date:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Update Settings** action, and then choose the **Set update date** action.
3. In the **Schedule Environment Update** pane, specify the update date.
    > [!NOTE]
    > You can choose to ignore the environment's update window when scheduling a specific update by switching **Allow the update to run outside the update window** to **Yes**. If an update is scheduled for the same day, this option lets it start immediately, and it lets large upgrades run for longer than 24 hours if required.

4. Choose **Schedule Update**.

If an administrator hasn't picked a date for an update, then the update is applied automatically within a default date range. The default date range is communicated in advance to tenant administrators through administrative notifications. You can then choose to override that with a custom date by following the steps that are provided above. Not selecting an update date doesn't prevent the environment from being updated.

## <a name="notify"></a>Get notified of updates

For updates that tenant administrators can schedule, a notification is sent to all notification recipients that are listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. For more information, see [Managing Tenant Notifications](tenant-admin-center-notifications.md).

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

For versions earlier than 2021 release wave 1, admins can't schedule the monthly minor updates. Until such environments are updated to version 18.0 and later, the update is applied to tenant environments as it becomes available. No notifications are sent to tenant administrators prior to the update. Notifications are sent only after the update is applied.  

## Environments that can't get updated

Sometimes an environment can't get the new update. For example, a per-tenant extension might conflict with the changes in the new version of the base application.  

[!INCLUDE [admin-update-pte](../includes/admin-update-pte.md)]

For more information, see [Failed updates and rescheduling](update-rollout-timeline.md#failed-updates-and-rescheduling).  

## See also

[Major Updates of Business Central Online](update-rollout-timeline.md)  
[Prepare for major updates with preview environments](preview-environments.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
