---
title: Business Central Administration| Microsoft Docs
description: Learn about how you as a reselling partner can manage online tenants of Dynamics 365 Business Central.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 08/07/2019
ms.author: edupont
---
# Administration of Business Central Online

As a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] reselling partner, you are the administrator of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenants of your customers. You have access to the administration tools of their Office 365 account and their [!INCLUDE[prodshort](../developer/includes/prodshort.md)] administration center where you can specify update windows, for example.  

## Get started with the Cloud Solution provider program

You must enroll in the Cloud Solution Provider program in order to service Business Central online. In the Microsoft Partner Center documentation, you can learn how to [add a customer](/partner-center/add-a-new-customer?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml), [assign licenses to users](/partner-center/assign-licenses-to-users?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml), and [create new subscriptions](/partner-center/create-a-new-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml). [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is one of the subscriptions that you can create, and there are [!INCLUDE[prodshort](../developer/includes/prodshort.md)]-specific license types that you can assign to users.  

## Extending trials

A prospect can sign up for a free trial of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. When they first sign up for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], they get access to an evaluation version that does not include all capabilities in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. If they then enable the 30 day trial experience, this enables all capabilities. However, sometimes 30 days is not quite enough to decide if they want to buy [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. In that case, they can extend their trial with an additional 30 days. For more information, see [Need More Time to Decide Whether to Subscribe?](/dynamics365/business-central/admin-extend-trial?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml).  

If the prospect wants to extend the trial further than those 30 days, you can extend it another 30 days if you, as the delegated administrator, log into their [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and extend the trial using the same **Extend Trial Period** guide. However, after those additional 30 days, the prospect must either purchase [!INCLUDE[prodshort](../developer/includes/prodshort.md)], or you can ask Microsoft for an additional extension of the trial by contacting Support.  

> [!TIP]
> You can suggest your prospects sign up for a trial, but you can also set up a customized demonstration environment based on your sandbox environment. This way, you can easily add or remove functionality based on your prospects' expectations. For more information, see [Choosing Your Dynamics 365 Business Central Development Sandbox Environment](../developer/devenv-sandbox-overview.md).

## Acting as a delegated administrator

As a [!INCLUDE [prodshort](../developer/includes/prodshort.md)] reselling partner, you have administrator access to your customers' Office 365 tenant and their [!INCLUDE [prodshort](../developer/includes/prodshort.md)] Administration Center. You can also log into their [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as a *delegated administrator* if you want to reproduce errors, for example.  

The Business Central Administration Center is a powerful tool for you to manage your customers' tenants. From the administration center, you can manage upgrades and access the tenants as the delegated administrator. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

### Restricted access to Business Central as delegated administrator

When you sign in to your customers' [!INCLUDE [prodshort](../developer/includes/prodshort.md)] as the delegated administrator from the administration center, you have access to all areas of their [!INCLUDE [prodshort](../developer/includes/prodshort.md)]. However, because you are not registered as a regular user, there are certain tasks that you cannot do.

The following tasks are not available to the delegated administrator:

- Set up jobs to run as scheduled tasks in the job queue
- Use the **Edit in Excel** action or interact with [!INCLUDE [prodshort](../developer/includes/prodshort.md)] data in Excel using the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] add-in for Excel.

    You can still use the **Open in Excel** action to view data in Excel.

## See Also

[The Business Central Administration Center](tenant-admin-center.md)  
[The Business Central Administration Center API](administration-center-api.md)  
[Resources for Help and Support for Dynamics 365 Business Central](../help-and-support.md)  
[How does Microsoft handle database sizes?](../faq.md#how-does-microsoft-handle-database-sizes)  
[Resell Different Solutions](../developer/readiness/readiness-reseller.md)  
[Deliver consulting services as a VAR: aka.ms/BusinessCentralConsultingServices](https://aka.ms/BusinessCentralConsultingServices)  
