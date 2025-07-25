---
title: GET pdfDocuments  
description: Gets a pdfDocument object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Get pdfDocuments

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a pdfDocument object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/salesInvoices({id})/pdfDocument
GET businesscentralPrefix/companies({id})/salesQuotes({id})/pdfDocument
GET businesscentralPrefix/companies({id})/salesCreditMemos({id})/pdfDocument
GET businesscentralPrefix/companies({id})/purchaseInvoices({id})/pdfDocument
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Don't supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **pdfDocuments** object in the response body.

## Example

**Request**

Here's an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices({id})/pdfDocument
```

**Response**

Here's an example of the response. 

```json
{
    "id": "5fd8a1c5-bde4-ea11-bbf2-00155df3a615",
    "parentId": "5fd8a1c5-bde4-ea11-bbf2-00155df3a615",
    "parentType": "Sales Invoice", 
    "pdfDocumentContent@odata.mediaReadLink": "http://onbuyuka-azvm1.europe.corp.microsoft.com:7047/Navision_NAV/api/v2.0/companies(52e03390-bde4-ea11-bbf2-00155df3a615)/salesInvoices(5fd8a1c5-bde4-ea11-bbf2-00155df3a615)/pdfDocument/pdfDocumentContent"
}
```


## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[pdfdocument](../resources/dynamics_pdfdocument.md)    
