---
title: Business Central Dataverse API
description: Dataverse API for integration with Dynamics 365 Business Central
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/20/2022
ms.author: solsen
---

# Business Central Dataverse API

The Dataverse API for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] is used to notify [!INCLUDE [prod_short](../developer/includes/prod_short.md)] that a change on a Dataverse entity happened. Only use this API if the Dataverse synchronization is enabled.
The Dataverse API is most commonly used from a Power Automate flow, using the following trigger [Trigger flows when a row is added, modified, or deleted](/power-automate/dataverse/create-update-delete-trigger). 

## Examples

In the following examples of a `POST` request and a `GET` request wit a response, the `entityName` is the name of the Dataverse entity for which the change happened. When you insert a row with a `POST` request, a corresponding job queue entry that does the entity synchronization will be rescheduled to run now. In this example it is the account entity.

The following is an example of a POST request:

```json
POST https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/dataverse/v1.0/dataverseEntityChanges
Content-type: application/json

{
    "entityName": "account"
}
```

The following is an example of a GET request with a response. The response is truncated, because this table can have many rows.

```json
GET https://api.businesscentral.dynamics.com/v2.0/{environment name}/api/microsoft/dataverse/v1.0/dataverseEntityChanges

{
    "id": "3496bbf8-fcae-4e48-a4f8-cb17c27de0b3",
    "entityName": "account"
}
```

## See also

[company resource type](resources/dynamics_company.md)  
[dataverseEntityChange resource type](resources/dynamics_dataverseentitychange.md)  
[subscriptions resource type](resources/dynamics_subscriptions.md)  
[Trigger flows when a row is added, modified, or deleted](/power-automate/dataverse/create-update-delete-trigger)