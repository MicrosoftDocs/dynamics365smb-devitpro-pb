---
title: Create disputeStatus
description: Creates a dispute status object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create disputeStatus

Creates a dispute status in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/disputeStatus({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body

In the request body, supply a JSON representation of a **disputeStatus** object.

## Response

If successful, this method returns ```201 Created``` response code and a **disputeStatus** object in the response body.


## Example

**Request**

Here's an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/disputeStatus({id})
Content-type: application/json
{
    "code": "INVEST",
    "displayName": "Under Investigation"
}
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id": "INVEST",
    "code": "INVEST",
    "displayName": "Under Investigation",
    "lastModifiedDateTime": "2025-04-29T14:32:09Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[disputeStatus](../resources/dynamics_disputeStatus.md)  
[GET disputeStatus](dynamics_disputestatus_get.md)  
[DELETE disputeStatus](dynamics_disputestatus_delete.md)  
[PATCH disputeStatus](dynamics_disputestatus_update.md)
