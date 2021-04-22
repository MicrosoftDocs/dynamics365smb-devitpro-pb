---
title: Update companyInformation | Microsoft Docs
description: Updates a company information object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update companyInformation

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a company information object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].


## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/companyInformation({id})
```

## Request headers

|Header        |Value                    |
|--------------|-------------------------|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json         |
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **companyInformation**, the **companyInformation** will not be updated.  |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated an **companyInformation** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/companyInformation({id})
Content-type: application/json

{
  "displayName": "CRONUS USA, Inc.",
  "website": "www.cronuscorp.net"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 200 OK
Content-type: application/json

{
    "id": "86f5f171-44e3-ea11-bb43-000d3a2feca1",
    "displayName": "CRONUS USA, Inc.",
    "addressLine1": "7122 South Ashford Street",
    "addressLine2": "Westminster",
    "city": "Atlanta",
    "state": "GA",
    "country": "US",
    "postalCode": "31772",
    "phoneNumber": "+1 425 555 0100",
    "faxNumber": "+1 425 555 0101",
    "email": "",
    "website": "www.cronuscorp.net",
    "taxRegistrationNumber": "",
    "currencyCode": "USD",
    "currentFiscalYearStartDate": "2021-01-01",
    "industry": "",
    "picture@odata.mediaReadLink": "https://api.businesscentral.dynamics-tie.com/v2.0/5b2f3b37-2b52-460e-8863-3561295b1e08/Production/api/v2.0/companies(4d0e744d-44e3-ea11-bb43-000d3a2feca1)/companyInformation(86f5f171-44e3-ea11-bb43-000d3a2feca1)/picture",
    "lastModifiedDateTime": "2020-08-21T00:24:33.793Z"
  }
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[companyinformation](../resources/dynamics_companyinformation.md)    
[Get companyinformation](dynamics_companyinformation_Get.md)    
