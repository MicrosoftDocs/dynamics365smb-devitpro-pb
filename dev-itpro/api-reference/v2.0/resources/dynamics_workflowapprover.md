---
title: workflowApprover Resource Type
description: Represents an approver configured in a Business Central workflow, including the workflow, approver type, approval limit type, user, and sequence.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/05/2026
ms.author: solsen
ms.reviewer: solsen
---

# workflowApprover resource type

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Represents an approver configured in a workflow in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)], see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return type | Description |
|:-------|:------------|:------------|
| [GET workflowApprover](../api/dynamics_workflowapprover_get.md) | workflowApprover | Gets a workflow approver object. |

## Properties

| Property | Type | Description |
|:---------|:-----|:------------|
| id | GUID | The unique ID of the workflow approver. Read-only. |
| workflowCode | string | The code of the workflow. |
| workflowDescription | string | The description of the workflow. |
| category | string | The category of the workflow. |
| enabled | boolean | Indicates whether the workflow is enabled. |
| workflowStepId | integer | The ID of the workflow step. |
| argumentId | GUID | The ID of the workflow step argument. |
| approverType | NAV.workflowApproverType | The type of approver for the workflow step. |
| approverLimitType | NAV.workflowApproverLimitType | The type of approval limit for the workflow step. |
| userGroupCode | string | The code of the workflow user group. |
| userGroupDescription | string | The description of the workflow user group. |
| userId | GUID | The unique ID of the approver. |
| userName | string | The name of the approver. |
| sequence | integer | The approver's sequence in the workflow user group. |
| lastModifiedDateTime | datetime | The date and time when the workflow approver was last modified. Read-only. |

## JSON representation

Here's a JSON representation of the workflowApprover resource.

```json
{
    "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
    "workflowCode": "PURCH-ORDER",
    "workflowDescription": "Purchase Order Approval Workflow",
    "category": "PURCHASE",
    "enabled": true,
    "workflowStepId": 10,
    "argumentId": "bbbbbbbb-1111-2222-3333-cccccccccccc",
    "approverType": "Approver",
    "approverLimitType": "Direct Approver",
    "userGroupCode": "",
    "userGroupDescription": "",
    "userId": "00aa00aa-bb11-cc22-dd33-44ee44ee44ee",
    "userName": "sara@contoso.com",
    "sequence": 1,
    "lastModifiedDateTime": "2026-08-04T11:15:00Z"
}
```

## Related information

[GET workflowApprover](../api/dynamics_workflowapprover_get.md)
