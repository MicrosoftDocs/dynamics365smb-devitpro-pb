---
title: Delete salesQuotes | Microsoft Docs
description: Deletes a sales quote object in Dynamics 365 Business Central.
 
author: SusanneWindfeldPedersen

ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Delete salesQuotes

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Delete a salesQuote from [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/salesQuotes({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **salesQuotes**, the **salesQuotes** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns ```204 No Content``` response code. It does not return anything in the response body.

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/salesQuotes({id})
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[salesquote](../resources/dynamics_salesquote.md)    
[Get salesquote](dynamics_salesquote_Get.md)    
[Create salesquote](dynamics_salesquote_Create.md)    
[Update salesquote](dynamics_salesquote_Update.md)    
