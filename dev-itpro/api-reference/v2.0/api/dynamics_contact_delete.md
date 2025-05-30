---
title: Delete contacts  
description: Deletes a contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Delete contacts

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Deletes a contact from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
DELETE businesscentralPrefix/companies({id})/contacts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided doesn't match the current tag on the **contact**, the **contact** won't be updated. |


## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the contact. It doesn't return anything in the response body.

## Example

**Request**

Here's an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/contacts({id})
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 204 No Content
```

## Remarks

This resource type requires [!INCLUDE[prod_short](../../../includes/prod_short.md)] version 18.0.

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[contact](../resources/dynamics_contact.md)  
[GET contact](dynamics_contact_get.md)  
[POST contact](dynamics_contact_create.md)  
[PATCH contact](dynamics_contact_update.md)  
