---
title: CREATE countryRegions | Microsoft Docs
description: Creates a countryRegion object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create countriesRegions

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Create a countriesRegions object in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/countriesRegions
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json   |

## Request body
In the request body, supply a JSON representation of **countriesRegions** object.

## Response
If successful, this method returns ```201 Created``` response code and a **countriesRegions** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v2.0/companies({id})/countriesRegions
Content-type: application/json

{
  "code": "AE",
  "displayName": "United Arab Emirates",
  "addressFormat": "City+ZIP Code"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
> The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "44a5738a-44e3-ea11-bb43-000d3a2feca1",
    "code": "AE",
    "displayName": "United Arab Emirates",
    "addressFormat": "City+ZIP Code",
    "lastModifiedDateTime": "2020-08-21T00:24:13.54Z"
}
```

## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[countryregion](../resources/dynamics_countryregion.md)    
[Get countryregion](dynamics_countryregion_Get.md)    
[Delete countryregion](dynamics_countryregion_Delete.md)    
[Update countryregion](dynamics_countryregion_Update.md)    
