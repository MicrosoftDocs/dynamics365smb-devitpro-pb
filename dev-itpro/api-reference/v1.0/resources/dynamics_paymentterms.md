---
title: (v1.0) paymentTerms resource type
description: (v1.0) A payment terms object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# paymentTerms resource type (v1.0)

[!INCLUDE[d365_api_newversion](../../../includes/d365_api_newversion.md)]

Represents a payment term in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method                                                      | Return Type|Description            |
|:------------------------------------------------------------|:-----------|:----------------------|
|[GET paymentTerms](../api/dynamics_paymentterms_get.md)      |paymentTerms|Get a payment terms object.   |
|[POST paymentTerms](../api/dynamics_create_paymentterms.md)  |paymentTerms|Create a payment terms object.|
|[PATCH paymentTerms](../api/dynamics_paymentterms_update.md) |paymentTerms|Update a payment terms object.|
|[DELETE paymentTerms](../api/dynamics_paymentterms_delete.md)|none        |Delete a payment terms object.|

## Properties

| Property                     | Type     |Description                                                |
|:-----------------------------|:-------|:----------------------------------------------------------|
|id                            |GUID    |The unique ID of the paymentTerms. Non-editable.           |
|code                          |string  |Specifies the payment term code.                           |
|displayName                   |string  |Specifies the payment term display name.                   |
|dueDateCalculation            |string  |Specifies the formula that is used to calculate the date that a payment must be made.|
|discountDateCalculation       |string  |Specifies the formula that is used to calculate the date that a payment must be made in order to obtain a discount.|
|discountPercent               |decimal |Specifies the discount percentage that is applied for early payment of an invoice amount.|
|calculateDiscountOnCreditMemos|boolean |Specifies if the discount should be applied to credit memos. **True** indicates a discount will be given, **false** indicates a discount will not be given.|
|lastModifiedDateTime          |datetime|The last datetime the paymentTerms was modified. Read-Only.|  


## Relationships
None

## JSON representation

Here is a JSON representation of the paymentTerms.


```json
{
  "id": "GUID",
  "code": "string",
  "displayName": "string",
  "dueDateCalculation": "string",
  "discountDateCalculation": "string",
  "discountPercent": "decimal",
  "calculateDiscountOnCreditMemos": "boolean",
  "lastModifiedDateTime": "datetime"
}
```

## See also

[Get Payment Terms](../api/dynamics_paymentterms_get.md)  
[Create Payment Terms](../api/dynamics_create_paymentterms.md)  
[Update Payment Terms](../api/dynamics_paymentterms_update.md)  
[Delete Payment Terms](../api/dynamics_paymentterms_delete.md)  