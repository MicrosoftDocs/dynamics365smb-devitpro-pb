---
title: customerSales resource type | Microsoft Docs
description: A customer sales in Dynamics 365 for Finance and Operations, Business edition.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/04/2018
ms.author: solsen
---

# customerSales resource type
Represents an customer sales in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)] see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method            | Return Type |Description               |
|:------------------|:------------|:-------------------------|
|[GET customerSales](../api/dynamics_customerSales_get.md)|CustomerSales|Get a customer sales object|

## Properties
| Property	          | Type  |Description                                       |
|:--------------------|:------|:-------------------------------------------------|
|customerId           |GUID   |Represents the customer ID.                       |
|customerNumber       |string |Represents the customer number.                   |
|name                 |string |Represents the name of the customer.              |
|totalSalesAmount     |numeric|Represents the customer sales.                    |
|dateFilter_FilterOnly|date   |Represents the date filter for the customer sales.|


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "customerId": "GUID",
    "customerNumber": "string",
    "name": "string",
    "totalSalesAmount": "decimal",
    "dateFilter_FilterOnly": "date"
}

```
## See also
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get customer sales](../api/dynamics_customersales_get.md)  
