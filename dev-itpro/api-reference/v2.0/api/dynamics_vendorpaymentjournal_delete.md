---
title: DELETE vendorPaymentJournals | Microsoft Docs
description: Deletes vendorPaymentJournal  in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Delete vendorPaymentJournals
Deletes vendorPaymentJournals in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
DELETE businesscentralPrefix/companies({id})/vendorPaymentJournals({id})
```

## Request headers

|Header         |Value                     |
|---------------|--------------------------|
|Authorization  |Bearer {token}. Required. |
|If-Match       |Required. When this request header is included and the eTag provided does not match the current tag on the **vendorPaymentJournal **, the **vendorPaymentJournals** will not be updated. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```204 No Content``` response code and it deletes the vendorPaymentJournal .

## Example

**Request**

Here is an example of the request.

```json
DELETE https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPaymentJournals({id})
```

**Response** 

Here is an example of the response. 

```json
HTTP/1.1 204 No Content
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[vendorPaymentJournal](../resources/dynamics_vendorPaymentJournal.md)  
[Get vendorPaymentJournal](dynamics_vendorPaymentJournal_Get.md)   
[Create vendorPaymentJournal](dynamics_vendorPaymentJournal_Create.md)   
[Update vendorPaymentJournal](dynamics_vendorPaymentJournal_Update.md)   

