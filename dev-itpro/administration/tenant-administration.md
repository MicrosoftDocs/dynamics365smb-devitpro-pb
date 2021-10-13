---
title: Administration of Business Central Online
description: Learn about how you as the internal administrator or as a reselling partner can manage online tenants of Dynamics 365 Business Central.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 09/30/2021
ms.author: edupont
---

# Administration of Business Central Online

Administrators that can manage [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online tenants are either an internal administrator, who is an employee of the company that bought the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] subscription, or an administrator from the reselling partner company. Some of the tools are the same, and some tools are available to partners only. Here you can learn which tools are available to you as an administrator.  

## Administration as an internal administrator

Internal administrators are the system administrators, IT professionals, or superusers of the customer's company, who are assigned the **Global admin** role in the Microsoft 365 admin center. For more information, see [About admin roles](/microsoft-365/admin/add-users/about-admin-roles) in the Microsoft 365 admin content.  

### Administration in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

As the internal administrator, you can add users and grant permissions. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) and [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions) in the business functionality content for [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

As an internal administrator you have **read-only** access to all areas of [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. You will have this access even if your organization decides not to continue with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and cancels the subscription. That way, the internal administrator can export relevant data, while no one else in the organization has a license to sign in and use [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

> [!IMPORTANT]
> You must have a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] license in order to set up integration to other products, or perform any other tasks in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], except the two mentioned above. For information about licensing, see [Microsoft Dynamics 365 Business Central Licencing Guide](https://aka.ms/BusinessCentralLicensing).

For other tasks, you can access the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], where you can manage upgrade schedules and other tasks. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

You can also use telemetry to track usage and monitor user sessions, for example. For more information, see [Monitoring and Analyzing Telemetry](telemetry-overview.md) and [Managing Sessions](tenant-admin-center-manage-sessions.md).  

### Administration of a trial

If your organization has signed up for a [!INCLUDE [prod_short](../developer/includes/prod_short.md)] trial, you can extend the free trial, and you can start the process of finding a reselling partner to help you get a subscription. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview).  

### Administration in the Microsoft 365 admin center

The **Global admin** role makes you an administrator of your organization's Microsoft 365 tenant. This role means that you can manage the subscription, add or remove users, and assign or remove licenses in the Microsoft 365 admin center. For more information, see [Microsoft 365 Admin help center](/office365/admin/admin-home).  

### Collaboration with reselling partners

When your organization subscribes to [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you have a relationship with [an authorized partner of Microsoft](/microsoft-365/admin/misc/add-partner). The partner company assists with licensing, configuration, and other tasks. They can also help you get [telemetry](telemetry-overview.md) about your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment.  

The partner will have access to your tenant as a *delegated administrator*. You can configure their access to your data. For more information, see [Managing delegated permissions as an internal administrator](delegated-admin.md#managing-delegated-permissions-as-an-internal-administrator).

If your organization decides to switch to another partner, you must take the following steps:

1. Ask your current partner to [remove the reseller relationship with you](/microsoft-365/admin/misc/add-partner#remove-a-reseller-relationship) in the Partner Center
2. Remove their delegated administration privileges

    1. In the Microsoft 365 admin center, under **Settings**, choose **Partner relationships**, and then select the partner of interest
    2. In the details pane, choose **Remove delegated admin**
    3. In the confirmation pane, choose **Remove**
    4. [Disable their user accounts](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system) in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]  
3. Remove any settings in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] if the partner did not already clear their settings.  

    For more information, see [Internal administrators](tenant-admin-center.md#internal-administrators).

4. [Add your new partner to your subscription](/microsoft-365/admin/misc/add-partner#add-a-partner-to-an-existing-subscription), and work with them to get them set up  

### Unsubscribing from [!INCLUDE [prod_short](../developer/includes/prod_short.md)]

If the organization decides not to continue with [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you can then cancel the subscription.  

In the Microsoft 365 admin portal, you can remove licenses from users. As the administrator, you can remove a trial subscription from your company's account. But to cancel a paid subscription, you must contact your reselling partner, and they can [cancel the relevant subscription](/partner-center/create-a-new-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml) in the Partner Center. For more information, see the [Data and access when a trial or subscription ends](#expire) section.  

## Administration as a partner

As a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] reselling partner, you are the administrator of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenants of your customers. You have access to the administration tools of their Microsoft 365 account and their [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] where you can specify update windows. You can also log into their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] as a *delegated administrator* if you want to reproduce errors.  

[!INCLUDE [admin-partner-mpn](../developer/includes/admin-partner-mpn.md)]
[!INCLUDE [csp-get-started](../developer/includes/csp-get-started.md)]
[!INCLUDE [csp-admin-users](../developer/includes/csp-admin-users.md)]

### Connect with customers

[!INCLUDE [csp-connect-customer](../developer/includes/csp-connect-customer.md)]

### Acting as a delegated administrator

As a reselling partner, you have delegated administration access to their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] and other services. For more information, see [Delegated Administrator Access to Business Central Online](delegated-admin.md).  

### Manage technical support

As a reselling partner, you must be the first line of support for your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] customers. Set up your support contact information, and help the internal administrators troubleshoot any issues that users find. For more information, see [Managing Technical Support](manage-technical-support.md).  

## Extending trials

[!INCLUDE [admin-extendtrials](../developer/includes/admin-extendtrials.md)]

### <a name="premiumtrial"></a>The Dynamics 365 Business Central Premium Trial

[!INCLUDE [admin-premiumtrial](../developer/includes/admin-premiumtrial.md)]

## <a name="expire"></a>Data and access when a trial or subscription ends

Trials can expire, and so can a paid subscription, such as if the organization does not renew the subscription, stops payments, or if they cancel the subscription.  

[!INCLUDE [admin-extendtrials-periods](../developer/includes/admin-extendtrials-periods.md)]

### Removing a subscription

If a customer decides to stop using [!INCLUDE [prod_short](../includes/prod_short.md)], an administrator must remove the subscription in the Microsoft 365 admin center. An email notification is sent to all administrators of the account. Deleting the subscription blocks all users from accessing their [!INCLUDE [prod_short](../includes/prod_short.md)], and deletes all data.  

> [!WARNING]
> The subscription is deleted immediately and can not be reactivated.

For more information, see [Suspend or cancel a subscription](/partner-center/create-a-new-subscription#suspend-or-cancel-a-subscription?toc=/dynamics365/business-central/dev-itpro/administration&bc=../breadcrumb/toc.yml) in the Partner Center content.  

### When a free trial expires

Most trials are based on people signing up at [https://dynamics.microsoft.com/business-central/](https://dynamics.microsoft.com/business-central/). These viral trials do not expire, unless the prospect switches to the 30-day trial, and provided that users access [!INCLUDE [prod_short](../includes/prod_short.md)] frequently.  

[!INCLUDE [admin-viral-trial-expiry](../developer/includes/admin-viral-trial-expiry.md)]

## <a name="infrastructure"></a>Understanding Business Central online infrastructure

When someone wants to buy [!INCLUDE [prod_short](../includes/prod_short.md)] online, a couple of questions must be answered because [!INCLUDE [prod_short](../includes/prod_short.md)] can be configured along several different axes. In this section, we describe the topology of [!INCLUDE [prod_short](../includes/prod_short.md)] online so that you can make qualified decisions for how the tenant will be deployed and configured.  

> [!TIP]
> [!INCLUDE [prod_short](../includes/prod_short.md)] is available in a limited number of markets. For more information, see [Country/regional availability and supported languages](../compliance/apptest-countries-and-translations.md).  

### Microsoft 365 and Azure Active Directory

The first decision to make is related to the Azure Active Directory (Azure AD) tenant that is required to use for [!INCLUDE [prod_short](../includes/prod_short.md)] online. To sign up for a trial, use a work or school account. For more information, see [Try or buy a Microsoft 365 for business subscription](/microsoft-365/commerce/try-or-buy-microsoft-365?view=o365-worldwide&preserve-view=true).  

This account is an important step because it is tied to a region of the world. Users are defined in the Azure AD account and then assigned the relevant licenses in the Microsoft 365 admin center. It is also important for the reseller's Azure AD. For more information, see the [Enroll in the CSP program](#enroll-in-the-csp-program) section.  

> [!TIP]
> For some customers, the right approach is to have multiple Azure AD tenants due to their own organizational structure.  

### Environments and companies

Each Azure AD tenant that buys a [!INCLUDE [prod_short](../includes/prod_short.md)] online license automatically gets some environments. Each environment is tied to a specific country and localization.  

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

Each environment can be divided into multiple companies, where each company defines a legal entity or a business unit that has separate accounting requirements. All users who have a [!INCLUDE [prod_short](../includes/prod_short.md)] license for a specific Azure AD tenant can access all companies in each [!INCLUDE [prod_short](../includes/prod_short.md)] environment that the Azure AD tenant has. You can define different permissions inside [!INCLUDE [prod_short](../includes/prod_short.md)]. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) in the business functionality content.  

### Example

Let's review a scenario for an organization that is based in Denmark but has a subsidiary in Germany. They have three business units in Denmark and two in Germany.  

| Organization | Azure AD | Environment localization | Number of companies |
|--|--|--|--|
| Parent company | Microsoft 365 account in Denmark | DK | 3 |
| Subsidiary company | Microsoft 365 account in Germany | DE | 2 |

In this example, the production environment that is based on the Danish localization of [!INCLUDE [prod_short](../includes/prod_short.md)] is part of the default assignment as described above. This production environment has three companies to represent the following business units, all located in central Jutland:

- The administrative headquarters
- The production facilities
- The Danish sales office

Because this organization has a German subsidiary that has separate accounting requirements, the organization decided to buy another production environment. This extra environment has two companies, one for the sales offices in Munich, and one for the warehouse near Stuttgart.

## See Also

[The Business Central Administration Center](tenant-admin-center.md)  
[The Business Central Administration Center API](administration-center-api.md)  
[Submitting support requests on behalf of your customer](manage-technical-support.md#submitsupportrequest)  
[Resources for Help and Support for Dynamics 365 Business Central](../help-and-support.md)  
[How does Microsoft handle database sizes?](../faq.yml#how-does-microsoft-handle-database-sizes)  
[Version numbers in Business Central](version-numbers.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Deliver consulting services as a VAR: aka.ms/BusinessCentralConsultingServices](https://aka.ms/BusinessCentralConsultingServices)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
