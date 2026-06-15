---
title: Get accountingPeriods (Beta)
description: Gets an accounting period object in Dynamics 365 Business Central (Beta).
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get accountingPeriods (Beta)

Retrieves the properties and relationships of an accounting period object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/accountingPeriods({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and an **accountingPeriod** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/accountingPeriods({id})
```
**Response**

Here is an example of the response.

```json
{
    "id" : "",
    "displayName" : "",
    "startingDate" : "",
    "endingDate" : "",
    "newFiscalYear" : "",
    "fiscalYearStartDate" : "",
    "fiscalYearEndDate" : "",
    "closed" : "",
    "lastModifiedDateTime" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[accountingPeriod](../resources/dynamics_accountingPeriod.md)  
