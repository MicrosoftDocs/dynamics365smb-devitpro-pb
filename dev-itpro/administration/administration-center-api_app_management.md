---
title: Business Central Admin Center API - App Management
description: Manage Business Central apps with the admin center API. Discover how to install, uninstall, update, and schedule PTEs, plus track operations and available updates.
author: jswymer
ms.author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 07/07/2026
---

# Business Central Admin Center API - App Management

Manage the apps that are installed on an environment.

## Important Information before you get started

### <a name="eula"></a>End-User License Agreement and Terms of Use for Installing an App 

When you install an app from Marketplace, you're shown a page for accepting the end-user license agreement, terms of use, and privacy policy. This behavior isn't the case when you install an app using the API, because there's currently no user-interface with the feature. Instead, to install an app using the API, you must set the `"acceptIsvEula":` property in the request body, which is used for agreeing to the same terms as would when you install from Marketplace. For more information, see [acceptIsvEula](#acceptisveula).

<!--
By setting this parameter to `true`, you accept the following terms:

> - I give Microsoft permission to use or share my account information so that the provider or Microsoft can contact me regarding this product and related products
>- Microsoft may share contact, usage, and transactional information for support, billing, and other transactional activities.
>- I agree to the provider's terms of use and privacy policy<sup>2</sup>.
>- I understand that the rights to use this product don't come from Microsoft, unless Microsoft is the provider. Use of Marketplace is governed by separate [terms](https://azure.microsoft.com/support/legal/marketplace-terms/) and [privacy](https://privacy.microsoft.com/privacystatement).

<sup>2</sup> You should be able to find the terms of use and privacy policy from the app's download page on Marketplace. Links to these documents are typically under **Details + Support** > **Legal**. Or, if you can't find this information, contact the provider.

-->

## Install a global app

**INTRODUCED IN:** API version 2.6

Installs an app on an environment.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/install 
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

### Body

```JSON
{ 
  "targetVersion": string, // Optional. If not provided, latest version will be installed. Required if "allowPreviewVersion": true 
  "useEnvironmentUpdateWindow": boolean, // If true, the operation will be executed only in the environment update window. It will appear as "scheduled" before it runs in the window. 
  "allowPreviewVersion": boolean, // If "allowPreviewVersion": true, targetVersion is required. Applies only to apps published as part of the Embed ISV program.
  "installOrUpdateNeededDependencies": boolean, // Value indicating whether any other app dependencies should be installed or updated; otherwise, information about missing app dependencies will be returned as error details 
  "acceptIsvEula": boolean, // Must be true for installation to proceed. Setting this to true means you agree to the terms described in the acceptIsvEula section that follows.
  "languageId": string // Optional. Specifies locale ID language code, for example, "en-US". This setting corresponds to what the user can set in Extension Management page in tenant.Full list of values can be found in /openspecs/office_standards/ms-oe376/6c085406-a698-4e12-9d4d-c3b0ee3dbc4a under BCP 47 Code column 
} 
```

#### acceptIsvEula

> [!IMPORTANT]
> By setting the `acceptIsvEula` property to `true`, you not only agree with ISV's end-user license terms (EULA) but also with these terms:
>
> **I give Microsoft permission to use or share my account information so that the provider or Microsoft can contact me regarding this product and related products and Microsoft may share contact, usage, and transactional information for support, billing, and other transactional activities. I agree to the provider's terms of use and privacy policy<sup>2</sup> and understand that the rights to use this product do not come from Microsoft, unless Microsoft is the provider. Use of Marketplace is governed by separate [terms](https://azure.microsoft.com/support/legal/marketplace-terms/) and [privacy](https://go.microsoft.com/fwlink/?LinkId=521839) <!--(https://privacy.microsoft.com/privacystatement)-->.**

<sup>2</sup> You should be able to find the terms of use and privacy policy from the app's download page on Marketplace. Links to these documents are typically under **Details + Support** > **Legal**. Or, if you can't find this information, contact the provider.

### Response

Example `200 OK` response with body:

```JSON
{ 
  "id": guid, // ID of the operation used for tracking the update request 
  "type": string, // Type of the operation, for this endpoint, it's "install" 
  "sourceAppVersion": string, // Current version of app on the tenant. In case of Install, it is always empty as no version is installed 
  "targetAppVersion": string, // Version of app that will be installed. 
  "status": string, // An enum that indicates the status. Values include: "scheduled", "running", "succeeded", "failed", "canceled", "skipped" 
  "createdOn": datetime, // Date and time the request was created 
  "errorMessage": string // Error message for failed operations 
} 
```

Example `400 Bad Request` response when dependent apps need to be installed first:

```JSON
{ 
  "code": string, // Error code 
  "message": string, // Detailed error message 
  "data": { // Any additional data for the error. For example, when "installOrUpdateNeededDependencies" in the request body was set to false, and there are dependencies that must be first installed or updated. 
    "requirements": [ // List of requirements you need to fulfil before you can run the request 
      { 
        "appId": guid, 
        "name": string, 
        "publisher": string, 
        "version": string, 
        "type": string // (enum | "install", "update", "uninstall") 
      } 
    ] 
  } 
} 
```

## Upload and schedule install for a per-tenant extension (PTE)

**INTRODUCED IN:** API version 2.29

Uploads an .app file for a PTE and schedules installation or update of the uploaded PTE.

```HTTP
Content-Type: multipart/form-data
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/pteInstall
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application, such as "BusinessCentral".  

`environmentName` - the name of the targeted environment.

### Body

```JSON
{ 
  "extensionFile": file, // Required. The .app package to upload. Must have .app file extension and cannot exceed 50MB in size.
  "deploymentSchedule": string, // Optional. Determines when the uploaded .app file will be installed on the environment. Possible values are "Immediate", "UpdateWindow", "NextMinorUpdate", and "NextMajorUpdate". Defaults to "Immediate" if omitted from request. Must be "Immediate" or "UpdateWindow" for new PTEs, updates to installed PTEs can use any deploymentSchedule.
  "syncMode": string, // Optional. Determines the sync mode applied during install. Possible values are "Add" and "ForceSync". Defaults to "Add" if omitted from request.
  "languageId": string, // Optional. Microsoft Language Code ID (for example, "en-US"). Defaults to "en-US" if omitted from request.
  "acceptIsvEula": boolean, // Required. Must be true for installation to proceed. Setting this to true means you agree to the terms described in the acceptIsvEula section that follows.
  "installOrUpdateNeededDependencies": boolean // Optional. Determines whether dependencies of the uploaded extension should be automatically installed or updated; otherwise the install fails when dependencies are missing. Defaults to false if omitted from request.
} 
```

#### acceptIsvEula

> [!IMPORTANT]
> By setting the `acceptIsvEula` property to `true`, you agree to the ISV's end-user license terms (EULA) and also agree to these terms:
>
> **I give Microsoft permission to use or share my account information so that the provider or Microsoft can contact me regarding this product and related products. Microsoft may share contact, usage, and transactional information for support, billing, and other transactional activities. I agree to the provider's terms of use and privacy policy<sup>2</sup> and understand that the rights to use this product don't come from Microsoft, unless Microsoft is the provider. Use of Marketplace is governed by separate [terms](https://azure.microsoft.com/support/legal/marketplace-terms/) and [privacy](https://go.microsoft.com/fwlink/?LinkId=521839).**

### Response

Responds with operation details. The operation's status reflects the `deploymentSchedule` set in the request: `running` for uploads with an `immediate` deployment, and `scheduled` for uploads set to deploy at a later time.

Example `200 OK` response with `immediate` deployment:

```JSON
{
  "id": guid,                       // Tracking id of the install operation. Use it to look up the operation later.
  "type": "install",                // Operation type. Always "install" for this endpoint.
  "sourceAppVersion": string,       // Empty for installs.
  "targetAppVersion": string,       // Version of the extension being installed, read from the uploaded .app package.
  "status": string,                 // (enum | "scheduled", "running", "succeeded", "failed", "canceled", "skipped")
  "createdOn": datetime,            // Date and time the operation was created.
  "startedOn": datetime,            // Date and time the operation began running. Omitted for a deferred (still-scheduled) install.
  "completedOn": datetime,          // Date and time the operation completed. Omitted until it finishes.
  "errorMessage": string,           // Failure detail when status is "failed"; empty otherwise.
  "createdBy": string,              // Email address if authenticated as a user, App ID if authenticated as a service principal.
  "canceledBy": string,             // Empty for a newly-created install.
  "creatorPrincipalType": string,   // (enum | "User", "App")
  "appId": guid,                    // Id of the targeted app, read from the uploaded .app package.
  "aadTenantId": guid,              // Microsoft Entra Tenant ID of the tenant the operation runs against.
  "scheduleKind": string            // (enum | "Immediate", "UpdateWindow", "NextMinorUpdate", "NextMajorUpdate")
}
```

## Uninstall an App

**INTRODUCED IN:** API version 2.6

Uninstalls an app from an environment.

> [!IMPORTANT]
> PTEs can have versions scheduled for installation. When you uninstall a PTE by using this API endpoint, it doesn't remove scheduled versions. To remove these versions, use the **Cancel Scheduled Per-Tenant Extension (PTE) Install or Update** endpoint. This removal ensures a new version of the uninstalled PTE doesn't install later.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/uninstall  
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

### Body

```JSON
{ 
  "useEnvironmentUpdateWindow": boolean, // If set to true, the operation will be executed only in the environment update window. It will appear as "scheduled" before it runs in the window. 
  "uninstallDependents": boolean // Value indicating whether any other dependent apps should be uninstalled, otherwise information about dependent apps will be returned in error details 
  "deleteData": boolean // Deletes data and syncs clean the extension. Exactly the same as deleting data in Extension Management page in tenant. 
} 
```

### Response

Example `200 OK` response with body:

```JSON
{
  "id": guid, // ID of the operation used for tracking the update request 
  "type": string, // Type of the operation. For this endpoint, it's "uninstall".
  "sourceAppVersion": string, // Current version of app on the tenant. 
  "targetAppVersion": string, // Target version of the app on the tenant. For uninstall, it will be always empty. 
  "status": string, // An enum that indicates the status. Values include: "scheduled", "running", "succeeded", "failed", "canceled", "skipped"  
  "createdOn": datetime, // Date and time the request was created 
  "errorMessage": string // Error message for failed operations 
} 
```

Example `400 Bad Request` response when dependent apps need to be uninstalled first: 

```JSON
{ 
  "code": string, // Error Code 
  "message": string, // Detailed error message 
  "data": { // Any additional data for the error. For example, when "uninstallDependents" in the request body was set to false, and there are existing dependent apps that need to be uninstalled first. The list of requirements is all apps that depend on the targeted app. 
    "requirements": [ // List of requirements you need to fulfil before you can run the request 
      { 
        "appId": guid, 
        "name": string, 
        "publisher": string, 
        "version": string, 
        "type": string // (enum | "install", "update", "uninstall") 
      } 
    ] 
  } 
}
```

## Get Uninstall Requirements

Lists dependent apps that need to be uninstalled in order to uninstall the targeted app.

**INTRODUCED IN:** API version 2.25

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/uninstallRequirements  
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

### Response

Example `200 OK` response with body:

```JSON
{
  "value":
  [
    {
      "appId": guid, // ID of the dependent app
      "name": string, // Name of the dependent app
      "publisher": string, // Publisher of the dependent app
      "version": string, // Version of the dependent app
      "type": string, // (enum | "Global", "PTE", "DEV")
      "EnvironmentAppOperationRequirementType": string // Defines the operation type for which the dependency applies
    },
    {
      ...
    }
  ]
}
```

## Get Installed Apps 

Get information about apps that are installed on the environment.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

### Response
Returns information about the apps installed on the environment.

```JSON
{
  "value":
  [
    { 
      "appId": guid, // Id of the installed app 
      "name": string, // Name of the installed app 
      "publisher": string, // Publisher of the installed app 
      "version": string, // Version of the installed app
      "state": string, // (enum | "Installed", "UpdatePending", "Updating")
      "lastOperationId": guid, // Id of the last update operation that was performed for this app
      "lastUpdateAttemptResult": string // (enum | "Failed", "Succeeded", "Canceled", "Skipped")
      "lastUninstallOperationId": guid // Id of the last uninstall operation that was performed for this app
      "lastUninstallAttemptResult": string // (enum | "Failed", "Succeeded", "Canceled", "Skipped")
      "appType": string // (enum | "global", "tenant", "dev")
      "canBeUninstalled": boolean // Specifies whether the app can be uninstalled
    }
  ]
}
```

## Get available global app updates

Get information about new global app versions that are available for apps currently installed on the environment.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/availableUpdates
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

### Response

```JSON
{
  "value":
  [ 
    { 
      "appId": guid, // Id of the app 
      "name": string, // Name of the app 
      "publisher": string, // Publisher of the app 
      "version": string, // New version available of the app
      "requirements": // List of other apps that need to be installed or updated before this app can be updated
      [
        { 
          "appId": guid, // Id of the app
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

## Update a Global App

Updates a global app by using an existing endpoint when new parameters in the request body are available. To update a PTE, upload a new version of the PTE by using the **Upload and schedule install for a per-tenant extension (PTE)** endpoint.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/update
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

### Body

```JSON
{ 
  "useEnvironmentUpdateWindow": boolean, // If set to true, the operation will be executed only in the environment update window. It will appear as "scheduled" before it runs in the window.
  "targetVersion": string, // Always required. There's no option to update to the latest. You have to first do a "availableAppUpdates", call then use the version here.
  "allowPreviewVersion": boolean,  
  "installOrUpdateNeededDependencies": boolean // Value indicating whether any other app dependencies should be installed or updated; otherwise, information about missing app dependencies will be returned as error details
}
```

### Responses (app operation) 

200 OK, with Body, example:

```JSON
{ 
  "id": guid, // ID of the operation used for tracking the update request
  "type": string, // Type of the operation. For this endpoint, it's "update".
  "sourceAppVersion": string, // Current version of app on the tenant.
  "targetAppVersion": string, // Target version of the app on the tenant that will be installed during update.
  "status": string, // An enum that indicates the status. Values include: "scheduled", "running", "succeeded", "failed", "canceled", "skipped"
  "createdOn": datetime, // Date and time the request was created
  "errorMessage": string, // Error message for failed operations
  "createdBy": string, // Email address if authenticated as user, App ID if authenticated as app
  "canceledBy: string // Empty value
}
```
  
Example `400 Bad Request` response when dependent apps need to be updated first:

```JSON
{ 
  "code": string, // Error Code 
  "message": string, // Detailed error message 
  "data": { // Any additional data for the error. For example, when "installOrUpdateNeededDependencies" in the request body was set to false, and dependencies need to be installed or updated.  
    "requirements": [ // List of requirements you need to fulfil before you can run the request 
      { 
        "appId": guid, 
        "name": string, 
        "publisher": string, 
        "version": string, 
        "type": string // (enum | "install", "update", "uninstall") 
      }
    ]
  }
}
```

## Cancel a scheduled global app update

Cancels a global app update that's in a scheduled state. This endpoint doesn't support PTEs.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/update/cancel
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

### Body

```JSON
{ 
  "ScheduledOperationId": guid // Obtained when scheduling an update or by getting app operations for the environment
}
```

### Responses (app operation) 

200 OK, with Body, example:

```JSON
{ 
  "id": guid, // ID of the operation used for tracking the update request
  "type": string, // Type of the operation. For this endpoint, it's "update".
  "sourceAppVersion": string, // Current version of app on the tenant.
  "targetAppVersion": string, // Target version of the app on the tenant that will be installed during update.
  "status": string, // An enum that indicates the status. Values include: "scheduled", "running", "succeeded", "failed", "canceled", "skipped"
  "createdOn": datetime, // Date and time the request was created
  "errorMessage": string, // Error message for failed operations
  "createdBy": string, // Email address if authenticated as user, App ID if authenticated as app
  "canceledBy: string // Email address if authenticated as user, App ID if authenticated as app
}
```

## Get scheduled per-tenant extension (PTE) installs and updates

**INTRODUCED IN:** API version 2.29

Lists scheduled install and update operations for per-tenant extensions (PTEs).

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/scheduledPteOperations
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application, such as "BusinessCentral".  

`environmentName` - the name of the targeted environment.

### Response

Example `200 OK` response body:

```JSON
{
  "value":
  [
    {
      "id": guid, // Id of the operation
      "type": string, // Operation type. For this endpoint, always "Install".
      "sourceAppVersion": string, // Empty for scheduled installs.
      "targetAppVersion": string, // Version of the extension that will be installed.
      "status": "scheduled", // Always "scheduled"
      "createdOn": datetime, // Date and time the schedule entry was created.
      "startedOn": datetime, // Null for operations that have not yet started.
      "completedOn": datetime, // Null for operations that have not yet completed.
      "errorMessage": string, // Empty for currently-scheduled ops.
      "createdBy": string, // Email address if authenticated as a user, App ID if authenticated as a service principal.
      "canceledBy": string, // Empty for currently-scheduled ops.
      "creatorPrincipalType": string, // (enum | "User", "App")
      "appId": guid, // Id of the targeted app.
      "aadTenantId": guid, // Microsoft Entra tenant id of the customer the operation runs against.
      "scheduleKind": string, // (enum | "Immediate", "UpdateWindow", "NextMinorUpdate", "NextMajorUpdate")
      "parameters": // Snapshot of the install request the operation was scheduled with.
      {
        "appId": guid, // Id of the targeted app.
        "targetAppVersion": string, // Version of the extension that will be installed.
        "countryCode": string, // Country code the install was scheduled with (for example, "US").
        "languageId": string, // Microsoft Language Code ID the install was scheduled with (for example, "en-US").
        "name": string, // Name of the extension as read from the uploaded .app package metadata.
        "publisher": string, // Publisher of the extension as read from the uploaded .app package metadata.
        "scheduleKind": string, // (enum | "Immediate", "UpdateWindow", "NextMinorUpdate", "NextMajorUpdate")
        "targetRelease": string, // Platform release the staged entry targets in tenant application storage (for example, "29.0.0.0" for NextMajorUpdate when the tenant is on 28.x).
        "syncMode": string // Sync mode supplied at upload time. One of "Add", "ForceSync".
      }
    }
  ]
}
```

## Cancel Scheduled Per-Tenant Extension (PTE) Install or Update

**INTRODUCED IN:** API version 2.29

Cancels a specific scheduled install or update for a per-tenant extension (PTE). To define the scheduled install or update, use `appId`, `targetVersion`, and `scheduleKind`. This operation permanently removes .app files for the PTE version from storage.

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/removeScheduledPteVersion
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application, such as "BusinessCentral".  

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

### Body

```JSON
{
  "targetVersion": string, //Required. Version of the scheduled per-tenant extension to remove (for example, "2.0.0.0").
  "scheduleKind": string //Required. Identifies which scheduled operation to target. One of "NextMinorUpdate", "NextMajorUpdate", "UpdateWindow".
}
```

### Response

Example `200 OK` response body:

```JSON
{
  "id": guid, // Id of the canceled operation.
  "type": "install", // Operation type.
  "sourceAppVersion": string,  // Empty.
  "targetAppVersion": string, // Version of the extension that was scheduled.
  "status": "canceled", // Final status after removal.
  "createdOn": datetime, // Date and time the schedule entry was originally created.
  "startedOn": datetime, // Omitted when removed before the operation began running.
  "completedOn": datetime, // Date and time the cancel completed.
  "errorMessage": string, // Reason the operation was canceled (for example, "Removed by user 'admin@contoso.com'").
  "createdBy": string, // Email address if originally created by a user, App ID if created by a service principal.
  "canceledBy": string, // Email address if removed by a user, App ID if removed by a service principal.
  "creatorPrincipalType": string, // (enum | "User", "App")
  "appId": guid, // Id of the targeted app.
  "aadTenantId": guid, // Microsoft Entra Tenant ID of the customer the operation ran against.
  "scheduleKind": string // Schedule kind of the removed operation.
}
```

Example `404 Not Found` response body:

```JSON
{
  "code": "ResourceDoesNotExist",
  "message": "App with id '<appId>' is not installed on environment or the environment does not exist.",
  "target": "BusinessCentral/<environment>/apps/<appId>"
}
```

## Get App Operations

Gets information about app install, uninstall, and update operations for the specified app.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/operations/[{operationId}]
```

### Route Parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment.

`appId` - ID of the targeted app.

`operationId` - ID of the app update operation. Used for getting information about a specific operation.

### Response

Returns the list of app update operations for the specified app.
*Note*: `operationId` is provided, the single operation is returned instead.

```JSON
{
  "value":
  [
    {
      "id": guid,  // Id of the operation
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

## Create alerts using Azure Logic Apps and Power Automate

[Azure Logic Apps](/azure/logic-apps/logic-apps-overview) and [Power Automate](https://powerautomate.microsoft.com) have built-in connectors that can be used to query the admin center API by using HTTP and service-to-service (S2S) authentication. Use this capability to set up custom notifications or to automate certain actions.

> [!NOTE]
> Samples of custom notifications and automations are shared by Microsoft and third parties in the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your Application Insights alerts and automations with the community on GitHub.

The following sample can help getting started with alerting in Microsoft Teams when app updates are available for an environment. When updates are available, an adaptive card is created in a Teams channel. This card allows for the automation of app updates by using S2S authentication that targets the admin center API.

### Example - Run a recurrent alerting API query that sends a Teams notification when app updates are available

This Logic App runs a specified number of times a day (parameter in deployment pipeline) and lists all app updates made available for selected environment (parameter in deployment pipeline).

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FS2SAppsEnvironmentAppUpdateAdaptiveCard.json)

### Prerequisites

Business Central admin center API is configured for S2S authentication of Microsoft Entra apps. For more information, go to [Authenticate using service-to-service Microsoft Entra Apps](administration-center-api.md#authenticate-using-service-to-service-microsoft-entra-apps-client-credentials-flow).

### Preparation

You need the following information about Business Central and your Teams service to deploy the Logic App:

|Service|Information|
|-|-|
|Business Central|<ul><li>The Microsoft Entra tenant ID for Business Central</li><li>The application (client) ID of the registered application in Azure used for S2S authentication</li><li>The client secret of the registered application in Azure used for S2S authentication</li></ul>|
|Teams|<ul><li>The group ID of the team in Teams that you want to send the alerts to</li><li>The ID of the channel in Teams that you want to send the alerts to</li></ul> |

> [!IMPORTANT]
> Deploying a Logic App to Azure also creates the API connection resources necessary to authenticate certain actions in the Logic Apps. In this example, the deployment creates a connection resource for the Teams API.
>
> If you already have an API connection resource for Teams in your resource group, you can reuse the existing connection resource by providing its name during deployment.

### Deploy the Logic App

1. Select the **Deploy to Azure** button and sign in to Azure portal when prompted.

2. Fill in the required fields on the **Custom deployment** page.

   In the **Teams Connection Name** field, specify a name for the new connection resource to be added for the Teams API. If you want to reuse the existing connection resource for the Teams API, entering the name of the existing connection resource.

3. Select **Review + create** to complete the deployment.

4. When deployment is done, authorize the connection to Teams API using your Teams credentials:

    1. Select **Go to resource group**.
    2. Select the resource for the Teams API connection to open it.
    3. Select **Edit API connection** > **Authorize**, then sign in with your credentials.


## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)  
