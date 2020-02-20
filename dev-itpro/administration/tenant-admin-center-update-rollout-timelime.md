---
title: Preparing for Major Updates of Business Central Online | Microsoft Docs
description: Use the Business Central administration center to manage environment updates.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, update
ms.date: 02/20/2020
ms.author: edupont
---

# Preparing for Major Updates of Business Central Online

This article provides an overview of what you need to know about the rollout of a major [!INCLUDE[prodshort](../developer/includes/prodshort.md)] update. It includes key dates, actions you need take, and answers some common questions.  

## Timelines for major updates

The following figure illustrates the key milestones and dates in the rollout of the next major update based on [2020 release wave 1](/dynamics365-release-plan/2020wave1/dynamics365-business-central/). The same timeline applies to all other major updates for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, though dates are of course different.

![Update Rollout Timeline](../developer/media/update-rollout-timeline.png)

|Milestone|Example|Description|
|---------|----|-----------|
|Update Is Available|April 1, 2020|The date when the new major version of Business Central becomes available|
|Update Starts On|April 8, 2020|The default date when Microsoft starts upgrading Business Central environments.|
|Last Selectable Update Date|May 1, 2020|The last date you can choose to extend your upgrade date to.|

### Update is available

On that date, e-mail notifications are sent out to all notification recipients that are registered in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], also a notification about update availability is displayed in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] itself. Starting this day, you can set the date for when your environment should be updated via the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] (schedule update). You can choose any date between Update Is Available and Last Selectable Update Date to start your update, including the current date. For more information, see [Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md).

> [!IMPORTANT]
> Existing environments are scheduled to be updated to the new version gradually across the world. Microsoft will schedule all environments to be updates as soon as possible following the release date, but in some cases, an environment might have to wait for up to a month before being updated.

On the same day, new users signing up for a trial are directed to the new version.

### Update starts

On that date, Microsoft starts updating Business Central environments to the new version. If you did not set any specific update date for your environment, it may be updated on any day between Update Starts On date and Last Selectable Update Date date. At any point of time during this period, unless your environment is being updated or is already updated, you can set a specific update date, including current date, and that date will be honored.

## Update date for an environment

When the update date you specified for your environment comes, the update is triggered within the first available update time window you have specified for that environment.  

> [!NOTE]
> If your update time window is set to start after midnight, the update will start within that time window, but on the following day to the one you defined for your environment.

## How can I test the update before updating my production environment?

You can get a preview sandbox well ahead of the update, and you can test even closer to the update

### Prepare for major updates with preview environments

[!INCLUDE [admin-previews](../developer/includes/admin-previews.md)]

### Prepare for major updates just before the updates

Starting on the #UpdateIsAvailable date, you can test the update by using a sandbox environment. Start by copying  your production environment into a sandbox. The sandbox environment will be created on the same version as your production environment. The newly created environments are included in the update process on the hourly basis, so you will receive an e-mail notification, informing you that the update is available, and be able to schedule the newly created sandbox for the update within 1 hour since it was created. By default, the newly created environments are scheduled to run the update in 7 days from the date they were created, but you can change that date in #TAC to any other allowed date, including the current date.

If you change the update date to the current date, the update will start within the closest available update time window you specified for the environment. If you want to start the update of your sandbox environment immediately, you can set the update time window for this environment to be 24 hours.
Note that we do not recommend setting the update time window within the working hours for the production environments. This is only advisable for the sandbox environments, for the period when you want to test the update immediately (recurrently).

If your sandbox environment update fails, such as due to per-tenant extension compatibility or other issues, your environment is automatically rescheduled for another update attempt in 7 days. If you address the issues earlier, you can change the date to an earlier date, including the current date, and run the test upgrade again.  

## It is already Update Is Available date, but I neither received the update notification nor can I schedule update in the admin center. Why is that?

This can happen for one of the following reasons:

- Your environment is not yet updated to the last minor update of the previous version of Business Central. All environments must be updated to the last available minor update of the previous version before they can schedule update to the next major version of Business Central. You can check which version you are currently running on by looking at ###. Microsoft is actively working on updating all environments to the latest minor update as soon as possible, so likely your environment will be updated soon and you will get a chance to schedule the major update. In an unlikely situation, when your environment is updated to the last minor update around or even after the #LastSelectableUpdateDate you will always get a least 7 days to schedule the update to the next major update.  
- Your per-tenant extensions are not compatible with the next major update. Prior to the rollout of the next major update as well as during update, Business Central team routinely checks per-tenant extensions in all environments for compatibility with the next major update. When compatibility issues  are detected, e-mail notification, listing the detected issues, is sent to the notification recipients. 
- AppSource issues  

## See also

[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
