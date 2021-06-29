---
title: "Using Service to Service Authentication"
description: Service-to-service authentication enables external services to connect as an application, without impersonating normal users.
author: henrikwh
ms.custom: na
ms.date: 06/29/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---
 
# Using Service-to-Service (S2S) Authentication 

> **APPLIES TO:** Business Central Online only. S2S for automation APIs requires 2020 release wave 2 (version 17.0) or later. S2S for standard Business Central APIs, custom APIs, and web services requires Business Central 2021 release wave 1, version 18.3 or later

<!-- Starting with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2, version 17, service-to-service authentication is enabled for Automation APIs. Service-to-service authentication enables external services to connect as an application, without impersonating normal users.    -->

Service-to-Service (S2S) authentication is suited for scenarios where integrations are required to run without any user interaction. OAuth delegate flows, like [authorization code](/azure/active-directory/develop/v2-oauth2-auth-code-flow), [implicit grant flow](/azure/active-directory/develop/v2-oauth2-implicit-grant-flow) and [resource owner password credentials](/azure/active-directory/develop/v2-oauth-ropc) can be configured to require multifactor authentication (MFA). This configuration prevents integration from running unattended, because MFA is required to acquire the access token from Azure Active Directory. S2S authentication uses the [Client Credentials OAuth 2.0 Flow](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow). This flow enables you to access resources by using the identity of an application.

Business Central 2020 release wave 2 (version 17.0) introduced S2S authentication support for accessing Business Central automation APIs. 2021 release wave 1 (version 18.3) expanded S2S authentication for access to the Business Central APIs [v2.0](/dynamics365/business-central/dev-itpro/api-reference/v2.0/) and [v1.0]/dynamics365/business-central/dev-itpro/api-reference/v2.0/), [custom APIs](../developer/devenv-develop-custom-api.md), and web services.

> [!NOTE]
> For more information about OAuth 2.0 flows, see [OAuth 2.0 and OpenID Connect protocols on the Microsoft identity platform](/azure/active-directory/develop/active-directory-v2-protocols) in the Azure Active Directory documentation.

## Usage

Two main scenarios are enabled with S2S authentication:

1. Company setup using automation API

    Automation APIs provide capability for automating company setup through APIs. The automation APIs are used to hydrate tenants, that is, to bring them to an initial state.

    The **D365 Automation** entitlements give access to APIs in the `/api/microsoft/automation` route by using the OAuth client credentials flow. An application token with the `Automation.ReadWrite.All` scope is needed for accessing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Automation APIs.

2. External user and non-interactive user access to APIs and web services.

    S2S authentication enables both external user and non-interactive user access to Business Central online. Refer to [license guide](https://www.microsoft.com/en-us/licensing/product-licensing/dynamics365) for scenarios and usage. An application token with the `API.ReadWrite.All` scope is needed for accessing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs and web services.  

## Setup service-to-service authentication

To enable service-to-service authentication, you'll have to do two things:

- Register an application in your Azure Active Directory tenant for authenticating API calls against [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

- Grant access for that Azure AD application in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

These tasks are described in the sections that follow. 

## Task 1: Register an Azure AD application for authentication to Business Central

Complete these steps to register an application in your Azure AD tenant for service-to-service authentication.

1. Sign in to the [Azure portal](https://portal.azure.com).

2. Register an application for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] in Azure Active Directory tenant.

    Follow the general guidelines at [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

    When you add an application to an Azure AD tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|Specify a unique name for your application. |
    |Supported account types| Select either <strong>Accounts in this organizational directory only (Microsoft only - Single tenant)</strong> or <strong>Accounts in any organizational directory (Any Azure AD directory - Multitenant)</strong>.|

    When completed, an **Overview** displays in the portal for the new application.

3. Create a client secret for the registered application as follows:

    1. Select **Certificates & secrets** > **New client secret**.
    2. Add a description, select a duration, and select **Add**.

    > [!NOTE]
    > Copy the secret's value for use in your client application code. This secret value is never displayed again after you leave this page.

    For the latest guidelines about adding client secrets in Azure AD, see [Add credentials ](/azure/active-directory/develop/quickstart-register-app#add-credentials) in the Azure documentation.

4. Grant the registered application **API.ReadWrite.All** or **Automation.ReadWrite.All** permission to the **Dynamics 365 [!INCLUDE [prod_short](../developer/includes/prod_short.md)]** API as follows:

    1. Select **API permissions** > **Add a permission** > **Microsoft APIs**.
    2. Select **Dynamics 365 [!INCLUDE [prod_short](../developer/includes/prod_short.md)]**.
    3. Select **Application permissions**, select **API.ReadWrite.All** or **Automation.ReadWrite.All**, then select **Add permissions**.

    When completed, the **API permissions** page will include one of the following entries:

    |API / Permission name|Type|Description|
    |---------------------|----|-----------|
    |Dynamics 365 Business Central / Automation.ReadWrite.All|Application|Full access to automation|
    |Dynamics 365 Business Central / API.ReadWrite.All|Application|Access to APIs and webservices|

    For the latest guidelines about adding permissions in Azure AD, see [Add permissions to access your APIs](/azure/active-directory/develop/quickstart-configure-app-access-web-apis#add-permissions-to-access-your-web-api) in the Azure documentation.

## Task 2: Set up the Azure AD application in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

Complete these steps to set up the Azure AD application for service-to-service authentication in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. 

1. In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client, search for **Azure Active Directory Applications**  and open the page.

2. Select **New**.

    The **Azure Active Directory Application Card** opens.

3. In the **Client ID** field, enter the **Application (Client) ID**  for the registered application in Azure AD from task 1. 

4. Fill in the **Description** field.

5. Set the **State** to **Enabled**.

6. Assign permissions to objects as needed.

   For more information, [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

   > [!IMPORTANT]
   > Applications can't be assigned the **SUPER** permission set. Make sure that applications follows least-privilege principle and only assign permissions required for the integration to work.

   > [!NOTE]
   > The system permission sets and user groups called **D365 AUTOMATION** and **EXTEND. MGT. - ADMIN** provide access to most typical objects used with automation.
   >
   > The **EXTEND. MGT. - ADMIN** permission set was introduced in Business Central 2021 release wave 1 as a replacement for the **D365 EXTENSION MGT** permission set in earlier versions.

7. Select **Grant Consent** in [!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)] and follow the wizard to the complete the setup. Consent can also be granted from the Azure portal.

   > [!TIP]
   > Pre-consent can be done by adding the AAD application to the **Adminagents** group in the partner tenant.  For more information, see [Pre-consent your app for all your customers](/graph/auth-cloudsolutionprovider#pre-consent-your-app-for-all-your-customers) in the Graph documentation.

## Calling API and web services

After the Azure AD application has been set up and access has been granted, you're ready to make API and web service calls to Business Central.

The following sample uses the [Rest Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) for Visual Studio Code. Using the Rest Client makes it easy to see which HTTP calls are made both against Business Central and Azure Active Directory. Any HTTP client can be used to create the requests below. Or you can choose any library, like MSAL.

> [!TIP]
> You can also see this sample in the[BCTech Github repo](https://github.com/microsoft/BCTech/tree/master/samples/VSCRestClientOAuthBCAccess).


```http
@tenantId = <tenant id>
@clientId = <client id>
@clientSecret = <client secret>
@baseUri = https://api.businesscentral.dynamics.com
@scope = {{baseUri}}/.default
@bcEnvironmentName = production
@url = {{baseUri}}/v2.0/{{bcEnvironmentName}}/api/v2.0

### Define entity, like customers, items, or vendors
@entityName =customers 

# @name auth
POST https://login.microsoftonline.com/{{tenantId}}/oauth2/v2.0/token HTTP/1.1
Content-type: application/x-www-form-urlencoded

grant_type=client_credentials
&client_id={{clientId}}
&client_secret={{clientSecret}}
&scope={{scope}}

### Variable Response
@accessHeader = Bearer {{auth.response.body.$.access_token}}

# @name GetCompanies
GET {{url}}/companies HTTP/1.1
Authorization: {{accessHeader}}

### Variable Response
@companyId = {{GetCompanies.response.body.value.[0].id}}
@companyUrl = {{url}}/companies({{companyId}})
@displayName = MyItemDisplayName2

### Get entities

# @name GetEntities
GET {{companyUrl}}/{{entityName}} HTTP/1.1
Authorization: {{accessHeader}}

### Create entity

# @name CreateEntity
POST {{companyUrl}}/{{entityName}} HTTP/1.1
Content-Type:  application/json
Authorization: {{accessHeader}}

{
 "displayName" : "{{displayName}}"
}

### Get created entity

# @name GetCreatedEntity
GET {{companyUrl}}/{{entityName}}/?$filter=displayName eq '{{displayName}}' HTTP/1.1
Authorization: {{accessHeader}}

#### Variable Response
@entityId = {{GetCreatedEntity.response.body.value.[0].id}}

### Modify entity

# @name ModifyEntity
PATCH {{companyUrl}}/{{entityName}}({{entityId}})
Authorization: {{accessHeader}}
Content-Type:  application/json
If-Match: *

{
    "displayName" : "DeleteMe-{{displayName}}"
}

### Delete entity

# @name DeleteItem
Delete {{companyUrl}}/{{entityName}}({{entityId}})
Authorization: {{accessHeader}}
```

## See Also
[OAuth2 and Azure Active Directory]/azure/active-directory/develop/active-directory-v2-protocols)  
[Client Credentials flow/S2S using MSAL library](/azure/active-directory/develop/scenario-daemon-overview)  
[C# samples using Client Credentials flow](https://github.com/Azure-Samples/active-directory-dotnetcore-daemon-v2)  
[OAuth 2.0 client credentials flow on the Microsoft identity platform](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow)  
[Samples and libraries for OAuth: Microsoft identity platform authentication libraries](/azure/active-directory/develop/reference-v2-libraries)  
[Business Central Repository on GitHub - PowerShell samples using MSAL](https://github.com/microsoft/BCTech/tree/master/samples/PSOAuthBCAccess)  
[Business Central API v2.0](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)



<!-- 
[Automation company](resources/dynamics_automationcompany.md)  
[Company](resources/dynamics_company.md)  
[Configuration package](resources/dynamics_configurationpackage.md)  
[Extension](resources/dynamics_extension.md)  
[Extension deployment status](resources/dynamics_extensiondeploymentstatus.md)  
[Extension upload](resources/dynamics_extensionupload.md)  
[Permission set](resources/dynamics_permissionset.md)  
[Profile](resources/dynamics_profile.md)  
[Scheduled job](resources/dynamics_scheduledjob.md)  
[User](resources/dynamics_user.md)  
[User group](resources/dynamics_usergroup.md)  
[User group member](resources/dynamics_usergroupmember.md)  
[User group permission](resources/dynamics_usergrouppermission.md)  
[User permission](resources/dynamics_userpermission.md)   -->
