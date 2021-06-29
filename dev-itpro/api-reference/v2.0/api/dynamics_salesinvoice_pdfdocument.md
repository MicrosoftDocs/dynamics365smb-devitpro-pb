---
title: Get salesInvoice pdfDocument  
description: Gets a PDF document on a salesInvoice in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/01/2021
ms.author: solsen
---

# Get salesInvoice pdfDocument

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve a PDF print-out of the corresponding document as binary content for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> To generate a document in the supported local language, you must specify `Accept-Language` in the Request header, for example `Accept-Language: nl-NL` for Dutch.

## HTTP request (v2.0)
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
The following example gets a link to the content of the PDF:

```
GET businesscentralPrefix/api/v2.0/companies({id})/salesInvoices({id})/pdfDocument
```

## Request headers (v2.0)

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body (v2.0)
Do not supply a request body for this method.

## Response (v2.0)
If successful, this method returns a ```200 OK``` response code and a link to the PDF document in the response body.

## Example (v2.0)

**Request**
Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesInvoices({id})/pdfDocument
```

**Response**
Here is an example of the response.

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{

    "@odata.context":"https://api.businesscentral.dynamics.com/v2.0/api/v2.0/$metadata#companies('CRONUS%20International%20Ltd.')/salesInvoices(94913756-80e9-47bc-995a-048a655b8cdd)/pdfDocument",
    "value":
    [
        {
            "@odata.etag":"W/\"JzQ0O0tQNUdjaUtZcU8rcUNCQTdXOUxIZVEwalA0clhjSmlXU1pqWjQ4RFczd2s9MTswMDsn\"",
            "id":"94913756-80e9-47bc-995a-048a655b8cdd",
            "content@odata.mediaReadLink":"https:// api.businesscentral.dynamics.com/v2.0/pi/v2.0/companies(name='CRONUS%20International%20Ltd.')/salesInvoices(94913756-80e9-47bc-995a-048a655b8cdd)/pdfDocument(94913756-80e9-47bc-995a-048a655b8cdd)/content"
        }
    ]
}
```

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
The following example gets the actual PDF document:
`GET businesscentralPrefix/api/v2.0/companies({companyid})/salesInvoices({invoiceid})/pdfDocument({invoiceid})/content`

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a `200 OK` response code and the PDF document in the response body.

## Example

**Request**
Here is an example of the request.

```
GET https://{businesscentralPrefix}/api/v2.0/companies({companyid})/salesInvoices({invoiceid})/pdfDocument({invoiceid})/content
```

**Response** 
The PDF document in binary format.

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[salesinvoice](../resources/dynamics_salesinvoice.md)    
[Get salesinvoice](dynamics_salesinvoice_Get.md)    
[Delete salesinvoice](dynamics_salesinvoice_Delete.md)    
[Create salesinvoice](dynamics_salesinvoice_Create.md)    
[Update salesinvoice](dynamics_salesinvoice_Update.md)    
