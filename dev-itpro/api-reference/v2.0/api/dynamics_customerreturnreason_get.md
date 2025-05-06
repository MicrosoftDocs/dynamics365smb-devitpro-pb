---
title: Get customerReturnReasons
description: Gets a customer return reason object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get customerReturnReasons

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieves the properties and relationships of a customer return reason object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/customerReturnReasons({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **customerReturnReason** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/customerReturnReasons({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "6ea22bf6-a449-ee11-ad0b-a1422c0f7f1f",
    "code": "VARIANT",
    "description": "Wrong item variant"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[customerReturnReason](../resources/dynamics_customerReturnReason.md)  
[DELETE customerReturnReason](dynamics_customerreturnreason_delete.md)  
[POST customerReturnReason](dynamics_customerreturnreason_create.md)  
[PATCH customerReturnReason](dynamics_customerreturnreason_update.md)  
