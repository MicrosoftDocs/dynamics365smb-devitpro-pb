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

# Major Update Rollout - What You Need to Know

This article provides an overview of what you need to know about the rollout of a major [!INCLUDE[prodshort](../developer/includes/prodshort.md)] update. It includes key dates, actions you need take, and answers some common questions. 

## What is the Timeline 

The following figure illustrates the key milestones and dates in the rollout of the next major update.

![Update Rollout Timeline](../developer/media/update-rollout-timeline.png)

|Milestone|Date|Description|
|---------|----|-----------|
|UpdateIsAvailable|April 1, 2020|The date when the new major version of Business Central becomes available|
|UpdateStartsOn|April 8, 2020|The default date when Microsoft starts upgrading Business Central environments.|
|LastSelectableUpdateDate|May 1, 2020|The last date you can choose to extend your upgrade date to.|

## What happens on the UpdateIsAvailable date?

On that date, e-mail notifications are sent out to all notification recipients that are registered in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], also a notification about update availability is displayed in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] itself. All new signups are directed to the new version. Starting this day, you can set the date for when your environment should be updated via the #[!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] (schedule update). You can choose any date between #UpdateIsAlvailable and #LastSelectableUpdateDate to start your update, including the current date.  See [Update Environments](tenant-admin-center-update-management.md).
 
## What happens on the #UpdateStartsOn date?   
 
On that date, Microsoft starts updating Business Central environments to the latest version. If you did not set any specific update date for your environment, it may be updated on any day between #UpdateStartsOn date and #LastSelectableUpdateDate date. At any point of time during this period, unless your environment is being updated or is already updated, you can set a specific update date, including current date, and that date will be honored. 
 
## What happens on the date which I set for my environment to be updated? 
 
When the update date you specified for  your environment comes, the update is triggered within the first available update time window you have specified for that environment.  
Note, that if your update time window is set to start after midnight, the update will start within that time window, but on the following day to the one you defined for your environment. 
 
## How can I test the update before updating my production environment? 
 
Starting on the #UpdateIsAvailable date, you can test the update by using a sandbox environment. Start by copying  your production environment into a sandbox. The sandbox environment will be created on the same version as your production environment. The newly created environments are included in the update process on the hourly basis, so you will receive an e-mail notification, informing you that the update is available, and be able to schedule the newly created sandbox for the update within 1 hour since it was created. By default, the newly created environments are scheduled to run the update in 7 days from the date they were created, but you can change that date in #TAC to any other allowed date, including the current date.

If  you change the update date to the current date, the update will start within the closest available update time window you specified for the environment. If you want to start the update of your sandbox environment immediately, you can set the update time window for this environment to be 24 hours. 
Note that we do not recommend setting the update time window within the working hours for the production environments. This is only advisable for the sandbox environments, for the period when you want to test the update immediately (recurrently).

If your sandbox environment update fails, e.g. due to per-tenant extension compatibility or other issues, your environment is automatically rescheduled for another update attempt in 7 days. If you address the issues earlier, you can change the date to an earlier date, including the current date, and run the test upgrade again.  

## It is already #UpdateIsAvailable date, but I neither received the update notification nor can I schedule update in #TAC. Why is that?
 
This can happen for one of the following reasons:

- Your environment is not yet updated to the last minor update of the previous version of Business Central. All environments must be updated to the last available minor update of the previous version before they can schedule update to the next major version of Business Central. You can check which version you are currently running on by looking at ###. Microsoft is actively working on updating all environments to the latest minor update as soon as possible, so likely your environment will be updated soon and you will get a chance to schedule the major update. In an unlikely situation, when your environment is updated to the last minor update around or even after the #LastSelectableUpdateDate you will always get a least 7 days to schedule the update to the next major update.  
- Your per-tenant extensions are not compatible with the next major update. Prior to the rollout of the next major update as well as during update, Business Central team routinely checks per-tenant extensions in all environments for compatibility with the next major update. When compatibility issues  are detected, e-mail notification, listing the detected issues, is sent to the notification recipients. ###### 
- AppSource issues  


## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
