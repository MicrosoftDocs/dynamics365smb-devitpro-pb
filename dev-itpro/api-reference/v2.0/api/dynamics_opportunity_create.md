---
title: Create opportunities
description: Creates an opportunity object in Dynamics 365 Business Central.
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
# Create opportunities

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Creates an opportunity in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/opportunities({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **opportunity**, the **opportunity** will not be updated. |

## Request body

In the request body, supply a JSON representation of a **opportunity** object.

## Response

If successful, this method returns ```201 Created``` response code and a **opportunity** object in the response body.


## Example

**Request**

Here is an example of the request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/opportunities({id})
Content-type: application/json
{
"number": "OP100101",
"contactNumber": "CT200116",
"salespersonCode": "BC",
"description": "Description"
}
```

**Response**

Here is an example of the response.

```json
HTTP/1.1 201 Created
Content-type: application/json
{
"@odata.etag": "W/\"JzQ0O05OZnZiNXpLT1BhTmkvQmduNDBxL1pMR09tdE1aZjVJUVYrYVBWb0VzeDA9MTswMDsn\"",
"id": "563c6d96-cd04-ec11-9310-000d3abb70f9",
"number": "OP100101",
"contactNumber": "CT200116",
"contactName": "David Oliver Lawrence",
"contactCompanyName": "A. Gibson\"s Law Firm",
"salespersonCode": "BC",
"description": "Description",
"status": "Not_x0020_Started",
"closed": false,
"creationDate": "2021-08-24",
"dateClosed": "0001-01-01",
"calculatedCurrentValue": 0,
"chancesOfSuccessPrc": 0,
"completedPrc": 0,
"estimatedClosingDate": "0001-01-01",
"estimatedValue": 0,
"systemCreatedAt": "2021-08-24T11:22:39.02Z",
"lastModifiedDateTime": "2021-08-24T11:22:39.02Z"
}
```

## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[opportunity](../resources/dynamics_opportunity.md)  
[GET opportunity](dynamics_opportunity_get.md)  
[DELETE opportunity](dynamics_opportunity_delete.md)  
[PATCH opportunity](dynamics_opportunity_update.md)  
