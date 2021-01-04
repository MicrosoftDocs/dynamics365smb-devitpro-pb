---
title: Application Access Management
description: Learn how application access management works as an Embed App ISV and VAR.
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: application, tenant, management, access, API
ms.date: 12/15/2020
---
# Application Access Management for the [!INCLUDE[embedapp](../developer/includes/embedapp.md)]

In this article, you'll learn how you can control which customers can create online environments based on your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] [application family](../deployment/embed-app-using-application-family.md), by enabling your resellers (VARS) to use the Application Management API.

## Overview

Both [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and [!INCLUDE[embedapp](../developer/includes/embedapp.md)]s are distributed by Cloud Solution Provider (CSP) resellers. [!INCLUDE[embedapp](../developer/includes/embedapp.md)]s use standard [!INCLUDE[prod_short](../developer/includes/prod_short.md)] licenses&mdash;the same licenses used for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. So any reseller who sells [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can also create online environments that run on your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] by default.  

As an [!INCLUDE[embedapp](../developer/includes/embedapp.md)] owner, you'll want to control which customers and which resellers can create online environments based on your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] application. You'd also like to allow these resellers to control whether customers have access to both [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] or only to the [!INCLUDE[embedapp](../developer/includes/embedapp.md)].

To support these capabilities, two features are available, depending on your role:

|Role|What you can do|
|---------|---------------|
|[!INCLUDE[embedapp](../developer/includes/embedapp.md)] ISV |Enable application access management for all environments in your LCS project.<br /><br />Register VARs to give them access to the Application Access Management API.|
|VAR|Once you've been registered by the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] ISV, you can allow or block access to the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] or [!INCLUDE[prod_short](../developer/includes/prod_short.md)] app for specific customers.|

## [!INCLUDE[embedapp](../developer/includes/embedapp.md)] ISV: Enable application access management and register VARs

Follow these steps to provide your VARs with access to the Application Access Management API. Once they have access, they can use the API to enable or disable the creation of online environments based on your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] application.

### Preparation

- Prepare the VAR for the change

    Once you enable application access management in your LCS project, any existing customers already using your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] will be blocked from access to their [!INCLUDE[embedapp](../developer/includes/embedapp.md)] environments by default. It also won't be possible to create new environments based on your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] application for any new or existing customers. The VAR will have to explicitly enable the access for each customer by using the API explained in the section below. Make sure you coordinate this change with your VARs.

- Get the VAR's CSP organizational ID (Microsoft ID). You'll need this ID for registration.

    The VAR can find their Microsoft ID in Partner Center, on the **Account Settings** > **Organizational profile** page.

### Enable application access management and register VARs

1. Go to [Lifecycle Services](https://lcs.dynamics.com/v2) and open your project.
2. Select the **Manage VARs** tile.
3. On the **Manage VARs access** page, turn on the **Allow VARs to whitelist customers** switch.

    > [!IMPORTANT]
    > This step enables application access management. When first you turn on this switch, it won't take effect until you save the change. Be aware that once you save, any existing VAR customers already using your [!INCLUDE[embedapp](../developer/includes/embedapp.md)] and any new customers will be blocked from access by default, until the VAR explicitly enables the app for them.

4. Now you start to register VARs. Select **+Add**.
5. On the **Register new VAR Tenant**, enter the VAR's Microsoft ID in the **Tenant ID** box.
6. Enter a description in the **Description** box to make it easier for you to identify the VAR.
7. Select **Add**.
8. Select **Save** when done.

Once a VAR is registered, they can start to enable and disable the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] for their customers using the Application Management API.

### Disabling and enabling application access management

In your LCS project, you can turn the **Allow VARs to whitelist customers** switch off and on&mdash;without having to remove VARs from the list. This capability is useful if you need to temporarily allow access to all VARs and all customers. For example, suppose a VAR is registered but they're not ready to use the API yet.

> [!IMPORTANT]
> If you turn the **Allow VARs to whitelist customers** switch off, even if the VARs are still listed on the **Manage VARs access** page, the environment access settings made by VARs for their customers will be ignored. The existing access settings will be enforced again once you turn the **Allow Vars to whitelist customers** switch on and save the changes. 

## VAR: Manage customer access to the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] environments

As a VAR, once you've been registered by your ISV, you must explicitly give every customer access to create [!INCLUDE[embedapp](../developer/includes/embedapp.md)] environments. Access is given by using the application access management API. The required steps are outlined in the sections that follow.

### Prerequisite: Register an application for in your Azure Active Directory tenant

You only have to do this step once. In your Azure Active Directory (Azure AD) tenant, register an application that has delegated permission to the Dynamics 365 Business Central API. You'll use this application to call the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Administration Center API for each customer that you want to onboard.

Apart from registering an application, you'll also need an access token. For more information, see [Setting up Azure Active Directory (AAD) based authentication](../administration/administration-center-api.md#azuread) and [Getting an access token](../administration/administration-center-api.md#getting-an-access-token).

### Onboarding customers

With application access management enabled, the typical process for getting customers up and running on a [!INCLUDE[embedapp](../developer/includes/embedapp.md)] environment is as follows:

1. Connect with the customer using Partner Center:
    1. Establish reseller relationship with the customer
    2. Add necessary [!INCLUDE[prod_short](../developer/includes/prod_short.md)] subscriptions
    3. Assign [!INCLUDE[prod_short](../developer/includes/prod_short.md)] licenses to the customer users.

    For more information, see [Connect with customers](https://docs.microsoft.com/partner-center/connect-with-your-customers?toc=/dynamics365/business-central/dev-itpro/toc.json).

2. Control access to [!INCLUDE[embedapp](../developer/includes/embedapp.md)] and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application using the application access management API:
    1. Enable the customer to create environments based on the [!INCLUDE[embedapp](../developer/includes/embedapp.md)] 
    2. Block the customer from creating environments based on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application.

    For more information, see [Application Access Management API](embed-app-application-access-management-api.md). The article explains the API calls that you can make to get the list of the available [!INCLUDE[embedapp](../developer/includes/embedapp.md)]s and enable or disable a specific [!INCLUDE[embedapp](../developer/includes/embedapp.md)] for the customer.

    This work is done using your AAD application and delegated admin access and credentials.
3. Create the first [!INCLUDE[embedapp](../developer/includes/embedapp.md)] environment for the customer by signing in to it for the first time, using the branded [!INCLUDE[embedapp](../developer/includes/embedapp.md)] URL:

    `https://[application family].bc.dynamics.com/[Customer Azure Active Directory Tenant ID]/Production`

## See Also

[Application Access Management API](embed-app-application-access-management-api.md)  
[Using Application Family](../deployment/embed-app-using-application-family.md)
[Managing an Business Central Embed App in Microsoft Lifecycle Services](../deployment/embed-app-lifecycle-services.md)  
