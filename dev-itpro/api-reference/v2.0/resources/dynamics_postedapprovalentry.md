---
title: postedApprovalEntry Resource Type
description: Represents a posted approval entry in Business Central, including its document, approver, final status, amount, and approval history details.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/21/2026
ms.author: solsen
ms.reviewer: solsen
---

# postedApprovalEntry resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a historical approval entry for a posted record in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)], see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| [GET postedApprovalEntry](../api/dynamics_postedapprovalentry_get.md) | postedApprovalEntry | Gets a posted approval entry object. |

## Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the posted approval entry. Read-only. |
| entryNumber | integer | The entry number of the posted approval entry. |
| tableId | integer | The ID of the table that contains the posted record. |
| documentNumber | string | The number of the document associated with the posted approval entry. |
| sequenceNumber | integer | The sequence number of the posted approval entry. |
| senderId | string | The ID of the user who sent the approval request. |
| senderName | string | The full name of the user who sent the approval request. |
| approvalCode | string | The code that identifies the approval workflow. |
| salespersonPurchCode | string | The salesperson or purchaser code associated with the posted approval entry. |
| salespersonPurchName | string | The salesperson or purchaser name associated with the posted approval entry. |
| approverId | string | The ID of the approver. |
| approverName | string | The full name of the approver. |
| status | NAV.approvalStatus | The final status of the posted approval entry. |
| dateTimeSentForApproval | datetime | The date and time when the request was sent for approval. |
| lastDateTimeModified | datetime | The date and time when the approval entry was last modified. |
| lastModifiedById | string | The ID of the user who last modified the approval entry. |
| comment | boolean | Indicates whether the posted approval entry has a comment. |
| dueDate | date | The date when the approval request was due. |
| amount | decimal | The amount associated with the posted approval entry. |
| amountLCY | decimal | The amount associated with the posted approval entry in the local currency. |
| currencyCode | string | The currency code of the amount. |
| approvalType | NAV.workflowApprovalType | The type of approval workflow. |
| limitType | NAV.workflowApprovalLimitType | The type of approval limit. |
| availableCreditLimitLCY | decimal | The available credit limit in the local currency. |
| recordId | string | The ID of the posted record associated with the approval entry. |
| delegationDateFormula | string | The date formula used to determine when the request could be delegated. |
| numberOfApprovedRequests | integer | The number of approved requests in the approval sequence. |
| numberOfRejectedRequests | integer | The number of rejected requests in the approval sequence. |
| iterationNumber | integer | The workflow iteration number of the posted approval entry. |
| lastModifiedDateTime | datetime | The date and time when the posted approval entry was last modified. Read-only. |

## JSON representation

Here's a JSON representation of the postedApprovalEntry resource.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "entryNumber": 41,
    "tableId": 112,
    "documentNumber": "PSI-103021",
    "sequenceNumber": 1,
    "senderId": "ALEX",
    "senderName": "Alex Wilber",
    "approvalCode": "SALES-INVOICE",
    "salespersonPurchCode": "JO",
    "salespersonPurchName": "John Roberts",
    "approverId": "SARA",
    "approverName": "Sara Davis",
    "status": "Approved",
    "dateTimeSentForApproval": "2026-08-01T08:15:00Z",
    "lastDateTimeModified": "2026-08-01T10:20:00Z",
    "lastModifiedById": "SARA",
    "comment": true,
    "dueDate": "2026-08-08",
    "amount": 2450.00,
    "amountLCY": 2450.00,
    "currencyCode": "USD",
    "approvalType": "Approver",
    "limitType": "Approval Limits",
    "availableCreditLimitLCY": 25000.00,
    "recordId": "Sales Invoice Header: PSI-103021",
    "delegationDateFormula": "3D",
    "numberOfApprovedRequests": 1,
    "numberOfRejectedRequests": 0,
    "iterationNumber": 1,
    "lastModifiedDateTime": "2026-08-01T10:20:00Z"
}
```

## Related information

[GET postedApprovalEntry](../api/dynamics_postedapprovalentry_get.md)
