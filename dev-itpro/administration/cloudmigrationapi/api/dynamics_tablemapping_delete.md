---
title: (cloudMigration API) Delete tableMappings
description: Deletes a table mapping object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# (cloudMigration API) Delete tableMappings

Deletes a table mapping from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replaces the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md)..
```
DELETE businesscentralPrefix/companies({id})/tableMappings({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **tableMapping**, the **tableMapping** will not be updated. |


## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code and deletes the **tableMapping**. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.
```json
DELETE https://{businesscentralPrefix}/api/v1.0/companies({id})/tableMappings({id})
```
**Response**

Here is an example of the response.

```json
HTTP/1.1 204 No Content
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[tableMapping](../resources/dynamics_tableMapping.md)  
[GET tableMapping](dynamics_tablemapping_get.md)  
[POST tableMapping](dynamics_tablemapping_create.md)  
[PATCH tableMapping](dynamics_tablemapping_update.md)  
