---
title: Get vendorLedgerEntries (Beta)
description: Gets a vendor ledger entry object in Dynamics 365 Business Central (Beta).
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get vendorLedgerEntries (Beta)

Retrieves the properties and relationships of a vendor ledger entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../../api-reference/v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/vendorLedgerEntries({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **vendorLedgerEntry** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorLedgerEntries({id})
```
**Response**

Here is an example of the response.

```json
{
    "entryNumber" : "",
    "documentType" : "",
    "description" : "",
    "postingDate" : "",
    "documentNumber" : "",
    "externalDocumentNumber" : "",
    "balancingAccountNumber" : "",
    "balancingAccountType" : "",
    "vendorNumber" : "",
    "open" : "",
    "dimensionSetID" : "",
    "currencyCode" : "",
    "lastModifiedDateTime" : "",
    "amount" : "",
    "debitAmount" : "",
    "creditAmount" : "",
    "amountLocalCurrency" : "",
    "debitAmountLocalCurrency" : "",
    "creditAmountLocalCurrency" : ""
}
```
## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[vendorLedgerEntry](../resources/dynamics_vendorLedgerEntry.md)  
