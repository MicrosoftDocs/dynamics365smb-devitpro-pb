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
ms.date: 04/01/2020
---

# The Business Central Administration Center API

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API enables administrators to programmatically do administrative tasks for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. With the API, administrators can, for example:

- Query and work with production and sandbox environments for the tenant.
- Set up administrative notifications.
- View telemetry for events on the tenant.

For more information about administrative capabilities, see [The Business Central Administration Center](tenant-admin-center.md). This article describes the API contracts for these administrative capabilities.

## Location
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API is located at the following URL: https://api.businesscentral.dynamics.com.

## Setting up Azure Active Directory (AAD) based authentication
Sign in to the [Azure portal](https://portal.azure.com) to register your client application as an app and enable it to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

1. Follow the instructions in the [Integrating applications with Azure Active Directory](/azure/active-directory/develop/active-directory-integrating-applications) article. The next steps elaborate on some of the specific settings you must enable.
2. Give the application a **Name**, such as **Business Central Web Service Client**.
3. For **Application type**, choose either **Native** or **Web app/API** depending on your scenario. The code examples below assume **Native**.
4. Choose a **Redirect URI**. If it's a **Native** app, you can choose for example: **BusinessCentralWebServiceClient://auth**. If it's a **Web app/API** app, set the value to the actual URL of the web application.
5. During the registration of the app, make sure to go to **Settings**, and then under **API ACCESS**, choose **Required permissions**. Choose **Add**, and then under **Add API Access**, choose **Select an API** and search for the **Dynamics 365** option. Choose **Dynamics 365**, select **Delegated permissions**, and then choose the **Done** button.  
    > [!NOTE]  
    > If **Dynamics 365** doesn't show up in search, it's because the tenant doesn't have any knowledge of Dynamics 365. To make it visible, an easy way is to register for a [free trial](https://signup.microsoft.com/signup?sku=6a4a1628-9b9a-424d-bed5-4118f0ede3fd&ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2FSandbox%2F%3FredirectedFromSignup%3D1) for Dynamics 365 Business Central with a user from the directory.
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

## Environments

Environments are the instances of the application that have been set up for the tenant. An instance can be of either a production type or a sandbox type. Currently, it's only possible to create three production environments and three sandbox environments per tenant. The environment APIs can be used to:

- Get information about the environments currently set up for the tenant
- Create a new environment using sample data or as a sandbox copy of the production environment
- Delete an environment.

> [!NOTE]  
> Special care should be taken when deleting a production environment as the data will not be recoverable

### Get environments and Get environments by application family

Returns a list of all the environments for the tenant. 

```
GET /admin/v2.1/applications/environments[?skipDbSize={bool}]
```

Returns a list of the environments for the specified application family.

```
GET /admin/v2.1/applications/{applicationFamily}/environments[?skipDbSize={bool}]
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral)

`skipDbSize` - `true` does not return database size in response; `false` does.

#### Response

Returns a wrapped array of environments.
```
{
  "value": 
  [
    {
      "friendlyName": string, // Display name of the environment
      "type": string, // Environment type (for example, "Sandbox", "Production")
      "name": string, // Environment name, unique within an application family
      "countryCode": string, // Country/Region that the environment is deployed in
      "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
      "aadTenantId": Guid, // Id of the Azure Active Directory tenant that owns the environment 
      "applicationVersion": string, // The version of the environment's application
      "status": string, // (enum | "NotReady", "Removing", "Preparing", "Active")
      "webClientLoginUrl": string, // Url to use to log into the environment,
      "webServiceUrl": string, // Url to use to access the environment's service API
      "locationName": string, // The Azure location where the environment's data is stored
      "platformVersion": string, // The version of the environment's Business Central platform
      "databaseSize": { // Contains info about the size of the environment's database or null if unknown
          "value": double, // The size of the database quantified by the provided 'unit' property
          "unit": string, // The sizing unit for the 'value' property (Currently always 'Bytes')
      },
      "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
      "appInsightsKey": string // The environment's key for Azure Application Insights
    }
  ]
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found


### Get environment by application family and name
Returns the properties for the provided environment name if it exists.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}[?skipDbSize={bool}]
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

`skipDbSize` - `true` does not return database size in response; `false` does.

#### Response
Returns a single environment if exists.
```
{
  "friendlyName": string, // Display name of the environment
  "type": string, // Environment type (for example, "Sandbox", "Production")
  "name": string, // Environment name, unique within an application family
  "countryCode": string, // Country/Region that the environment is deployed in
  "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
  "aadTenantId": Guid, // Id of the Azure Active Directory tenant that owns the environment 
  "applicationVersion": string, // The version of the environment's application
  "status": string, // (enum | "NotReady", "Removing", "Preparing", "Active")
  "webClientLoginUrl": string, // Url to use to log into the environment,
  "webServiceUrl": string, // Url to use to access the environment's service API
  "locationName": string, // The Azure location where the environment's data is stored
  "platformVersion": string, // The version of the environment's Business Central platform
  "databaseSize": { // Contains info about the size of the environment's database or null if unknown
      "value": double, // The size of the database quantified by the provided 'unit' property
      "unit": string, // The sizing unit for the 'value' property (Currently always 'Bytes')
  },
  "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
  "appInsightsKey": string // The environment's key for Azure Application Insights
}
```

#### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found
   
   - `target: {applicationFamily}/{environmentName}`


### Create new environment
Creates a new environment with sample data.

```
Content-Type: application/json
PUT /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}
```

#### Route Parameters

`applicationFamily` - Family to create the new environment within. (for example, "BusinessCentral")

`environmentName` - The name of the new environment. See the section below about valid environment names to see what values are allowed.

#### Body
```
{
  "environmentType": string, // The type of environment to create (enum | "Production", "Sandbox")
  "countryCode": string, // The country to create the environment within 
  ("ringName": string), // Optional - The logical ring group to create the environment within. Currently only Sandbox type environments may be created in a 'Preview' ring. If not provided then the production ring will be used.
  ("applicationVersion": Version), // Optional - The version of the application the environment should be created on. If not provided then the latest available version will be used.
}
```

> [!NOTE]  
> The values for the `countryCode`, `ringName`, and `applicationVersion` properties should be derived from the API endpoints described in the Available Applications section below.

#### Response
Returns newly created environment.
```
{
  "friendlyName": string, // Display name of the environment
  "type": string, // Environment type (for example, "Sandbox", "Production")
  "name": string, // Environment name, unique within an application family
  "countryCode": string, // Country/Region that the environment is deployed in
  "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
  "aadTenantId": Guid, // Id of the Azure Active Directory tenant that owns the environment 
  "applicationVersion": string, // The version of the environment's application
  "status": string, // (enum | "NotReady", "Removing", "Preparing", "Active")
  "webClientLoginUrl": string, // Url to use to log into the environment,
  "webServiceUrl": string, // Url to use to access the environment's service API
  "locationName": string, // The Azure location where the environment's data is stored
  "platformVersion": string, // The version of the environment's Business Central platform
  "databaseSize": { // Contains info about the size of the environment's database or null if unknown
      "value": double, // The size of the database quantified by the provided 'unit' property
      "unit": string, // The sizing unit for the 'value' property (Currently always 'Bytes')
  },
  "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
  "appInsightsKey": string // The environment's key for Azure Application Insights
}
```

#### Expected Error Codes

`
DoesNotExist` - the provided value for the application family wasn't found

`destinationApplicationServiceNotFound` -- a suitable destination service couldn't be found to put the environment. Occurs if missing or if the tenant doesn't have access to the target application.

`invalidInput` - the targeted property in invalid in some way

   - target: {countryCode} - the country code property can't be null or whitespace
    
   - target: {environmentName} - the environment name property can't be null or whitespace
    
   - target: {environmentType} - the environment type property can't be null or whitespace, and must be a valid value (Production or Sandbox)        
    
   - target: {ringName} - attempt to create a production environment on a non-production ring
    
   - target: {applicationVersion} - the version property must be a valid version string (major.minor.build.revision)

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - the targeted property doesn't exist

   - target: {ringName} - a ring with the provided name wasn't found

`resourceExists` an environment with the same name already exists

`environmentNameNotValid` - the environment name can't be a reserved value, must be less than 30 characters, must start with an alpha character and consist only of alpha, numberical, underscore (_), or dash (-) characters

`cannotCreateNamedEnvironment` - environments with names other than 'Production' or 'Sandbox' aren't supported on the targeted version.

`tenantAlreadyProvisioning` - can't create a new environment because another environment is currently in the process of being created.

`applicationFamilyNotAccessible` - the calling tenant doesn't have access to the targeted application family and country code

`environmentReservationFailed` -- another environment within the same application family already has this name

`maximumNumberOfEnvironmentsAllowedReached` - the limit on the number of allowed environments of the provided type has been reached 

### Get Database Size

Gets size of a database for a specific environment.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/dbsize
```

#### Response
```
{
    value: double,
    unit: string
}
```

### Copy environment
Creates a new environment with a copy of another environment's data.

```
Content-Type: application/json
POST /admin/v2.1/applications/{applicationFamily}/environments/{sourceEnvironmentName}
```

#### Route Parameters

`applicationFamily` - Family of the source environment's application. (for example, "BusinessCentral")

`sourceEnvironmentName` - Name of the environment to copy from.

#### Body

```
{
  "environmentName": string, // The name of the new environment.
  "type": string // The type of environment to create. Currently only the value "Sandbox" is supported.  
}
```

#### Response
Returns newly copied environment.
```
{
  "friendlyName": string, // Display name of the environment
  "type": string, // Environment type (for example, "Sandbox", "Production")
  "name": string, // Environment name, unique within an application family
  "countryCode": string, // Country/Region that the environment is deployed in
  "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
  "aadTenantId": Guid, // Id of the Azure Active Directory tenant that owns the environment 
  "applicationVersion": string, // The version of the environment's application
  "status": string, // (enum | "NotReady", "Removing", "Preparing", "Active")
  "webClientLoginUrl": string, // Url to use to log into the environment,
  "webServiceUrl": string, // Url to use to access the environment's service API
  "locationName": string, // The Azure location where the environment's data is stored
  "platformVersion": string, // The version of the environment's Business Central platform
  "databaseSize": { // Contains info about the size of the environment's database or null if unknown
      "value": double, // The size of the database quantified by the provided 'unit' property
      "unit": string, // The sizing unit for the 'value' property (Currently always 'Bytes')
  },
  "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
  "appInsightsKey": string // The environment's key for Azure Application Insights
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`destinationApplicationServiceNotFound` -- a suitable destination service couldn't be found to put the environment. Occurs if missing or if tenant doesn't have access rights to the target application.

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{sourceEnvironmentName}```

`invalidInput` - the targeted property in invalid in some way

   - target: {environmentName} - the environment name property can't be null or whitespace```

   - target: {type} - the type property can't be null or whitespace, and must be a valid value (Currently only Sandbox)```

`requestBodyRequired` - the request body must be provided

`resourceExists` an environment with the same name already exists

`environmentNameNotValid` - the environment name can't be a reserved value, must be fewer than 30 characters, must start with an alpha character and consist only of alpha, numerical, underscore (_), or dash (-) characters

`cannotCreateNamedEnvironment` - environments with names other than 'Production' or 'Sandbox' aren't supported on the targeted version.

`tenantAlreadyProvisioning` - can't create a copy of an environment because another environment is currently in the process of being created.

`conflictingDeveloperExtensions` - The source environment contains 'uploaded' extensions that are already published to the destination service as 'developer' extensions. This condition will cause conflicts. 

  ```
  extensionData: 
  {
      "conflictingExtensions": [{
          "appId": guid, // The id of the conflicting extension
          "name": string, // The name of the conflicting extension
          "publisher": string, // The name of the person or group who published the conflicting extension
          "version": string, // The version of the conflicting extension
          "developerEnvironmentName": string // The name of the environment if the conflicting extension exists in another environment owned by the tenant requesting the copy operation
      }],
      "sameAadTenant": bool, // Indicates if the conflicts occur on an environment that is owned by the same tenant that is requesting the copy operation
  } 
  ```
  
`environmentReservationFailed` -- another environment within the same application family already has the same name

`maximumNumberOfEnvironmentsAllowedReached` - the limit on the number of allowed environments of the provided type has been reached 


### Delete environment
Deletes the specified environment. Warning: A production environment shouldn't be deleted.

```
DELETE /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}
```

#### Route Parameters

`applicationFamily` - Family of the environment's application. (for example "BusinessCentral")

`environmentName` - Name of the environment to delete.


> [!NOTE]  
> The Create, Copy, and Delete operations are asynchronous. The response objects are returned before the underlying operation has completed.
> The final results of the operation are reflected in the 'status' field of the environment that the operations affect.
> In practice this means that polling of the 'Get Environments' endpoints must be done to determine if the given operation was successful.

#### Expected Error Codes

`invalidStatusCannotDeleteTenant` - can't delete the environment in its current state

`tenantDeletionInProgress` - environment is already in the process of being deleted

`ambiguousRequest` - multiple environments with the same name were found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


## Available Applications
Get information about the currently available application families, countries, rings, and versions that environments can be created on.
The API endpoints here should be utilized to determine what values can be used for environment creation or copying 

### Applications and corresponding Countries with Rings
Get a list of the currently available application families, the available countries within those families, and the available rings within the countries.

```
GET /admin/v2.1/applications/
```

#### Response
```
{
  "value": [
    {
      "applicationFamily": string, // The name of the family for a given Business Central offered application. (Typically this will just be "BusinessCentral")
      "countriesringDetails": {
          "countryCode": string, // Code for a country that the application family supports creating environments within.
          "rings": [{ // A list of logical ring groupings where environments can be created
            "name": string, // The API name of the ring (for example, PROD, PREVIEW)
            "productionRing": bool, // Indicates that the ring is a production ring. Currently there should only be one production ring within a country.
            "friendlyName": string, // The display friendly name of the ring
          }]
      }
    }
  ]
}
```

### Ring details with Versions
Gets a list of the currently available Versions that an environment can be created on within a logical ring group.

```
GET /admin/v2.1/applications/{applicationFamily}/Countries/{countryCode}/Rings/{ringName}
```

#### Route Parameters

`applicationFamily` - Family of the ring's application. (for example, "BusinessCentral")

`countryCode` - Code for the ring's country.

`ringName` - Name of the ring to inspect.


#### Response
```
{
  "value": [ // A list of the available application versions within the ring that environments can be created on 
    "<version string>",
    "<version string>",
    ...
  ]
}
```

## Environment Settings
Allows you to manage environment specific settings such as the environment's AppInsights key or the update window. That is, the timeframe is considered 'ok' for updates (and thus downtime) to occur.

### Get Update Settings
Returns the update settings for the environment.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response
Returns the environment's update settings, or "null" if none exist
```
{
  "preferredStartTimeUtc": datetime, // Specifies the start of an environment's update window. 
  "preferredEndTimeUtc": datetime, // Specifies the end of environment's update window.
}
```

> [!NOTE]  
> The `date` components of the values are ignored, only the time components are used.

#### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


### Put Update Settings
Sets the update window start and end times.

```
Content-Type: application/json
PUT /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body

```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

#### Response
Returns the updated settings
```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

> [!NOTE]  
> The `date` components of the values are ignored, only the time components are used.

#### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

**- invalidRange:** - the targeted logical range is invalid in some way

   - target: "Preferred Upgrade Window" - the specified window is too small

`requestBodyRequired` - the request body must be provided


### Put AppInsights key
Sets the key an environment uses for Azure AppInsights.

> [!IMPORTANT]
> This process requires a restart to the environment, which is triggered automatically when you call this API. Plan to do this during non-working hours to avoid disruptions.

```
Content-Type: application/json
POST /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/settings/appinsightskey
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body

```
{
  "key": string, // The Application Insights key for the environment
}
```

#### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`cannotSetAppInsightsKey` - the targeted environment's status isn't 'Active'
    

## Telemetry
Telemetry includes the top-level AL events and any returned errors logged from the service. These events can provide necessary information and errors that can be used to troubleshoot issues happening in the tenant's environment. 

### Get Environment Telemetry
Returns the telemetry information for the provided environment and filters. it's recommended that you provide start and end time parameters to return a manageable data set.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/telemetry?startDateUtc={start}&endDateUtc={end}&logCategory={cat}
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Query parameters

`start`: datetime // The start of the telemetry entry time window to query  
`end`: datetime // The end of the telemetry entry time window to query  
`cat`:  (All or 0) // Category of telemetry to query  

#### Response
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

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`invalidInput` - the targeted property in invalid in some way

   - target: {logCategory} - the provided log category isn't a valid value


## Notifications
Notifications are sent to the recipient email addresses set up for the tenant. For example, notifications are sent for update availability, successful updates, update failures, and extension validations.   

### Get Notification Recipients
Returns a list of notification recipients.

```
GET /admin/v2.1/settings/notification/recipients
```

#### Response
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

#### Expected Error Codes

`tenantNotFound` - the calling tenant information couldn't be found


### Create Notification Recipient
Create a new notification recipient.

```
Content-Type: application/json
PUT /admin/v2.1/settings/notification/recipients
```

#### Body
```
{
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

#### Response
Returns the newly created recipient.

```
{
  "id": GUID, // Unique identifier of the recipient
  "email": string, // Email address of the recipient
  "name": string // Full name of the recipient
}
```

#### Expected Error Codes

`invalidInput` - the targeted property in invalid in some way

   - target: {name} - the name property can't be null or whitespace
        
   - target: {email} - the email property can't be null or whitespace

`requestBodyRequired` - the request body must be provided

`tenantNotFound` - the calling tenant information couldn't be found


### Delete Notification Recipient
Deletes an existing notification recipient.

```
DELETE /admin/v2.1/settings/notification/recipients/{id}
```

#### Route Parameters

`id` - The unique identifier of the notification recipient to delete.

#### Expected Error Codes

`invalidInput` - the targeted property in invalid in some way

   - target: {id} - provided id can't be the empty guid

`tenantNotFound` - the calling tenant information couldn't be found


### Get Notification Settings
Returns the full set of notification settings including the list of recipients.

```
GET /admin/v2.1/settings/notification
```

#### Response
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

#### Expected Error Codes

`tenantNotFound` - the calling tenant information couldn't be found

## Application Access Management
It's possible for a **Delegated Tenant Admin** to manage access to application families available in the service. The application family is [!INCLUDE[prodshort](../developer/includes/prodshort.md)] or other independent software vendor (ISV) applications that may be provisioned through the service. 

You can get the list of applications that are available to the tenant. From this list you can determine, by setting the access property, for which applications an environment may be provisioned on the tenant.

### Get List Of Manageable Applications
Returns a list of manageable applications by family and country code.

```
GET /admin/v2.1/manageableapplications
```

#### Response
Returns a wrapped array of applications.

```
{
  "value": [
    {
      "applicationFamily":  string, // The name of the family for a given Business Central offered application. (Typically this will just be "BusinessCentral") 
      "access":  boolean, // Indicates if the tenant has access to the application family/country code combination
      "countryCode": string, // The country code of the application.
    }
  ]
}
```

### Control the access to Applications
Pass the application family name in the URL and a boolean in the body. 
- True - enables the access.
- False - disables the access.

```
Content-Type: application/json
PUT /admin/v2.1/manageableapplications/{applicationFamily}/countries/{countryCode}
```

#### Route Parameters

`applicationFamily` - The name of the family for a given Business Central offered application. (Typically this value will just be "BusinessCentral")

`countryCode` - Country code for the targeted application.

#### Body
```
{
  <boolean> // Desired access state
}
```

> [!NOTE]  
> It's only possible to disable the access to applications for the AAD tenant if it has first created an environment somewhere.

#### Expected Error Codes

`invalidInput` - the targeted property in invalid in some way

   - target: {targeted tenant's AAD Id} - attempt to remove access to an application but the targeted tenant already has an environment in that application

`resourceDoesNotExist` - couldn't find the targeted application


## Reschedule Updates
Allows for the management of scheduled updates such as rescheduling the update to a run on or after a specific date within a provided range.

### Get Scheduled Update
Get information about updates that have already been scheduled for a specific environment.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response
Returns information about the scheduled update for that environment.

```
{
  "environmentName": string, // The name of the targeted environment.
  "applicationFamily": string, // Family of the environment. (for example, "BusinessCentral")
  "sourceVersion": string, // The current version of the environment's application.
  "targetVersion": string, // The version of the application that the environment will update to.
  "canTenantSelectDate": boolean, // Indicates if a new update date can be selected.
  "didTenantSelectDate": boolean, // Indicates if the tenant has selected the current date for the update.
  "earliestSelectableUpgradeDate": datetime, // Specifies the earliest date that can be chosen for the update.
  "latestSelectableUpgradeDate": datetime, // Specifies the latest date that can be chosen for the update.
  "upgadeDate": datetime, // The currently selected scheduled date of the update.
  "updateStatus": string, // The current status of the environment's updatee. (enum | "Scheduled" or "Running")
  "ignoreUpgradeWindow": boolean, // Indicates if the environment's update window will be ignored
  "isActive": boolean, // Indicates if the update is activated and is scheduled to occur.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


### Reschedule Update
Reschedule an update, if able.

```
Content-Type: application/json
PUT /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body

```
{
  "runOn": datetime, // Sets the date that the upgrade should be run on.
  "ignoreUpgradeWindow": boolean // Specifies if the upgrade window for the environment should be respected.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - no upgrade is currently scheduled for the targeted environment

` entityValidationFailed` - some unhandled error occurred in the validation of the request

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


## Support Settings

Allows for the management of support settings, such as changing the contact, for a specific environment

### Get Support Contact
Get information about the support contact for a specified environment.

```
GET /admin/v2.1/support/applications/{applicationFamily}/environments/{environmentName}/supportcontact
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response
Returns information about the support contact for that environment.

```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string, // A freeform url for additional support contact information such as a support website.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`resourceDoesNotExist` - couldn't find the necessary information to communicate with the targeted environment's API

` businessCentralCommunicationException` - an unhandled error occurred when communicating with the targeted environment's API


### Set Support Contact
Sets the support contact information for a specified environment

```
Content-Type: application/json
PUT /admin/v2.1/support/applications/{applicationFamily}/environments/{environmentName}/supportcontact
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body 
```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string, // A freeform url for additional support contact information such as a support website.
}
```

#### Response
Returns the newly updated support contact information.
```
{
  "name": string, // The name of the support contact.
  "email": string, // The email address of the support contact.
  "url": string // A freeform url for additional support contact information such as a support website.
}
```

#### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - couldn't find the necessary information to communicate with the targeted environment's API

` businessCentralCommunicationException` - an unhandled error occurred when communicating with the targeted environment's API


## Environment Outage Reporting
Enables the ability to report that an environment isn't accessible and may require attention

### Get Outage Types
Gets the list of supported categories of outages

```
GET /admin/v2.1/support/outageTypes
```

#### Response
Returns a list with information about the supported outage types for reporting 
```
{
  "value": [
    {
      "outageType": string, // The identifier of the outage type. 
      "name": string, // A displayable name for the outage type.
      "description": string, // A displayable description for the outage type.
    }]
}
```

#### Expected Error Codes

`cannotGetOutages` - an unhandled error occurred when trying to acquire the outage types

`tenantNotFound` - the calling tenant information couldn't be found


### Get Outage Questions
Gets the list of metadata about questions that need to be answered when reporting an environment outage

```
GET /admin/v2.1/support/outageTypes/{outageType}/outageQuestions
```

#### Response
Returns the list of question metadata for the provided outage type
```
{
  "value": [
    {
      "sequence": int, // The order in which the question should be answered
      "parentId": int, // The identifier of a toggle question whose value indicates if this question should be shown. that is if the parent value is 'true' then this question should also be answered
      "id": string, // The unique identifier of the question 
      "defaultValue": string, // The default value of the question if it has no value
      "questionType": string, // (enum | "None", "Toggle", "TextField", "DateTime")
      "questionText": string, // The question's text to display 
      "required": bool, // Indicates if the question must have a value
      "onText": string, // Toggle type only - display text for when the question is toggled to 'true'
      "offText": string, // Toggle type only - display text for when the question is toggled to 'false'
      "multiline": bool // Indicates if the value is intended to contain multi-line text
    }]
}   
```

#### Expected Error Codes

`cannotGetOutageQuestions` - an unhandled error occurred when trying to acquire the outage types

`tenantNotFound` - the calling tenant information couldn't be found


### Get Reported Outages
Gets the list of outages that have been previously reported 

```
GET /admin/v2.1/support/reportedoutages
```

#### Response
Returns the list of outages reported across all environments for the calling tenant
```
{
  "value": [
    {
      "TenantId": string, // The id of the tenant who reported the outage.
      "EnvironmentId": string, // The id of the environment that was reported to have been unavailable.
      "CreatedDate": dateTime, // The date that the report was created.
      "State": string, // The current state of the outage report.
      "MsaasTicketId": string, // The identifier of the MSaaS ticket that is associated with the outage report.
      "IcmTicketId": string, // The identifier of the IcM ticket that is associated with the outage report.
      "AppVersion": string, // The version of the environment's application at the time of the outage report.
      "PlatformVersion": string, // The version of the environment's platform at the time of the outage report.
      "OutageType": string, // The category of the reported outage.
    }]
}
```

#### Expected Error Codes

`cannotGetReportedOutages` - an unhandled error occurred when trying to acquire the reported outages

`tenantNotFound` - the calling tenant information couldn't be found


### Report Outage
Initiates an outage report indicating that an environment isn't accessible

```
Content-Type: application/json
POST /admin/v2.1/support/applications/{applicationFamily}/environments/{environmentName}/reportoutage
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body
```
{
  "outageType": string, // The category of the outage being reported.
  "outageQuestionAnswers": [{ // The collection of answers to the questions associated with the outage type.
    "id": string, // The identifier of the question being answered.
    "answer": string // The answered value of the question.
  }],
  ("contact": string), // (Optional) - The name of the person whose to contact with updates on the outage report
  ("email": string), // (Optional) - An email to contact with updates on the outage report
  ("phone": string), // (Optional) - A phone number to contact with updates on the outage report
  ("appVersion": string), // (Optional) - If known, the version of the targeted environment's application 
  ("platformVersion": string) //(Optional) - If known, the version of the targeted environment's platform
}
```

#### Response
Returns information about the created outage report
```
{
    "creationStatus": string, // The status of the request to create an outage report. (enum | "Unknown", "Created", "UpdatedExisting", "Error")
    "msaasCaseNumber": string, // The identifier of the MSaaS ticket that is associated with the outage report.
}
```

#### Expected Error Codes

`requestBodyRequired` - the request body must be provided

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`failedToReportOutage` - an unhandled error occurred when trying to report the outage


## Environment Database Export
Allows for the export of an environment's Azure database. Databases are exported to an Azure Storage account provided by you. There is a limit to the number of exports that can be done within a month as shown by the 'metrics' endpoint below.

### Get Export Metrics
Gets information about the number of exports allowed per month and the amount remaining.

```
GET /admin/v2.1/exports/applications/{applicationFamily}/environments/{environmentName}/metrics
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Response
Returns the metrics around the current month's database exports.

```
{
  "exportsPerMonth": int, // The total number of allowed exports of the targeted environment every month.
  "exportsRemainingThisMonth": int, // The number of exports remaining for the targeted environment that can be performed this month.
}
```

#### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


### Start Environment Database Export
Starts the export of an environment's database to a provided Azure storage account

```
Content-Type: application/json
POST /admin/v2.1/exports/applications/{applicationFamily}/environments/{environmentName}
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

#### Body 
```
{
  "storageAccountSasUri": string, // An Azure SAS uri pointing at the Azure storage account where the database will be exported to. The uri must have (Read | Write | Create | Delete) permissions
  "container": string, // The name of the container that will be created by the process to store the exported database.
  "blob": string, // The name of the blob within the container that the database will be exported to. Databases are exported in the .bacpac format so a filename ending with the '.bacpac' suffix is typical.
}
```

#### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`exportFailed` - the export failed because the target environment's version was too old, it wasn't a production environment, the requesting tenant is a trial, the calling user doesn't have permissions to export, or the quota of allowed exports has been used up 


### Get Export History
Gets information about the exports that have been done within a provided time frame, for which environment, and by whom.

```
POST /admin/v2.1/exports/history?start={startTime}&end={endTime}
```

#### Query parameters

`startTime` - datetime // The start of the export history entry time window to query  
`endTime` - datetime // The end of the  export history entry time window to query  

#### Response

Returns a detailed list of the database exports that occurred within the provided timeframe of the `start` and `end` query parameters

```
{
  "applicationType": string, // Family of the environment. (for example, "BusinessCentral")
  "applicationVersion": string, // The version of the environment's application at the time of the export.
  "blob": string, // The name of the blob that the environment's database was exported to.
  "container": string, // The name of the Azure storage account container that the environment's database was exported within.
  "country": string, // The country code of the environment.
  "environmentName": string, // The name of the environment that was exported.
  "storageAccount": string, // The name of the Azure storage account that the environent's database was exported to.
  "time": dateTime, // The time that the environment's database was exported.
  "user": string // The user who initiated the export process.
}
```

> [!NOTE]  
> All datetime values are in UTC


### Case-Invariant blocked environment names

##### All environment types

   - invoicing
   - api
   - error
   - navwinclient
   - clickonce
   - tablet
   - phone
   - reset
   - getapp
   - signout
   - addremotehost
   - deployment
   - health
   - home
   - notsupported
   - officeaddin
   - remotesignin
   - shell service
   - admin
        
##### Production Environment Types
   - sandbox
            
##### Sandbox Environment Types
   - production

## App Management

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Manage the apps that are installed on the environment.

### Get Installed Apps 

Get information about apps that are installed on the environment.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/apps
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment.

#### Response
Returns information about the apps installed on the environment.

```
{
    "value":
    [
        { 
            "id": Guid, // Id of the installed app 
            "name": string, // Name of the installed app 
            "publisher": string, // Publisher of the installed app 
            "version": string, // Version of the installed app
            "state": string, // (enum | "Installed", "UpdatePending", "Updating")
            "lastOperationId": Guid, // Id of the last update operation that was performed for this app
            "lastUpdateAttemptResult": string // (enum | "Failed", "Succeeded", "Canceled", "Skipped")
        }
    ] 
}

```

### Get Available App Updates 

Get information about new app versions that are available for apps currently installed on the environment.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/apps/availableUpdates
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment.

#### Response

```
{
    "value":
    [ 
        { 
            "id": Guid, // Id of the app 
            "name": string, // Name of the app 
            "publisher": string, // Publisher of the app 
            "version": string, // New version available of the app
            "requirements": // List of other apps that need to be installed or updated before this app can be updated
            [
                { 
                    "id": Guid, // Id of the app
                    "name": string, // Name of the app 
                    "publisher": string, // Publisher of the app 
                    "version": string, // Version the required app needs to be updated to or installed
                    "type": string // (enum | "Install", "Update") 
                }
            ] 
        }
    ] 
}

```

### Schedule an App Update 

Schedules the installation of an app update version. The update will be installed as soon as a time slot is available.

```
Content-Type: application/json
POST /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/update
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment.

`appId` - Id of the targeted app.

#### Body

```
{ 
    "targetVersion": string // Version the installed app should be updated to
    "allowPreviewVersion": bool // Indicates whether to allow updating to an app version that is marked as a Preview by the ISV (exact version must be specified in the targetVersion)
}
```

#### Response (app operation)

Returns information about the scheduled app update request.
```
{ 
    "id": Guid, // Id of the operation used for tracking the update request
    "createdOn": string, // Date and time the request was created
    "status": string, // (enum | "Scheduled", "Running", "Succeeded", "Failed", "Canceled", "Skipped")
    "targetVersion": string, // Version the installed app will be updated to
    "type": string // The type of app operation
} 
```

### Get App Operations

Gets information about app update operations for the specified app.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/operations/[{operationId}]
```

#### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment.

`appId` - Id of the targeted app.

`operationId` - Id of the app update operation. Used for getting information about a specific operation.

#### Response

Returns the list of app update operations for the specified app.
*Note*: `operationId` is provided, the single operation is returned instead.

```
{
    "value":
    [ 
        { 
            "id": Guid,  // Id of the operation
            "createdOn": string, // Date and time the request was created
            "startedOn": string, // Date and time the installation process started
            "completedOn": string, // Date and time the installation process completed
            "status": string, // (enum | "Scheduled", "Running", "Succeeded", "Failed", "Canceled", "Skipped")
            "sourceVersion": string, // Version of the app that was installed before the installation process started
            "targetVersion": string, // Version the installed app will be updated to
            "type": string, // The type of app operation
            "errorMessage": string // The error message provided when update installation fails
        } 
    ] 
}
```

## Session Management

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Manage the active sessions on an environment.

### Get active sessions

Gets active sessions for an environment.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/sessions
```

#### Response
```
{
    value: [
        {
            environmentName: string,
            applicationFamily: string,
            sessionId: int,
            userId: string,
            clientType: string,
            logOnDate: string,
            entryPointOperation: string,
            entryPointObjectName: string,
            entryPointObjectId: string,
            entryPointObjectType: string,
            currentObjectName: string,
            currentObjectId: int,
            currentObjectType: string,
            currentOperationDuration: long
        }
        ,...
    ]
}
```

### Get session details

Gets session information for a specific session id.

```
GET /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

#### Response

```
{
    environmentName: string,
    applicationFamily: string,
    sessionId: int,
    userId: string,
    clientType: string,
    logOnDate: string,
    entryPointOperation: string,
    entryPointObjectName: string,
    entryPointObjectId: string,
    entryPointObjectType: string,
    currentObjectName: string,
    currentObjectId: int,
    currentObjectType: string,
    currentOperationDuration: long
}
```

### Stop and delete a session

Terminates and deletes an active session.

```
DELETE /admin/v2.1/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

## See Also

[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
