---
title: Authorization Trace | Microsoft Docs
description: Learn about the Authorization telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/15/2019
ms.author: jswymer
---

# Authorization Telemetry 

Authorization telemetry provides information about the authorization of users when they try to sign in to Business Central, including:  

- Success or failure of the sign-in attempt
- Reason for failure
- Type of user (such as normal, administrator, or delegated user)
- Whether the user belongs to the tenant or is an invited user

After a successful authorization attempt, additional telemetry is provided about the opening the company, indicating hether the company was successfuly opened or failed for a specific reason. 


## Operation: Success Authorization

Occurs when a user is successfully authorized.

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Column|Description or value||
|---------|-----|-----------|
|message|**Authorization Attempt**||
|severityLevel|**1**||
|operation_Name|**Success Authorization**||

### Custom dimensions

|Column|Description or value||
|---------|-----|-----------|
|authorizationStatus|`Succeeded`|
|guestUser|`true` indicates that the user is a guest user on the tenant.<br />`false`indicates the user is belongs to the tenant.||
|entitlementSetIds |Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|userType|Specifies whether the user is an `Internal_Admin`, `Normal user`, or `Delegated_admin`||

### Operation: Failed Authorization

Occurs when a user sign-in in fails authorization.

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Column|Description or value||
|---------|-----|-----------|
|message|**Authorization Attempt**||
|severityLevel|**1**||
|operation_Name|**Failed Authorization**||

### Custom dimensions

|Column|Description or value||
|---------|-----|-----------|
|authorizationStatus|**Failed**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user is belongs to the tenant.||
|entitlementSetIds|Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|userType|Specifies whether the user is an **Internal_Admin**, **Normal user**, or **Delegated_admin**||
|Failure reason|Specifies why the sign-in failed. Possible values include:<br /> `User is disabled in Business Central.<br />`User does not have entitlements in Business Central. ||




## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
