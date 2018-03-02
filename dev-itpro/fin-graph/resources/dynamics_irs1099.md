---
title: irs1099Codes resource type | Microsoft Docs
description: An IRS 1099 Code object in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/05/2018
ms.author: solsen
---

# irs1099Codes resource type
Represents an irs1099Codes object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)]. IRS 1099 codes are used for reporting to the IRS.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                 | Return Type|Description            |
|:-------------------------------------------------------|:-----------|:----------------------|
|[GET irs1099Codes](../api/dynamics_irs1099_get.md)      |irs1099Codes|Gets an IRS 1099 code. |
|[POST irs1099Codes](../api/dynamics_create_irs1099.md)  |irs1099Codes|Creates an IRS 1099 code.|
|[PATCH irs1099Codes](../api/dynamics_irs1099_update.md) |irs1099Codes|Update an IRS 1099 code.|
|[DELETE irs1099Codes](../api/dynamics_irs1099_delete.md)|none        |Delete an IRS 1099 code.|

## Properties
| Property	         | Type 	|Description                                      |
|:-------------------|:-------|:------------------------------------------------|
|id                  |GUID    |The unique ID of the IRS 1099 Code. Non-editable.|
|code                |string  |Specifies the IRS 1099 Code.                     |
|displayName         |string  |Specifies the IRS 1099 Code display name.        |
|minimumReportable   |decimal |Specifies the minimum value for this box that must be reported to the IRS on a 1099 form.|
|lastModifiedDateTime|datetime|The last datetime the IRS 1099 Code was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the irs1099Codes.


```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "minimumReportable": "decimal",
  "lastModifiedDateTime": "datetime"
}

```

## See also
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get IRS 1099](../api/dynamics_irs1099_get.md)  
[Post IRS 1099](../api/dynamics_create_irs1099.md)  
[Patch IRS 1099](../api/dynamics_irs1099_update.md)  
[Delete IRS 1099](../api/dynamics_irs1099_delete.md)  