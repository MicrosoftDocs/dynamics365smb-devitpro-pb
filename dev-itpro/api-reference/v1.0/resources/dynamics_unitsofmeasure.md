---
title: (v1.0) unitsOfMeasure resource type
description: (v1.0) A unit of measure object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# unitsOfMeasure resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a unit of measure, which is a standard of measurement of a quantity, in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET unitsOfMeasure](../api/dynamics_unitsofmeasure_get.md)|unitsOfMeasure|Gets a unit of measure object.|
|[POST unitsOfMeasure](../api/dynamics_create_unitsofmeasure.md)|unitsOfMeasure|Creates a unit of measure object.|
|[PATCH unitsOfMeasure](../api/dynamics_unitsofmeasure_update.md)|unitsOfMeasure|Updates a unit of measure object.|
|[DELETE unitsOfMeasure](../api/dynamics_unitsofmeasure_delete.md)|none|Deletes a unit of measure object.|

## Properties

| Property     | Type   |Description|
|:---------------|:--------|:----------|
|id|GUID|The unique ID of the unitsOfMeasure. Non-editable.|
|code|string|Specifies the code for the unit of measure.|
|displayName|string|Specifies the unit of measure's display name.|
|internationalStandardCode|string|Specifies the unit of measure code expressed according to the UNECE Rec20 standard in connection with electronic sending of sales documents.|
|lastModifiedDateTime|datetime|The last datetime the unit of measure was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the **unitsOfMeasure** resource.

```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "internationalStandardCode": "string",
  "lastModifiedDateTime": "datetime"
}
```

## See also

[Get Units of Measure](../api/dynamics_unitsofmeasure_get.md)  
[Create Units of Measure](../api/dynamics_create_unitsofmeasure.md)  
[Update Units of Measure](../api/dynamics_unitsofmeasure_update.md)  
[Delete Units of Measure](../api/dynamics_unitsofmeasure_delete.md)  