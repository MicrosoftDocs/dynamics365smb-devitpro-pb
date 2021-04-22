---
title: Get companyInformation | Microsoft Docs
description: Gets a company information object in Dynamics 365 Business Central. 
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get companyInformation

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a company information object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/companyInformation({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **companyInformation** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/companyInformation({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
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
    "website": "",
    "taxRegistrationNumber": "",
    "currencyCode": "USD",
    "currentFiscalYearStartDate": "2021-01-01",
    "industry": "",
    "picture@odata.mediaReadLink": "https://api.businesscentral.dynamics-tie.com/v2.0/5b2f3b37-2b52-460e-8863-3561295b1e08/Production/api/v2.0/companies(4d0e744d-44e3-ea11-bb43-000d3a2feca1)/companyInformation(86f5f171-44e3-ea11-bb43-000d3a2feca1)/picture",
    "lastModifiedDateTime": "2020-08-21T00:24:33.793Z"
}
```


## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[companyinformation](../resources/dynamics_companyinformation.md)    
[Update companyinformation](dynamics_companyinformation_Update.md)    
