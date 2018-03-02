---
title: shipmentMethods resource type | Microsoft Docs
description: A shipment method in Dynamics 365 for Finance and Operations, Business edition. 
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

# shipmentMethods resource type
Represents a method of shipment in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], such as UPS, Fedex, and DHL.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET shipmentMethods](../api/dynamics_shipmentmethods_get.md)|shipmentMethods|Gets a shipment method.|
|[POST shipmentMethods](../api/dynamics_create_shipmentmethods.md)|shipmentMethods|Creates a shipment method.|
|[PATCH shipmentMethods](../api/dynamics_shipmentmethods_update.md)|shipmentMethods|Updates a shipment method.|
|[DELETE shipmentMethods](../api/dynamics_shipmentmethods_delete.md)|none|Deletes a shipment method.|

## Properties
| Property	   | Type	|Description|
|:---------------|:--------|:----------|
|id|GUID|The unique ID of the shipmentMethod. Non-editable.|
|code|string|Specifies the shipment method code.|
|displayName|string|Specifies the shipment method display name.|
|lastModifiedDateTime|datetime|The last datetime the shipment method was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the shipmentMethod.

```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "lastModifiedDateTime": "datetime"
}

```

## See also
[Graph Reference](../api/dynamics_graph_reference.md)  
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get shipment methods](../api/dynamics_shipmentmethods_get.md)  
[Create shipment methods](../api/dynamics_create_shipmentmethods.md)  
[Update shipment methods](../api/dynamics_shipmentmethods_update.md)  
[Delete shipment methods](../api/dynamics_shipmentmethods_delete.md)  
