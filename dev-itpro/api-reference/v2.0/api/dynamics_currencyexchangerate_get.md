---
title: Get currencyExchangeRates
description: Gets a currency exchange rate object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get currencyExchangeRates

Retrieves the properties and relationships of a currency exchange rate object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/currencyExchangeRates({id})
```
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **currencyExchangeRate** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/currencyExchangeRates({id})
```
**Response**

Here's an example of the response.

```json
{
    "id": "USD-230501",
    "currencyCode": "USD",
    "startingDate": "2023-05-01",
    "exchangeRateAmount": 1.08,
    "relationalCurrencyCode": "EUR",
    "relationalExchangeRateAmount": 0.93,
    "lastModifiedDateTime": "2023-05-01T10:15:32Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[currencyExchangeRate](../resources/dynamics_currencyExchangeRate.md)
