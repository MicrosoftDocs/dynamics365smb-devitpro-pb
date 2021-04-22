---
title: CREATE vendorPaymentJournals | Microsoft Docs
description: Creates a vendorPaymentJournal object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/22/2020
ms.author: solsen
---

# Create vendorPaymentJournals
Create a vendorPaymentJournal object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
POST businesscentralPrefix/companies({id})/vendorPaymentJournals
```

## Request headers

|Header         |Value                    |
|---------------|-------------------------|
|Authorization  |Bearer {token}. Required.|
|Content-Type   |application/json         |

## Request body
In the request body, supply a JSON representation of **vendorPaymentJournals** object.

## Response
If successful, this method returns ```201 Created``` response code and a **vendorPaymentJournals** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/vendorPaymentJournals
Content-type: application/json

{
PLACE CODE HERE.
}
```

**Response**

Here is an example of the response. 

```json
HTTP/1.1 201 Created
Content-type: application/json

{
PLACE CODE HERE.
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)     
[vendorPaymentJournal](../resources/dynamics_vendorPaymentJournal.md)  
[Get vendorPaymentJournal](dynamics_vendorPaymentJournal_Get.md)   
[Delete vendorPaymentJournal](dynamics_vendorPaymentJournal_Delete.md)   
[Update vendorPaymentJournal](dynamics_vendorPaymentJournal_Update.md)   


