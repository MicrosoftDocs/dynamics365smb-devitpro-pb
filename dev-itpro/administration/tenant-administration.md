---
title: Administration of Business Central Online | Microsoft Docs
description: Learn about how you as the internal administrator or as a reselling partner can manage online tenants of Dynamics 365 Business Central.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 09/20/2019
ms.author: edupont
---
# Administration of Business Central Online

As an administrator, you can manage [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online tenants both as an internal administrator, who is typically an employee of the company that bought the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] subscription, and as 
an administrator from the reselling partner company. Some of the tools are the same, and some tools are available to partners only. Here you can learn which tools are available to you as an administrator.  

## Administration as an internal administrator

Internal administrators are the system administrators, IT professionals, or superusers of the customer's company, who are assigned the **Global admin** role in the Office 365 admin center. For more information, see [About admin roles](/office365/admin/add-users/about-admin-roles) in the Office 365 admin content.  

As the internal administrator, you can add users, grant permissions, set up integration to other products, and many other tasks right there in [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. For more information, see [Administration](/dynamics365/business-central/admin-setup-and-administration) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

For other tasks, you can access the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], where you can manage upgrade schedules and other tasks. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

If the organization decides not to continue with [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you can then cancel the subscription. For more information, see [Unsubscribe, Remove, or Reset Business Central](/dynamics365/business-central/admin-cancel) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

## Administration as a partner

As a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] reselling partner, you are the administrator of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenants of your customers. You have access to the administration tools of their Office 365 account and their [!INCLUDE[prodshort](../developer/includes/prodshort.md)] administration center where you can specify update windows, for example.  

### Get started with the Cloud Solution Provider program as a partner

As a reselling partner, you must enroll in the [Cloud Solution Provider program](https://partner.microsoft.com/en-US/membership/cloud-solution-provider) in order to service Business Central online. In the Microsoft Partner Center documentation, you can learn how to [add a customer](/partner-center/add-a-new-customer?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml), [assign licenses to users](/partner-center/assign-licenses-to-users?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml), and [create new subscriptions](/partner-center/create-a-new-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml). [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is one of the subscriptions that you can create, and there are [!INCLUDE[prodshort](../developer/includes/prodshort.md)]-specific license types that you can assign to users.  

### Acting as a delegated administrator

As a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] reselling partner, you have administrator access to your customers' Office 365 tenant and their [!INCLUDE [prodshort](../developer/includes/prodshort.md)] Administration Center. You can also log into their [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as a *delegated administrator* if you want to reproduce errors, for example.  

The Business Central Administration Center is a powerful tool for you to manage your customers' tenants. From the administration center, you can manage upgrades and access the tenants as the delegated administrator. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

#### Restricted access to Business Central as delegated administrator

When you sign in to your customers' [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as the delegated administrator from the administration center, you have access to all areas of their [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. However, because you are not registered as a regular user, there are certain tasks that you cannot do.

The following tasks are not available to the delegated administrator:

- Set up jobs to run as scheduled tasks in the job queue
- Use the **Edit in Excel** action or interact with [!INCLUDE [prodshort](../developer/includes/prodshort.md)] data in Excel using the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] add-in for Excel.

    You can still use the **Open in Excel** action to view data in Excel.

### Manage technical support

As a reselling partner, you must be the first line of support for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] customers. You must set up your support contact information, and help the internal administrators troubleshoot any issues that users find. For more information, see [Managing Technical Support](manage-technical-support.md).  

## Extending trials

A business can sign up for a free trial of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. When they first sign up for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], they get access to an evaluation version that does not include all capabilities in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. They can then switch to the 30 day trial experience to enable all capabilities.  

However, sometimes 30 days is not quite enough to decide if they want to buy [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In that case, they can extend their trial with an additional 30 days. For more information, see [Need More Time to Decide Whether to Subscribe?](/dynamics365/business-central/admin-extend-trial) in the business functionality content for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].  

If the prospect wants to extend the trial further than those 30 days, the partner can extend it another 30 days if the administrator, acting as the delegated administrator, log into the prospect's [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and extend the trial using the same **Extend Trial Period** guide. However, after those additional 30 days, the prospect must either purchase [!INCLUDE[prodshort](../developer/includes/prodshort.md)], or the partner can ask Microsoft for an additional extension of the trial by contacting Support.  

> [!TIP]
> As a reselling partner, you can suggest your prospects sign up for a trial, but you can also set up a customized demonstration environment based on a sandbox environment. This way, you can easily add or remove functionality based on your prospects' expectations. For more information, see [Creating a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml).  

## See Also

[The Business Central Administration Center](tenant-admin-center.md)  
[The Business Central Administration Center API](administration-center-api.md)  
[Submitting support requests on behalf of your customer](manage-technical-support.md#submitting-support-requests-on-behalf-of-your-customer)  
[Resources for Help and Support for Dynamics 365 Business Central](../help-and-support.md)  
[How does Microsoft handle database sizes?](../faq.md#how-does-microsoft-handle-database-sizes)  
[Version numbers in Business Central](version-numbers.md)  
[Resell Different Solutions](../developer/readiness/readiness-reseller.md)  
[Deliver consulting services as a VAR: aka.ms/BusinessCentralConsultingServices](https://aka.ms/BusinessCentralConsultingServices)  
