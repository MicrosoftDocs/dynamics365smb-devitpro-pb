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

# Authorization Trace

The authorization trace provides information about the authorization of users try to sign in to Business Central, including:

- Success or failure of the sign-in attempt
- Reason for failure
- Type of user (such as normal, administrator, or delegated user) 
- Whether the user belongs to the tenant or is an invited user. 
- The opened company / If the user can't open the company (authorization issue etc..)

### <a name="LRSQLQuery"></a>Dimensions for long running SQL queries emitted to Application Insights

The following tables explains the columns included in authentication events emitted to Application Insights. Bold text indicates that the value of the columns is a constant. Some columns are standard for Application Insights. These are indicated by *Application Insights*.

### Message: Success Authorization

|Column|Description or value||
|---------|-----|-----------|
|Authorization status|`Succeeded` indicates that the sign in was successful.|
|Guest user|`true` indicates that the user is a guest user on the tenant.<br />`false`indicates the user is belongs to the tenant.||
|Entitlement set Ids |Specifies the entitlements that the user has in Business Central.||
|Telemetry schema version|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|User type|Specifies whether the user is an `Internal_Admin`, `Normal user`, or `Delegated_admin`||


### Message: Failed Authorization

|Column|Description or value||
|---------|-----|-----------|
|Authorization status|`Failed` indicates that the sign-in failed.|
|Guest user|`true` indicates that the user is a guest user on the tenant.<br />`false`indicates the user is belongs to the tenant.||
|Entitlement set Ids |Specifies the entitlements that the user has in Business Central.||
|Telemetry schema version|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|User type|Specifies whether the user is an `Internal_Admin`, `Normal user`, or `Delegated_admin`||
|Failure reason|Specifies why the sign-in failed. Possible values include:<br /> `User is disabled in Business Central.<br />`User does not have entitlements in Business Central. the user is an `Internal_Admin`, `Normal user`, or `Delegated_admin`||


## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
