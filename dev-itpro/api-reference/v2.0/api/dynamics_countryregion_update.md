---
title: UPDATE countryRegions  | Microsoft Docs
description: Updates a countryRegion object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update countriesRegions

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a country/region object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/countriesRegions({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **countriesRegions**, the **countriesRegions** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **countriesRegions** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/countriesRegions({id})
Content-type: application/json

{
  "displayName": "United Arab Emirates"
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
[Create countryregion](dynamics_countryregion_Create.md)    
