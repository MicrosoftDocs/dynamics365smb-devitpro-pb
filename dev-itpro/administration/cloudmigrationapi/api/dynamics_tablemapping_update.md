---
title: (cloudMigration API) Update tableMappings
description: Updates a  table mapping object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# (cloudMigration API) Update tableMappings

Updates the properties of a table mapping object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md)..
```
PATCH businesscentralPrefix/companies({id})/tableMappings({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **tableMapping**, the **table mapping** will not be updated. |

## Request body

In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response

If successful, this method returns a ```200 OK``` response code and an updated **tableMapping** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies({id})/tableMappings({id})
Content-type: application/json
{
    "id" : ,
    "tableId" :
}
```
**Response**

Here is an example of the response.

```json
HTTP/1.1 200 OK
Content-type: application/json
{
    "id" : ,
    "tableId" : ,
    "tableName" : ,
    "sourceTableName" : ,
    "extensionName" :
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[tableMapping](../resources/dynamics_tableMapping.md)  
[GET tableMapping](dynamics_tablemapping_get.md)  
[DELETE tableMapping](dynamics_tablemapping_delete.md)  
[POST tableMapping](dynamics_tablemapping_create.md)  
