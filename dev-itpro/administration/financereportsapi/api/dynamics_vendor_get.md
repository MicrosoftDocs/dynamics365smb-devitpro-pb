---
title: Get vendors (Beta)
description: Gets a vendor object in Dynamics 365 Business Central (Beta).
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get vendors (Beta)

Retrieves the properties and relationships of a vendor object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/vendors({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **vendor** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/vendors({id})
```
**Response**

Here is an example of the response.

```json
{
    "id" : "",
    "number" : "",
    "displayName" : "",
    "city" : "",
    "state" : "",
    "country" : "",
    "postalCode" : "",
    "currencyCode" : "",
    "paymentTermsId" : "",
    "paymentMethodId" : "",
    "taxLiable" : "",
    "blocked" : "",
    "balance" : "",
    "lastModifiedDateTime" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[vendor](../resources/dynamics_vendor.md)  
