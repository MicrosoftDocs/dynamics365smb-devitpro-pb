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

# Analyzing Authorization Telemetry

Authorization telemetry provides information about the authorization of users when they try to sign in to Business Central. This telemetry data can help you identify problems a user might experience when signing in. Authorization signals are emitted in two stages of sign-in. The first stage is the initial authorization, where the user account is verified that it is enabled in the tenant and has the correct entitlements. The telemetry data includes:

- Success or failure of the sign-in attempt
- Reason for failure
- Type of user (such as normal, administrator, or delegated user)
- Whether the user belongs to the tenant or is an invited user

The next stage occurs after a successful authorization attempt, when trying to open the company (that is, when the CompanyOpen trigger run). etry is provided about the opening the company, indicating whether the company was opened successfully  or failed for a specific reason.

## Success Authorization (Pre Open Company)

Occurs when a user has been successfully authorized.

### General dimensions

The following tables explains the dimensions included in a **Success Authorization** signal.

|Dimension|Description or value||
|---------|-----|-----------|
|message|**Authorization steps prior to the open company trigger succeeded.**||
|severityLevel|**1**||
|operation_Name|**Success Authorization (Pre Open Company)**||

### Custom dimensions

The following tables explains the custom dimensions included in a **Success Authorization** signal.

|Dimension|Description or value||
|---------|-----|-----------|
|authorizationStatus|**Succeeded**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user is belongs to the tenant.||
|entitlementSetIds |Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. Currently, the version is **0.2** ||
|userType|Specifies whether the user is an **Internal_Admin**, **Normal user**, or **Delegated_admin**||

## Operation: Failed Authorization (Pre Open Company)

Occurs when a user sign-in in has failed authorization.

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Column|Description or value||
|---------|-----|-----------|
|message|**Authorization steps prior to the open company trigger failed, see failureReason column for details.**||
|severityLevel|**1**||
|operation_Name|**Authorization Failed (Pre Open Company)**||

### Custom dimensions

|Column|Description or value||
|---------|-----|-----------|
|authorizationStatus|**Failed**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user is belongs to the tenant.||
|entitlementSetIds|Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|userType|Specifies whether the user is an **Internal_Admin**, **Normal user**, or **Delegated_admin**||
|Failure reason|Specifies why the sign-in failed. Possible values include:<br /> `User is disabled in Business Central.<br />`User does not have entitlements in Business Central. ||

## Operation: Authorization Succeeded (Open Company)

Occurs when the company has opened successfully.

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Column|Description or value||
|---------|-----|-----------|
|message|**Authorization steps in the open company trigger succeeded.**||
|severityLevel|**1**||
|operation_Name|**Authorization Failed (Pre Open Company)**||

### Custom dimensions

|Column|Description or value||
|---------|-----|-----------|
|authorizationStatus|**Failed**|
|guestUser|**true** indicates that the user is a guest user on the tenant.<br />**false** indicates the user is belongs to the tenant.||
|entitlementSetIds|Specifies the entitlements that the user has in Business Central.||
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|userType|Specifies whether the user is an **Internal_Admin**, **Normal user**, or **Delegated_admin**||
|Failure reason|Specifies why the sign-in failed. Possible values include:<br /> `User is disabled in Business Central.<br />`User does not have entitlements in Business Central. ||

## Operation: Authorization Failed (Open Company)

Occurs when a company has failed to open.  

### General dimensions

The following tables explains the columns included in a Success Authorization trace.

|Column|Description or value||
|---------|-----|-----------|
|message|**Authorization steps in the open company trigger failed, see failureReason column for details.**||
|severityLevel|**1**||
|operation_Name|**Authorization Failed (Pre Open Company)**||

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
