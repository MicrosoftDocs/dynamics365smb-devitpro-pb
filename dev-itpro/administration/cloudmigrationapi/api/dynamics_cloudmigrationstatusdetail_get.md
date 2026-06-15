---
title: (cloudMigration API) Get cloudMigrationStatusDetails
description: Gets a cloud migration status detail object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# (cloudMigration API) Get cloudMigrationStatusDetails

Retrieves the properties and relationships of a cloud migration status detail object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md)..
```
GET businesscentralPrefix/companies({id})/cloudMigrationStatusDetails({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **cloudMigrationStatusDetail** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/cloudMigrationStatusDetails({id})
```
**Response**

Here is an example of the response.

```json
{
    "id" : "",
    "runId" : "",
    "companyName" : "",
    "tableName" : "",
    "status" : "",
    "recordsCopied" : "",
    "totalRecords" : "",
    "errors" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[cloudMigrationStatusDetail](../resources/dynamics_cloudMigrationStatusDetail.md)  
