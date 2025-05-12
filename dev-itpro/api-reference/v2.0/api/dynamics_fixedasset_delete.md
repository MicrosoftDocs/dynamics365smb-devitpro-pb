---
title: Delete fixedAssets
description: Deletes a fixed asset object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: how-to
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Delete fixedAssets

Deletes a fixed asset from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
DELETE businesscentralPrefix/companies({id})/fixedAssets({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided doesn't match the current tag on the **fixedAsset**, the **fixedAsset** won't be updated. |


## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the **fixedAsset**. It doesn't return anything in the response body.

## Example

**Request**

Here's an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssets({id})
```

**Response**

Here's an example of the response.

```json
HTTP/1.1 204 No Content
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAsset](../resources/dynamics_fixedAsset.md)  
[GET fixedAsset](dynamics_fixedasset_get.md)  
[POST fixedAsset](dynamics_fixedasset_create.md)  
[PATCH fixedAsset](dynamics_fixedasset_update.md)  
