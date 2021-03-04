---
title: Analyzing Permission Changes Trace Telemetry
description: Learn about the telemetry for permission changes made in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/24/2020
ms.author: jswymer
---

# Analyzing Permission Changes Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, version 17.2, and later

Permission changes telemetry gathers data about the following operations on permission sets: 

- A user-defined permission set was added or removed
- A link between a user-defined permission set and system permission set was added or removed
- A permission set was assigned to or removed from a user or user group

For information about managing permission sets, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

## <a name="setadded"></a>User-defined permission set added

Occurs when a user-defined permission set is created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**User-defined permission set added: {alPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2A**|
|alNumberOfUserDefinedPermissionSets|Specifies the total number of user-defined permission sets.|
|alPermissionSetId|Specifies the ID assigned to the permission set.|

<a name="other"></a>**Common custom dimensions**

The following table explains additional custom dimensions that are common to all permission traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alCategory|**AL PermissionSet**|
|alDataClassification|**SystemMetadata**|
|alObjectId|**1351**, which is the ID of the system application codeunit that subscribes to the telemetry events.|
|alObjectName|**Telemetry Subscribers**, which is the name of the system application codeunit that subscribes to the telemetry events.|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


<!--
{"component":"Dynamics 365 Business Central Server","Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18466.0","componentVersion":"17.0.18466.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E2A","alObjectId":"1351","alObjectName":"Telemetry Subscribers","alObjectType":"CodeUnit","alDataClassification":"SystemMetadata","alCategory":"AL PermissionSet","alNumberOfUserDefinedPermissionSets":"10","alPermissionSetId":"EMAIL SETUP COPY"}

-->

## <a name="setremoved"></a>User-defined permission set removed

Occurs when a user-defined permission set is deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**User-defined permission set removed: {alPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2B**|
|alNumberOfUserDefinedPermissionSets|Specifies the total number of user-defined permission sets.|
|alPermissionSetId|Specifies the ID of the permission set that was deleted.|
|[See common custom dimensions](#other)||

## <a name="linkadded"></a>Permission set link added

Occurs when a user-defined permission set is created from a copy of a system permission set, and the **Notify on Changed Permission Set** option is selected. The **Notify on Changed Permission Set** option creates a link between the system permission set and the user-defined permission set. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set link added: {alSourcePermissionSetId} -> {alLinkedPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E28**|
|alSourcePermissionSetId|Specifies the ID of the system permission set that was copied to create the user-defined permission set.|
|alLinkedPermissionSetId|Specifies the ID of the user-defined permission that was created from a copy of the system permission set.|
|alNumberOfUserDefinedPermissionSetLinks|Specifies the total number of user-defined permission sets that are linked to system permission sets.|
|[See common custom dimensions](#other)||

## <a name="linkremoved"></a>Permission set link removed

Occurs when a user-defined permission set, which is linked to a system permission set, is deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set link removed {alSourcePermissionSetId} -> {alLinkedPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E29**|
|alSourcePermissionSetId|Specifies the ID of the system permission set that the deleted user-defined permission set was linked to.|
|alLinkedPermissionSetId|Specifies the ID of the deleted user-defined permission set.|
|alNumberOfUserDefinedPermissionSetLinks|Specifies the total number of user-defined permission sets that are linked to system permission sets.|
|[See common custom dimensions](#other)||

## <a name="assigneduser"></a>Permission set assigned to user 

Occurs when a permission set is assigned to a user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set assigned to user: {alPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2C**|
|alPermissionSetId|Specifies the ID of the permission set that was assigned to a user.|
|[See common custom dimensions](#other)||

## <a name="removeduser"></a>Permission set removed from user  

Occurs when a permission set is removed from a user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set removed from user: {alPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2D**|
|alPermissionSetId|Specifies the ID of the permission set that was removed from the user.|
|[See common custom dimensions](#other)||


## <a name="assignedusergroup"></a>Permission set assigned to user group

Occurs when a permission set is assigned to a user group.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set assigned to user group: {alPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2E**|
|alPermissionSetId|Specifies the ID of the permission set that was assigned to the user group.|
|alUserGroupId|Specifies the ID of the user group that the permission set was assigned to.|
|[See common custom dimensions](#other)||

## <a name="removedusergroup"></a>Permission set removed from user group

Occurs when a permission set is removed from a user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set removed from user group: {alPermissionSetId}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2F**|
|alPermissionSetId|Specifies the ID of the permission set that was removed from the user group.|
|alUserGroupId|Specifies the ID of the user group that the permission set was removed from.|
|[See common custom dimensions](#other)||


## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
