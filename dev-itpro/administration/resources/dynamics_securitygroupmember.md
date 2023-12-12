---
title: securityGroupMember resource type
description: A security group member object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/04/2023
ms.author: solsen
---

# securityGroupMember resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a security group member in [!INCLUDE[prod_short](../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../../api-reference/v2.0/enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET securityGroupMember](../api/dynamics_securitygroupmember_get.md)|securityGroupMember|Gets a security group member object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[user](dynamics_user.md)|user |Gets the user of the securityGroupMember.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|securityGroupCode|string||
|userSecurityId|GUID|The unique ID of the user security.|
|securityGroupName|string||

## JSON representation

Here is a JSON representation of the securityGroupMember resource.


```json
{
    "securityGroupCode": "string",
    "userSecurityId": "GUID",
    "securityGroupName": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET securityGroupMember](../api/dynamics_securitygroupmember_get.md)
