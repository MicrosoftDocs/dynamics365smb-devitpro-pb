---
title: Get salesCreditLines
description: Gets a salesCreditLine object in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# Get salesCreditLines

Retrieve the properties and relationships of a salesCreditLine object for [!INCLUDE[prod_short](../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../includes/prod_short.md)] depending on environment following the [guideline](../../developer/devenv-connect-apps-tips.md).
```
GET businesscentralPrefix/api/microsoft/analytics/v1.0/companies({companyId})/salesCreditLines
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **salesCreditLine** object in the response body.

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/microsoft/analytics/v1.0/companies({companyId})/salesCreditLines
```

**Response**

Here's an example of the response.

> [!NOTE]
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "postingDate": "Date",
    "type": "string",
    "description": "string",
    "documentNo": "string",
    "lineNo": "integer",
    "no": "string",
    "locationCode": "string",
    "quantityBase": "decimal",
    "amount": "decimal",
    "unitCostLCY": "decimal",
    "returnReasonCode": "string",
    "shipmentDate": "Date",
    "dimensionSetID": "integer",
    "projectNo": "string",
    "billToCustomerNo": "string",
    "sellToCustomerNo": "string",
    "salesCreditDocumentNo": "string",
    "campaignNo": "string",
    "salespersonCode": "string",
    "opportunityNo": "string"
}
```

## Related information

[salesCreditLine](../resources/dynamics_salescreditline.md)
