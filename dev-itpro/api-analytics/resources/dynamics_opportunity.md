---
title: opportunity resource type
description: Represents a opportunity entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# opportunity resource type

Represents a opportunity in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET opportunity](../api/dynamics_opportunity_get.md)|opportunity|Gets a opportunity object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|opportunityNo|string|The primary key of the opportunity.|
|opportunityDescription|string|Specifies the opportunityDescription of the opportunity.|
|opportunitySalesCycle|string|Specifies the opportunitySalesCycle of the opportunity.|
|opportunityCreationDate|Date|Specifies the opportunityCreationDate of the opportunity.|
|opportunityStatus|string|Specifies the opportunityStatus of the opportunity.|
|opportunityClosed|boolean|Specifies the opportunityClosed of the opportunity.|
|opportunitySalesDocumentNo|string|Specifies the opportunitySalesDocumentNo of the opportunity.|
|opportunitySalesDocumentType|string|Specifies the opportunitySalesDocumentType of the opportunity.|
|opportunityPriority|string|Specifies the opportunityPriority of the opportunity.|
|opportunityCampaignNo|string|Specifies the opportunityCampaignNo of the opportunity.|
|opportunitySegmentNo|string|Specifies the opportunitySegmentNo of the opportunity.|

## JSON representation

Here's a JSON representation of the opportunity resource.

```json
{
    "opportunityNo": "10000",
    "opportunityDescription": "Standard posting",
    "opportunitySalesCycle": "",
    "opportunityCreationDate": "2026-01-15",
    "opportunityStatus": "Released",
    "opportunityClosed": false,
    "opportunitySalesDocumentNo": "103001",
    "opportunitySalesDocumentType": "Invoice",
    "opportunityPriority": "",
    "opportunityCampaignNo": "10000",
    "opportunitySegmentNo": "10000"
}
```

## Related information

[GET opportunity](../api/dynamics_opportunity_get.md)
