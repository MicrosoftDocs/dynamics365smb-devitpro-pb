---
title: UPDATE taxGroups  | Microsoft Docs
description: Updates a taxGroup object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update taxGroups

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a tax groups object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v1.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/taxGroups({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **taxGroups**, the **taxGroups** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **taxGroups** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
PATCH https://{businesscentralPrefix}/api/v1.0/companies({id})/taxGroups({id})
Content-type: application/json

{
  "displayName": "Taxable Furniture"
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
    "id": "9f196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "FURNITURE",
    "displayName": "Taxable Furniture",
    "taxType": "Sales Tax",
    "lastModifiedDateTime": "2020-08-21T00:24:26Z"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[taxgroup](../resources/dynamics_taxgroup.md)    
[Get taxgroup](dynamics_taxgroup_Get.md)    
[Delete taxgroup](dynamics_taxgroup_Delete.md)    
[Create taxgroup](dynamics_taxgroup_Create.md)    
