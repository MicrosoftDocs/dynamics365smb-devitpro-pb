---
title: Get disputeStatus
description: Gets a dispute status object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get disputeStatus

Retrieves the properties and relationships of a dispute status object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/disputeStatus({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **disputeStatus** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/disputeStatus({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "REVIEW",
    "code": "REVIEW",
    "displayName": "Under Review",
    "lastModifiedDateTime": "2025-04-12T09:45:23Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[disputeStatus](../resources/dynamics_disputeStatus.md)  
[DELETE disputeStatus](dynamics_disputestatus_delete.md)  
[POST disputeStatus](dynamics_disputestatus_create.md)  
[PATCH disputeStatus](dynamics_disputestatus_update.md)
