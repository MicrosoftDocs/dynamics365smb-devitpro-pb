---
title: Get generalBudgetEntries (Beta)
description: Gets a general budget entry object in Dynamics 365 Business Central (Beta).
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get generalBudgetEntries (Beta)

Retrieves the properties and relationships of a general budget entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/generalBudgetEntries({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **generalBudgetEntry** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/generalBudgetEntries({id})
```
**Response**

Here is an example of the response.

```json
{
    "id" : "",
    "number" : "",
    "description" : "",
    "budgetName" : "",
    "businessUnitCode" : "",
    "date" : "",
    "accountNo" : "",
    "amount" : "",
    "generalLedgerAccountNumber" : "",
    "dimensionSetID" : "",
    "globalDimension1Code" : "",
    "globalDimension2Code" : "",
    "budgetDimension1Code" : "",
    "budgetDimension2Code" : "",
    "budgetDimension3Code" : "",
    "budgetDimension4Code" : "",
    "lastModifiedDateTime" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[generalBudgetEntry](../resources/dynamics_generalBudgetEntry.md)  
