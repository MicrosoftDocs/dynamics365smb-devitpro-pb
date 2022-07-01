---
title: Manage Tenant-Specific Notifications
description: Learn about how an internal admin and a delegated admin can get notified of changes for Business Central tenants. 
author: edupont04

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, notifications
ms.date: 06/28/2022
ms.author: edupont

---

# Manage Tenant-Specific Notifications

You can get notified of administrative events that occur on environments in a [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant. For example, we send notifications when a major update is available for environments, when an environment update has succeeded or failed, or when extensions require changes to be compatible with an upcoming update. When these and other similar events occur on the tenant, an email is sent to the notification recipients for the tenant.  

> [!NOTE]
> If a prospect has signed up for a trial of [!INCLUDE [prod_short](../includes/prod_short.md)], make sure that they understand that they must sign up for notifications. This is especially important if the prospect moves to My Company so that the tenant will expire after 30 days. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for Business Central.

## Notification recipients

Notifications are sent to all email addresses that are listed in the **Notification recipients** list of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. The list is managed manually by adding and removing recipients to ensure the right individuals are notified of the event.

> [!NOTE]
> It is important that *at least* one administrator's email address has been entered as a notification recipient to ensure proper awareness of events requiring administrative attention.

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

> [!NOTE]
> In August 2022, we start moving this type of notification to the Microsoft 365 Message center. For a while, notifications will be sent both from the Microsoft 365 Message center and the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. Over time, emails sent to notification recipients set up in [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] will be a subset of messages posted in Message Center, and eventually emails sent to notification recipients will be deprecated.  
>
> Already now, we warmly recommend that you make sure that the relevant people [sign up to receive email notifications from the Message center](/microsoft-365/admin/manage/message-center#preferences). For more information, see the article [Message center](/microsoft-365/admin/manage/message-center) in the Microsoft 365 admin content.

If you're a delegated admin, you might not be able to sign up yourself. In those cases, ask the internal admin to add you or a group email account as recipients. Also, in some scenarios where your organization manages multiple tenants, you might want to use the service communications API in Microsoft Graph to access the health status and message center posts about [!INCLUDE [prod_short](../includes/prod_short.md)]. For more information, see [Access service health and communications in Microsoft Graph](/graph/service-communications-concept-overview).

## Notification of blocked updates

Microsoft updates environments according to the update windows that are defined for the environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. However, if the environment includes an app that isn't compatible with the next version, Microsoft pauses the update and sends a notification of the issue.  

After a while, all users see an in-product notification, which may confuse some people. But Microsoft wants to update the environment, so an admin must disable and remove the problematic app so that the update can continue. After more than a month of waiting, Microsoft sends a more strongly worded notification. If the environment is still blocked from getting the update after more than 4-5 months, Microsoft uninstalls the problematic app, but doesn't delete any data. The environment is updated with the latest security and other updates.  

The following list illustrates a typical timeline:

* 10 weeks of emails sent to the registered notification recipients.  

    If the update fails, Microsoft reschedules automatically. The notification recipients will receive multiple emails. If no notification recipient has been set up, then no email is sent.
* Six weeks with in-product notifications that encourage users to contact their admin.  

    This notification currently indicates that the environment will expire to worry users so they try to find their admin to sort out things.
* One month of more explicit in-product notifications

    This notification currently indicates that the environment is missing an important update and is blocked. The wording has been chosen to make it clearer what the issue is and what the user must do as quickly as possible.  

If the problematic app hasn't been uninstalled at this point, Microsoft typically starts the process of force-uninstalling apps, including per-tenant extensions. Data isn't deleted.  

For more information about updates, see [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md). For more information about how to keep your [!INCLUDE [prod_short](../includes/prod_short.md)] compliant with upcoming updates, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](../developer/app-maintain.md).  

## Cleaning up settings

If you end the relationship with a customer where you have set up your email address as a notification recipient, you must remove the email address while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

## Service health

[!INCLUDE [admin-service-health](../includes/admin-service-health.md)]

## See also

[Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Working with Administration Tools](administration.md)  
