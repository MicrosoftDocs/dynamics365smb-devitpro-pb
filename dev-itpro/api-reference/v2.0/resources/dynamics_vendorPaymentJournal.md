---
title: vendorPaymentJournal resource type  
description: A vendor payment journal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# vendorPaymentJournal resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a vendor payment journal in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET vendorPaymentJournal](../api/dynamics_vendorpaymentjournal_get.md)|vendorPaymentJournal|Gets a vendor payment journal object.|
|[DELETE vendorPaymentJournal](../api/dynamics_vendorpaymentjournal_delete.md)|none|Deletes a vendor payment journal object.|
|[POST vendorPaymentJournal](../api/dynamics_vendorpaymentjournal_create.md)|vendorPaymentJournal|Creates a vendor payment journal object.|
|[PATCH vendorPaymentJournal](../api/dynamics_vendorpaymentjournal_update.md)|vendorPaymentJournal|Updates a vendor payment journal object.|


## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[account](dynamics_account.md)|account |Gets the account of the vendorPaymentJournal.|
|[vendorPayments](dynamics_vendorpayment.md)|vendorPayments |Gets the vendorpayments of the vendorPaymentJournal.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the vendor payment journal. Non-editable.|
|code|string|The code of the vendor payment journal.|
|displayName|string|Specifies the vendor payment journal's name. This name will appear on all sales documents for the vendor payment journal.|
|balancingAccountId|GUID|The balancing G/L Account ID.|
|balancingAccountNumber|string|The balancing G/L Account number.|
|lastModifiedDateTime|datetime|The last datetime the vendor payment journal was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the vendorPaymentJournal resource.


```json
{
    "id": "GUID",
    "code": "string",
    "displayName": "string",
    "balancingAccountId": "GUID",
    "balancingAccountNumber": "string",
    "lastModifiedDateTime": "datetime"
}
```
<!-- IMPORTANT: END>DO_NOT_EDIT -->



## See Also
[GET vendorPaymentJournal](../api/dynamics_vendorPaymentJournal_Get.md)
[DELETE vendorPaymentJournal](../api/dynamics_vendorPaymentJournal_Delete.md)
[POST vendorPaymentJournal](../api/dynamics_vendorPaymentJournal_Create.md)
[PATCH vendorPaymentJournal](../api/dynamics_vendorPaymentJournal_Update.md)
