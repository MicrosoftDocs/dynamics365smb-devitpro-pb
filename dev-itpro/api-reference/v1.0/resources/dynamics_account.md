---
title: (v1.0) accounts resource type
description: (v1.0) An account object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# accounts resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents an account object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method       | Return Type  |Description|
|:---------------|:--------|:----------|
|[GET accounts](../api/dynamics_account_get.md)|accounts|Get accounts object.|

## Properties

| Property     | Type   |Description|
|:---------------|:--------|:----------|
|id|GUID|The unique ID of the account.|
|number|string, maximum size 20|Specifies the number of the G/L account.|
|displayName|string, maximum size 50|Specifies the name of the G/L account.|
|category|string, maximum size 20|Specifies the category of the G/L account.|
|subCategory|string, maximum size 80|Specifies the subcategory of the account category of the G/L account.|
|blocked|boolean|Specifies that entries cannot be posted to the G/L account. **True** indicates account is blocked and posting is not allowed.|
|lastModifiedDateTime|datetime|The last datetime the account was modified.|


## Relationships
None

## JSON representation

Here is a JSON representation of the resource.


```json
{
  "id": "GUID",
  "number": "string",
  "displayName": "string",
  "category": "string",
  "subCategory": "string",
  "blocked": "boolean",
  "lastModifiedDateTime": "datetime"
}
```
## See also
  
[Get Account](../api/dynamics_account_get.md)  
[Aged Accounts Payable](dynamics_agedaccountspayable.md)  
[Aged Accounts Receivable](dynamics_agedaccountsreceivable.md)  
