---
title: (v1.0) agedAccountsReceivable resource type
description: (v1.0) An aged accounts receivable object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# agedAccountsReceivable resource type

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an agedAccountsReceivable object in [!INCLUDE[prod_short](../../../includes/prod_short.md)], which is showing the aging of a customer account.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)], see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET agedAccountsReceivable](../api/dynamics_agedaccountsreceivable_get.md)|agedAccountsReceivable|Get agedAccountsReceivable object|

## Properties

| Property       | Type    |Description                                  |
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
  
[Get Aged Accounts Receivable](../api/dynamics_agedaccountsreceivable_get.md)  
[Aged Accounts Payable](dynamics_agedaccountspayable.md)  
[Account](dynamics_account.md)  

