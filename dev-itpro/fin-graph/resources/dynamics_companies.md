---
title: companies resource type | Microsoft Docs
description: A company in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# companies resource type
Represents a companies resource type in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. 

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET companies](../api/dynamics_companies_get.md)|companies|Get a company.|

## Properties
| Property	      | Type |Description                             |
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
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get companies](../api/dynamics_companies_get.md)  
[Company information](dynamics_companyinformation.md)  
[Get company information](../api/dynamics_companyinformation_get.md)  
[Update company information](../api/dynamics_companyinformation_update.md)  
