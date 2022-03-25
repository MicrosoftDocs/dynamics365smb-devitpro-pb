---
title: Create tableMappings
description: Creates a table mapping object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/25/2022
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Create tableMappings

Creates a table mapping in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different or there might be more than one -->
```
POST businesscentralPrefix/companies({id})/tableMappings({id})
```
<!-- END>EDIT_IS_REQUIRED -->
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
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different. Fill in the property values -->
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
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.
<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
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
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[tableMapping](../resources/dynamics_tableMapping.md)  
[GET tableMapping](dynamics_tablemapping_get.md)  
[DELETE tableMapping](dynamics_tablemapping_delete.md)  
[PATCH tableMapping](dynamics_tablemapping_update.md)  
