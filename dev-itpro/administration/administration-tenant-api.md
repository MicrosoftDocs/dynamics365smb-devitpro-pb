---
title: Business Central Admin Center API | Microsoft Docs
description: Learn about the tenant administration API.
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/20/2018
---

# The Business Central Administration Center API
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API enables administrators to programmatically perform administrative tasks for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. Using the API, administrators can query and work with production and sandbox environments for the tenant, set up upgrade notifications, and view telemetry for events on the tenant. 

See (LINK TO Administration Center article) for more details on administrative capabilities. This article describes the API contracts.

## Location
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API is located at the following URL: https://api.businesscentral.dynamics.com.

## Setting up Azure Active Directory (AAD) based authentication
Sign in to the [Azure Portal](https://portal.azure.com) to register your client application as an app and enable it to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

1. Follow the instructions in the [Integrating applications with Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications) article. The next steps elaborate on some of the specific settings you must enable.
2. Choose **Native** for **Application type**.
3. During the registration of the app, make sure to go to **Settings**, and then under **API ACCESS**, choose **Required permissions**.
4. Choose **Add**, and then under **Add API Access**, choose **Select an API** and search for the **Dynamics 365** option.  
    > [!NOTE]  
    > If **Dynamics 365** does not show up in search, it's because the tenant does not have any knowledge of Dynamics 365. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)] with a user from the directory. 
5. Choose **Dynamics 365** and select **Delegated permissions**, and then choose the **Done** button.

## Getting an access token
HTTP requests sent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API must include the Authorization HTTP header, and the value must be an access token.

The following examples show how to obtain such a token using PowerShell. Using C# is straightforward.

Powershell example without prompt:
 ```powershell
    $cred = [Microsoft.IdentityModel.Clients.ActiveDirectory.UserPasswordCredential]::new($UserName, $Password)
    $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$TenantName")
    $token = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContextIntegratedAuthExtensions]::AcquireTokenAsync($ctx, "https://api.businesscentral.dynamics.com", "966e61ab-3ffb-494a-8ea9-3293da2594ce", $cred).GetAwaiter().GetResult().AccessToken
 ```
 
 Powershell example with prompt:
 ```powershell
    $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$tenantName")
    $redirectUri = New-Object -TypeName System.Uri -ArgumentList "https://api.businesscentral.dynamics.com"
    $platformParameters = New-Object -TypeName Microsoft.IdentityModel.Clients.ActiveDirectory.PlatformParameters -ArgumentList ([Microsoft.IdentityModel.Clients.ActiveDirectory.PromptBehavior]::Always)
    $token = $ctx.AcquireTokenAsync("https://api.businesscentral.dynamics.com", "966e61ab-3ffb-494a-8ea9-3293da2594ce", $redirectUri, $platformParameters).GetAwaiter().GetResult().AccessToken
 ```

## Get environments and Get environments by application family
```[200] GET /v1.1/admin/environments```

```[200] GET /v1.1/admin/applications/{applicationFamily}/environments```

**Response:**  
Returns a wrapped array of environments
```
{
  "value": 
  [
    {
      "friendlyName": string, // Display name of the environment
      "type": string, // Environment type (e.g. "Sandbox", "Production")
      "name": string, // Environment name, unique within an application type
      "countryCode": string, // Country/Region the environment is deployed in
      "applicationFamily": string,
      "aadTenantId": Guid,
      "applicationVersion": string, 
      "status": string (enum | "NotReady", "Removing", "Preparing", "Active"),
      "webClientLoginUrl": string // Url to use to log into the environment
    }
  ]
}
```

## Get environment by application family and name

```[200] GET /v1.1/admin/applications/{applicationFamily}/environments/{environmentName}```

**Response:**  
Returns a single environment if exists
```
{
  "friendlyName": string, // Display name of the environment
  "type": string, // Environment type (e.g. "Sandbox", "Production")
  "name": string, // Environment name, unique within an application type
  "countryCode": string, // Country/Region the environment is deployed in
  "applicationFamily": string,
  "aadTenantId": Guid,
  "applicationVersion": string, 
  "status": string (enum | "NotReady", "Removing", "Preparing", "Active"),
  "webClientLoginUrl": string // Url to use to log into the environment
}
```

## Delete environment
```[202] DELETE /v1.1/admin/applications/{applicationFamily}/environments/{environmentName | "sandbox" or "production"}```

## Copy environment
```[201] PUT /v1.1/admin/applications/{applicationFamily}/environments/{environmentName | "sandbox" or "production"}```

**Body**

```
{
  "copyFromEnvironmentName": "Production",
  "type": "Sandbox"
}
```

## Create environment
```[201] PUT /v1.1/admin/applications/{applicationFamily}/environments/{environmentName | "sandbox" or "production"}```

**Body**

```
{
  "type": "Sandbox"
}
```

**Response:**  
Returns newly created environment
```
  {
    "type": string, // Environment type
    "name": string, // Environment name, unique within an application type
    "applicationFamily": string,
    "aadTenantId": Guid,
    "status": string (enum | "NotReady", "Removing", "Preparing", "Active")
  }
```

### Path parameters

**- applicationFamily:** Family of the application as is.

**- environmentName:** Free field; but, currently only "sandbox" is used. Stored case sensitive, indexed case insensitive.

### Errors

```
{
  {
    "code": string, // e.g. "DestinationApplicationServiceNotFound"
    "message": string, // e.g. "A suitable destination service cannot be found"
    "target": string, // Such as a field name, where the error is occurred
    "clientError": [
      {
        "code": string,
        "message": string,
        "target": string
        "clientError": [...]
      }
    ]

    "innerError": {
      "code": string,
      "innerError": [...]
    }
  }
}
```

## Get Upgrade Settings
```[200] GET v1.1/admin/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade```

**Response:**  
Returns the environment's upgrade settings, or "null" if not exists
```
{
  "preferredStartTimeUtc": datetime, // Start of environment upgrade window
  "preferredEndTimeUtc": datetime, // End of environment upgrade window
}
```

Note: The 'date' components of the values are ignored, only the time components are used

## Put Upgrade Settings
```[200] PUT v1.1/admin/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade```

**Body**

```
{
  "preferredStartTimeUtc": datetime, // Start of environment upgrade window
  "preferredEndTimeUtc": datetime, // End of environment upgrade window
}
```

**Response:**  
Returns the updated settings
```
{
  "preferredStartTimeUtc": datetime, // Start of environment upgrade window
  "preferredEndTimeUtc": datetime, // End of environment upgrade window
}
```

Note: The 'date' components of the values are ignored, only the time components are used

## Get Environment Telemetry
```[200] GET v1.1/admin/applications/{applicationFamily}/environments/{environmentName}/telemetry?startDateUtc={start}&endDateUtc={end}&logCategory={cat}```

**Query parameters:**

**start**: datetime // The start of the telemetry entry time window to query  
**end**: datetime // The end of the telemetry entry time window to query  
**cat**:  ( All or 0 ) // Category of telemetry to query  

**Response:**  
Returns the telemetry logs and with data column headers.
```
{
  "queryColumns": [
    {
      "name": string, // Column display name
      "ordinal": int, // Index of the column in the data set
      "dataType": ( string or 0 | numeric or 1 | datetime or 2 )
      "expectations": (none or 0 | wide or 1) // Flags enum value
    }
  ],
  "queryResults": object[][] // Raw query data results 
}
```


## Get Notification Recipients
```[200] GET /v1.1/admin/settings/notification/recipients```

**Response:**  
Returns a wrapped array of recipients.

```
{
  "value": 
  [
    {
      "id": GUID, // Unique identifier of the recipient
      "email": string, // Email address of the recipient
      "name": string // Full name of the recipient
    }
  ]
}
```

## Create Notification Recipient
```[200] PUT /v1.1/admin/settings/notification/recipients```

**Body**
```
{
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

**Response:**  
Returns the newly created recipient.

```
{
  "id": GUID, // Unique identifier of the recipient
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

## Update Notification Recipient
```[200] PUT /v1.1/admin/settings/notification/recipients```

**Body**
```
{
  "id": GUID, // Unique identifier of the recipient
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

**Response:**  
Returns the updated recipient.

```
{
  "id": GUID, // Unique identifier of the recipient
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

## Delete Notification Recipient
```[200] DELETE /v1.1/admin/settings/notification/recipients/{id}```

## Get Notification Settings
```[200] GET /v1.1/admin/settings/notification```

**Response:**  
Returns the notification settings.
```
{
  "aadTenantId": GUID, // AAD Tenant ID of the caller
  "recipients": [
    {
      "id": GUID, // Unique identifier of the recipient
      "email": string, // Email address of the recipient
      "name": string // Full name of the recipient
    }
  ]
}
```

## See Also
