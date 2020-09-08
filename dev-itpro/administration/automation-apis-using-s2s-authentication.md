---
title: "Using Service to Service Authentication with Automation APIs"
description: Service-to-service authentication enables external services to connect as an application, without impersonating normal users.
author: henrikwh
ms.custom: na
ms.date: 07/22/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Using Service-to-Service Authentication with Automation APIs

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)] online

Starting with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 release wave 2, version 17, service-to-service authentication is enabled for Automation APIs. Service-to-service authentication enables external services to connect as an application, without impersonating normal users.  

Service to service authentication is only intended to support the hydration of companies supported by the Automation APIs.

## Usage

Automation APIs provide capability for automating company setup through APIs. Once the tenants have been created, the automation APIs can be used to hydrate the tenant - to bring the tenant up to a desired state. Usually this process involves creating a new company on the tenant, applying RapidStart packages, installing extensions, adding users to user groups and assigning permission sets to users.

The **D365 Automation** entitlements give access to APIs in the `/api/microsoft/automation` route by using the OAuth client credentials flow. An application token with `Automation.ReadWrite.All` scope is needed for accessing [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Automation APIs.

Service-to-service authentication is intended only for company setup through APIs.

## Setup Overview 

To enable service-to-service authentication, two things are required:

- An application must be registered in your Azure Active Directory tenant for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. This application is used to authenticate API calls against [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

- The Azure AD application must also be registered in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

The following tasks describe how to complete this setup. 

## Task 1: Create an Azure Application for authentication to Business Central 

Complete these steps to register an application in Azure AD for service-to-service authentication.

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Register an application for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] in Azure Active Directory tenant.

    Follow the general guidelines at [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

    When you add an application to an Azure AD tenant, you must specify the following information:
    
    |Setting|Description|
    |-------|-----------|
    |Name|Specify a uniques name for your Business Central application. |
    |Supported account types| Select either <strong>Accounts in this organizational directory only (Microsoft only - Single tenant)</strong> or <strong>Accounts in any organizational directory (Any Azure AD directory - Multitenant)</strong>.|
    |Redirect URI|Leave this option empty.|
    
    When completed, an **Overview** displays in the portal for the new application.

3. Copy the **Application (Client) ID** that was assigned the application and also redirect URL that you specified. You'll use this information in the next task.

4. Create a client secret for the registered application.

    Follow the general guidelines at [Add credentials to your web application](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-credentials-to-your-web-application).

5. Grant the registered application  **Automation.ReadWrite.All** permission to **Dynamics 365 [!INCLUDE [prodshort](../developer/includes/prodshort.md)]** API.

    Follow the general guidelines at [Add permissions to access web APIs](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-web-apis).

    1. Select **Dynamics 365 [!INCLUDE [prodshort](../developer/includes/prodshort.md)]** under **Microsoft APIs**. Then, add 
    2. Add a **Application permissions** type, and select the **Automation.ReadWrite.All** permissions.

    When completed, the **API permissions** page should include the following entry:

    |API / Permission name|Type|Description|
    |---------------------|----|-----------|
    |Dynamics 365 Business Central / Automation.ReadWrite.All|Application|Full access to automation|

    

## Task 2: Register the service-to-service application in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

Complete these steps to register the Azure AD application for service-to-service authentication in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

1. In the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client, search for **AAD Applications**  and open the page.

2. Select **New**.

    The **AAD Application Card** opens.

3. In the **Client Id** field, enter the **Application (Client) ID**  for the registered application in Azure AD from task 1. 

4. Fill-in the **Description** field.

5. Set the **State** to **Enabled**.

6. Validate the permission sets assigned. 

7. Select **Grant Consent** and follow the wizard to the complete the set up.

   > [!NOTE]
   > Pre-Consent can be done by adding the AAD application to the **Adminagents** group in the partner tenant.  

## See Also

[Automation API overview](dynamics-microsoft-automation-overview.md)  

