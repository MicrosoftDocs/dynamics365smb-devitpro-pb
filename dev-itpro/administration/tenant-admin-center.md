---
title: Business Central Admin Center| Microsoft Docs
description: Learn about how a VAR or an internal administrator can set update windows and other admin tasks.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 12/06/2019
ms.author: edupont

---
# The Business Central Administration Center

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides a portal for administrators to perform administrative tasks for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. Here, administrators can [view and work with production and sandbox environments](tenant-admin-center-environments.md) for the tenant, [set up upgrade notifications](tenant-admin-center-notifications.md), and [view telemetry](tenant-admin-center-telemetry.md) for events on the tenant.  

> [!div class="mx-imgBorder"]
> ![Business Central Admin Center](../developer/media/admin/business_central_admin_center.png)

## Accessing the administration center

The following users are authorized to access the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]:

- Internal tenant administrators
- Admin agent
- Helpdesk agent

Internal administrators are the system administrators, IT professionals, or superusers of the customer's company, who are assigned the **Global admin** role in the Office 365 admin center. For more information, see [About admin roles](/office365/admin/add-users/about-admin-roles) in the Office 365 admin content.  

The admin agent and helpdesk agent roles are assigned through the [Microsoft Partner Center](https://partner.microsoft.com) for the partner that is associated with the tenant. These roles have access to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant as *delegated administrators*.

### Internal administrators

As the internal administrator, you can get to the administration center by navigating directly to the URL, or by choosing the link in the **Settings** menu when you are logged in to your [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

To access the administration center from the URL, use the following pattern but replace *[TENANT_ID]* with the tenant ID of your [!INCLUDE [prodshort](../developer/includes/prodshort.md)]:

`https://businesscentral.dynamics.com/[TENANT_ID]/admin`

> [!TIP]
> The tenant ID is shown in the **Help and Support** page in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

### Partner access to the administration center

As a partner, you can access the administration center from the Partner Dashboard in the Microsoft Partner Center:

1. Log into the [Partner Dashboard](https://partnercenter.microsoft.com/dashboard).
2. Select the **Customers** link in the navigation pane.
3. Select the customer tenant that you want to perform administrative tasks for.
4. Select **Service Management**.
5. Under the **Administer Services** heading, select [!INCLUDE[prodlong](../developer/includes/prodlong.md)].

You can also get to the administration center by navigating directly to the URL of a tenant as described in the previous section.

> [!NOTE]
> As the partner, there are certain tasks that you cannot do in your customers' [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. For more information, see [Acting as a delegated administrator](tenant-administration.md#acting-as-a-delegated-administrator).  

## See also

[Managing Environments](tenant-admin-center-environments.md)  
[Tenant Notifications](tenant-admin-center-notifications.md)  
[Environment Telemetry](tenant-admin-center-telemetry.md)  
[Administration Center API](administration-center-api.md)  
[Managing Technical Support](manage-technical-support.md)  
[Business Central Data Security](../security/data-security.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Microsoft Partner Dashboard](https://partnercenter.microsoft.com/dashboard)  
[Add a new customer in the Partner Center](/partner-center/add-a-new-customer)  
[Assign licenses to users in the Partner Center](/partner-center/assign-licenses-to-users)  
[Create new subscriptions in the Partner Center](/partner-center/create-a-new-subscription)  
[Cloud Solution Provider program - selling in-demand cloud solutions](/partner-center/csp-overview)  
