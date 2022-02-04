---
title: Business Central Admin Center API - Environments
description: Learn about the Business Central administration center API for managing environments.
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 01/26/2022
---

# Environments

Environments are the instances of the application that have been set up for the tenant. An instance can be of either a production type or a sandbox type. The environment APIs can be used to:

- Get information about the environments currently set up for the tenant
- Get information about the used storage and allowed quotas
- Create a new environment using sample data or as a sandbox copy of the production environment
- Delete an environment.

> [!NOTE]  
> Special care should be taken when deleting a production environment as the data will not be recoverable

## Get environments and Get environments by application family

Returns a list of all the environments for the tenant. 

```
GET /admin/v2.11/applications/environments
```

Returns a list of the environments for the specified application family.

```
GET /admin/v2.11/applications/{applicationFamily}/environments
```

### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example, "BusinessCentral)

### Response

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
      "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
      "appInsightsKey": string // The environment's key for Azure Application Insights
    }
  ]
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

## Get environment by application family and name
Returns the properties for the provided environment name if it exists.

```
GET /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

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
  "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
  "appInsightsKey": string // The environment's key for Azure Application Insights
}
```

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found
   
   - `target: {applicationFamily}/{environmentName}`

## Create new environment

Creates a new environment with sample data.

```
Content-Type: application/json
PUT /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}
```

### Route Parameters

`applicationFamily` - Family to create the new environment within (for example, "BusinessCentral")

`environmentName` - The name of the new environment. See the section below about valid environment names to see what values are allowed.

[!INCLUDE [admin-center-api-copy-create-delete](../developer/includes/admin-center-api-copy-create-delete.md)]

### Body

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

### Response

**API v2.9 and later**

EnvironmentOperation response with HTTP status code 202 (Accepted) with the following format:

```
{
  "id": "11111111-aaaa-2222-bbbb-333333333333",
  "type": "create",
  "status": "scheduled", // Will eventually switch to running and then one between succeeded/failed
  "aadTenantId": "",
  "createdOn": "2021-09-27T08:13:46.65Z",
  "startedOn": "2021-09-27T08:13:47.3Z",
  "completedOn": "2021-09-27T08:15:02.073Z",
  "createdBy": "",
  "errorMessage": "",
  "parameters": {
    "sourceEnvironmentName": "",
    "sourceEnvironmentType": "",
    "destinationEnvironmentName": "NewEnvironment",
    "destinationEnvironmentType": "Production",
    "applicationVersion": "19.0.28719.0",
    "countryCode": "US"
  },
  "environmentName": "NewEnvironment",
  "environmentType": "Production",
  "productFamily": "BusinessCentral"
}
```

**API v2.8 and earlier**

Returns HTTP status code 201 (Created) with newly created environment.

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
  "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
  "appInsightsKey": string // The environment's key for Azure Application Insights
}
```

### Expected Error Codes

`DoesNotExist` - the provided value for the application family wasn't found

`destinationApplicationServiceNotFound` - a suitable destination service couldn't be found to put the environment. Occurs if missing or if the tenant doesn't have access to the target application.

`invalidInput` - the targeted property is invalid in some way

   - target: {countryCode} - the country code property can't be null or whitespace
    
   - target: {environmentName} - the environment name property can't be null or whitespace
    
   - target: {environmentType} - the environment type property can't be null or whitespace, and must be a valid value (Production or Sandbox)        
    
   - target: {ringName} - attempt to create a production environment on a non-production ring
    
   - target: {applicationVersion} - the version property must be a valid version string (major.minor.build.revision)

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - the targeted property doesn't exist

   - target: {ringName} - a ring with the provided name wasn't found

`resourceExists` an environment with the same name already exists

`environmentNameNotValid` - the environment name can't be a reserved value, must be fewer than 30 characters, must start with an alpha character and consist only of alpha, numerical, underscore (_), or dash (-) characters

`cannotCreateNamedEnvironment` - environments with names other than 'Production' or 'Sandbox' aren't supported on the targeted version.

`tenantAlreadyProvisioning` - can't create a new environment because another environment is currently in the process of being created.

`applicationFamilyNotAccessible` - the calling tenant doesn't have access to the targeted application family and country code

`environmentReservationFailed` - another environment within the same application family already has this name

`maximumNumberOfEnvironmentsAllowedReached` - the limit on the number of allowed environments of the provided type has been reached

`maximumStorageCapacityUsageReached` - the limit of the storage capacity usage has been reached

## Copy environment

Creates a new environment with a copy of another environment's data.

```
Content-Type: application/json
POST /admin/v2.11/applications/{applicationFamily}/environments/{sourceEnvironmentName}/copy
```

API v2.8 and earlier:

```
Content-Type: application/json
POST /admin/v2.11/applications/{applicationFamily}/environments/{sourceEnvironmentName}
```

### Route Parameters

`applicationFamily` - Family of the source environment's application (for example, "BusinessCentral")

`sourceEnvironmentName` - Name of the environment to copy from.

[!INCLUDE [admin-center-api-copy-create-delete](../developer/includes/admin-center-api-copy-create-delete.md)]

### Body

```
{
  "environmentName": string, // The name of the new environment.
  "type": string // The type of environment to create. With API v2.8 and earlier, only the value "Sandbox" is supported.  
}
```

### Response

**API v2.9 and later**

EnvironmentOperation response with HTTP status code 202 (Accepted) with the following format:

```
{
  "id": "11111111-aaaa-2222-bbbb-333333333333",
  "type": "copy",
  "status": "scheduled", // Will eventually switch to running and then one between succeeded/failed
  "aadTenantId": "",
  "createdOn": "2021-09-27T08:13:46.65Z",
  "startedOn": "2021-09-27T08:13:47.3Z",
  "completedOn": "2021-09-27T08:15:02.073Z",
  "createdBy": "",
  "errorMessage": "",
  "parameters": {
    "sourceEnvironmentName": "SourceEnvironment",
    "sourceEnvironmentType": "Production",
    "destinationEnvironmentName": "NewEnvironment",
    "destinationEnvironmentType": "Sandbox",
    "applicationVersion": "19.0.28719.0",
    "countryCode": "US"
  },
  "environmentName": "NewEnvironment",
  "environmentType": "sandbox",
  "productFamily": "BusinessCentral"
}
```

**API v2.8 and earlier**

Returns HTTP status code 201 (Created) with newly copied environment.

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
  "ringName": string, // Name of the environment's logical ring group (such as  Prod, Preview) 
  "appInsightsKey": string // The environment's key for Azure Application Insights
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`destinationApplicationServiceNotFound` - a suitable destination service couldn't be found to put the environment. Occurs if missing or if tenant doesn't have access rights to the target application.

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{sourceEnvironmentName}```

`invalidInput` - the targeted property is invalid in some way

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
  
`environmentReservationFailed` - another environment within the same application family already has the same name

`maximumNumberOfEnvironmentsAllowedReached` - the limit on the number of allowed environments of the provided type has been reached

`maximumStorageCapacityUsageReached` - the limit of the storage capacity usage has been reached

## Delete environment

Deletes the specified environment. Warning: A production environment shouldn't be deleted.

```
DELETE /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}
```

### Route Parameters

`applicationFamily` - Family of the environment's application. (for example "BusinessCentral")

`environmentName` - Name of the environment to delete.

[!INCLUDE [admin-center-api-copy-create-delete](../developer/includes/admin-center-api-copy-create-delete.md)]

### Response

**API v2.9 and later**

EnvironmentOperation response with HTTP status code 202 (Accepted) with the following format:

```
{
  "id": "8924140b-0da8-4bbb-8a4f-dac047944e72",
  "type": "delete",
  "status": "scheduled", // Will eventually switch to running and then one between succeeded/failed
  "aadTenantId": "",
  "createdOn": "2021-09-27T08:13:46.65Z",
  "startedOn": "2021-09-27T08:13:47.3Z",
  "completedOn": "2021-09-27T08:15:02.073Z",
  "createdBy": "",
  "errorMessage": "",
  "parameters": {
    "environmentName": "EnvironmentToDelete",
    "environmentType": "sandbox",
    "productFamily": "BusinessCentral",
    "countryCode": "US",
    "applicationVersion": "19.0.28719.0"
  },
  "environmentName": " EnvironmentToDelete",
  "environmentType": "sandbox",
  "productFamily": "BusinessCentral"
}
```

**API v2.8 and earlier**

Returns empty HTTP status code 202 (Accepted).

### Expected Error Codes

`invalidStatusCannotDeleteTenant` - can't delete the environment in its current state

`tenantDeletionInProgress` - environment is already in the process of being deleted

`ambiguousRequest` - multiple environments with the same name were found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Rename environment

**INTRODUCED IN:** API version 2.3

Schedules a rename operation on an environment. 

```
Content-Type: application/json
POST /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}/rename
```

### Routing parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral").

`environmentName` - Name of the environment to rename.

### Body 

```
{ 
  "NewEnvironmentName": "sandbox" 
} 
```
 
### Response 

202 Accepted with body. Follows the general "Operations" format, but with specific operation parameters 
```
{ 
  "id": "11111111-aaaa-2222-bbbb-333333333333", 
  "type": "environmentRename", // Operation type 
  "status": "scheduled", 
  "aadTenantId": "44444444-aaaa-5555-bbbb-666666666666", 
  "createdOn": "2021-04-22T12:29:06.668254Z", 
  "createdBy": "greg.chapman@contoso.com", 
  "errorMessage": "", 
  "parameters": { // Operation-specific parameters 
    "oldEnvironmentName": "prod-1", // The old name of the environment 
    "newEnvironmentName": "prod-2"  // The new name of the environment (the target name) 
  } 
} 
```

### Expected Error Codes

Follows the general "Error response" format with no operation-specific error codes. 

## Restore environment

**INTRODUCED IN:** API version 2.4

Schedules a restore operation an existing environment from a time in the past.

```
Content-Type: application/json
POST /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}/restore
```

### Routing parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral").

`environmentName` - Name of the environment to restore.

### Body

```
{ 
  "EnvironmentName": "x-restored", // Mandatory. The name of the new environment that will be created as the result of the resore operation. 
  "EnvironmentType": "production", // Mandatory. The type of the new environment. 
  "PointInTime": "2021-04-22T20:00:00Z" // The point in time to which to restore the environment. Must be in ISO 8601 format in UTC. 
} 
```

### Response

202 Accepted with body. Follows the general "Operations" format, but with specific operation parameters.

```
{ 
  "id": "11111111-aaaa-2222-bbbb-333333333333", // Operation ID 
  "type": "pitRestore",  // Operation type 
  "status": "queued", // Status 
  "aadTenantId": "44444444-aaaa-5555-bbbb-666666666666",         
  "createdOn": "2021-04-23T09:41:28.8300669Z", 
  "createdBy": "greg.chapman@contoso.com", 
  "errorMessage": "", 
  "parameters": { // Parameters mimic the same from the request body 
    "environmentName": "x-restored",                        
    "environmentType": "Production", 
    "restorePointInTime": "2021-04-22T20:00:00Z" 
  } 
} 
```

### Expected Error Codes

Follows the general "Error response" format, but with specific error codes. 

Operation-specific error codes: 

`PitRestoreFailed` - the restore operation failed

## Get available restore periods

**INTRODUCED IN:** API version 2.4

Returns an ordered list of available restore periods.

```
GET applications/{applicationType}/environments/{environmentName}/availableRestorePeriods 
```

### Response

200 OK with body. Body represents an ordered list of available restore periods that are non-overlapping and sorted in ascending order by period start date-time. If there are no available restore periods, the list will be empty.

```
{ 
  "value": [ 
    { 
      "from": "2021-01-25T14:57:04.967Z", 
      "to": "2021-01-25T21:06:17.737Z" 
    }, 
    { 
      "from": "2021-01-25T21:14:48Z", 
      "to": "2021-01-27T14:33:15.0007416Z" 
    } 
  ] 
} 
```

## Get used storage of an environment by application family and name

Returns used storage properties for the provided environment name if it exists.

```
GET /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}/usedstorage
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns used storage information of a single environment if exists.
```
{
  "environmentType": string, // Environment type (for example, "Sandbox", "Production")
  "environmentName": string, // Environment name, unique within an application family
  "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
  "databaseStorageInKilobytes": int // Used database storage in kilobytes
}
```

> [!NOTE]  
> If an error occurs when calculating database storage, the corresponding property will be -1.

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found
   
   - `target: {applicationFamily}/{environmentName}`
   
## Get used storage for all environments
Returns a list of used storage objects for all the environments.

```
GET /admin/v2.11/environments/usedstorage
```

### Response
Returns a wrapped array of used storage objects.
```
{
  "value":
  [
    {
       "environmentType": string, // Environment type (for example, "Sandbox", "Production")
       "environmentName": string, // Environment name, unique within an application family
       "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
       "databaseStorageInKilobytes": int // Used database storage in kilobytes
    }
  ]
}
```

## Get allowed quotas
Returns different types of quotas and their limits.

```
GET /admin/v2.11/environments/quotas
```

### Response
Returns quotas object.
```
{
  "environmentsCount":
  {
    "production": int, // Maximum allowed number of production environments
    "sandbox": int // Maximum allowed number of sandbox environments
  }
  "storageInKilobytes":
  {
    "default": int, // Amount of storage allowed by default
    "userLicenses": int, // Amount of storage allowed based on the number of user licenses
    "additionalCapacity": int, // Amount of storage allowed based on purchased capacity add-ons
    "total": int // Total amount of allowed storage
   }
}
```

## Get environment operations

**INTRODUCED IN:** API version 2.6

Gets the following operations that occurred on an environment.

```
GET /admin/v2.11/applications/{applicationType}/environments/{environmentName}/operations 
```

### Operation types

Data is returned for the following operation types:

|Type|Description|More information|
|----|-----------|----------------|
|Copy<sup>3</sup>|An environment was created from a copy of another environment.|[Copy a Production or Sandbox Environment in the Admin Center](tenant-admin-center-environments-copy.md)<br><br>[Copy Endpoint](#copy-environment)|
|Create<sup>3</sup>|A new environment was created|[Create Environment in Admin Center](tenant-admin-center-environments.md#create-a-new-environment)<br><br>[Create Endpoint](#create-new-environment)||
|Delete<sup>2</sup>|An environment was deleted.|[Delete Environment in Admin Center](tenant-admin-center-environments.md#delete-an-environment)<br><br>[Delete Endpoint](#delete-environment)|
|EnvironmentAppHotfix<sup>1</sup>|App was hotfixed by using the App Management API.|[App Management API](appmanagement/app-management-api.md#schedule-environment-hotfix)
|EnvironmentAppUpdate<sup>1</sup> |App was updated either by the Admin Center or API update endpoint.| [Update an App in Admin Center](tenant-admin-center-manage-apps.md#install-an-app-update---the-flow)<br><br>[Update Endpoint](administration-center-api_app_management.md#update-an-app)|
|EnvironmentAppInstall<sup>1</sup>|App was installed by using the tenant's **Extension Management** page or the API install endpoint.|[Extension Management Page](/dynamics365/business-central/ui-extensions-install-uninstall#installing-an-extension)<br><br>[Install Endpoint](administration-center-api_app_management.md#install-an-app)|
|EnvironmentAppUninstall<sup>1</sup>|App was uninstalled by using the tenant's **Extension Management** page or the API uninstall endpoint.|[Extension Management Page](/dynamics365/business-central/ui-extensions-install-uninstall#uninstalling-an-extension)<br><br>[Uninstall Endpoint](administration-center-api_app_management.md#uninstall-an-app)|
|EnvironmentRename|Environment was renamed by using the Admin Center|[Rename an Environment](tenant-admin-center-environments-rename.md)<br><br>[Rename Endpoint](#rename-environment)|
|Modify<sup>5</sup>|Records the following operations:<br />[Set update window](administration-center-api_environment_settings.md#put-update-settings)<br />[Set Application Insights key](administration-center-api_environment_settings.md#put-appinsights-key)<br />[Set security group](administration-center-api_environment_settings.md#set-security-group)<br /> [Clear security group](administration-center-api_environment_settings.md#clear-security-group)<br />[Reschedule update](administration-center-api_reschedule_updates.md#reschedule-update)|[Manage updates in Admin Center](tenant-admin-center-update-management.md)<br />[Manage access using Azure Active Directory groups in Admin Center](tenant-admin-center-environments.md#manage-access-using-azure-active-directory-groups)|
|MoveToAnotherAadTenant|An environment was moved to another Azure Active Directory organization by using the Admin Center|[Move an Environment](tenant-admin-center-environments-move.md)|
|PitRestore|Environment was restored by using the Admin Center|[Restoring an Environment](tenant-admin-center-backup-restore.md)|
|Restart<sup>4</sup>|An environment was restarted.|[Restart Environment](tenant-admin-center-manage-sessions.md#restart-environment)|
|Update<sup>5</sup>|Records a long-running background operation that occurs when an environment is updated to a newer version.||

<sup>1</sup> These operations are only supported with API version 2.6 and later. For these operations, the data returned is the same as for [Get App Operations](#get-app-operations), but in a different format.

<sup>2</sup> These operations are only supported with API version 2.8 and later.

<sup>3</sup> These operations are only supported with API version 2.9 and later.

<sup>4</sup> These operations are only supported with API version 2.10 and later.

<sup>5</sup> These operations are only supported with API version 2.11 and later.

<!--
- EnvironmentRename 
- PitRestore 
- MoveToAnotherAadTenant
- EnvironmentAppHotfix 
- EnvironmentAppInstall 
-->

### Route Parameters

`applicationType` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Example `200 OK` response:

```
{ 

  "value": [ 
    { 
      "id": "552d3cb2-144e-4195-9a92-1043c4f483e9", // Id of the operation used for tracking
      "type": "environmentAppInstall", // Type of operation 
      "status": "succeeded", // Status of operation (enum | "Queued", "Scheduled", "Running", "Succeeded", "Failed", "Canceled", "Skipped") 
      "aadTenantId": "5633d4a2-6d53-4254-868f-b8d70eefed7a", // AAD tenant ID for which the operation was executed 
      "createdOn": "2021-03-22T15:45:46.537Z", // Date and time the request was created 
      "errorMessage": "", // Error message for failed operations 
      "parameters": { // Additional parameters for the operation, specific to every operation type 
        "appId": "1bb96677-5112-4566-b742-12eebbb9a058", 
        "targetAppVersion": "17.0.3.0", 
        "countryCode": "US", 
        "allowPreviewVersion": true, 
        "ignoreUpgradeWindow": true, 
        "acceptIsvEula": true, 
        "allowDependencyUpdate": true,
      "environmentName": "Production",
      "environmentType": "Production",
      "productFamily": "BusinessCentral" 
      } 
    }, 
    { 
      "id": "5fe4ac38-a523-4c1f-80db-acd2cf848c09", 
      "type": "environmentRename", 
      "status": "succeeded", 
      "aadTenantId": "5633d4a2-6d53-4254-868f-b8d70eefed7a", 
      "createdOn": "2021-03-16T18:57:36.223Z", 
      "startedOn": "2021-03-16T18:57:39.053Z", 
      "completedOn": "2021-03-16T18:57:47.867Z", 
      "createdBy": "", 
      "errorMessage": "", 
      "parameters": { 
        "oldEnvironmentName": "Production", 
        "newEnvironmentName": "Production-deprecated",
      "environmentName": "Production",
      "environmentType": "Production",
      "productFamily": "BusinessCentral" 
      } 
    } 
  ] 
}
```

`"environmentName"`, `"environmentType"`, and `"productFamily"` are only included in version 2.7 and later.
 
## Get operations on all environments

**INTRODUCED IN:** API version 2.7

Gets the operations that occurred on all environments.

```
GET /admin/v2.11/applications/{applicationType}/environments/operations 
```

### Operation types

See [Operation Types](#operation-types).

### Route Parameters

`applicationType` - Family of the environment's application (for example, "BusinessCentral")

### Response

Example `200 OK` response:

```
{ 

  "value": [ 
    { 
      "id": "552d3cb2-144e-4195-9a92-1043c4f483e9", // Id of the operation used for tracking
      "type": "environmentAppInstall", // Type of operation 
      "status": "succeeded", // Status of operation (enum | "Queued", "Scheduled", "Running", "Succeeded", "Failed", "Canceled", "Skipped") 
      "aadTenantId": "5633d4a2-6d53-4254-868f-b8d70eefed7a", // AAD tenant ID for which the operation was executed 
      "createdOn": "2021-03-22T15:45:46.537Z", // Date and time the request was created 
      "errorMessage": "", // Error message for failed operations 
      "parameters": { // Additional parameters for the operation, specific to every operation type 
        "appId": "1bb96677-5112-4566-b742-12eebbb9a058", 
        "targetAppVersion": "17.0.3.0", 
        "countryCode": "US", 
        "allowPreviewVersion": true, 
        "ignoreUpgradeWindow": true, 
        "acceptIsvEula": true, 
        "allowDependencyUpdate": true,
      "environmentName": "Sandbox",
      "environmentType": "Sandbox",
      "productFamily": "BusinessCentral" 
      } 
    }, 
    { 
      "id": "5fe4ac38-a523-4c1f-80db-acd2cf848c09", 
      "type": "environmentRename", 
      "status": "succeeded", 
      "aadTenantId": "5633d4a2-6d53-4254-868f-b8d70eefed7a", 
      "createdOn": "2021-03-16T18:57:36.223Z", 
      "startedOn": "2021-03-16T18:57:39.053Z", 
      "completedOn": "2021-03-16T18:57:47.867Z", 
      "createdBy": "", 
      "errorMessage": "", 
      "parameters": { 
        "oldEnvironmentName": "Production", 
        "newEnvironmentName": "Production-deprecated",
      "environmentName": "Production",
      "environmentType": "Production",
      "productFamily": "BusinessCentral"  
      } 
    } 
  ] 
}
```
## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Managing Production and Sandbox Environments in the Admin Center](tenant-admin-center-environments.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)  
