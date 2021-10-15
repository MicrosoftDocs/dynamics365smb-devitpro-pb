---
title: Understanding the infrastructure of Business Central online
description: Learn about how environments in Business Central online reflect the Azure AD tenant with an example of environments and companies across two countries.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: conceptual
ms.workload: na
ms.reviewer: na
ms.search.keywords: administration, tenant, admin, environment
ms.date: 10/15/2021
ms.author: edupont
---

# Understanding the Infrastructure of Business Central Online

When someone wants to buy [!INCLUDE [prod_short](../includes/prod_short.md)] online, a couple of questions must be answered because [!INCLUDE [prod_short](../includes/prod_short.md)] can be configured along several different axes. In this section, we describe the topology of [!INCLUDE [prod_short](../includes/prod_short.md)] online so that you can make qualified decisions for how a [!INCLUDE [prod_short](../includes/prod_short.md)] tenant will be deployed and configured.  

> [!TIP]
> [!INCLUDE [prod_short](../includes/prod_short.md)] is available in a limited number of markets. For more information, see [Country/regional availability and supported languages](../compliance/apptest-countries-and-translations.md).  

## Microsoft 365 and Azure Active Directory

The first decision to make is related to the Azure Active Directory (Azure AD) tenant that is required to use for [!INCLUDE [prod_short](../includes/prod_short.md)] online. To sign up for a trial, use a work or school account. For more information, see [Try or buy a Microsoft 365 for business subscription](/microsoft-365/commerce/try-or-buy-microsoft-365?view=o365-worldwide&preserve-view=true).  

This account is an important step because it is tied to a region of the world. Users are defined in the Azure AD account and then assigned the relevant licenses in the Microsoft 365 admin center. It is also important for the reseller's Azure AD. For more information, see the [Enroll in the CSP program](tenant-administration.md#enroll-in-the-csp-program) section.  

> [!TIP]
> For some customers, the right approach is to have multiple Azure AD tenants due to their own organizational structure. However, in [!INCLUDE [prod_short](../includes/prod_short.md)], all users of an environment must belong to the same Azure AD tenant.

If an organization's structure changes over time, admins can transfer environments from one Azure AD tenant to another. For more information, see [Move an Environment to another Azure Active Directory organization](tenant-admin-center-environments-move.md).  

## Environments and companies

Each Azure AD tenant that buys a [!INCLUDE [prod_short](../includes/prod_short.md)] online license automatically gets some environments. Each environment is tied to a specific country and localization.  

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

Each environment can be divided into multiple companies, where each company defines a legal entity or a business unit that has separate accounting requirements. All users who have a [!INCLUDE [prod_short](../includes/prod_short.md)] license for a specific Azure AD tenant can access all companies in each [!INCLUDE [prod_short](../includes/prod_short.md)] environment that the Azure AD tenant has. You can define different permissions inside [!INCLUDE [prod_short](../includes/prod_short.md)]. For more information, see [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions) in the business functionality content.  

## Example

Let's review a scenario for an organization that is based in Denmark but has a subsidiary in Germany. They have three business units in Denmark and two in Germany. The following diagram illustrates how this fictitious company has set up their [!INCLUDE [prod_short](../includes/prod_short.md)]:  

:::image type="content" source="../media/admin_contoso_org-bc.png" alt-text="Chart that shows one Azure AD tenant using two Business Central production environments and one sandbox with three and two companies, respectively.":::

In this example, the production environment that is based on the Danish localization of [!INCLUDE [prod_short](../includes/prod_short.md)] is part of the default assignment as described earlier. This production environment has three companies to represent the following business units, all located in central Jutland:

- The administrative headquarters
- The production facilities
- The Danish sales office

Contoso has chosen to add a sandbox environment with two companies so that their users can train new employees in a safe environment. The sandbox started out as a copy of the Danish production environment. Over time, it has become a proper training ground with some sample data that Contoso's reselling partner came up with for them.  

Because Contoso has a German subsidiary that has separate accounting requirements, they decided to buy another production environment. This extra environment has two companies, one for the sales offices in Munich, and one for the warehouse near Stuttgart.  

The users in all three environments are defined in the same Azure AD tenant. This way, all licensed users can work in all environments. Individual access to various capabilities is controlled through permissions.  

Alternatively, the organization could have chosen to use a separate Azure AD tenant for the German subsidiary. In that case, users from the Danish Azure AD tenant would not be able to access the German production environment.  

> [!IMPORTANT]
> As the example illustrates, the Azure AD tenant plays an important role in how users can access [!INCLUDE [prod_short](../includes/prod_short.md)]. Users from one Azure AD tenant cannot access environments that belong to another Azure AD tenant.

Contoso is just an example to illustrate how the Azure AD tenant both affects and reflects the organizational structure. In some cases, this example is overly simplistic; in other cases, the example is too complicated. We recommend that customers work closely with their reselling partner to understand how to configure their [!INCLUDE [prod_short](../includes/prod_short.md)] online.  

> [!TIP]
> For information about how to find out which Azure region a [!INCLUDE [prod_short](../includes/prod_short.md)] environment is deployed to, see the overview at [Country/regional availability and supported languages](../compliance/apptest-countries-and-translations.md).

## See Also

[Administration of Business Central Online](tenant-administration.md)  
[Production and Sandbox Environments](environment-types.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[The Business Central Administration Center API](administration-center-api.md)  
[Version numbers in Business Central](version-numbers.md)  
[Monitoring and Analyzing General Data Protection Regulation](telemetry-overview.md)  
[Get Started as a Reseller of Business Central Online](get-started-online.md)  
[Deliver consulting services as a VAR: aka.ms/BusinessCentralConsultingServices](https://aka.ms/BusinessCentralConsultingServices)  
