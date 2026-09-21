---
title: Create a Dataverse Entity Change in Business Central
description: Notify Business Central that a Dataverse table changed so the applicable Dataverse synchronization job can run immediately.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Create a Dataverse entity change

Create a Dataverse entity change in [!INCLUDE [prod_short](../../includes/prod_short.md)].

## HTTP request

Replace `{environmentName}` and `{companyId}` with the environment name and company ID.

```http
POST https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/companies({companyId})/dataverseEntityChanges
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |
| `Content-Type` | `application/json`. Required. |

## Request body

In the request body, specify the logical name of the Dataverse table that changed.

```json
{
  "entityName": "account"
}
```

## Response

If successful, this method returns a `201 Created` response code and a **dataverseEntityChange** object in the response body.

## Example

**Request**

```http
POST https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges
Authorization: Bearer {token}
Content-Type: application/json

{
  "entityName": "account"
}
```

**Response**

```http
HTTP/1.1 201 Created
Content-Type: application/json

{
  "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "entityName": "account"
}
```

## Related information

[Dataverse entity change resource type](../resources/dynamics_dataverseentitychange.md)  
[Get a Dataverse entity change](dynamics_dataverseentitychange_get.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
