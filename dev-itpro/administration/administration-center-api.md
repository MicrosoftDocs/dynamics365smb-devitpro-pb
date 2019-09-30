---
title: Business Central Administration Center API | Microsoft Docs
description: Learn about the Business Central administration center API.
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/01/2019
---

# The Business Central Administration Center API
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API enables administrators to programmatically perform administrative tasks for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. Using the API, administrators can query and work with production and sandbox environments for the tenant, set up administrative notifications, and view telemetry for events on the tenant. 

See [The Business Central Administration Center](tenant-admin-center.md) for more details on administrative capabilities. This article describes the API contracts for these administrative capabilities.

## Location
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API is located at the following URL: https://api.businesscentral.dynamics.com.

## Setting up Azure Active Directory (AAD) based authentication
Sign in to the [Azure Portal](https://portal.azure.com) to register your client application as an app and enable it to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

1. Follow the instructions in the [Integrating applications with Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-integrating-applications) article. The next steps elaborate on some of the specific settings you must enable.
2. Give the application a **Name**, such as **Business Central Web Service Client**.
3. For **Application type**, choose either **Native** or **Web app/API** depending on your scenario. The code examples below assume **Native**.
4. Choose a **Redirect URI**. In the case of a **Native** app, you can choose for example: **BusinessCentralWebServiceClient://auth**. In the case of a **Web app/API** app, set the value to the actual URL of the web application.
5. During the registration of the app, make sure to go to **Settings**, and then under **API ACCESS**, choose **Required permissions**. Choose **Add**, and then under **Add API Access**, choose **Select an API** and search for the **Dynamics 365** option. Choose **Dynamics 365**, select **Delegated permissions**, and then choose the **Done** button.  
    > [!NOTE]  
    > If **Dynamics 365** does not show up in search, it's because the tenant does not have any knowledge of Dynamics 365. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for Dynamics 365 Business Central with a user from the directory.
6. Make a note of both the **Application ID** and the **Redirect URI**. They will be needed later.


## Getting an access token
HTTP requests sent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API must include the Authorization HTTP header, and the value must be an access token.

The following examples show how to obtain such a token using PowerShell. Using C# is straightforward.

Powershell example without prompt:
 ```powershell
    $cred = [Microsoft.IdentityModel.Clients.ActiveDirectory.UserPasswordCredential]::new($UserName, $Password)
    $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$TenantName")
    $token = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContextIntegratedAuthExtensions]::AcquireTokenAsync($ctx, "https://api.businesscentral.dynamics.com", <Application ID>, $cred).GetAwaiter().GetResult().AccessToken
 ```
 
 Powershell example with prompt:
 ```powershell
    $ctx = [Microsoft.IdentityModel.Clients.ActiveDirectory.AuthenticationContext]::new("https://login.windows.net/$tenantName")
    $redirectUri = New-Object -TypeName System.Uri -ArgumentList <Redirect URL>
    $platformParameters = New-Object -TypeName Microsoft.IdentityModel.Clients.ActiveDirectory.PlatformParameters -ArgumentList ([Microsoft.IdentityModel.Clients.ActiveDirectory.PromptBehavior]::Always)
    $token = $ctx.AcquireTokenAsync("https://api.businesscentral.dynamics.com", <Application ID>, $redirectUri, $platformParameters).GetAwaiter().GetResult().AccessToken
 ```

## Environments
Environments are the instances of the application that have been set up for the tenant. An instance can be of either a production type or a sandbox type. Currently, there can be one production environment and up to three sandbox environments per tenant. The environment APIs can be used to get information about the environments currently set up for the tenant, create a new sandbox environment using sample data or as a copy of the production environment, and delete the sandbox environment.

### Get environments and Get environments by application family
Returns a list of all the environments for the tenant. 

```[200] GET /v1.2/admin/environments```

Returns a list of the environments for the specified application family.

```[200] GET /v1.2/admin/applications/{applicationFamily}/environments```

**Response:**  
Returns a wrapped array of environments.
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

### Get environment by application family and name
Returns the properties for the provided environment name if it exists.

```[200] GET /v1.2/admin/applications/{applicationFamily}/environments/{environmentName}```

**Response:**  
Returns a single environment if exists.
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

### Create environment
Creates a new sandbox environment with sample data.

```[201] PUT /v1.2/admin/applications/{applicationFamily}/environments/{environmentName | "Sandbox" or "Production"}```

or

```[201] PUT /v1.2/admin/applications/{applicationFamily}/environments/{environmentName}/{applicationVersion}/{ringName | "PROD" or "PREVIEW"}```
  * See the section below about Available Versions for information about versions currently supported.

**Body**

```
{
  "type": "Sandbox"
}
```

**Response:**  
Returns newly created environment.
```
  {
    "type": string, // Environment type
    "name": string, // Environment name, unique within an application type
    "applicationFamily": string,
    "aadTenantId": Guid,
    "status": string (enum | "NotReady", "Removing", "Preparing", "Active")
  }
```

#### Path parameters

**- applicationFamily:** Family of the application as is.

**- environmentName:** Free field; but, currently only "sandbox" is used. Stored case sensitive, indexed case insensitive.

#### Errors

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
### Copy environment
Creates a new sandbox environment with a copy of the production environment's data.

```[201] PUT /v1.2/admin/applications/{applicationFamily}/environments/{environmentName}```

**Body**

```
{
  "copyFromEnvironmentName": "Production",
  "type": "Sandbox"
}
```

### Delete environment
Deletes the specified environment. Warning: A production environment should not be deleted.

```[202] DELETE /v1.2/admin/applications/{applicationFamily}/environments/{environmentName}```

## Available Versions
Get information about the currently supported versions.

### Versions and Corresponding Rings

```[200] GET /v1.2/admin/applications/{applicationFamily}/rings```

**Response:**  

```
{
  "value": [
    {
      "applicationVersion": {
        "major": int,
        "minor": int,
        "build": int,
        "revision": int
      },
      "ringName": string,
      "ringFriendlyName": string
    }
  ]
}
```

## Updates
The update settings allow you to specify an update window for the time of day an update can be performed on the tenant environment. The update window must be a minimum of six hours. (e.g. 1:00 - 7:00)

### Get Update Settings
Returns the update settings for the environment. The update settings currently available are the start and end times for the update window.

```[200] GET v1.2/admin/applications/{applicationFamily}/environments/{environmentName}/settings/update```

**Response:**  
Returns the environment's update settings, or "null" if not exists
```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

> [!NOTE]  
> The `date` components of the values are ignored, only the time components are used.

### Put Update Settings
Set the update window start and end times.

```[200] PUT v1.2/admin/applications/{applicationFamily}/environments/{environmentName}/settings/update```

**Body**

```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

**Response:**  
Returns the updated settings
```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

> [!NOTE]  
> The `date` components of the values are ignored, only the time components are used.

## Telemetry
Telemetry includes the top-level AL events and any returned errors logged from the service. These events can provide necessary information and errors that can be used to troubleshoot issues happening in the tenant's environment. 

### Get Environment Telemetry
Returns the telemetry information for the provided environment and filters. It is recommended that you provide start and end time parameters in order to return a managable data set.

```[200] GET v1.2/admin/applications/{applicationFamily}/environments/{environmentName}/telemetry?startDateUtc={start}&endDateUtc={end}&logCategory={cat}```

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

## Notifications
Notifications are sent to the recipient email addresses set up for the tenant. For example, notifications are sent for update availability, successful updates, update failures, and extension validations.   

### Get Notification Recipients
Returns a list of notification recipients.

```[200] GET /v1.2/admin/settings/notification/recipients```

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

### Create Notification Recipient
Create a new notification recipient.

```[200] PUT /v1.2/admin/settings/notification/recipients```

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

### Update Notification Recipient
Modify an existing notification recipient.

```[200] PUT /v1.2/admin/settings/notification/recipients```

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

### Delete Notification Recipient
Deletes an existing notification recipient.

```[200] DELETE /v1.2/admin/settings/notification/recipients/{id}```

### Get Notification Settings
Returns the properties of the specified notification recipient.

```[200] GET /v1.2/admin/settings/notification```

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

## Application Access Management
It is possible for a **Delegated Tenant Admin** to manage access to application families available in the service. The application family is [!INCLUDE[prodshort](../developer/includes/prodshort.md)] or other independent software vendor (ISV) applications that may be provisioned through the service. 

You can get the list of applications that are available to the tenant. From this list you can determine, by setting the access property, for which applications an environment may be provisioned on the tenant.

### Get List Of Manageable Applications
Returns a list of manageable applications.

```[200] GET /v1.2/admin/manageableapplications```

**Response:**  
Returns a wrapped array of applications.

```
{
  "value": [
    {
      "applicationFamily":  string,
      "access":  boolean
    }
  ]
}
```

### Control the access to Applications
Pass the application family name in the URL and a boolean in the body. 
- True - enables the access.
- False - disables the access.

```[200] PUT /v1.2/admin/manageableapplications/{applicationFamily}```

**Body**
```
{
  boolean  // Desired access state
}
```

> [!NOTE]  
> It is only possible to disable the access to applications for the AAD tenant if it does not have **application tenant** yet.

### Get List Of Accessible Applications
**Tenant Admin** can obtain a list of accessible applications.

```[200] GET /v1.2/admin/accessibleapplications```

**Response:**  
Returns a wrapped array of applications.

```
{
  "value": [
    {
      "applicationFamily":  string,
      "access":  boolean
    }
  ]
}
```

## Reschedule Updates
Some environment updates are allowed to be rescheduled.

### Get Scheduled Update
Get information about updates that have already been scheduled for a specific environment.

```[200] GET /v1.2/admin/applications/{applicationFamily}/environments/{environmentName}/update```

**Response:**  
Returns information about the update job for that environment.

```
{
  "jobId": int,
  "jobEntryId": int,
  "sourceVersion": string,
  "targetVersion": string,
  "canTenantSelectDate": boolean,
  "didTenantSelectDate": boolean,
  "earliestSelectableUpgradeDate": datetime,
  "latestSelectableUpgradeDate": datetime,
  "upgadeDate": datetime,
  "updateStatus": string (enum | "Scheduled" or "Running"),
  "ignoreUpgradeWindow": boolean,
  "isActive": boolean
}
```

### Reschedule Update
Reschedule an update, if able.

```[200] PUT /v1.2/admin/applications/{applicationFamily}/update```

**Body**

```
{
  "jobId": int,
  "jobEntryId": int,
  "runOn": datetime,
  "ignoreUpgradeWindow": boolean
}
```

> [!NOTE]  
> All datetime values are in UTC

## See Also
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)    
