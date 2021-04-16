---
title: user resource type | Microsoft Docs
description: An user object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# user resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an user in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET user](../api/dynamics_user_get.md)|user|Gets a user object.|
|[PATCH user](../api/dynamics_user_update.md)|user|Updates a user object.|

## Bound Actions

The user resource type offers a bound action called `getNewUsersFromOffice365` which retrieves new users or new user information from the Office 365 portal. Note that existing, unchanged users will not be updated.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/microsoft/automation/v2.0/companies({id})/users({id})/Microsoft.NAV.createNewUsersFromAzureAD`

The response has no content; the response code is 204.

The user resource type offers a bound action called `getNewUsersFromOffice365Async` which schedules a background job to retrieve new users or new user information from the Office 365 portal. Note that existing, unchanged users will not be updated.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/microsoft/automation/v2.0/companies({id})/users({id})/Microsoft.NAV.createNewUsersFromAzureADAsync`

The response has a reference to the scheduled job to track the progress of the scheduled background job; the response code is 201.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[userGroupMembers](dynamics_usergroupmember.md)|userGroupMembers |Gets the usergroupmembers of the user.|
|[userPermissions](dynamics_userpermission.md)|userPermissions |Gets the userpermissions of the user.|
|[scheduledJobs](dynamics_scheduledjob.md)|scheduledJobs |Gets the scheduledjobs of the user.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|userSecurityId|GUID|The unique ID of the user security.|
|userName|string|Specifies the user name.|
|displayName|string|Specifies the user's name. This name will appear on all sales documents for the user.|
|state|string|Specifies the user's state.|
|expiryDate|datetime|The date of expiration.|

## JSON representation

Here is a JSON representation of the user resource.


```json
{
    "userSecurityId": "GUID",
    "userName": "string",
    "displayName": "string",
    "state": "string",
    "expiryDate": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET user](../api/dynamics_user_get.md)  
[PATCH user](../api/dynamics_user_update.md)  
