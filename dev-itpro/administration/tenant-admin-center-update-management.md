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
ms.date: 02/19/2020
ms.author: edupont
---

# Managing Major and Minor Updates of Business Central Online

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments are updated according to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] [roadmap](https://dynamics.microsoft.com/roadmap/business-central/) with major updates every 6 months in April and October, and monthly service updates. For more information, see [Dynamics 365 Release Plans](/dynamics365/release-plans/).

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] gives you a level of control over the timing of updates for each environment. You can also help prepare your solution and your users by creating preview environments so that you can get acquainted with new functionality in the product.  

## Set the update window for each environment

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

## Get notified of updates

For updates for which the option is available for tenant administrators to schedule the update date, a notification is sent to the notification recipients listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. For more information, see [Managing Tenant Notifications](tenant-admin-center-notifications.md).

Scheduling environment updates is *not* available for monthly service updates. For these, the update is applied to tenant environments as it becomes available. No notifications are sent to tenant administrators prior to the update. Notifications are sent only after the update is applied.

## Prepare for major updates with preview environments

[!INCLUDE [admin-previews](../developer/includes/admin-previews.md)]

### Practice and test

Once you have the preview, start using it:

1. Review the new functionality. Try it out, and begin training employees on the new features that are coming.

2. Validate your extensions. Upload and Install your extensions into the sandbox environments created on the preview version and run through the functionality. Verify that the customization continues to work and is compatible with the new version. In rare cases, if you discover any changes required for your per-tenant extension to become compatible with the next release, apply the changes to your app, test it again on a sandbox environment running on a preview version. then, if tests complete successfully, upload the app into your production environment, setting **Deploy to** field to **Next major version**. This way the compatible version of your app will be used when you schedule upgrade of your production environment to Wave 1 2020 release once it becomes available.

3.Test the quality. If you run into issues related to the preview, please provide the feedback following the steps outlined above.

Finally, as always, if you have ideas for features you would like to see in future releases of Business Central, let us know at [https://aka.ms/bcideas](https://aka.ms/bcideas).

### Provide feedback on the preview

We need your feedback on the preview! Let us know about your experiences with the new version. You can provide feedback on Microsoft Collaborate: 

1. Browse to [aka.ms/collaborate](https://aka.ms/collaborate)

2. If you have not registered before, please complete the registration form to access Collaborate

3. Choose Engagements, and then choose Join

4. Under the **Ready! for Dynamics 365 Business Central program**, find **2020 Release Wave 1 Preview** in the list of available engagements, and choose **Join**

Once you have joined the 2020 Release Wave 1 engagement, you can submit your feedback by filling in the form. You must specify if you are reporting a technical issue, a translation issue, or a documentation issue. The default severity is set to 3, which is the normal severity for most defects and means that the system is not crashing and users are not blocked from doing their work, but you can change that. When we have triaged your issue, you can see changes in Collaborate.

> [!TIP]
> If you get stuck trying to join Collaborate, please submit a support request, and please be explicit about the error you’re getting.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
