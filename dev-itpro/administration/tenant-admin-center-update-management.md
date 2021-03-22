---
title: Updating Environments | Microsoft Docs
description: Use the Business Central administration center to manage environment updates.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 10/01/2020
ms.author: edupont
---

# Managing Updates in the Business Central Admin Center

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments are updated according to the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] [roadmap](https://dynamics.microsoft.com/roadmap/business-central/) with two major updates in April and October each year, and monthly service updates. For more information, see [Dynamics 365 Release Plans](/dynamics365/release-plans/).

Updates of the base application and platform are managed by Microsoft. As an internal administrator or as a partner, you can use the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to specify certain parameters of the timing of updates for each environment, and you can specify the people who must receive [notifications of when an update is available](#notify). You can also help prepare your solution and your users by creating preview environments so that you can get acquainted with new functionality in the product. For more information, see [Major Updates of Business Central Online](update-rollout-timelime.md).  

## Set the update window for each environment

The update window for an environment defines a window of time during the day in which the environment can be updated. When an update is rolling out to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, regardless of whether it's the monthly service update or a major update, the update will be applied to an environment within the time frame that the update window defines. This helps to ensure that updates are applied outside of the normal business hours of the organization, for example.

The update window must be a minimum of six hours.

> [!NOTE]
> Desktop users who are signed in during the update will receive an alert in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

To set the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Set update window** action on the **Update** list on the action ribbon.
3. In the **Set update window** pane, specify the start time and the end time for the update window for the environment.
   > [!NOTE]
   > The update window must be a minimum of six hours.
4. Choose **Save**.

## <a name="schedule"></a>Schedule an update date

Specifically for major updates, you can choose a specific date on which the environment is updated. The **Update version** field in the **Version Management** section of the environment details also displays the version number of the available update version.

To schedule an update date:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Set update date** action on the **Update Settings** list on the action ribbon.
3. In the **Schedule Environment Update** pane, specify the update date.
    > [!NOTE]
    > The specified date must be within a given date range that is shown in the pane.

4. Choose **Schedule Update**.

If an administrator has chosen the **Set update date** action but not set a date, then the update is applied automatically to each tenant environment with a default date range. The default date range is communicated in advance to tenant administrators through administrative notifications. You can then choose to override that with a custom date by following the steps that are provided above. Not selecting an update date does not prevent the environment from being updated.

## <a name="notify"></a>Get notified of updates

For updates for which the option is available for tenant administrators to schedule the update date, a notification is sent to the notification recipients listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. For more information, see [Managing Tenant Notifications](tenant-admin-center-notifications.md).

> [!IMPORTANT]
> To not miss update notifications from Microsoft, you must add [notification recipients](tenant-admin-center-notifications.md) and verify that the e-mails are not redirected to a spam folder by your e-mail software. The notifications are sent from the Microsoft Partner Center address, `msftpc@microsoft.com` and contain `Dynamics 365 Business Central` in the subject line.  

Scheduling environment updates is *not* available for monthly service updates. For these, the update is applied to tenant environments as it becomes available. No notifications are sent to tenant administrators prior to the update. Notifications are sent only after the update is applied.

## See also

[Major Updates of Business Central Online](update-rollout-timelime.md)  
[Prepare for major updates with preview environments](preview-environments.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
