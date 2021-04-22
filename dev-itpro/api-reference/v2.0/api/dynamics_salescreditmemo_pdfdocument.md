---
title: Get pdfDocument | Microsoft Docs
description: Gets a PDF document on a salesCreditMemo in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get pdfDocument

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve a PDF print-out of the corresponding document as binary content for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]  
> To generate a document in the supported local language, you must specify `Accept-Language` in the Request header, for example `Accept-Language: nl-NL` for Dutch.

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
The following example gets a link to the content of the PDF:

```
GET businesscentralPrefix/api/v2.0/companies({id})/salesCreditMemos({creditMemoId})/pdfDocument
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a link to the PDF document in the response body.

## Example

**Request**
Here is an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/salesCreditMemos({creditMemoId})/pdfDocument
```

**Response**
Here is an example of the response.

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{

    "@odata.context":"https://api.businesscentral.dynamics.com/v2.0/api/v2.0/$metadata#companies('CRONUS%20International%20Ltd.')/salesCreditMemos(94913756-80e9-47bc-995a-048a655b8cdd)/pdfDocument",
    "value":
    [
        {
            "@odata.etag":"W/\"JzQ0O0tQNUdjaUtZcU8rcUNCQTdXOUxIZVEwalA0clhjSmlXU1pqWjQ4RFczd2s9MTswMDsn\"",
            "id":"94913756-80e9-47bc-995a-048a655b8cdd",
            "content@odata.mediaReadLink":"https:// api.businesscentral.dynamics.com/v2.0/pi/v2.0/companies(name='CRONUS%20International%20Ltd.')/salesCreditMemos(94913756-80e9-47bc-995a-048a655b8cdd)/pdfDocument(94913756-80e9-47bc-995a-048a655b8cdd)/content"
        }
    ]
}
```

## Remarks
The pdfDocument is not supported for unposted sales credit memos. The sales credit memo must be posted before it is printed; if it is not posted, the response will return an error.

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
The following example gets the actual PDF document:
`GET businesscentralPrefix/api/v2.0/companies({companyid})/salesCreditMemos({creditMemoId})/pdfDocument({id})/content`

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
GET https://{businesscentralPrefix}/api/v2.0/companies({companyid})/salesCreditMemos({creditMemoId})/pdfDocument({id})/content
```

**Response** 
The PDF document in binary format.

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[salescreditmemo](../resources/dynamics_salescreditmemo.md)    
[Get salescreditmemo](dynamics_salescreditmemo_Get.md)    
[Delete salescreditmemo](dynamics_salescreditmemo_Delete.md)    
[Create salescreditmemo](dynamics_salescreditmemo_Create.md)    
[Update salescreditmemo](dynamics_salescreditmemo_Update.md)    
