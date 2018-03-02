---
title: unitsOfMeasure resource type | Microsoft Docs
description: A unit of measure object in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/08/2018
ms.author: solsen
---

# unitsOfMeasure resource type
Represents a unit of measure, which is a standard of measurement of a quantity, in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET unitsOfMeasure](../api/dynamics_unitsofmeasure_get.md)|unitsOfMeasure|Gets a unit of measure object.|
|[POST unitsOfMeasure](../api/dynamics_create_unitsofmeasure.md)|unitsOfMeasure|Creates a unit of measure object.|
|[PATCH unitsOfMeasure](../api/dynamics_unitsofmeasure_update.md)|unitsOfMeasure|Updates a unit of measure object.|
|[DELETE unitsOfMeasure](../api/dynamics_unitsofmeasure_delete.md)|none|Deletes a unit of measure object.|

## Properties
| Property	   | Type	|Description|
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
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get units of measure](../api/dynamics_unitsofmeasure_get.md)  
[Create units of measure](../api/dynamics_create_unitsofmeasure.md)  
[Update units of measure](../api/dynamics_unitsofmeasure_update.md)  
[Delete units of measure](../api/dynamics_unitsofmeasure_delete.md)  