---
title: Major Updates of Business Central Online | Microsoft Docs
description: Learn about the timeline for how major updates roll out and how you can prepare for an update.  
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

# Major Updates of Business Central Online

This article provides an overview of what you need to know about the rollout of a major [!INCLUDE[prodshort](../developer/includes/prodshort.md)] update. It includes key dates, actions you need take, and answers some common questions.  

## Timelines for major updates

The following figure illustrates the key milestones and dates in the rollout of the next major update based on [2020 release wave 1](/dynamics365-release-plan/2020wave1/dynamics365-business-central/). The same timeline applies to all other major updates for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online, though dates will of course be different.

![Update Rollout Timeline](../developer/media/update-rollout-timeline.png)

The following table describes the milestones with example dates.

|Milestone|Example date|Description|
|---------|------------|-----------|
|Update is available|April 1, 2020|The date when the new major version of Business Central becomes generally available|
|Update starts rolling out|April 8, 2020|The default date when Microsoft starts upgrading your environments. You can change that date, within allowed date range, to a date which fits you better.|
|Last scheduled update date|May 1, 2020|The last date you can choose to extend your upgrade date to.|

These times may differ significantly across countries and regions, so make sure that you have set up notifications in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] so that you will be notified of when the next major update is available for your tenant.  

### Update is available

In the release plans, you can see when the next major update is generally available. Typically, the update is announced on the Dynamics 365 blog, and Microsoft starts rolling out the update to existing environments. On the same day, new users signing up for a trial are directed to the new version.

The existing environments are scheduled to be updated to the new version gradually across the world. Microsoft strives to schedule all environments as soon as possible following the official release date, but for some environments, the update might not be available for a few weeks. In extreme cases, a given environment might be scheduled for update up to one month after the release date.  

When the update becomes available for a tenant, email notifications are sent out to all [notification recipients](tenant-admin-center-notifications.md) that are registered in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. A notification about the update availability is also shown in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] itself. Starting this day, you can set the date for when your environment should be updated via the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] (schedule update). You can choose any date between that date and the date that is shown as the last available date for the update, which might be between one and four weeks away. For more information, see [Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md).  

> [!TIP]
> For each environment, you can specify two dates related to updates to the next major version: The earliest date that the update can start, and the last date that the update can start. Microsoft will schedule the update to run at a point in time between those two dates.

### Behind the scenes

Starting from the official release date, Microsoft begins scheduling updates. Scheduling does not occur for all environments around the world simultaneously. During scheduling, Microsoft sets a default update date for each environment. You can see this date in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] in the **Scheduled update date** field in the **Version Management** section of the environment details page.  

By default, any newly created environments are scheduled to run the update within seven days from the date they were created.

If you do not change the default scheduled update date, your environment will be updated on any day between the scheduled update date and the date shown as the last possible update date. In some cases, Microsoft can suspend or postpone all updates beyond this last possible date. At any point of time during this period you can change the update date, including the current date, and that date will be honored.  

When the scheduled update date for your environment comes, the update is triggered automatically within the update time window that you have specified for it. All users will be disconnected from this environment, and all login attempts during the update will be blocked with the message `Service is under maintenance`. We strongly encourage that you set the update window for all production environments to make sure that updates does not start during your business hours.  

When the update date you specified for your environment comes, the update is triggered within the first available update time window you have specified for that environment.  

> [!NOTE]
> If your update time window is set to start after midnight, the update will start within that time window, but on the following day to the one you defined for your environment.

In some circumstances, Microsoft may not be able to perform the update on the selected date. In such cases, you will receive an email notification, and your environment will be automatically rescheduled to be updated 7 days later. You can change that date in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to any other allowed date, including the current date.

## Delayed update dates

In some cases, even after the update is available in your area, you may still not be able to set the update date (schedule environment update). This can happen for one of the following reasons:  

- Your environment has not yet updated to the latest minor update of the previous version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. All environments must be updated to the last available minor update of the previous version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] before they can be scheduled to be updated to the next major version. You can check the version information in the **Troubleshooting** section of the **Help and Support** page in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as well as in the **Version Management** section in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. For more information, see [Version numbers in Business Central](version-numbers.md).  

    Microsoft is actively working on updating all environments to the latest minor update as soon as possible. In most cases, your environment will be updated and scheduled for the major update soon, and you will get a chance to change the date to the one that fits you better. In an unlikely situation, when your environment is updated to the last minor update around or even after the last selectable update date, you will still get a least seven days to schedule the update.  

- You have just created a new sandbox environment as a copy of your production environment. In this case, the sandbox environment is created on the same version as the production environment it was copied from. If your newly created sandbox environment is running on the last minor update of the previous version, Microsoft will schedule it for update automatically within one hour.  

    You will receive email notification and will see the notification in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]when it happens. The scheduled update date for this environment will be set to seven days from the current date, so that you have enough time to change the date to one that fits you better (including the current date).  

- Your per-tenant extensions are not compatible with the next major update.  

    Before rolling out the next major update, as well as during the update, Microsoft routinely checks per-tenant extensions in all existing environments for compatibility with the next major update. When compatibility issues with the upcoming version are detected, email notifications that describe the detected issues are sent to the notification recipients.  

    If you discover any such issues, apply the changes to your solution as usual using Visual Studio Code, and test the new app in a sandbox environment that runs on the new major version (either in preview or officially available). If tests complete successfully, upload the new app version into your production environment, and, in the ***Extension Management** page, set the **Deploy to** field to **Next major version**. This way the compatible version of your app will be used when your environment is updated. For more information, see [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization.md).  

- The AppSource apps that are installed in your environment are not yet available for the next major version of Business Central[!INCLUDE [prodshort](../developer/includes/prodshort.md)]. While the AppSource apps are normally kept up-to-date by the partners who own them, it can happen that a particular app needs more time to prepare for the next major update and is not yet available for it. In this situation, please contact the app owner to understand their availability plans.  

    Environments that failed to update due to missing AppSource apps will be automatically restored to the original application version and also automatically (within 1 hour) rescheduled for another update attempt in seven days. If your partner addresses the compatibility issues earlier, you can change the date to an earlier date, including the current date.  

## Postponed updates

In critical circumstances, Microsoft can decide to postpone the rollout of the updates, such as if a critical issue is discovered in the new major version that is being rolled out. While Microsoft is working on addressing the issue, the updates will be postponed. You will receive email notification about this, and you will see the notification displayed in the #[!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. The **Version Management** section for each environment will show an update rollout state as Postponed.  

Not knowing the nature of the issue and the solution in advance, we cannot predict when the updates will resume again. This means that neither the email nor the notification in [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] will contain the information about the expected resume date. Microsoft will be actively working on resuming updates as a matter of highest priority once the issue is addressed. You will receive another email notification when updates have been resumed. The last available date will be prolonged by the number of days the update was postponed.  

If it happens that you schedule the update of your environment on a date when the updates are postponed, your update will not be performed. Microsoft will not send separate notification about this. You can reschedule the update to a later date, or you can wait until you have received the email notification that the updates have been resumed and schedule the update at that time. All tenants that missed their scheduled update date will be automatically updated. Therefore, if you do not want to be automatically updated you need to change your date to a later date until postponement is over.  

If you did not explicitly set a date for your environment update in #TAC, this environment will be picked up for updating automatically, shortly after the updates have been resumed. The update will of course still be executed within the specified update time window.  

<!--### Prepare for major updates with preview environments

[!INCLUDE [admin-previews](../developer/includes/admin-previews.md)]-->

## Prepare for major updates just before the production environment is updated

Starting on the date when you are notified that the new major update is available, you can test the new version by using a sandbox environment that you then schedule to be updated. Start by copying your production environment into a sandbox on the same version as your production environment. All newly created environments are automatically included in the update process that runs hourly in your country or region, so you will receive email notification that the update is available, and you will be able to schedule the newly created sandbox for update within 1 hour after it was created. By default, the newly created environments are scheduled to run the update in 7 days from the date they were created, but you can change that date to any other allowed date, including the current date.  

If you change the update date to the current date, the update will start within the closest available update time window you specified for the environment. If you want to start the update of your sandbox environment immediately, you can set the update time window for this environment to be 24 hours.  

If any errors are detected during the update, you will receive email notification that describes the detected issues.  

Any environments that fail to update due to per-tenant extension compatibility issues or any other issues will be automatically restored to the original application version. Within one hour, they are automatically rescheduled for another update attempt, and this pattern repeats within the first seven days. If you address the compatibility issues earlier, you can change the date to an earlier date, including the current date.  

## Frequently asked questions

### How can I test the update before updating my production environment?

You can get a preview sandbox well ahead of the update, and you can test even closer to the update with an updated sandbox.

### I changed the Scheduled Update date to today, but my update doesn’t start?

Check the update window you defined for this environment. It is likely that the update window you defined for this environment has already passed today, so the update can only start within that time window on the following day.  

For example, if you are changing the Scheduled update date to the current date at 6pm, and your update window is set to 1 AM - 7 AM, the update will not start immediately, but around 1 AM on the next day.  

### What is a realistic timeline for how I can prepare for the next major update?

The following table describes the suggested milestones with example dates.

|Milestone|Example date|Description|
|---------|------------|-----------|
|Previews are available|February 25, 2020|You create a new sandbox environment based on the new preview for test purposes. For more information, see [Prepare for major updates with preview environments](preview-environments.md).|
|A few days before you know that the update is announced|March 30, 2020|You create a new sandbox environment based on your existing production environment and wait for it to be automatically updated to the new version.|
|Interim sandbox is updated to the new version|April 2. 2020|The new sandbox is updated, and you can test your existing extensions and your production data against the new version.|
|Update available in your region|April 8, 2020|you are notified that the update is available and hurry to set the relevant update dates in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].|
|Preview sandboxes are deleted|May 1, 2020|30 days after the new major update is announced, the preview sandboxes are deleted.|

## See also

[Managing Major and Minor Updates of Business Central Online](tenant-admin-center-update-management.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
