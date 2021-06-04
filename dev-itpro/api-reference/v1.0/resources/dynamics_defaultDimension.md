---
title: (v1.0) defaultDimensions resource type
description: (v1.0) A defaultDimensions in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# defaultDimensions resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a dimension in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:-------------|:-------------|:----------|
|[GET defaultDimensions](../api/dynamics_defaultdimensions_get.md)|dimension|Gets defaultDimensions for an entity.|
|[POST defaultDimensions](../api/dynamics_defaultdimensions_create.md)|dimension|Gets defaultDimensions for an entity.|
|[PATCH defaultDimensions](../api/dynamics_defaultdimensions_update.md)|dimension|Gets defaultDimensions for an entity.|
|[DELETE defaultDimensions](../api/dynamics_defaultdimensions_delete.md)|dimension|Gets defaultDimensions for an entity.|


## Properties

| Property           | Type                  |Description               |
|:-------------------|:----------------------|:-------------------------|
|parentId                  |GUID                   |The unique ID of the entity.|
|dimensionId                  |GUID                   |The unique ID of the dimension.|
|dimensionCode                |string, maximum size 20|The dimension code.       |
|dimensionValueId                  |GUID                   |The unique ID of the dimension value.|
|dimensionValueCode                |string, maximum size 20|The dimension value code.       |
|postingValidation |string|

## JSON representation

Here is a JSON representation of the resource.


```json
{
  "parentId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "dimensionId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "dimensionCode": "string",
  "dimensionValueId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
  "dimensionValueCode": "string",
  "postingValidation": "string",
  "account": {
    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "number": "string",
    "displayName": "string",
    "category": "string",
    "subCategory": "string",
    "blocked": true,
    "lastModifiedDateTime": "2019-03-22T09:03:59.565Z"
  },
  "dimension": {
    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "code": "string",
    "displayName": "string",
    "lastModifiedDateTime": "2019-03-22T09:03:59.565Z",
    "dimensionValues": [
      {
        "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "code": "string",
        "displayName": "string",
        "lastModifiedDateTime": "2019-03-22T09:03:59.565Z"
      }
    ]
  },
  "dimensionValue": {
    "id": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
    "code": "string",
    "displayName": "string",
    "lastModifiedDateTime": "2019-03-22T09:03:59.565Z"
  }
}
```


## See also
[Get defaultDimensions](../api/dynamics_defaultdimensions_get.md)  
[Create defaultDimensions](../api/dynamics_defaultdimensions_create.md)  
[Update defaultDimensions](../api/dynamics_defaultdimensions_update.md)  
[Delete defaultDimensions](../api/dynamics_defaultdimensions_delete.md)  
