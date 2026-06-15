---
title: (cloudMigration API) Create tableMappings
description: Creates a table mapping object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# (cloudMigration API) Create tableMappings

Creates a table mapping in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md)..
```
POST businesscentralPrefix/companies({id})/tableMappings({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **tableMapping**, the **tableMapping** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **tableMapping** object.

## Response

If successful, this method returns ```201 Created``` response code and a **tableMapping** object in the response body.


## Example

**Request**

Here is an example of the request.
```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/tableMappings({id})
Content-type: application/json
{
    "id" : "",
    "tableId" : "",
    "tableName" : "",
    "sourceTableName" : "",
    "extensionName" : ""
}
```
**Response**

Here is an example of the response.
```json
HTTP/1.1 201 Created
Content-type: application/json
{
    "id" : "",
    "tableId" : "",
    "tableName" : "",
    "sourceTableName" : "",
    "extensionName" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[tableMapping](../resources/dynamics_tableMapping.md)  
[GET tableMapping](dynamics_tablemapping_get.md)  
[DELETE tableMapping](dynamics_tablemapping_delete.md)  
[PATCH tableMapping](dynamics_tablemapping_update.md)  
