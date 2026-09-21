---
title: Business Central Dataverse API Overview
description: Learn how the Business Central Dataverse API notifies Business Central about Dataverse entity changes and supports webhook subscriptions.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 09/10/2026
ms.author: solsen
ms.reviewer: solsen
---

# Use the Business Central Dataverse API

Use the Dataverse API for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to notify Business Central when a row changes in Dataverse. Use this API only when Dataverse synchronization is enabled.

The API is commonly called from a Power Automate flow that uses the [When a row is added, modified, or deleted trigger](/power-automate/dataverse/create-update-delete-trigger).

## Business Central Dataverse API endpoint

The Dataverse API is a custom API with the following route:

```http
https://api.businesscentral.dynamics.com/v2.0/{environmentName}/api/microsoft/dataverse/v1.0
```

Company-specific entity change requests use the following resource:

```http
companies({companyId})/dataverseEntityChanges
```

Learn more about Business Central API URLs in [API endpoint structure](../webservices/api-endpoint-structure.md).

## Notify Business Central about a Dataverse change

Set `entityName` to the logical name of the Dataverse table that changed. When you create an entity change, Business Central reschedules the applicable Dataverse synchronization job queue entry to run immediately.

The following example notifies Business Central that a row in the Dataverse `account` table changed.

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

## Get Dataverse entity changes

Use a `GET` request to retrieve entity changes for a company. The response can contain many entries.

**Request**

```http
GET https://api.businesscentral.dynamics.com/v2.0/production/api/microsoft/dataverse/v1.0/companies(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)/dataverseEntityChanges
Authorization: Bearer {token}
```

**Response**

```json
{
  "value": [
    {
      "id": "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb",
      "entityName": "account"
    }
  ]
}
```

## Related information

[Company resource type](resources/dynamics_company.md)  
[Dataverse entity change resource type](resources/dynamics_dataverseentitychange.md)  
[Subscription resource type](resources/dynamics_subscriptions.md)  
[Integrate Business Central with Microsoft Dataverse](../developer/dataverse-integration-overview.md)  
[When a row is added, modified, or deleted trigger](/power-automate/dataverse/create-update-delete-trigger)  
