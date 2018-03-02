---
title: agedAccountsReceivable resource type | Microsoft Docs
description: An aged accounts receivable object in Dynamics 365 for Finance and Operations, Business edition.
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

# agedAccountsReceivable resource type
Represents an agedAccountsReceivable object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], which is showing the aging of a customer account.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[navnow](../../includes/navnow_md.md)], see [Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md).

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET agedAccountsReceivable](../api/dynamics_agedaccountsreceivable_get.md)|agedAccountsReceivable|Get agedAccountsReceivable object|

## Properties
| Property	     | Type    |Description                                  |
|:---------------|:--------|:--------------------------------------------|
|customerId      |GUID     |The unique ID of customer.                   |
|customerNumber  |string   |Specifies customer's number.                 |
|name            |string   |Specifies customer's name.                   |
|currencyCode    |string   |Specifies the currency.                      |
|before          |numeric  |Specifies balance before first aging period. |
|period1         |numeric  |Specifies balance in the first aging period. |
|period2         |numeric  |Specifies balance in the second aging period.|
|period3         |numeric  |Specifies balance in the third aging period. |
|after           |numeric  |Specifies balance after third aging period.  |
|balance         |numeric  |Specifies customer's total balance.          |  
|periodStartDateFilter|date|Specifies period start date used to calculate aging periods.|
|periodLengthFilter|string |Specifies the length of the periods.         |


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "customerId": "GUID",
    "customerNumber": "string",
    "name": "string",
    "currencyCode": "string",
    "before": "decimal",
    "period1": "decimal",
    "period2": "decimal",
    "period3": "decimal",
    "after": "decimal",
    "balance": "decimal",
    "periodStartDateFilter": "date",
    "periodLengthFilter": "string"
}

```
## See also
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Get aged accounts receivable](../api/dynamics_agedaccountsreceivable_get.md)  
[Aged accounts payable](dynamics_agedaccountspayable.md)  
[Account](dynamics_account.md)  

