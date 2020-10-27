---
title: Managing Tenant-Specific Notifications
description: Learn about how a VAR or an internal administrator can manage tenant notifications. 
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, notifications
ms.date: 10/01/2020
ms.author: edupont

---

# Managing Tenant-Specific Notifications

Notifications are sent by email for administrative events that occur on the tenant. For example, notifications are sent when a major update is available for tenant environments, when an environment update has succeeded or failed, or when extensions require changes to be compatible with an upcoming release. When these and other similar events occur on the tenant, an email is sent to the notification recipients for the tenant.

## Notification recipients

Notifications are sent to all email addresses that are listed in the **Notification recipients** list of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. The list is managed manually by adding and removing recipients to ensure the right individuals are notified of the event.

> [!NOTE]
> It is important that *at least* one administrator's email address has been entered as a notification recipient to ensure proper awareness of events requiring administrative attention.

> [!IMPORTANT]
> To not miss update notifications from Microsoft, you must verify that the e-mails are not redirected to a spam folder by your e-mail software. The notifications are sent from the Microsoft Partner Center address, `msftpc@microsoft.com` and contain `Dynamics 365 Business Central` in the subject line.  

## Cleaning up settings

If you end the relationship with a customer where you have set up your email address as a notification recipient, you must remove the email address while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

## See also

[Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Working with Administration Tools](administration.md)  
