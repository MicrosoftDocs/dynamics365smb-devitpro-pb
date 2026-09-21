---
title: Get a Company with the Business Central Dataverse API
description: Retrieve a Business Central company through the Dataverse API route so you can identify the company used for entity change operations.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# (Business Central Dataverse API) Get a company

Retrieve a company from [!INCLUDE [prod_short](../../includes/prod_short.md)] through the Business Central Dataverse API.

## HTTP request

Replace `{environmentName}` and `{companyId}` with the environment name and company ID.

```http
GET https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0/companies({companyId})
```

## Request headers

| Header | Value |
|---|---|
| `Authorization` | `Bearer {token}`. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a `200 OK` response code and a **company** object in the response body.

## Example

**Request**

```http
GET https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)
Authorization: Bearer {token}
```

**Response**

```json
{
  "id": "00aa00aa-bb11-cc22-dd33-44ee44ee44ee",
  "systemVersion": "29.0.12345.0",
  "timestamp": 638931456000000000,
  "name": "CRONUS USA, Inc.",
  "displayName": "CRONUS USA, Inc.",
  "businessProfileId": "",
  "systemCreatedAt": "2026-09-01T08:00:00Z",
  "systemCreatedBy": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
  "systemModifiedAt": "2026-09-09T12:30:00Z",
  "systemModifiedBy": "bbbbbbbb-1111-2222-3333-cccccccccccc"
}
```

## Related information

[Company resource type](../resources/dynamics_company.md)  
[Business Central Dataverse API overview](../dynamics-dataverse-api.md)  
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
