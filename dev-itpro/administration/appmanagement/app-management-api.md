---
title: "App Management API"
description: Learn about managing Embed apps by using the App Management API.
author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# App Management API

[!INCLUDE[2020_releasewave1](../../includes/2020_releasewave1.md)]

## Entities

## App

### Description

The `app` entity represents a Business Central App that has been registered with the service and so it can be managed via the API. The `app` entity contains some basic metadata about the app, such as:
- its ID
- the Azure Active Directory Tenant ID of the publisher's organization
- which Azure location the respective .app files and other metadata should be stored in.

> [!NOTE]
> An app doesn't refer to any specific .app file or version of the app.

### Properties

|Name|Description|Schema|
|---|---|---|
|**ID**|The ID of the app. The ID must remain the same across all app versions.|string (uuid)|
|**publisher**|The publisher's name.|string|
|**publisherAadTenantId**|The ID of the Azure Active Directory tenant that represents the publisher's organization.|string (uuid)|
|**publisherContactEmail**|The publisher's contact e-mail address.|string|
|**storageLocation**|The Azure location in which data related to this app should be stored.|string|
|**_etag**|The entity tag that contains a value unique to the entity's current state.|string|

### Available Endpoints

### List apps

Lists all apps that match the provided (optional) filter that the current `principal` can access.

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps?$filter=<odata_filter>
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|query|$filter|Restricts the set of items returned.|OData filter|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps?$filter=storageLocation eq 'West Europe'
```

#### Example Response

```json
{
    "value": [
        {
            "id": "36d697e1-1982-43a5-9927-7f8f2a3eb361",
            "publisher": "Contoso",
            "publisherAadTenantId": "49cf52d4-fc10-41af-91ab-2d7cd011db47",
            "publisherContactEmail": "publisher@contoso.com",
            "storageLocation": "West Europe",
            "_etag": "5c47bfb0-d80c-4780-99ed-c3a3d38ac539"
        }
    ]
}
```

## Country

The `country` entity represents a country that an `app` is available in.  
A country is represented by its ISO 3166-1 alpha-2 (2-letter) country code.  
Specific versions of Business Central Apps can be made available for specific countries.

### Properties

|Name|Description|Schema|
|---|---|---|
|**countryCode**|The ISO 3166-1 alpha-2 (2-letter) code for the country.|string|
|**_etag**|The entity tag that contains a value unique to the entity's current state.|string|

### Available Endpoints

### List countries

Lists all countries the specified `app` has been made available in.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app to list the countries for.|string (uuid)|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries
```

#### Example Response

```json
{
    "value": [
        {
            "countryCode": "US",
            "_etag": "f6039211-0dea-481a-80a5-38498dcea011"
        },
        {
            "countryCode": "DK",
            "_etag": "bb8f8166-a6cc-4562-b135-0b13257b032f"
        }
    ]
}
```

### Get country

Gets the `country` with the specified country code in the specified `app`.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}
```
#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the country belongs to.|string (uuid)|
|path|countryCode|The ISO 3166-1 alpha-2 (2-letter) code of the country.|string|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US
```

#### Example Response

```json
{
    "countryCode": "US",
    "_etag": "f6039211-0dea-481a-80a5-38498dcea011"
}
```

### Add or update country

Adds a new `country` to the specified `app` or updates an existing one.

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the country belongs to.|string (uuid)|
|path|countryCode|The ISO 3166-1 alpha-2 (2-letter) code of the country to add.|string|
|body|country|The country properties that should be added or updated.|[Country](#country)|

#### Example Request

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/AT

{
    "countryCode": "AT"
}

```

#### Example Response

```json
{
    "countryCode": "AT",
    "_etag": "584915f0-6319-4aab-a23c-743c0c4d9aeb"
}
```

## Principal

### Description

The `principal` entity represents an Azure Active Directory user or application that has some level of access to an `app`.  
Principal can have different roles that determine which actions they're allowed to do.
The currently supported roles are:
- `Owner` - Owners are allowed to do all available actions on all entities.
- `Contributor` - Contributors have similar permissions to owners, except that they aren't allowed to add/update principals.
- `Reader` - Readers can read information about the various entities, but can't add/update anything.

### Properties
|Name|Description|Schema|
|---|---|---|
|**aadTenantId**|The ID of the Azure Active Directory Tenant the principal belongs to.|string (uuid)|
|**id**|The ID of Azure Active Directory user/application.|string (uuid)|
|**roles**|The list of roles the principal has assigned.|string[]|
|**type**|The principal type.|enum (User, Application)|
|**_etag**|The entity tag that contains a value unique to the entity's current state.|string|

### Available Endpoints
### List principals
Lists all `principal`s that match the provided filter within the specified `app`.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/principals?$filter=<odata_filter>
```
#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app to list the principals for.|string (uuid)|
|query|$filter|Restricts the set of items returned.|OData filter|

#### Example Request
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/principals?$filter=type eq 'User' and 'Owner' in roles
```

#### Example Response
```json
{
    "value": [
        {
            "id": "c07b7af3-8c9a-4bb1-9a0b-03692ba98d6d",
            "type": "User",
            "aadTenantId": "0c1cbce0-b823-4acf-be2f-1ac3a4e81c21",
            "roles": [
                "Owner"
            ],
            "_etag": "c99541ab-a0d2-4807-86f8-e1eb1853eb4f"
        }
    ]
}
```

### Get principal by ID

Gets the `principal` with the specified ID in the specified `app`.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/principals/{id}
```
#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the principal belongs to.|string (uuid)|
|path|id|The ID of the principal.|string (uuid)|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/principals/c07b7af3-8c9a-4bb1-9a0b-03692ba98d6d
```

#### Example Response

```json
{
    "id": "c07b7af3-8c9a-4bb1-9a0b-03692ba98d6d",
    "type": "User",
    "aadTenantId": "0c1cbce0-b823-4acf-be2f-1ac3a4e81c21",
    "roles": [
        "Owner"
    ],
    "_etag": "c99541ab-a0d2-4807-86f8-e1eb1853eb4f"
}
```

### Remove principal
Removes the `principal` with the specified ID in the specified `app`.  
**Note:** Only principals with the `Owner` role are allowed to remove principals.

```
DELETE https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/principals/{id}
```
#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the principal belongs to.|string (uuid)|
|path|id|The ID of the principal.|string (uuid)|

#### Example Request

```
DELETE https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/principals/c07b7af3-8c9a-4bb1-9a0b-03692ba98d6d
```

### Add or update principal

Adds or updates the specified `principal` that belongs to the specified `app`.
**Note:** Only principals with the `Owner` role are allowed to add or update principals.
**Note:** The `aadTenantId` field should only be specified in the request body when the principal being added is of type `User`.

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/principals/{id}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the principal belongs to.|string (uuid)|
|path|id|The ID of the principal to add or update.|string (uuid)|
|body|principal|The properties that should be added or updated.|[Principal](#principal)|

#### Example Request

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/principals/c07b7af3-8c9a-4bb1-9a0b-03692ba98d6d

{
    "aadTenantId":  "20ba9ed9-d37b-4db0-ade4-f64322ad7c02",
    "Type":  "User",
    "roles":  [
                  "Reader"
              ]
}
```

When using `Type:"Application"`, the `aadTenantId` must not be used.

#### Example Response

```json
{
    "id": "c07b7af3-8c9a-4bb1-9a0b-03692ba98d6d",
    "type": "User",
    "aadTenantId": "0c1cbce0-b823-4acf-be2f-1ac3a4e81c21",
    "roles": [
        "Reader"
    ],
    "_etag": "a98992bf-d7f6-460b-83bb-1498459a6a75"
}
```

## Version

### Description

A `version` represents an .app file that has been uploaded for a specific `country` in an `app`.  
If a version of an app should be available in multiple countries, then the .app file needs to be uploaded to each country separately.

### Properties

#### Version
|Name|Description|Schema|
|---|---|---|
|**appId**|The ID of the app.|string (uuid)|
|**availability**|The version's availability.|enum (Preview, Available, Deprecated)|
|**buildVersion**|The build number of the version.|integer (int32)|
|**countryCode**|The country that the version was uploaded for.|string|
|**dependencies**|The dependencies of the uploaded package.|[Dependency](#dependency)[]|
|**majorVersion**|The major number of the version.|integer (int32)|
|**minorVersion**|The minor number of the version.|integer (int32)|
|**name**|The name of the app.|string|
|**packageId**|The ID of the uploaded package.|string (uuid)|
|**publisher**|The publisher of the app.|string|
|**revisionVersion**|The revision number of the version.|integer (int32)|
|**status**|The version's status.|enum (Uploading, Uploaded, UploadFailed)|
|**uploadedOn**|The UTC date and time the version was uploaded on.|string (date-time)|
|**version**|The version of the app.|string|
|**_etag**|The entity tag that contains a value unique to the entity's current state.|string|

#### Dependency

|Name|Description|Schema|
|---|---|---|
|**appId**|The dependency app ID.|string (uuid)|
|**name**|The dependency app name.|string|
|**publisher**|The dependency app publisher.|string|
|**version**|The minimum version of the dependency.|string|
|**incompatibleFromVersion**|The initial app version of the dependency that is no longer compatible with the dependent app. If this value is set then it means that versions greater or equal to it are considered incompatible.|string|

### List versions

Lists all `versions` that match the provided filter.

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/versions?$filter=<odata_filter>
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app to list the versions for.|string (uuid)|
|path|countryCode|The code of the country to list the versions for.|string|
|query|$filter|Restricts the set of items returned.|OData filter|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/versions?$filter=MajorVersion eq 16 and MinorVersion eq 0
```

#### Example Response

```json
{
    "value": [
        {
            "version": "16.0.1.2",
            "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
            "countryCode": "US",
            "packageId": "01d39741-8ab1-4fcc-b353-d9208ba475e3",
            "publisher": "Example Publisher",
            "name": "ExampleApp",
            "uploadedOn": "2019-07-09T11:54:45.5414576Z",
            "availability": "Available",
            "status": "Uploaded",
            "dependencies": [
                {
                    "appId": "1914cafc-93b9-46fd-b825-707f1743caee",
                    "name": "Example Dependency",
                    "publisher": "Other Publisher",
                    "version": "1.0.0.0"
                }
            ],
            "majorVersion": 16,
            "minorVersion": 0,
            "buildVersion": 1,
            "revisionVersion": 2,
            "_etag": "50fec40a-99b6-4743-bbe7-42e95cde2cfa"
        }
    ]
}
```

### Upload version

Uploads an .app file into the specified `app` and `country` based on the provided package contents.

```
POST https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/versions
```

> [!IMPORTANT]
> Make sure that you registered your app with the service and added a country to it, before you attempt to upload the app version.

> [!NOTE]
> If you want to update app to a version that introduces breaking changes, see [Upgrading an App by Using ForceSync](app-management-updating-with-forcesync.md).

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|body|requestData|The request data.|[Upload Version Request](#upload-version-request)|

#### Upload version request

|Name|Description|Schema|
|---|---|---|
|**initialAvailability**|The initial availability that the uploaded app version should have.|enum (Preview, Available, Deprecated)|
|**packageContents**|The base64-encoded contents of the package (.app file) to upload.|string (byte)|

#### Example Request

```
POST https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/versions

{
    "initialAvailability": "Preview",
    "packageContents": <contents>
}

```

#### Example Response

```json
{
    "version": "16.0.1.2",
    "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
    "countryCode": "US",
    "packageId": "01d39741-8ab1-4fcc-b353-d9208ba475e3",
    "publisher": "Example Publisher",
    "name": "ExampleApp",
    "uploadedOn": "2019-07-09T11:54:45.5414576Z",
    "availability": "Preview",
    "status": "Uploaded",
    "dependencies": [
        {
            "appId": "1914cafc-93b9-46fd-b825-707f1743caee",
            "name": "Example Dependency",
            "publisher": "Other Publisher",
            "version": "1.0.0.0"
        }
    ],
    "majorVersion": 16,
    "minorVersion": 0,
    "buildVersion": 1,
    "revisionVersion": 2,
    "_etag": "50fec40a-99b6-4743-bbe7-42e95cde2cfa"
}
```

### Download version 

Downloads the .app file linked to the specified version.
```
POST https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/versions/{versionNumber}/getPackageContents -OutFile {saveToFile}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the version belongs to.|string (uuid)|
|path|countryCode|The country code.|string|
|path|versionNumber|The version number of the version to update.|string|
|path|saveToFile|The path and the name you want to use for file you download.|string|

#### Example Request

Downloads an app file.

```
POST https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/versions/16.0.1.2/getPackageContents -OutFile "C:\temp\ExampleApp-16.0.1.2.app"
```



### Get version

Gets the `version` in the specified `app` and `country`.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/versions/{versionNumber}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|path|versionNumber|The version number.|string|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/versions/16.0.1.2 
```

#### Example Response

```json
{
    "version": "16.0.1.2",
    "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
    "countryCode": "US",
    "packageId": "01d39741-8ab1-4fcc-b353-d9208ba475e3",
    "publisher": "Example Publisher",
    "name": "ExampleApp",
    "uploadedOn": "2019-07-09T11:54:45.5414576Z",
    "availability": "Preview",
    "status": "Uploaded",
    "dependencies": [
        {
            "appId": "1914cafc-93b9-46fd-b825-707f1743caee",
            "name": "Example Dependency",
            "publisher": "Other Publisher",
            "version": "1.0.0.0"
        }
    ],
    "majorVersion": 16,
    "minorVersion": 0,
    "buildVersion": 1,
    "revisionVersion": 2,
    "_etag": "50fec40a-99b6-4743-bbe7-42e95cde2cfa"
}
```

### Update version

Updates the `version` in the specified `app` and `country` with the provided updated data.  
**Note:** only some properties can be updated.
```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/versions/{versionNumber}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app that the version belongs to.|string (uuid)|
|path|countryCode|The country code.|string|
|path|versionNumber|The version number of the version to update.|string|
|body|version|The properties that should be updated.|[Version](#version)|

#### Example Request

Marking an app version as deprecated.

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/versions/16.0.1.2 

{
    "availability": "Deprecated"
}
```
#### Example Request

Marks older versions of your app as incompatible with a dependency app, starting with a specific version. In such cases, make sure you upload another version of your app that is compatible with the new version of the dependency app. 

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/versions/16.0.1.2

{
    "dependencies": [
        {
            "appId": "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
            "incompatibleFromVersion": "16.0.0.0"
        }
    ]
}
```

#### Example Response

```json
{
    "version": "16.0.1.2",
    "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
    "countryCode": "US",
    "packageId": "01d39741-8ab1-4fcc-b353-d9208ba475e3",
    "publisher": "Example Publisher",
    "name": "ExampleApp",
    "uploadedOn": "2019-07-09T11:54:45.5414576Z",
    "availability": "Deprecated",
    "status": "Uploaded",
    "dependencies": [
        {
            "appId": "1914cafc-93b9-46fd-b825-707f1743caee",
            "name": "Example Dependency",
            "publisher": "Other Publisher",
            "version": "1.0.0.0"
        }
    ],
    "majorVersion": 16,
    "minorVersion": 0,
    "buildVersion": 1,
    "revisionVersion": 2,
    "_etag": "3c0f1fd2-266e-491b-82e3-74f09a975267"
}
```

## Environment

### Description

Represents a customer's `environment` that has a specific `version` of an `app` installed.

### Properties

|Name|Description|Schema|
|---|---|---|
|**aadTenantId**|The ID of the customer's Azure Active Directory tenant.|string (uuid)|
|**appId**|The ID of the installed app.|string (uuid)|
|**applicationFamily**|The environment's application family.|string|
|**countryCode**|The country code the environment belongs to.|string|
|**locationName**|The Azure location the environment is in.|string|
|**name**|The environment's name.|string|
|**type**|The environment's type.|enum (Production, Sandbox)|
|**version**|The version of the installed app.|string|

### List environments

Lists the `environment`s in the specified `app` and `country` that have the app installed.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/environments
```
#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|query|$filter|Restricts the set of items returned.|OData filter|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/environments?$filter=version eq '16.0.1.2'
```

#### Example Response

```json
{
    "value": [
        {
            "aadTenantId": "539a833c-4e6a-42d8-a081-27fa9d810424",
            "version": "16.0.1.2",
            "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
            "countryCode": "US",
            "applicationFamily": "Business Central",
            "locationName": "West Europe",
            "name": "MyCustomer",
            "type": "Production"
        }
    ]
}
```

## Environment Hotfix

### Description

An `environment hotfix` represents the action of pushing out an update (new `version`) of an `app` to a customer's `environment` as part of fixing a critical issue.  
Only `version`s where the major and minor components haven't changed can be pushed as hotfixes.

### Properties

|Name|Description|Schema|
|---|---|---|
|**appId**|The ID of the app.|string (uuid)|
|**completedOn**|Date and time (UTC) when the hotfix was applied.|string (date-time)|
|**countryCode**|The country code.|string|
|**createdOn**|Date and time (UTC) when the hotfix request was created.|string (date-time)|
|**environmentAadTenantId**|The ID of the customer's Azure Active Directory tenant.|string (uuid)|
|**environmentApplicationFamily**|The environment's application family.|string|
|**environmentName**|The environment's name.|string|
|**errorMessage**|The error message provided when the hotfix was unable to be applied.|string|
|**id**|The ID hotfix request.|string (uuid)|
|**ignoreUpgradeWindow**|Determines whether the environment's upgrade window should be ignored when applying the hotfix.|boolean|
|**runAfter**|Date and time (UTC) after which hotfix should start to be applied.|string (date-time)|
|**sourceAppVersion**|The version of the app that was installed before the hotfix was applied.|string|
|**startedOn**|Date and time (UTC) when the hotfix started to be applied.|string (date-time)|
|**status**|Status.|enum (Scheduled, Running, Succeeded, Failed, Canceled, Skipped)|
|**targetAppVersion**|The version of the app containing the fixes that should be applied. The value is the version that the app will be updated to.|string|

### List environment hotfixes

Lists all the hotfix operations that were requested for a specific `app` and `country`.

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/environmentHotfixes?$filter=<odata_filter>
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|query|$filter|Restricts the set of items returned.|OData filter|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/environmentHotfixes?$filter=targetAppVersion eq '16.0.1.2'
```

#### Example Response

```json
{
    "value": [
        {
            "id": "db311b6a-062e-4756-b17e-73aeb89c45cc", 
            "environmentAadTenantId": "539a833c-4e6a-42d8-a081-27fa9d810424",
            "sourceAppVersion": "16.0.0.5",
            "targetAppVersion": "16.0.1.2",
            "status": "Scheduled",
            "createdOn": "2020-03-05T15:41:20.6468128Z",
            "runAfter": "2020-03-05T17:30:00.0000000Z",
            "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
            "countryCode": "US",
            "environmentApplicationFamily": "Business Central",
            "environmentName": "MyCustomer",
            "environmentType": "Production"
        }
    ]
}
```

### Get environment hotfix

Gets an `environment hotfix` operation by its ID.  
This endpoint can be used to track the status/outcome of a hotfix request.
```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/environmentHotfixes/{id}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|path|id|The ID of the hotfix request.|string (uuid)|

#### Example Request

```
GET https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/environmentHotfixes/db311b6a-062e-4756-b17e-73aeb89c45cc
```

#### Example Response

```json
{
    "id": "db311b6a-062e-4756-b17e-73aeb89c45cc", 
    "environmentAadTenantId": "539a833c-4e6a-42d8-a081-27fa9d810424",
    "sourceAppVersion": "16.0.0.5",
    "targetAppVersion": "16.0.1.2",
    "status": "Scheduled",
    "createdOn": "2020-03-05T15:41:20.6468128Z",
    "runAfter": "2020-03-05T17:30:00.0000000Z",
    "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
    "countryCode": "US",
    "environmentApplicationFamily": "Business Central",
    "environmentName": "MyCustomer",
    "environmentType": "Production"
}
```

### Schedule environment hotfix

Schedules a hotfix for a specific `environment` to the specified `version`.  
The hotfix operation ID that is returned can be used to track the status/outcome of the operation (see: [Get environment hotfix](#get-environment-hotfix)).

```
POST https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/environmentHotfixes
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|body|environmentHotfix|Environment hotfix to schedule.|[Environment Hotfix](#environment-hotfix)|

#### Example Request

```
POST https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/environmentHotfixes

{
    "environmentAadTenantId": "539a833c-4e6a-42d8-a081-27fa9d810424",
    "targetAppVersion": "16.0.1.2",
    "runAfter": "2020-03-05T17:30:00.0000000Z",
    "environmentApplicationFamily": "Business Central",
    "environmentName": "MyCustomer",
    "environmentType": "Production"
}
```

#### Example Response

```json
{
    "id": "db311b6a-062e-4756-b17e-73aeb89c45cc", 
    "environmentAadTenantId": "539a833c-4e6a-42d8-a081-27fa9d810424",
    "sourceAppVersion": "16.0.0.5",
    "targetAppVersion": "16.0.1.2",
    "status": "Scheduled",
    "createdOn": "2020-03-05T15:41:20.6468128Z",
    "runAfter": "2020-03-05T17:30:00.0000000Z",
    "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
    "countryCode": "US",
    "environmentApplicationFamily": "Business Central",
    "environmentName": "MyCustomer",
    "environmentType": "Production"
}
```

### Update environment hotfix

Updates an existing `environment hotfix` operation.  
It can currently only be used to cancel a requested hotfix that hasn't yet started running.

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/{appId}/countries/{countryCode}/environmentHotfixes/{id}
```

#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The ID of the app.|string (uuid)|
|path|countryCode|The country code.|string|
|path|id|The ID of the hotfix request.|string (uuid)|
|body|environmentHotfix|Environment hotfix properties to update.|[Environment Hotfix](#environment-hotfix)|

#### Example Request

```
PATCH https://apps.businesscentral.dynamics.com/v1.0/apps/41a68924-7fcf-4fd0-9200-f10f36a2e213/countries/US/environmentHotfixes/db311b6a-062e-4756-b17e-73aeb89c45cc

{
    "status": "Canceled"
}

```

#### Example Response

```json
{
    "id": "db311b6a-062e-4756-b17e-73aeb89c45cc", 
    "environmentAadTenantId": "539a833c-4e6a-42d8-a081-27fa9d810424",
    "sourceAppVersion": "16.0.0.5",
    "targetAppVersion": "16.0.1.2",
    "status": "Canceled",
    "createdOn": "2020-03-05T15:41:20.6468128Z",
    "runAfter": "2020-03-05T17:30:00.0000000Z",
    "appId": "41a68924-7fcf-4fd0-9200-f10f36a2e213",
    "countryCode": "US",
    "environmentApplicationFamily": "Business Central",
    "environmentName": "MyCustomer",
    "environmentType": "Production"
}
```

<!--## Endpoints

***
### GetCurrentUsersPermissionsAsync
#### Gets all permissions this request's user has to an app.
```
POST /v1.0/apps/{appId}/getMyPermissions
```
#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The id of the app to get the permissions for.|string (uuid)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[ListResult[Permission]](#listresult[permission])|
|**404**|Not Found||

#### Produces
- `text/plain`
- `application/json`
- `text/json`

***
### ListRoles
#### Lists all available roles.
```
GET /v1.0/apps/{appId}/roles
```
#### Parameters
|Type|Name|Description|Schema|
|---|---|---|---|
|path|appId|The id of the app to list the roles for.|string (uuid)|

#### Responses
|HTTP Code|Description|Schema|
|---|---|---|
|**200**|Success|[ListResult[Role]](#listresult[role])|
|**404**|Not Found||

#### Produces
- `text/plain`
- `application/json`
- `text/json`
-->

## Getting detailed error messages

To get detailed error messages from t API calls, wrap the calls in a try-catch block, as shown in the following PowerShell example: 

```powershell
try {
    Invoke-WebRequest ....
} 
catch [System.Net.WebException]
{
    $Exception = $_.Exception
    $respStream = $Exception.Response.GetResponseStream()
    $reader = New-Object System.IO.StreamReader($respStream)
    $respBody = $reader.ReadToEnd() | ConvertFrom-Json | ConvertTo-Json -Depth 100
    $reader.Close();
    Write-Error $Exception.Response.Headers["ms-correlation-x"]
    Write-Error $Exception.Message
    Write-Error $respBody -ErrorAction Stop
}
```
Please make sure you provide full output in textual format when reporting the issues to Microsoft. 

## See Also

[App Management for ISVs](app-management-overview.md)  
