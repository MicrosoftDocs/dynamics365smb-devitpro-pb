---
title: CREATE unitOfMeasures  
description: Creates a unitOfMeasure object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Create unitsOfMeasure

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a units of measure object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/unitsOfMeasure
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json   |

## Request body
In the request body, supply a JSON representation of a **unitsOfMeasure** object.

## Response
If successful, this method returns ```201 Created``` response code and a **unitsOfMeasure** object in the response body.

## Example

**Request**

Here is an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/unitsOfMeasure
Content-type: application/json

{
    "id": "53a6738a-44e3-ea11-bb43-000d3a2feca1",
    "code": "BOX",
    "displayName": "Box",
    "internationalStandardCode": "BX",
    "symbol": "",
    "lastModifiedDateTime": "2020-08-20T22:24:22.193Z"
}
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "53a6738a-44e3-ea11-bb43-000d3a2feca1",
    "code": "BOX",
    "displayName": "Box",
    "internationalStandardCode": "BX",
    "symbol": "",
    "lastModifiedDateTime": "2020-08-20T22:24:22.193Z"
}
```

## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[unitofmeasure](../resources/dynamics_unitofmeasure.md)    
[Get unitofmeasure](dynamics_unitofmeasure_Get.md)    
[Delete unitofmeasure](dynamics_unitofmeasure_Delete.md)    
[Update unitofmeasure](dynamics_unitofmeasure_Update.md)    
