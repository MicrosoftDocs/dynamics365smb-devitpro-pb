---
title: automationCompany resource type | Microsoft Docs
description: An automation company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# automationCompany resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an automation company in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE [prod_short](../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](/dynamics365/dynamics-nav/api-reference/v2.0/enabling-apis-for-dynamics-nav).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET automationCompany](../api/dynamics_automationcompany_get.md)|automationCompany|Gets a automation company object.|
|[DELETE automationCompany](../api/dynamics_automationcompany_delete.md)|none|Deletes a automation company object.|
|[POST automationCompany](../api/dynamics_automationcompany_create.md)|automationCompany|Creates a automation company object.|
|[PATCH automationCompany](../api/dynamics_automationcompany_update.md)|automationCompany|Updates a automation company object.|



## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the item. Non-editable.|
|name|string|Represents the automation company's name.|
|evaluationCompany|boolean|Specifies the whether the Company is an evaluation company.|
|displayName|string|Specifies the automation company's name. This name will appear on all sales documents for the automation company.|
|businessProfileId|string|Specifies the Business Profile ID linked to the company.|

## JSON representation

Here is a JSON representation of the automationCompany resource.


```json
{
    "id": "GUID",
    "name": "string",
    "evaluationCompany": "boolean",
    "displayName": "string",
    "businessProfileId": "string"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET automationCompany](../api/dynamics_automationcompany_get.md)  
[DELETE automationCompany](../api/dynamics_automationcompany_delete.md)  
[POST automationCompany](../api/dynamics_automationcompany_create.md)  
[PATCH automationCompany](../api/dynamics_automationcompany_update.md)  
