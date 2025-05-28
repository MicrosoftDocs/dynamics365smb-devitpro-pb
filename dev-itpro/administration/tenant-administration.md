---
title: Administration of Business Central Online
description: Learn about how you as the internal administrator or as a reselling partner can manage online tenants of Dynamics 365 Business Central.  
author: jswymer
ms.topic: article
ms.search.keywords: administration, tenant, admin, environment
ms.date: 06/22/2024
ms.author: jswymer
ms.reviewer: solsen
---

# Administration of Business Central Online

Administrators that can manage [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online tenants are either an internal administrator, who is an employee of the company that bought the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] subscription, or a delegated administrator, who is an employee of the reselling partner company. Some of the tools are the same, and some tools are available to delegated administrators only. Here you can learn which tools are available to you as an administrator.  

## Administration as an internal administrator

Internal administrators are the system administrators, IT professionals, or superusers of the customer's company, who are assigned a role allowing for the administration of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] in the Microsoft 365 admin center. **Dynamics 365 Business Central Administrator** is recommended as least-privileged role allowing for the administration of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], but **Dynamics 365 Administrator** and **Global Administrator** are supported as well. For more information, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles) in the Microsoft 365 admin content.

### Administration in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

As the internal administrator, you can add users and grant permissions. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) and [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions) in the business functionality content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

As an internal administrator you have **read-only** access to all areas of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. You have this access even if your organization decides not to continue with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and cancels the subscription. That way, the internal administrator can export relevant data, while no one else in the organization has a license to sign in and use [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

> [!IMPORTANT]
> You must have a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] license in order to set up integration to other products, or perform any other tasks in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], except the two mentioned previously. For information about licensing, see [Microsoft Dynamics 365 Business Central Licencing Guide](https://aka.ms/BusinessCentralLicensing).

For other tasks, you can access the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], where you can manage environment updates and other tasks. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

You can also use telemetry to track usage and monitor user sessions, for example. For more information, see [Monitoring and Analyzing Telemetry](telemetry-overview.md) and [Managing Sessions](tenant-admin-center-manage-sessions.md).  

### Administration of a trial

If your organization signed up for a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] trial, you can extend the free trial, and you can start the process of finding a reselling partner to help you get a subscription. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview).  

### Administration in the Microsoft 365 admin center

To manage the subscription and assign or remove licenses in the Microsoft 365 admin center, you must have at least the **License administrator** role. To add or remove add or remove users from your organization's tenant, you must have at least the **User administrator** role.

### Collaboration with reselling partners

When your organization subscribes to [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you have a relationship with [an authorized partner of Microsoft](/microsoft-365/admin/misc/add-partner). The partner company assists with licensing, configuration, and other tasks. They can also help you get [telemetry](telemetry-overview.md) about your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment. Authorized partners can gain access to your tenant and its [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments by setting up a granular delegated administrative privileges (GDAP) relationship. It's recommended the **Dynamics 365 Business Central Administrator** role in GDAP relationships as this role limits access for partner users to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] only. The **Dynamics 365 Administrator** and **Global Administrator** roles are also supported for partners to administer and access [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments in the customer tenant, but also provide access to services other than [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

If your organization decides to switch to another partner, you must take the following steps:

1. Ask your current partner to [remove the reseller relationship with you](/microsoft-365/admin/misc/add-partner#remove-a-reseller-relationship) in the Partner Center.
1. Remove their delegated administration privileges by completing the following steps:

   1. In the Microsoft 365 admin center, under **Settings**, select **Partner relationships**, and then select the partner of interest.
   1. In the details pane, select **Remove delegated admin**.
   1. In the confirmation pane, select **Remove**.
   1. [Disable their user accounts](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system) in [!INCLUDE [prod_short](../developer/includes/prod_short.md)].
   1. Remove any [multitenant applications](automation-apis-using-s2s-authentication.md) owned by the partner that are authorized to use service to service (S2S) authentication with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] APIs.

1. Remove any settings in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] if the partner didn't already clear their settings. Settings that partners typically set up in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] that should be removed include [notification recipients](tenant-admin-center-notifications.md), [authorized Microsoft Entra apps](administration-center-api.md), and the [Application Insights connection string](telemetry-enable-application-insights.md#from-the-admin-center).

    For more information, see [Internal administrators](tenant-admin-center.md#internal-administrators).

1. [Add your new partner to your subscription](/microsoft-365/admin/misc/add-partner#add-a-partner-to-an-existing-subscription), and work with them to get them set up.

### Unsubscribing from [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

If the organization decides not to continue with [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you can then cancel the subscription.  

In the Microsoft 365 admin portal, you can remove licenses from users. As the administrator, you can remove a trial subscription from your company's account. But to cancel a paid subscription, you must contact your reselling partner, and they can [cancel the relevant subscription](/partner-center/create-a-new-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml) in the Partner Center. For more information, see the [Data and access when a trial or subscription ends](#expire) section. 

## Administration as a partner

As a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] reselling partner, you're the administrator of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments of your customers. You have access to the administration tools of their Microsoft 365 account and their [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] where you administer your customers' environments. You can also log into their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environments as a *delegated administrator*, for example to set up and maintain the environment or to troubleshoot any issues.  

[!INCLUDE [admin-partner-mpn](../developer/includes/admin-partner-mpn.md)]
[!INCLUDE [csp-get-started](../developer/includes/csp-get-started.md)]
[!INCLUDE [csp-admin-users](../developer/includes/csp-admin-users.md)]

### Connect with customers

[!INCLUDE [csp-connect-customer](../developer/includes/csp-connect-customer.md)]

### Manage technical support

As a reselling partner, you must be the frontline of support for your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] customers. Set up your support contact information, and help the internal administrators troubleshoot any issues that users find. For more information, see [Managing Technical Support](manage-technical-support.md).  

## Trials

Organizations can sign up for different types of trials, and some trials can be extended. For more information, see [Trials and Subscriptions](trials-subscriptions.md).  

## <a name="expire"></a>Data and access when a trial or subscription ends

Trials can expire, and so can a paid subscription, such as if the organization doesn't renew the subscription, stops payments, or if they cancel the subscription.  

[!INCLUDE [admin-extendtrials-periods](../developer/includes/admin-extendtrials-periods.md)]

## <a name="infrastructure"></a>Understanding Business Central online infrastructure

If you're migrating from an on-premises solution, understanding the infrastructure of [!INCLUDE [prod_short](../includes/prod_short.md)] online can help you make good choices for how to set up environments and companies. For more information and an example, see [Understanding the infrastructure of Business Central online](tenant-environment-topology.md).  

## Related information

[The Business Central Administration Center](tenant-admin-center.md)  
[The Business Central Administration Center API](administration-center-api.md)  
[Submitting support requests on behalf of your customer](manage-technical-support.md#submitsupportrequest)  
[Resources for Help and Support for Dynamics 365 Business Central](../help-and-support.md)  
[How does Microsoft handle database sizes?](../faq.yml#how-does-microsoft-handle-database-sizes)  
[Version numbers in Business Central](version-numbers.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Deliver consulting services as a VAR: aka.ms/BusinessCentralConsultingServices](https://aka.ms/BusinessCentralConsultingServices)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Trials and Subscriptions](trials-subscriptions.md)  
[Understanding the infrastructure of Business Central online](tenant-environment-topology.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
