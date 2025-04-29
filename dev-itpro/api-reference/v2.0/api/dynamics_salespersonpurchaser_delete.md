---
title: Delete salespersonPurchasers
description: Deletes a salesperson purchaser object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/28/2025
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Delete salespersonPurchasers

Deletes a salesperson purchaser from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
DELETE businesscentralPrefix/companies({id})/salespersonPurchasers({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **salespersonPurchaser**, the **salespersonPurchaser** will not be updated. |


## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the **salespersonPurchaser**. It does not return anything in the response body.

## Example

**Request**

Here's an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/salespersonPurchasers({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here's an example of the response.

```json
HTTP/1.1 204 No Content
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[salespersonPurchaser](../resources/dynamics_salespersonPurchaser.md)  
[GET salespersonPurchaser](dynamics_salespersonpurchaser_get.md)  
[POST salespersonPurchaser](dynamics_salespersonpurchaser_create.md)  
[PATCH salespersonPurchaser](dynamics_salespersonpurchaser_update.md)  
[GET salespersonPurchaser](dynamics_salespersonpurchaser_get.md)  
