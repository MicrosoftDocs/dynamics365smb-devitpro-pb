---
title: Get Dataverse Entity Change Details
description: Retrieve a Dataverse entity change from Business Central to inspect the Dataverse table associated with a synchronization notification.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Get a Dataverse entity change

Retrieve a Dataverse entity change from [!INCLUDE [prod_short](../../includes/prod_short.md)].

## HTTP request

Replace `{environmentName}`, `{companyId}`, and `{id}` with the environment name, company ID, and entity change ID.

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/companies({companyId})/dataverseEntityChanges({id})
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a **dataverseEntityChange** object in the response body.

## Example

**Request**

```http
GET https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)
Authorization: Bearer {token}
```

**Response**

```json
{
  "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "entityName": "account"
}
```

## Related information

[Dataverse entity change resource type](../resources/dynamics_dataverseentitychange.md)  
[Create a Dataverse entity change](dynamics_dataverseentitychange_create.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
