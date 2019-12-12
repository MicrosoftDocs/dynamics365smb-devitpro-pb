---
title: Updating Environments | Microsoft Docs
description: Use the Business Central administration center to manage environment updates.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 10/01/2019
ms.author: edupont
---

# Updating Environments

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments are updated according to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] roadmap with major updates every 6 months in April and October, and monthly service updates. For more information, see [Dynamics 365 and Power Platform Release Plans](/dynamics365/release-plans/).

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] gives you a level of control over the timing of updates for each environment.

## Set the update window

The update window for an environment defines a window of time during the day in which the environment can be updated. When an update is rolling out to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, regardless of whether it's the monthly service update or a major update, the update will be applied to an environment within the time frame that the update window defines. This helps to ensure that updates are applied outside of the customer's normal business hours, for example.

The update window must be a minimum of six hours.

> [!NOTE]
> Desktop users who are signed in during the update will receive an alert in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

To set the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Set update window** action on the **Update** list on the action ribbon.
3. In the **Set update window** pane, specify the start time and the end time for the update window for the environment.
   > [!NOTE]
   > The update window must be a minimum of six hours.
4. Choose **Save**.

## Schedule an update date

Specifically for major updates, you can select a specific date on which the environment is updated. The **Update version** field in the **Version Management** section of the environment details also displays the version number of the available update version.

To schedule an update date:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **Name** of the relevant environment to open the environment details.
2. Choose the **Schedule Update** action on the **Update** list on the action ribbon.
3. In the **Schedule Environment Update** pane, specify the update date.
    > [!NOTE]
    > The specified date must be within a given date range displayed in the pane.

4. Choose **Schedule Update**.

If an administrator has chosen the **Schedule Update** action but not set a date, then the update is applied automatically to each tenant environment with a default date range. The default date range is communicated in advance to tenant administrators through administrative notifications. You can then choose to override that with a custom date by following the steps that are provided above. Not selecting an update date does not prevent the environment from being updated.

## Update Notifications

For updates for which the option is available for tenant administrators to schedule the update date, a notification is sent to the notification recipients listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. For more information, see [Managing Tenant Notifications](tenant-admin-center-notifications.md).

Scheduling environment updates is *not* available for monthly service updates. For these, the update is applied to tenant environments as it becomes available. No notifications are sent to tenant administrators prior to the update. Notifications are sent only after the update is applied.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
