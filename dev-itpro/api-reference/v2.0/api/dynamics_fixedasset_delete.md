---
title: Delete fixedAssets
description: Deletes a fixed asset object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: dynamics-365-business-central
ms.topic: article
ms.devlang: al
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Delete fixedAssets

Deletes a fixed asset from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
DELETE businesscentralPrefix/companies({id})/fixedAssets({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **fixedAsset**, the **fixedAsset** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the **fixedAsset**. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/fixedAssets({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.

```json
HTTP/1.1 204 No Content
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[fixedAsset](../resources/dynamics_fixedAsset.md)  
[GET fixedAsset](dynamics_fixedasset_get.md)  
[POST fixedAsset](dynamics_fixedasset_create.md)  
[PATCH fixedAsset](dynamics_fixedasset_update.md)  
