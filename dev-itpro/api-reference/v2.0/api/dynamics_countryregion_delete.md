---
title: Delete countriesRegions  
description: Deletes a countries/regions object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Delete countriesRegions

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Delete a countries/regions object from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/countriesRegions({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided doesn't match the current tag on the **countriesRegions**, the **countriesRegions** won't be updated.|

## Request body
Don't supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code and deletes the **countryRegion**. It doesn't return anything in the response body.


## Example

**Request**

Here's an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/countriesRegions({id})
```

**Response** 

Here's an example of the response. 

```json
HTTP/1.1 204 No Content
```

## Related information

[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[countryregion](../resources/dynamics_countryregion.md)  
[Get countryregion](dynamics_countryregion_Get.md)  
[Create countryregion](dynamics_countryregion_Create.md)  
[Update countryregion](dynamics_countryregion_Update.md)  
