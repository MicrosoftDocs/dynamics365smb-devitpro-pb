---
title: Business Central Administration Center API 
description: Get introduced to the Business Central administration center API.
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 06/14/2022
---

# The Business Central Admin Center API

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API enables administrators to programmatically do administrative tasks for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tenant. With the API, administrators can, for example:

- Query and work with production and sandbox environments for the tenant.
- Set up administrative notifications.
- View telemetry for events on the tenant.

For more information about administrative capabilities, see [The Business Central Administration Center](tenant-admin-center.md). This article describes the API contracts for these administrative capabilities.

[!INCLUDE [admin-azure-ad-preconsent](../developer/includes/admin-azure-ad-preconsent.md)]

## Location

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API is located at the following URL: https://api.businesscentral.dynamics.com.

## Authenticate using service-to-service AAD Apps ([Client Credentials Flow](/azure/active-directory/develop/v2-oauth2-client-creds-grant-flow))
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API supports authentication using AAD Apps.

1. Sign in to the [Azure portal](https://portal.azure.com).
2. Register an application for [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] in your Azure Active Directory tenant.

    Follow the general guidelines at [Register your application with your Azure Active Directory tenant](/azure/active-directory/active-directory-app-registration).

    When you add an application to an Azure AD tenant, you must specify the following information:

    |Setting|Description|
    |-------|-----------|
    |Name|Specify a unique name for your application. |
    |Supported account types| Select either <strong>Accounts in this organizational directory only (Microsoft only - Single tenant)</strong> or <strong>Accounts in any organizational directory (Any Azure AD directory - Multitenant)</strong>.|
    |Redirect URI|Optional. You can grant consent from the Azure portal if left empty.|

    When completed, an **Overview** displays in the portal for the new application.
3. Create a client secret for the registered application as follows:

    1. Select **Certificates & secrets** > **New client secret**.
    2. Add a description, select a duration, and select **Add**.

    > [!NOTE]
    > Copy the secret's value for use in your client application code. This secret value is never displayed again after you leave this page.

    For the latest guidelines about adding client secrets in Azure AD, see [Add credentials](/azure/active-directory/develop/quickstart-register-app#add-credentials) in the Azure documentation.

  > [!NOTE]
  > Copy the **Application (client) ID** of the registered app. You'll need this later. You can get this value from the **Overview** page.
4. Grant the registered application **AdminCenter.ReadWrite.All** permission to the **Dynamics 365 [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]** API as follows:

    1. Select **API permissions** > **Add a permission** > **Microsoft APIs**.
    2. Select **Dynamics 365 [!INCLUDE [prod_short](../developer/includes/prod_short.md)]**.
    3. Select **Application permissions**, select **AdminCenter.ReadWrite.All**, then select **Add permissions**.
  
    > [!NOTE]
    > If you intent to use the same AAD App with the Automation API and Business Central Web Services you can also grant **API.ReadWrite.All** and **Automation.ReadWrite.All** permissions. Learn more [here](automation-apis-using-s2s-authentication.md).
5. (optional) Grant admin consent on each permission by selecting it in the list, then selecting **Grant admin consent for \<tenant name\>**. This step isn't required if you'll be granting consent from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].
6. Go to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and navigate to the 'Authorized AAD Apps' page. Paste the **Application (client) ID** of your app in the form to authorize an app.
7. If not already completed in step 5 you can grant consent for your app from the 'Authorized AAD Apps' page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].
8. (optional) Some operations in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API require that the app has a permissions assigned in the environment in addition to the authorization in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Follow the instructions in Task 2 [here](automation-apis-using-s2s-authentication.md) to assign permissions.

    > [!NOTE]
    > Learn more about permissions required for App Management operations [here](administration-center-api_app_management.md) and learn more about permissions required for Database Exports [here](administration-center-api_environment_database_export.md).

### Getting an Access Token with Client Credentials Flow
HTTP requests sent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API must include the Authorization HTTP header, and the value must be an access token.

The following examples show how to obtain such a token using PowerShell. Using C# is straightforward.

PowerShell example without prompt:
 ```powershell
   $cred = [Microsoft.IdentityModel.Clients.ActiveDirectory.ClientCredential]::new($AppId, $AppSecret)
   $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$TenantName")
   $token = $ctx.AcquireTokenAsync("996def3d-b36c-4153-8607-a6fd3c01b89f", $cred).GetAwaiter().GetResult().AccessToken
 ```
  > [!NOTE]
  > In the PowerShell example above, the guid specified to acquire the token (996def3d-b36c-4153-8607-a6fd3c01b89f) is the resource ID of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The example gets the client credential using the app secret, but the recommended way would be to rely on X.509 certificates.

### Calling [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API OAuth2Flows
After the Azure AD Application has been set up, authorized in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and granted admin consent, you're ready to make API calls.

The following sample uses the [Rest Client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client) for Visual Studio Code. Using the Rest Client makes it easy to see which HTTP calls are made both against [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and Azure Active Directory. Any HTTP client can be used to create the requests below. Or you can choose any library, like MSAL.

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

## <a name="azuread"></a>Setting up Azure Active Directory (Azure AD) based authentication ([Authorization Code Flow](/azure/active-directory/develop/v2-oauth2-auth-code-flow))

Sign in to the [Azure portal](https://portal.azure.com) to register your client application as an app and enable it to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

1. Follow the instructions in the [Integrating applications with Azure Active Directory](/azure/active-directory/develop/active-directory-integrating-applications) article. The next steps elaborate on some of the specific settings you must enable.
2. Give the application a **Name**, such as **Business Central Web Service Client**.
3. For **Application type**, choose either **Native** or **Web app/API** depending on your scenario. The code examples below assume **Native**.
4. Choose a **Redirect URI**. If it's a **Native** app, you can choose for example: **BusinessCentralWebServiceClient://auth**. If it's a **Web app/API** app, set the value to the actual URL of the web application.
5. During the registration of the app, make sure to go to **Settings**, and then under **API ACCESS**, choose **Required permissions**. Choose **Add**, and then under **Add API Access**, choose **Select an API** and search for the **Dynamics 365 Business Central** option. Choose **Dynamics 365 Business Central**, select **Delegated permissions**, and then choose the **Done** button.  
    > [!NOTE]  
    > If **Dynamics 365 Business Central** doesn't show up in search, it's because the tenant doesn't have any knowledge of Dynamics 365 Business Central. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for Dynamics 365 Business Central with a user from the directory.
6. Make a note of both the **Application ID** and the **Redirect URI**. They'll be needed later.

### Getting an access token with Authorization Code Flow

HTTP requests sent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API must include the Authorization HTTP header, and the value must be an access token.

The following examples show how to obtain such a token using PowerShell. Using C# is straightforward.

PowerShell example without prompt:
 ```powershell
    $cred = [Microsoft.IdentityModel.Clients.ActiveDirectory.UserPasswordCredential]::new($UserName, $Password)
    $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$TenantName")
    $token = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContextIntegratedAuthExtensions]::AcquireTokenAsync($ctx, "https://api.businesscentral.dynamics.com", <Application ID>, $cred).GetAwaiter().GetResult().AccessToken
 ```
 
 PowerShell example with prompt:

 ```powershell
    $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$tenantName")
    $redirectUri = New-Object -TypeName System.Uri -ArgumentList <Redirect URL>
    $platformParameters = New-Object -TypeName Microsoft.IdentityModel.Clients.ActiveDirectory.PlatformParameters -ArgumentList ([Microsoft.IdentityModel.Clients.ActiveDirectory.PromptBehavior]::Always)
    $token = $ctx.AcquireTokenAsync("https://api.businesscentral.dynamics.com", <Application ID>, $redirectUri, $platformParameters).GetAwaiter().GetResult().AccessToken
 ```

## Error Format

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
  })
]
}
```

**General unhandled errors**

All unknown and unhandled errors that aren't covered by the lists above will use the error code: **Unknown** 

## See Also

[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
