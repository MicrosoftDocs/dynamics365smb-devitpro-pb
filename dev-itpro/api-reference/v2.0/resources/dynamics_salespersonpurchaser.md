---
title: salespersonPurchaser resource type
description: A salesperson purchaser object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: na
ms.date: 04/28/2025
ms.author: solsen
---

# salespersonPurchaser resource type

Represents a salesperson purchaser in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET salespersonPurchaser](../api/dynamics_salespersonpurchaser_get.md)|salespersonPurchaser|Gets a salesperson purchaser object.|
|[DELETE salespersonPurchaser](../api/dynamics_salespersonpurchaser_delete.md)|none|Deletes a salesperson purchaser object.|
|[POST salespersonPurchaser](../api/dynamics_salespersonpurchaser_create.md)|salespersonPurchaser|Creates a salesperson purchaser object.|
|[PATCH salespersonPurchaser](../api/dynamics_salespersonpurchaser_update.md)|salespersonPurchaser|Updates a salesperson purchaser object.|
|[GET salespersonPurchaser](../api/dynamics_salespersonpurchaser_get.md)|salespersonPurchaser|Gets a salesperson purchaser object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the salesperson purchaser. Non-editable.|
|code|string|The code of the salesperson purchaser.|
|displayName|string|Specifies the salesperson purchaser's name. This name will appear on all sales documents for the salesperson purchaser.|
|email|string|Specifies the salesperson purchaser's email address.|
|email2|string||
|phoneNo|string||
|jobTitle|string|The job title of the salesperson purchaser.|
|commisionPercent|decimal||
|privacyBlocked|boolean|Specifies whether the privacy of the salesperson purchaser is blocked.|
|blocked|boolean|Specifies that entries cannot be posted to the salesperson purchaser. **True** indicates account is blocked and posting is not allowed.|
|lastModifiedDateTime|datetime|The last datetime the salesperson purchaser was modified. Read-Only.|

## JSON representation

Here's a JSON representation of the salespersonPurchaser resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "email": "string",
    "email2": "string",
    "phoneNo": "string",
    "jobTitle": "string",
    "commisionPercent": "decimal",
    "privacyBlocked": "boolean",
    "blocked": "boolean",
    "lastModifiedDateTime": "datetime"
}
```

## Related information

[GET salespersonPurchaser](../api/dynamics_salespersonpurchaser_get.md)  
[DELETE salespersonPurchaser](../api/dynamics_salespersonpurchaser_delete.md)  
[POST salespersonPurchaser](../api/dynamics_salespersonpurchaser_create.md)  
[PATCH salespersonPurchaser](../api/dynamics_salespersonpurchaser_update.md)
