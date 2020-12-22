---
title: "Introduction to automation APIs"
description: APIs used to hydrate a Dynamics 365 Business Central tenant. Using the automation APIs, companies can be created, extensions installed, permissions assigned, and RapidStart packages applied.
author: henrikwh
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Introduction to automation APIs

Automation APIs provide capability for automating company setup through APIs. Once the tenants have been created, the automation APIs can be used, in order to hydrate the tenant - to bring the tenant up to a desired state. Usually this involves creating a new company on the tenant, running RapidStart packages, installing extensions, adding users to user groups and assigning permission sets to users.

Delegated admin credentials and [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)] users with permissions, can call the APIs.

[!INCLUDE [admin-azure-ad-preconsent](../developer/includes/admin-azure-ad-preconsent.md)]

Automation APIs are placed in the `microsoft/automation` API namespace. In all the examples below, parameters are marked in parenthesis `{}`. Make sure that only valid parameters are passed.

## Create a company

To create a company, an automationCompany endpoint is available. To create a Company issue a [POST request](dynamics-microsoft-automation-automationCompanies-post.md) as shown in the following example.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/automationCompanies
Authorization: Bearer {token}
Content-type: application/json
{
    "name": "CRONUS",
    "displayName": "CRONUS",
    "businessProfileId": ""
}
```

The {companyId} must be the ID of an valid company on the tenant. Issue a [GET automationCompany](dynamics-microsoft-automation-automationCompanies-get.md) request to fetch existing companies. 

> [!NOTE]  
> The company which is created will not be initialized.

To rename a company, issue a [PATCH automationCompanies](dynamics-microsoft-automation-automationcompanies-patch.md).

## Upload and apply a RapidStart package

RapidStart is uploaded, installed, and applied using the APIs described below. RapidStart operations can be time consuming. To get the current status of the RapidStart packages and running operations issue a [GET configurationPackages](dynamics-microsoft-automation-configurationpackage-get.md) as shown in the following example.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/configurationPackages

Authorization: Bearer {token}
```

In the response, status for the import and apply status will be shown, as well as information about the RapidStart package.

### Insert RapidStart

First step is to create the configuration package, by issuing a [POST configurationPackages](dynamics-microsoft-automation-configurationpackage-post.md) in the [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)] tenant. Once the configuration package is created, the RapidStart package can be uploaded. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/configurationPackages

Authorization: Bearer {token}
Content-type: application/json
{
    "code":"{SAMPLE}",
    "packageName": "{SAMPLE}"
}
```

### Upload RapidStart package

Once the configuration package is created, a RapidStart package can be uploaded with a [PATCH configurationPackages](dynamics-microsoft-automation-configurationpackage-patch.md). See the example below.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/configurationPackages({Id})/file('{SAMPLE}')/content

Authorization: Bearer {token}
Content-type: application/octet-stream
If-Match: *
Body: RapidStart file.
```

### Import and apply RapidStart package

Once uploaded, the RapidStart package needs to be imported by issuing a [POST on the bound action Microsoft.NAV.import](dynamics-microsoft-automation-configurationpackage-post.md).

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/configurationPackages({Id})/Microsoft.NAV.import

Authorization: Bearer {token}
```

When the RapidStart package is imported it can applied with a [POST on bound action Microsoft.NAV.apply](dynamics-microsoft-automation-configurationpackage-post.md).

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/configurationPackages({Id})/Microsoft.NAV.apply

Authorization: Bearer {token}
```

## Managing users, user groups, and permission sets

The automation APIs enable users to be set up in [!INCLUDE[d365fin_long_md](../developer/includes/d365fin_long_md.md)].

### Modifying user properties

Get the current user properties by issuing a [GET users](dynamics-microsoft-automation-user-get.md). This will get the UserSecurityId needed on subsequent requests.

To modify the user, create a [PATCH user](dynamics-microsoft-automation-user-patch.md) request as shown in the example below.

```json
PATCH https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({id})/users({userSecurityId})
Content-type: application/json
If-Match:*
{
    "state": "Enabled",
    "expiryDate": "2035-01-01T21:03:53.444Z"
}
```

### Assign user permissions and user groups

To assign users to a user group, issue a [POST request](dynamics-microsoft-automation-usergroupmember-post.md) against the **userGroupMembers** entity. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/users({userSecurityId})/userGroupMembers

Authorization: Bearer {token}
{ 
    "code": "D365 EXT. ACCOUNTANT",
    "companyName" :"CRONUS USA, Inc."
}
```

To retrieve the list of user groups issue a [GET userGroups](dynamics-microsoft-automation-usergroup-get.md). This will return the information that you need for the payload above.

Assigning permission sets is identical to adding users to user groups. [GET permissionSet](dynamics-microsoft-automation-permissionset-get.md) returns information about the available permission sets. To assign a permissionSet issue a [POST userPermission](dynamics-microsoft-automation-userpermission-post.md) as shown in the following example.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/users({userSecurityId})/userPermissions

Authorization: Bearer {token}
{ 
    "id": "SECURITY"
}
```

Removing the permissionSet from the user is done by issuing a [DELETE userPermissions](dynamics-microsoft-automation-userpermission-delete.md) on the users entity.

## Handling tenant extensions

Add-on extensions which are already published to the tenant can be installed and uninstalled. Per-tenant extensions can be uploaded and installed. To get the list of all extensions on the tenant, issue a [GET extensions](dynamics-microsoft-automation-extension-get.md). This will return the packageId needed for installing and uninstalling extensions.

### Installing and uninstalling published add-on extensions

There are two bound actions available on the **extensions** endpoint: `Microsoft.NAV.install` and `Microsoft.NAV.uninstall`.

Issue a [POST extension](dynamics-microsoft-automation-extension-post.md) using the bound actions. See the example below.

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/2.0/companies({companyId})/extensions({packageId})/Microsoft.NAV.install

Authorization: Bearer {token}
```

### Upload and install a per-tenant extension

Issue a [PATCH](dynamics-microsoft-automation-extensionupload-patch.md) against the **extensionUpload** endpoint to upload and install the extension. 

> [!NOTE]  
> Installing per-tenant extensions using Automation APIs is only possible in SaaS.

Uninstalling the extension can be done through the bound action [Microsoft.NAV.uninstall](dynamics-microsoft-automation-extension-post.md), as with the add-on extensions.  

### Monitoring extension installation progress

To view ongoing extension installation status, issue [GET extensionDeploymentStatus](dynamics-microsoft-automation-extensionDeploymentStatus-get.md) as shown in the following example.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/automation/v1.0/companies({companyId})/extensionDeploymentStatus
```

## See Also

[Automation API overview](dynamics-microsoft-automation-overview.md)  
