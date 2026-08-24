---
title: approvalEntry Resource Type Reference
description: Represents a current approval entry in Business Central, including its document, approver, status, amount, due date, and workflow details.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/21/2026
ms.author: solsen
ms.reviewer: solsen
---

# approvalEntry resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents a current approval entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)], see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| [GET approvalEntry](../api/dynamics_approvalentry_get.md) | approvalEntry | Gets an approval entry object. |

## Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the approval entry. Read-only. |
| entryNumber | integer | The entry number of the approval entry. |
| tableId | integer | The ID of the table that contains the record to approve. |
| documentType | NAV.approvalDocumentType | The type of document associated with the approval entry. |
| documentNumber | string | The number of the document associated with the approval entry. |
| sequenceNumber | integer | The sequence number of the approval entry. |
| senderId | string | The ID of the user who sent the approval request. |
| senderName | string | The full name of the user who sent the approval request. |
| approvalCode | string | The code that identifies the approval workflow. |
| salespersonPurchaserCode | string | The salesperson or purchaser code associated with the approval entry. |
| salespersonPurchaserName | string | The salesperson or purchaser name associated with the approval entry. |
| approverId | string | The ID of the approver. |
| approverName | string | The full name of the approver. |
| status | NAV.approvalStatus | The status of the approval entry. |
| dateTimeSentForApproval | datetime | The date and time when the request was sent for approval. |
| lastDateTimeModified | datetime | The date and time when the approval entry was last modified. |
| comment | boolean | Indicates whether the approval entry has a comment. |
| dueDate | date | The date when the approval request is due. |
| amount | decimal | The amount associated with the approval entry. |
| amountLCY | decimal | The amount associated with the approval entry in the local currency. |
| currencyCode | string | The currency code of the amount. |
| approvalType | NAV.workflowApprovalType | The type of approval workflow. |
| limitType | NAV.workflowApprovalLimitType | The type of approval limit. |
| availableCreditLimitLCY | decimal | The available credit limit in the local currency. |
| pendingApprovals | integer | The number of pending approval requests. |
| recordIdToApprove | string | The ID of the record that requires approval. |
| delegationDateFormula | string | The date formula used to determine when the request can be delegated. |
| numberOfApprovedRequests | integer | The number of approved requests in the approval sequence. |
| numberOfRejectedRequests | integer | The number of rejected requests in the approval sequence. |
| relatedToChange | boolean | Indicates whether the approval entry is related to a record change. |
| workflowStepInstanceId | GUID | The ID of the workflow step instance associated with the approval entry. |
| lastModifiedDateTime | datetime | The date and time when the approval entry was last modified. Read-only. |

## JSON representation

Here's a JSON representation of the approvalEntry resource.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "entryNumber": 42,
    "tableId": 36,
    "documentType": "Order",
    "documentNumber": "101001",
    "sequenceNumber": 1,
    "senderId": "ALEX",
    "senderName": "Alex Wilber",
    "approvalCode": "PURCH-ORDER",
    "salespersonPurchaserCode": "JO",
    "salespersonPurchaserName": "John Roberts",
    "approverId": "SARA",
    "approverName": "Sara Davis",
    "status": "Open",
    "dateTimeSentForApproval": "2026-08-04T09:30:00Z",
    "lastDateTimeModified": "2026-08-04T09:30:00Z",
    "comment": false,
    "dueDate": "2026-08-11",
    "amount": 1250.00,
    "amountLCY": 1250.00,
    "currencyCode": "USD",
    "approvalType": "Approver",
    "limitType": "Approval Limits",
    "availableCreditLimitLCY": 25000.00,
    "pendingApprovals": 1,
    "recordIdToApprove": "Purchase Header: Order, 101001",
    "delegationDateFormula": "3D",
    "numberOfApprovedRequests": 0,
    "numberOfRejectedRequests": 0,
    "relatedToChange": false,
    "workflowStepInstanceId": "bbbbbbbb-1111-2222-3333-cccccccccccc",
    "lastModifiedDateTime": "2026-08-04T09:30:00Z"
}
```

## Related information

[GET approvalEntry](../api/dynamics_approvalentry_get.md)
