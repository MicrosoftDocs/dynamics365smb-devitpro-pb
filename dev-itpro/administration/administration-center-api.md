---
title: Business Central Administration Center API | Microsoft Docs
description: Learn about the Business Central administration center API.
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/05/2021
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

## <a name="azuread"></a>Setting up Azure Active Directory (Azure AD) based authentication

Sign in to the [Azure portal](https://portal.azure.com) to register your client application as an app and enable it to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

1. Follow the instructions in the [Integrating applications with Azure Active Directory](/azure/active-directory/develop/active-directory-integrating-applications) article. The next steps elaborate on some of the specific settings you must enable.
2. Give the application a **Name**, such as **Business Central Web Service Client**.
3. For **Application type**, choose either **Native** or **Web app/API** depending on your scenario. The code examples below assume **Native**.
4. Choose a **Redirect URI**. If it's a **Native** app, you can choose for example: **BusinessCentralWebServiceClient://auth**. If it's a **Web app/API** app, set the value to the actual URL of the web application.
5. During the registration of the app, make sure to go to **Settings**, and then under **API ACCESS**, choose **Required permissions**. Choose **Add**, and then under **Add API Access**, choose **Select an API** and search for the **Dynamics 365 Business Central** option. Choose **Dynamics 365 Business Central**, select **Delegated permissions**, and then choose the **Done** button.  
    > [!NOTE]  
    > If **Dynamics 365 Business Central** doesn't show up in search, it's because the tenant doesn't have any knowledge of Dynamics 365 Business Central. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for Dynamics 365 Business Central with a user from the directory.
6. Make a note of both the **Application ID** and the **Redirect URI**. They'll be needed later.

## Getting an access token

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
