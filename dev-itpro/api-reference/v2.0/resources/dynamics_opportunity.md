---
title: opportunity resource type
description: An opportunity object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/24/2021
ms.author: solsen
---

# opportunity resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents an opportunity in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET opportunity](../api/dynamics_opportunity_get.md)|opportunity|Gets a opportunity object.|
|[DELETE opportunity](../api/dynamics_opportunity_delete.md)|none|Deletes a opportunity object.|
|[POST opportunity](../api/dynamics_opportunity_create.md)|opportunity|Creates a opportunity object.|
|[PATCH opportunity](../api/dynamics_opportunity_update.md)|opportunity|Updates a opportunity object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[contact](dynamics_contact.md)|contact |Gets the contact of the opportunity.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the opportunity. Non-editable.|
|number|string|Specifies the number of the opportunity.|
|contactNumber|string|The number of the contact.|
|contactName|string|The name of the contact.|
|contactCompanyName|string||
|salespersonCode|string||
|description|string|Specifies the description of the opportunity.|
|status|NAV.opportunityStatus||
|closed|boolean||
|creationDate|date||
|dateClosed|date||
|calculatedCurrentValue|decimal||
|chancesOfSuccessPrc|decimal||
|completedPrc|decimal||
|estimatedClosingDate|date||
|estimatedValue|decimal||
|systemCreatedAt|datetime|The datetime the company was created.|
|lastModifiedDateTime|datetime|The last datetime the opportunity was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the opportunity resource.


```json
{
    "id": "GUID",
    "number": "string",
    "contactNumber": "string",
    "contactName": "string",
    "contactCompanyName": "string",
    "salespersonCode": "string",
    "description": "string",
    "status": "NAV.opportunityStatus",
    "closed": "boolean",
    "creationDate": "date",
    "dateClosed": "date",
    "calculatedCurrentValue": "decimal",
    "chancesOfSuccessPrc": "decimal",
    "completedPrc": "decimal",
    "estimatedClosingDate": "date",
    "estimatedValue": "decimal",
    "systemCreatedAt": "datetime",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->

## See Also
[GET opportunity](../api/dynamics_opportunity_get.md)  
[DELETE opportunity](../api/dynamics_opportunity_delete.md)  
[POST opportunity](../api/dynamics_opportunity_create.md)  
[PATCH opportunity](../api/dynamics_opportunity_update.md)
