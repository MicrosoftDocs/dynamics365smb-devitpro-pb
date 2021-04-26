---
title: GET taxGroups  
description: Gets a taxGroup object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get taxGroups

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a tax groups object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/taxGroups({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and a **taxGroups** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v1.0/companies({id})/taxGroups({id})
```

**Response**

Here is an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
{
    "id": "9f196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "FURNITURE",
    "displayName": "Taxable Olympic Furniture",
    "taxType": "Sales Tax",
    "lastModifiedDateTime": "2020-08-21T00:24:26Z"
}
```



## See also
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[taxgroup](../resources/dynamics_taxgroup.md)    
[Delete taxgroup](dynamics_taxgroup_Delete.md)    
[Create taxgroup](dynamics_taxgroup_Create.md)    
[Update taxgroup](dynamics_taxgroup_Update.md)    
