---
title: Update countriesRegions | Microsoft Docs
description: Updates a countries/regions object in Dynamics 365 for Financials.
services: project-madeira
documentationcenter: ''
author: SusanneWindfeldPedersen

ms.service: dynamics365-financials
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/03/2018
ms.author: solsen
---

# Update countriesRegions
Update the properties of a country/region object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
```
PATCH /financials/companies({id})/countriesRegions({id})
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
PATCH https://api.financials.dynamics.com/v1.0/api/beta/companies({id})/countriesRegions({id})
Content-type: application/json

{
  "displayName": "United States of America"
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
  "id": "id-value",
  "code": "US",
  "displayName": "United States of America",
  "addressFormat": "City+County+Post Code",
  "lastModifiedDateTime": "2017-03-16T15:22:31.753Z"
}
```


## See also
[Working with [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] in Microsoft Graph](../resources/dynamics_overview.md)  
[Enabling the APIs for Microsoft Dynamics NAV](../../enabling-apis-for-dynamics-nav.md)  
[Endpoints for the APIs](../../endpoints-apis-for-dynamics.md)  
[Error Codes](../dynamics_error_codes.md)  
[Countries regions](../resources/dynamics_countriesregions.md)  
[Get counties regions](dynamics_countriesregions_get.md)  
[Post countries regions](dynamics_create_countriesregions.md)  
[Delete countries regions](dynamics_countriesregions_delete.md)  