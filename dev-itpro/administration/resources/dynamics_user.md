---
title: user resource type
description: A user object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/02/2024
ms.author: solsen
ms.reviewer: solsen
---

# user resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an user in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).


## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET user](../api/dynamics_user_get.md)|user|Gets a user object.|
|[PATCH user](../api/dynamics_user_update.md)|user|Updates a user object.|

## Bound Actions

The user resource type offers a bound action called `getNewUsersFromOffice365Async` which get new users from office 365 asyncs the corresponding user batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/users({id})/Microsoft.NAV.getNewUsersFromOffice365Async`

The response has no content; the response code is 204.

The user resource type offers a bound action called `getNewUsersFromOffice365` which get new users from office 365s the corresponding user batch.
This is illustrated in the following example:
`POST https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/users({id})/Microsoft.NAV.getNewUsersFromOffice365`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[securityGroupMembers](dynamics_securitygroupmember.md)|securityGroupMembers |Gets the securitygroupmembers of the user.|
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
|contactEmail|string|Specifies the user's email.|

## JSON representation

Here is a JSON representation of the user resource.


```json
{
    "userSecurityId": "GUID",
    "userName": "string",
    "displayName": "string",
    "state": "string",
    "expiryDate": "datetime",
    "contactEmail": "string"
}
```

## Related information
[GET user](../api/dynamics_user_get.md)  
[PATCH user](../api/dynamics_user_update.md)  
