---
title: Delete customerContacts
description: Deletes a customer contact object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: article
ms.devlang: al
ms.date: 04/28/2025
ms.author: solsen
---

# Delete customerContacts

Deletes a customer contact from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
DELETE businesscentralPrefix/companies({id})/customerContacts({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided doesn't match the current tag on the **customerContact**, the **customerContact** won't be updated. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the **customerContact**. It doesn't return anything in the response body.

## Example

**Request**

Here's an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/customerContacts({id})
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 204 No Content
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[customerContact](../resources/dynamics_customerContact.md)  
[GET customerContact](dynamics_customercontact_get.md)  
[PATCH customerContact](dynamics_customercontact_update.md)  
[GET customerContact](dynamics_customercontact_get.md)  
