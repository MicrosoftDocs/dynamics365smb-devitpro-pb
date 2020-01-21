---
title: Administration of Business Central Online | Microsoft Docs
description: Learn about how you as the internal administrator or as a reselling partner can manage online tenants of Dynamics 365 Business Central.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 01/06/2020
ms.author: edupont
---

# Administration of Business Central Online

As an administrator, you can manage [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenants both as an internal administrator, who is typically an employee of the company that bought the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] subscription, and as an administrator from the reselling partner company. Some of the tools are the same, and some tools are available to partners only. Here you can learn which tools are available to you as an administrator.  

## Administration as an internal administrator

Internal administrators are the system administrators, IT professionals, or superusers of the customer's company, who are assigned the **Global admin** role in the Office 365 admin center. For more information, see [About admin roles](/office365/admin/add-users/about-admin-roles) in the Office 365 admin content.  

### Administration in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]

As the internal administrator, you can add users and grant permissions. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) and [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].

As an internal administrator you have **read-only** access to all areas of [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. You will have this access even if your organization decides not to continue with [!INCLUDE [prodshort](../developer/includes/prodshort.md)] and cancels the subscription. This ensures that you, as the internal administrator, can export relevant data, while no one else in your organization has a license to sign in and use [!INCLUDE [prodshort](../developer/includes/prodshort.md)].

> [!IMPORTANT]
> You must have a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] license in order to set up integration to other products, or perform any other tasks in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], except the two mentioned above. For information about licensing, see [Microsoft Dynamics 365 Business Central Licencing Guide](https://aka.ms/BusinessCentralLicensing).

For other tasks, you can access the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], where you can manage upgrade schedules and other tasks. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

### Administration of a trial

If your organization has signed up for a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] trial, you can extend the free trial, and you can start the process of finding a reselling partner to help you get a subscription. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview).  

### Administration in the Office portal

The **Global admin** role makes you an administrator of your organization's Office 365 tenant. This means that you can manage the subscription, add or remove users, and assign or remove licenses in the Office portal. For more information, see [Office 365 Admin help center](/office365/admin/admin-home).  

### Unsubscribing from [!INCLUDE [prodshort](../developer/includes/prodshort.md)]

If the organization decides not to continue with [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you can then cancel the subscription.  

In the Office portal, you can remove licenses from users. As the administrator, you can remove a trial subscription from your company's account. But to cancel a paid subscription, you must contact your reselling partner, and they can [cancel the relevant subscription](/partner-center/create-a-new-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml) in the Partner Center.  

For more information, see [Unsubscribe or Remove Business Central](/dynamics365/business-central/admin-cancel) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

## Administration as a partner

As a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] reselling partner, you are the administrator of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenants of your customers. You have access to the administration tools of their Office 365 account and their [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] where you can specify update windows. You can also log into their [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as a *delegated administrator* if you want to reproduce errors.  

### Get set up in the Partner Center

[!INCLUDE [csp-get-started](../developer/includes/csp-get-started.md)]
[!INCLUDE [csp-admin-users](../developer/includes/csp-admin-users.md)]

### Connect with customers

[!INCLUDE [csp-connect-customer](../developer/includes/csp-connect-customer.md)]

### Acting as a delegated administrator

As a reselling partner, you have delegated administration access to their [!INCLUDE [prodshort](../developer/includes/prodshort.md)] and other services. For more information, see [Delegated Administrator Access to Business Central Online](delegated-admin.md).  

### Manage technical support

As a reselling partner, you must be the first line of support for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] customers. You must set up your support contact information, and help the internal administrators troubleshoot any issues that users find. For more information, see [Managing Technical Support](manage-technical-support.md).  

## Extending trials

A business can sign up for a free trial of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. When they first sign up for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], they get access to an evaluation version that does not include all capabilities in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. They can then switch to the 30 day trial experience to enable all capabilities.  

However, sometimes 30 days is not quite enough to decide if they want to buy [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In that case, they can extend their trial with an additional 30 days. For more information, see [Need More Time to Decide Whether to Subscribe?](/dynamics365/business-central/admin-extend-trial) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

If the prospect wants to extend the trial further than those 30 days, the partner can extend it another 30 days if the administrator, acting as the delegated administrator, log into the prospect's [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and extend the trial using the same **Extend Trial Period** guide. However, after those additional 30 days, the prospect must either purchase [!INCLUDE[prodshort](../developer/includes/prodshort.md)], or the partner can ask Microsoft for an additional extension of the trial by contacting Support.  

> [!TIP]
> As a reselling partner, you can suggest your prospects sign up for a trial, but you can also help them set up a customized demonstration environment based on a sandbox environment. This way, you can easily add or remove functionality based on your prospects' expectations. For more information, see [Creating a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml).  

## See Also

[The Business Central Administration Center](tenant-admin-center.md)  
[The Business Central Administration Center API](administration-center-api.md)  
[Submitting support requests on behalf of your customer](manage-technical-support.md#submitsupportrequest)  
[Resources for Help and Support for Dynamics 365 Business Central](../help-and-support.md)  
[How does Microsoft handle database sizes?](../faq.md#how-does-microsoft-handle-database-sizes)  
[Version numbers in Business Central](version-numbers.md)  
[Resell Different Solutions](../developer/readiness/readiness-reseller.md)  
[Deliver consulting services as a VAR: aka.ms/BusinessCentralConsultingServices](https://aka.ms/BusinessCentralConsultingServices)  
