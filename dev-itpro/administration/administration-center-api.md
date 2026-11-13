---
title: Business Central Administration Center API
description: Use the Business Central administration center API to automate tenant administration, authenticate API calls, and understand error responses.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/13/2026
ai-usage: ai-assisted
---

# The Business Central admin center API

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API enables administrators to programmatically do administrative tasks for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant. With the API, administrators can, for example:

- Query and work with production and sandbox environments for the tenant.
- Set up administrative notifications.
- View telemetry for events on the tenant.

Learn more about administrative capabilities in [The Business Central Administration Center](tenant-admin-center.md). This article describes the API contracts for these administrative capabilities.

[!INCLUDE [admin-azure-ad-preconsent](../developer/includes/admin-azure-ad-preconsent.md)]

## Locate the API endpoint

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API is located at the following URL: `https://api.businesscentral.dynamics.com`.

<a id="authenticate-using-service-to-service-microsoft-entra-apps-client-credentials-flow"></a>

## Authenticate by using service-to-service Microsoft Entra apps

> [!IMPORTANT]  
> This authentication type is supported from version 20.0 an onwards

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API supports authentication using Microsoft Entra apps. Learn more in [Microsoft identity platform and the OAuth 2.0 client credentials flow](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow).

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com/).
1. Go to **Entra ID** > **App registrations** > **New registration** to register an application for [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] in your Microsoft Entra tenant.

    Learn more in [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).

    When you add an application to a Microsoft Entra tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|Specify a meaningful name for your application. The name doesn't need to be unique.|
    |Supported account types|Choose single-tenant access for accounts in your tenant only, or multitenant access for accounts in multiple Microsoft Entra tenants.|
    |Redirect URI|Don't configure this setting. The client credentials flow doesn't use a redirect URI.|

    Select **Register**. The **Overview** page displays for the new application.

  > [!NOTE]
  > Copy the **Application (client) ID** of the registered app. You'll need this later. You can get this value from the **Overview** page.

1. Create a client secret for the registered application as follows:

    1. Select **Certificates & secrets** > **Client secrets** > **New client secret**.
    1. Add a description, select a duration, and select **Add**.

    > [!NOTE]
    > Copy the secret's value for use in your client application code. This secret value is never displayed again after you leave this page.

    Learn more in [Add credentials to an application](/entra/identity-platform/how-to-add-credentials).

   > [!IMPORTANT]  
   > The following sample uses a client secret to demonstrate how to get an access token. For production scenarios, use a certificate or federated credential instead of a client secret. Learn more in [Add credentials to an application](/entra/identity-platform/how-to-add-credentials).

1. Grant the registered application **AdminCenter.ReadWrite.All** permission to the **Dynamics 365 [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]** API as follows:

    1. Select **API permissions** > **Add a permission** > **Microsoft APIs**.
    1. Select **Dynamics 365 [!INCLUDE [prod_short](../developer/includes/prod_short.md)]**.
    1. Select **Application permissions**, select **AdminCenter.ReadWrite.All**, then select **Add permissions**.
  
    > [!NOTE]
    > If you intent to use the same Microsoft Entra app with the Automation API and Business Central Web Services you can also grant **API.ReadWrite.All** and **Automation.ReadWrite.All** permissions. Learn more [here](automation-apis-using-s2s-authentication.md).

1. (optional) Grant admin consent on each permission by selecting it in the list, then selecting **Grant admin consent for \<tenant name\>**. This step isn't required if you'll be granting consent from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. It is possible to grant consent from this page only for your own current tenant. This works for single-tenant apps, but for multi-tenant apps you have to grant consent for each tenant from that tenant's [Microsoft Entra admin center](https://entra.microsoft.com/), [Azure portal](https://portal.azure.com/) or the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]
1. Go to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and navigate to the 'Authorized Microsoft Entra apps' page. Paste the **Application (client) ID** of your app in the form to authorize an app.
1. If not already completed in step 5 you can grant consent for your app from the 'Authorized Microsoft Entra apps' page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].
  
   > [!NOTE]
   > There might be a short delay until the `Granted` status is visible in the Business Central admin center after refreshing. To grant consent, you must have a Microsoft Entra role assigned that allows for management of application registrations in the tenant, such as the [Cloud Application Administrator](/azure/active-directory/roles/permissions-reference#cloud-application-administrator) role. The Dynamics 365 Administrator role that grants access to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] does not allow users to grant consent to applications in the tenant.
1. (optional) Some operations in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API require that the app has a permissions assigned in the environment in addition to the authorization in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Follow the instructions in Task 2 [here](automation-apis-using-s2s-authentication.md) to assign permissions.

   > [!NOTE]
   > Learn more about permissions required for App Management operations [here](administration-center-api_app_management.md) and learn more about permissions required for Database Exports [here](administration-center-api_environment_database_export.md).

<a id="getting-an-access-token-with-client-credentials-flow"></a>

### Get an access token with the client credentials flow

HTTP requests sent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API must include the Authorization HTTP header, and the value must be an access token.

Use the OAuth 2.0 v2.0 token request in [Call the admin center API](#call-the-admin-center-api) to get an access token.

### Call the admin center API

After the Microsoft Entra application has been set up, authorized in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and granted admin consent, you're ready to make API calls.

The following sample uses the [Rest Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) for Visual Studio Code. Using the Rest Client makes it easy to see which HTTP calls are made both against [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and Microsoft Entra ID. Any HTTP client can be used to create the requests below. Or you can choose any library, like MSAL.

```
@tenantId = <tenant id>
@clientId = <client id>
@clientSecret = <client secret>
@baseUri = https://api.businesscentral.dynamics.com
@scope = {{baseUri}}/.default
@url = {{baseUri}}/admin/v2.15

# @name auth
POST https://login.microsoftonline.com/{{tenantId}}/oauth2/v2.0/token HTTP/1.1
Content-type: application/x-www-form-urlencoded

grant_type=client_credentials
&client_id={{clientId}}
&client_secret={{clientSecret}}
&scope={{scope}}

### Variable Response
@accessHeader = Bearer {{auth.response.body.$.access_token}}

# @name GetEnvironments
GET {{url}}/applications/BusinessCentral/environments HTTP/1.1
Authorization: {{accessHeader}}

### Variable Response
@environmentName = {{GetEnvironments.response.body.value.[0].name}}
```

<a name="azuread"></a>

## Set up Microsoft Entra delegated authentication

Learn more about interactive delegated authentication in [Microsoft identity platform and OAuth 2.0 authorization code flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow).

Register your client application as an app and enable it to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com/) and go to **Entra ID** > **App registrations** > **New registration**.
1. Give the application a meaningful **Name**, such as **Business Central Web Service Client**, choose the account types for your scenario, and select **Register**. Learn more in [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).
1. Go to **Authentication** > **Add Redirect URI**. Choose **Mobile and desktop applications** for a desktop client or **Web** for a web application. Register the redirect URI required by your application's runtime and authentication library. For a web application, use the application's redirect URL. For the interactive MSAL example below, set `$redirectUri` to the registered URI supported by your runtime. Learn more in [Add a redirect URI to an application](/entra/identity-platform/how-to-add-redirect-uri).
1. Select **API permissions** > **Add a permission**, select **Dynamics 365 Business Central**, and select **Delegated permissions**. Select the delegated permissions required for your scenario, then select **Add permissions**. Learn more in [Configure an application to access a web API](/entra/identity-platform/quickstart-configure-app-access-web-apis).
   > [!NOTE]  
   > If **Dynamics 365 Business Central** doesn't show up in search, it's because the tenant doesn't have any knowledge of Dynamics 365 Business Central. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for Dynamics 365 Business Central with a user from the directory.
1. Make a note of both the **Application (client) ID** and the **Redirect URI**. You need them later.

### Get an access token with delegated authentication

HTTP requests sent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API must include the Authorization HTTP header, and the value must be an access token.

[!INCLUDE [username-password-ropc](../includes/username-password-ropc.md)]

The following examples show how to obtain such a token using PowerShell. Using C# is straightforward.

The following example uses the resource owner password credentials flow, not the authorization code flow. This flow isn't recommended and doesn't support multifactor authentication (MFA). Learn more in [Microsoft identity platform and the resource owner password credentials flow](/entra/identity-platform/v2-oauth-ropc).

PowerShell example without prompt:

```powershell
$cred = [System.Management.Automation.PSCredential]::new($userName, $secureStringPassword)
$authority = "https://login.microsoftonline.com/$tenantName"
$scopes = [String[]]@("https://api.businesscentral.dynamics.com/.default")
$client = [Microsoft.Identity.Client.PublicClientApplicationBuilder]::Create($applicationId).WithAuthority($authority).Build()
$accessToken = $client.AcquireTokenByUsernamePassword($Scopes, $cred.UserName, $cred.Password).ExecuteAsync().GetAwaiter().GetResult().AccessToken
```

PowerShell example with prompt:

```powershell
$authority = "https://login.microsoftonline.com/$tenantName"
$scopes = [String[]]@("https://api.businesscentral.dynamics.com/.default")
$client = [Microsoft.Identity.Client.PublicClientApplicationBuilder]::Create($applicationId).WithAuthority($authority).WithRedirectUri($redirectUri).Build()
$accessToken = $client.AcquireTokenInteractive($scopes).ExecuteAsync().GetAwaiter().GetResult().AccessToken
```

## API error response format

If an error occurs during the execution of an API method, it will respond back with an error object. While the specifics of any error will vary from endpoint to endpoint and by the error, the error object returned should adhere to the following structure. When an error occurs that doesn't fit this structure, it typically indicates that an error occurred in sending the request or during authentication of the request. For example, it could be that the API hasn't yet received the request. 

**Error Response Object:**

```
{
"code": string, // A stable error code describing the type an nature of the error. Ex: EnvironmentNotFound
"message": string, // A message with a readable description of the error and cause. Intended to assist with debugging or troubleshooting the API, it's not intended to be displayed.
("target": string), // Optional - Provides information about what part of a request caused the error. Ex: The name of a property on the request body.
("extensionData": {...}), // Optional - A key/value dictionary object containing additional information about the error.
("clientError": [ // Optional - A nested list of error objects containing more details about the error encountered. For instance, this may be used if multiple errors are encountered to list them all out.
  {
    "code": string,
    "message": string,
    "target": string,
    "extensionData": {...},
    "clientError": [...]
  }
])
}
```

**General unhandled errors**

All unknown and unhandled errors that aren't covered by the lists above will use the error code: **Unknown**

## Related information

[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
