---
title: (v1.0) Delete customerPaymentsJournals
description: (v1.0) Deletes a customer payment journal in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2019
ms.author: solsen
---

# Delete customerPaymentsJournals (v1.0)
Delete a customer payment journal object from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/customerPaymentJournals({id})
```

## Request headers

|Header       |Value                     |
|-------------|--------------------------|
|Authorization|Bearer {token}. Required. |
|If-Match     |Required. When this request header is included and the eTag provided does not match the current tag on the **customerPaymentJournals**, the **customerPaymentJournals** will not be updated. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v1.0/companies({id})/customerPaymentJournals({id})
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)  
[Microsoft Graph Reference](../api/dynamics_graph_reference.md)  
[Error Codes](../dynamics_error_codes.md)  
[Customer Payments Journal](../resources/dynamics_customerpaymentsjournal.md)  
[Get Customer Payments Journal](dynamics_customerpaymentsjournal_get.md)  
[Post Customer Payments Journal](dynamics_create_customerpaymentsjournal.md)  
[Patch Customer Payments Journal](dynamics_customerpaymentsjournal_update.md)  