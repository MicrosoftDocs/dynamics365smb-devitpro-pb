---
title: Introduction to automation APIs
description: APIs used to hydrate a Dynamics 365 Business Central tenant. Using the automation APIs, companies can be created, extensions installed, permissions assigned, and RapidStart packages applied.
author: SusanneWindfeldPedersen
ms.date: 02/04/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Introduction to automation APIs

Automation APIs provide capability for automating company setup through APIs. Once the tenants are created, the automation APIs can be used, in order to hydrate the tenant - to bring the tenant up to a desired state. Usually this involves creating a new company on the tenant, running RapidStart packages, installing extensions, assigning permission sets to users, and managing security groups.

Delegated admin credentials and [!INCLUDE [prod_short](../developer/includes/prod_short.md)] users with permissions, can call the APIs.

[!INCLUDE [admin-azure-ad-preconsent](../developer/includes/admin-azure-ad-preconsent.md)]

Automation APIs are placed in the `microsoft/automation` API namespace. In all the examples below, parameters are marked in parenthesis `{}`. Make sure that only valid parameters are passed.

## Create a company

To create a company, an automationCompany endpoint is available. To create a company, issue a [POST request](api/dynamics_automationCompany_create.md) as shown in the following example.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/automationCompanies
Authorization: Bearer {token}
Content-type: application/json
{
    "name": "CRONUS",
    "displayName": "CRONUS",
    "businessProfileId": ""
}
```

The {companyId} must be the ID of a valid company on the tenant. Issue a [GET automationCompany](api/dynamics_automationCompany_get.md) request to fetch existing companies. 

> [!NOTE]  
> The company, which is created won't be initialized.

To rename a company, issue a [PATCH automationCompanies](resources/dynamics_automationcompany.md).

## Upload and apply a RapidStart package

RapidStart is uploaded, installed, and applied using the APIs described below. RapidStart operations can be time consuming. To get the current status of the RapidStart packages and running operations issue a [GET configurationPackages](resources/dynamics_configurationpackage.md) as shown in the following example.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages

Authorization: Bearer {token}
```

In the response, status for the import and apply status is shown, and information about the RapidStart package.

### Insert RapidStart

First step is to create the configuration package, by issuing a [POST configurationPackages](api/dynamics_configurationpackage_create.md) in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] tenant. Once the configuration package is created, the RapidStart package can be uploaded. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages

Authorization: Bearer {token}
Content-type: application/json
{
    "code":"{SAMPLE}",
    "packageName": "{SAMPLE}"
}
```

### Upload RapidStart package

Once the configuration package is created, a RapidStart package can be uploaded with a [PATCH configurationPackages](api/dynamics_configurationpackage_update.md). See the example below.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})/file('{SAMPLE}')/content

Authorization: Bearer {token}
Content-type: application/octet-stream
If-Match: *
Body: RapidStart file.
```

### Import and apply RapidStart package

Once uploaded, the RapidStart package needs to be imported by issuing a [POST on the bound action Microsoft.NAV.import](api/dynamics_configurationpackage_create.md).

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})/Microsoft.NAV.import

Authorization: Bearer {token}
```

When the RapidStart package is imported, it can be applied with a [POST on bound action Microsoft.NAV.apply](api/dynamics_configurationpackage_create.md).

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/configurationPackages({packageId})/Microsoft.NAV.apply

Authorization: Bearer {token}
```

## Managing users and permission sets

The automation APIs enable users to be set up in [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

### Modifying user properties

Get the current user properties by issuing a [GET users](api/dynamics_user_get.md). This gets the UserSecurityId needed on subsequent requests.

To modify the user, create a [PATCH user](api/dynamics_user_update.md) request as shown in the example below.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})
Content-type: application/json
If-Match:*
{
    "state": "Enabled",
    "expiryDate": "2035-01-01T21:03:53.444Z"
}
```

### Assign user permissions and user groups

> [!NOTE]  
> User groups are replaced with [Security groups](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/manage-user-permissions-using-security-groups) and will be deprecated in version 25. Learn more in [security group APIs](resources/dynamics_securitygroup.md).

To assign users to a user group, issue a [POST request](api/dynamics_usergroupmember_create.md) against the **userGroupMembers** entity. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})/userGroupMembers

Authorization: Bearer {token}
{ 
    "code": "D365 EXT. ACCOUNTANT",
    "companyName" :"CRONUS USA, Inc."
}
```

To retrieve the list of user groups issue a [GET userGroups](api/dynamics_usergroup_get.md). This returns the information that you need for the payload above.

Assigning permission sets is identical to adding users to user groups. [GET permissionSet](api/dynamics_permissionset_get.md) returns information about the available permission sets. To assign a permissionSet issue a [POST userPermission](api/dynamics_userpermission_create.md) as shown in the following example.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/users({userSecurityId})/userPermissions

Authorization: Bearer {token}
{ 
    "roleId": "SECURITY"
}
```

Removing the permissionSet from the user is done by issuing a [DELETE userPermissions](api/dynamics_userpermission_delete.md) on the users entity.

### Get new users from Office 365

To get new users from Office 365, two bound actions on the **users** endpoint can be used: `Microsoft.NAV.getNewUsersFromOffice365` and `Microsoft.NAV.getNewUsersFromOffice365Async`. Both actions retrieve new users or new user information from the Office 365 portal but former one is designed for delegated admins and it runs synchronous and latter one schedules a background job, which makes it asynchronous. `Microsoft.NAV.getNewUsersFromOffice365Async` returns a link to the scheduled job where you can track the progress. You can also track the progress by issuing a [GET scheduledJobs](api/dynamics_scheduledjob_get.md) on the users entity. Existing, unchanged users won't be updated with these actions.

## Handling tenant extensions

Add-on extensions, which are already published to the tenant can be installed and uninstalled. Per-tenant extensions can be uploaded and installed. To get the list of all extensions on the tenant, issue a [GET extensions](api/dynamics_extension_get.md). This returns the packageId needed for installing and uninstalling extensions.

### Installing and uninstalling published add-on extensions

There are three bound actions available on the **extensions** endpoint: `Microsoft.NAV.install`, `Microsoft.NAV.uninstall`, and `Microsoft.NAV.uninstallAndDeleteExtensionData`.

Issue a POST extension using the bound actions. See the example below, use the same syntax for the other bound actions.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensions({packageId})/Microsoft.NAV.install

Authorization: Bearer {token}
```

### Unpublishing an uninstalled app

On the **extensions** endpoint, the `Microsoft.NAV.unpublish` is available to unpublish an uninstalled app.

Issue a POST extension using the bound action. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensions({packageId})/Microsoft.NAV.unpublish

Authorization: Bearer {token}
```

> [!NOTE]
> The `Microsoft.NAV.unpublish` bound action is introduced in version 25.4. It's used for unpublishing an app, which isn't installed. You can choose to either uninstall and then unpublish the app, or you can install a new version of the app, which leaves the old app uninstalled, and then you can unpublish the app to remove it from the extensions list.


### Upload and install a per-tenant extension

Use **extensionUpload** endpoint to upload and install the extension.

> [!NOTE]  
> Installing per-tenant extensions using Automation APIs is only possible in SaaS.

### Insert extension upload

First step is to create the configuration package, by issuing a [POST extensionUpload](api/dynamics_extensionupload_create.md) in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] tenant. Once the extension upload record is created, the extension can be uploaded. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensionUpload

Authorization: Bearer {token}
Content-type: application/json
{
    "schedule":"Current version",
    "schemaSyncMode": "Add"
}
```

> [!NOTE]  
> Schedule in the body can be "Current version", "Next minor version" or "Next major version".

> [!NOTE]  
> Schema Sync Mode in the body can be "Add" or "Force Sync".

### Upload extension file

Once the extension upload record is created, an extension file can be uploaded with a [PATCH extensionUpload](api/dynamics_extensionupload_update.md). See the example below.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensionUpload({extensionUploadId})/extensionContent

Authorization: Bearer {token}
Content-type: application/octet-stream
If-Match: *
Body: extension file.
```

### Install extension

Once extension file is uploaded, the extension needs to be installed by issuing a [POST on the bound action Microsoft.NAV.upload](api/dynamics_extensionupload_create.md).

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensionUpload({extensionUploadId})/Microsoft.NAV.upload

Authorization: Bearer {token}
```

Uninstalling the extension can be done through the bound action [Microsoft.NAV.uninstall](api/dynamics_extensionupload_create.md), as with the add-on extensions. The bound action Microsoft.NAV.uninstallAndDeleteExtensionData can be used to delete the tables that contain data owned by the extension on uninstall. This action can't be undone.

### Monitoring extension installation progress

To view ongoing extension installation status, issue [GET extensionDeploymentStatus](api/dynamics_extensionDeploymentStatus_get.md) as shown in the following example.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/extensionDeploymentStatus
```

## Handling Feature Management

### Get a list of available features

To view list of features available in feature management and their status issue a [GET FeatureManagement]()

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features
```

### Activate a feature

To activate a feature, issue a [POST activate]() on the bound action Microsoft.NAV.activate against the specific feature resource. Use the {featureId} value from the GET features response.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features({featureId})/Microsoft.NAV.activate
Authorization: Bearer {token}
{
	"updateInBackground":false,
	"startDateTime":"2025-07-08T16:00:00Z"
}
```

If successful, the request typically returns a "200" response. Use the GET features request to verify that the feature state has changed.


### Deactivate a feature

To deactivate a feature, issue a [POST deactivate]() on the bound action Microsoft.NAV.deactivate against the specific feature resource.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v2.0/companies({companyId})/features({featureId})/Microsoft.NAV.deactivate
Authorization: Bearer {token}
```

If successful, the request typically returns a "200" response. Use the GET features request to verify that the feature state has changed.


## Related information

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
[User permission](resources/dynamics_userpermission.md)  
[Control access to Business Central using security groups](/dynamics365/business-central/ui-security-groups)  
