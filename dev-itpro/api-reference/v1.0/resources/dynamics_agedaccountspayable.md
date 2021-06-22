---
title: (v1.0) agedAccountsPayable resource type
description: (v1.0) An aged accounts payable object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# agedAccountsPayable resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an agedAccountsPayable object in [!INCLUDE[prod_short](../../../includes/prod_short.md)], which is showing the aging of a vendor account.

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method         | Return Type  |Description|
|:---------------|:-------------|:----------|
|[GET agedAccountsPayable](../api/dynamics_agedaccountspayable_get.md)|agedAccountsPayable|Get agedAccountsPayable object|

## Properties

| Property      | Type     |Description                                 |
|:--------------|:---------|:-------------------------------------------|
|vendorId       |GUID      |The unique ID of vendor.                    |
|vendorNumber   |string    |Specifies vendor's number.                  |
|name           |string    |Specifies vendor's name.                    |
|currencyCode   |string    |Specifies the currency.                     |
|before         |numeric   |Specifies balance before first aging period.|
|period1        |numeric   |Specifies balance in the first aging period.|
|period2        |numeric   |Specifies balance in the second aging period.|
|period3        |numeric   |Specifies balance in the third aging period.|
|after          |numeric   |Specifies balance after third aging period. |
|balance        |numeric   |Specifies vendor's total balance.           |
|periodStartDateFilter|date|Specifies period start date used to calculate aging periods.|
|periodLengthFilter|string |Specifies the length of the periods.        |


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
    "vendorId": "GUID",
    "vendorNumber": "string",
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
  
[Get Aged Accounts Payable](../api/dynamics_agedaccountspayable_get.md)  
[Aged Accounts Receivable](dynamics_agedaccountsreceivable.md)  
[Account](dynamics_account.md)  
