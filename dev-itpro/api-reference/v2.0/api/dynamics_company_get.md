---
title: GET companies | Microsoft Docs
description: Gets a company object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get companies

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a companies object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **companies** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "id-value",
    "systemVersion": "17806",
    "name": "CRONUS US",
    "displayName": "CRONUS USA, Inc.",
    "businessProfileId": "",
    "systemCreatedAt": "2017-01-23T00:24:31.766Z",
    "systemCreatedBy": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "systemModifiedAt": "2020-08-21T00:24:31.777Z",
    "systemModifiedBy": "f2a5738a-44e3-ea11-bb43-000d3a2feca1"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[company](../resources/dynamics_company.md)    
