---
title: Managing Tenant-Specific Notifications
description: Learn about how a VAR or an internal administrator can manage tenant notifications. 
author: edupont04

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, notifications
ms.date: 02/16/2022
ms.author: edupont

---

# Managing Tenant-Specific Notifications

Notifications are sent by email for administrative events that occur on the tenant. For example, notifications are sent when a major update is available for tenant environments, when an environment update has succeeded or failed, or when extensions require changes to be compatible with an upcoming release. When these and other similar events occur on the tenant, an email is sent to the notification recipients for the tenant.  

> [!NOTE]
> If a prospect has signed up for a trial of [!INCLUDE [prod_short](../includes/prod_short.md)], make sure that they understand that they must sign up for notifications. This is especially important if the prospect moves to My Company so that the tenant will expire after 30 days. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for Business Central.

## Notification recipients

Notifications are sent to all email addresses that are listed in the **Notification recipients** list of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. The list is managed manually by adding and removing recipients to ensure the right individuals are notified of the event.

> [!NOTE]
> It is important that *at least* one administrator's email address has been entered as a notification recipient to ensure proper awareness of events requiring administrative attention.

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

## Notification of blocked updates

Microsoft updates environments according to the update windows that are defined for the environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. However, if the environment includes an app that is not compatible with the next version, Microsoft pauses the update and sends a notification of the issue.  

After a while, the notification is also made in-product to all users, which can be confusing to some people. But Microsoft wants to update the environment, so an admin must disable and remove the problematic app so that the update can continue. After more than a month of waiting, Microsoft sends a more strongly worded notification. If, after more than 4-5 months the environment is still blocked from getting the update, Microsoft uninstalls the problematic app, but does not delete any data, and the environment is updated with the latest security and other updates.  

The following list illustrates a typical timeline:

* 10 weeks of emails sent to the registered notification recipients.  

    If the update fails, Microsoft reschedules automatically. The notification recipients will receive multiple emails. If no notification recipient has been set up, then no email is sent.
* Six weeks with in-product notifications that encourage users to contact their admin.  

    This notification currently indicates that the environment will expire to worry users so they try to find their admin to sort things out.
* One month of more explicit in-product notifications

    This notification currently indicates that the environment is missing an important update and is blocked. The wording has been chosen to make it clearer what the issue is and what the user must do as quickly as possible.  

If the problematic app has not been uninstalled at this point, Microsoft typically starts the process of force-uninstalling apps, including per-tenant extensions. Data is not deleted.  

For more information about updates, see [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md). For more information about how to keep your [!INCLUDE [prod_short](../includes/prod_short.md)] compliant with upcoming updates, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](../developer/app-maintain.md).  


## Cleaning up settings

If you end the relationship with a customer where you have set up your email address as a notification recipient, you must remove the email address while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

## See also

[Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Working with Administration Tools](administration.md)  
