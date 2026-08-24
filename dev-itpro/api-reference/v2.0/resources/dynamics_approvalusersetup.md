---
title: approvalUserSetup Resource Type
description: Represents an approval user setup in Business Central, including the approver, substitute, approval limits, contact details, and administrator status.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/21/2026
ms.author: solsen
ms.reviewer: solsen
---

# approvalUserSetup resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents the approval setup for a user in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)], see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| [GET approvalUserSetup](../api/dynamics_approvalusersetup_get.md) | approvalUserSetup | Gets an approval user setup object. |

## Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the approval user setup. Read-only. |
| userId | string | The ID of the user. |
| userFullName | string | The full name of the user. |
| salesPersonPurchaser | string | The salesperson or purchaser code associated with the user. |
| approverId | string | The ID of the user's approver. |
| salesAmountApprovalLimit | integer | The maximum sales amount that the user can approve. |
| unlimitedSalesApproval | boolean | Indicates whether the user can approve sales amounts without a limit. |
| purchaseAmountApprovalLimit | integer | The maximum purchase amount that the user can approve. |
| unlimitedPurchaseApproval | boolean | Indicates whether the user can approve purchase amounts without a limit. |
| requestApprovalAmountLimit | integer | The maximum request amount that the user can approve. |
| unlimitedRequestApprovalAmount | boolean | Indicates whether the user can approve request amounts without a limit. |
| substitute | string | The ID of the user who acts as the substitute approver. |
| email | string | The email address of the user. |
| phoneNumber | string | The phone number of the user. |
| approvalAdmin | boolean | Indicates whether the user is an approval administrator. |
| lastModifiedDateTime | datetime | The date and time when the approval user setup was last modified. Read-only. |

## JSON representation

Here's a JSON representation of the approvalUserSetup resource.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "userId": "SARA",
    "userFullName": "Sara Davis",
    "salesPersonPurchaser": "SD",
    "approverId": "ADMIN",
    "salesAmountApprovalLimit": 10000,
    "unlimitedSalesApproval": false,
    "purchaseAmountApprovalLimit": 15000,
    "unlimitedPurchaseApproval": false,
    "requestApprovalAmountLimit": 5000,
    "unlimitedRequestApprovalAmount": false,
    "substitute": "ALEX",
    "email": "sara@contoso.com",
    "phoneNumber": "555-0100",
    "approvalAdmin": false,
    "lastModifiedDateTime": "2026-08-04T11:00:00Z"
}
```

## Related information

[GET approvalUserSetup](../api/dynamics_approvalusersetup_get.md)
