---
title: (v1.0) companies resource type
description: (v1.0) A company in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# companies resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a companies resource type in [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET companies](../api/dynamics_companies_get.md)|companies|Get a company.|

## Properties

| Property        | Type |Description                             |
|:----------------|:-----|:---------------------------------------|
|id               |GUID  |The unique ID of the company. Read-Only.|
|name             |string|Specifies the Company.                  |
|displayName      |string|Specifies the company display name.     |
|systemVersion    |string|Specifies the internal version of the company.|
|businessProfileId|string|Specifies the Business Profile ID linked to the company.|


## Relationships
None

## JSON representation

Here is a JSON representation of the company.

```json
{
  "id": "GUID",
  "name": "string",
  "displayName": "string",
  "systemVersion": "string",
  "businessProfileId": "string"
}
```

## See Also
  
[Get Companies](../api/dynamics_companies_get.md)  
[Company Information](dynamics_companyinformation.md)  
[Get Company Information](../api/dynamics_companyinformation_get.md)  
[Update Company Information](../api/dynamics_companyinformation_update.md)  
