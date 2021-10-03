---
title: Get opportunities
description: Gets an opportunity object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/24/2021
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get opportunities

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieves the properties and relationships of an opportunity object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/opportunities({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **opportunity** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/opportunities({id})
```

**Response**

Here is an example of the response.

```json
200 OK
{
"@odata.etag": "W/\"JzQ0OzZXc0ZDVjlUYjBOTDNOYmMvbjdTSTNpRWlhVjVXbmRBUzltakJOYmFlTU09MTswMDsn\"",
"id": "2438bf05-52ff-eb11-bb76-000d3a220646",
"number": "OP100001",
"contactNumber": "CT200116",
"contactName": "David Oliver Lawrence",
"contactCompanyName": "A. Gibson\"s Law Firm",
"salespersonCode": "BC",
"description": "New tables",
"status": "In_x0020_Progress",
"closed": false,
"creationDate": "2022-11-05",
"dateClosed": "0001-01-01",
"calculatedCurrentValue": 600,
"chancesOfSuccessPrc": 15,
"completedPrc": 2,
"estimatedClosingDate": "2023-11-11",
"estimatedValue": 200000,
"systemCreatedAt": "2021-08-17T11:55:35.327Z",
"lastModifiedDateTime": "2021-08-17T11:55:35.327Z"
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[opportunity](../resources/dynamics_opportunity.md)  
[DELETE opportunity](dynamics_opportunity_delete.md)  
[POST opportunity](dynamics_opportunity_create.md)  
[PATCH opportunity](dynamics_opportunity_update.md)  
