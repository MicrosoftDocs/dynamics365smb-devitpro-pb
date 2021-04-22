---
title: Create salesQuotes  
description: Creates a sales quote object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create salesQuotes

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a sales quote object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/salesQuotes
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required.    |
|Content-Type  |application/json    |

## Request body
In the request body, supply a JSON representation of a **salesQuotes** object.

## Response
If successful, this method returns ```201 Created``` response code and a **salesQuotes** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/salesQuotes
Content-type: application/json

{
  "id": "id-value",
  "number": "1006",
  "documentDate": "2016-12-31",
  "customerNumber": "10000",
  "currencyCode": "GBP",
  "paymentTermsId": "3bb5b4b6-ea4c-43ca-ba1c-3b69e29a6668"
}
```
## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)  

[Sales Quote](../resources/dynamics_salesquote.md)  
[Get Sales Quote](dynamics_salesquote_get.md)  
[Update Sales Quote](dynamics_salesquote_update.md)  
[Delete Sales Quote](dynamics_salesquote_delete.md)  