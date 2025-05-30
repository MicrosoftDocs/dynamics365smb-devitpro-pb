---
title: CREATE taxGroups  
description: Creates a taxGroup object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 05/31/2024
ms.author: solsen
ms.reviewer: solsen
---

# Create taxGroups

[!INCLUDE[api_v2_note](../../../includes/api_v2_note.md)]

Create a tax groups object in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../endpoints-apis-for-dynamics.md).
```
POST businesscentralPrefix/companies({id})/taxGroups
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |
|Content-Type  |application/json|

## Request body
In the request body, supply a JSON representation of a **taxGroups** object.

## Response
If successful, this method returns ```201 Created``` response code and a **taxGroups** object in the response body.

## Example

**Request**

Here's an example of a request.

```json
POST https://{businesscentralPrefix}/api/v1.0/companies({id})/taxGroups
Content-type: application/json

{
  "code": "FURNITURE",
  "displayName": "Taxable Olympic Furniture"  
}
```

**Response**

Here's an example of the response. 

> [!NOTE]  
>   The response object shown here may be truncated for brevity. All of the properties will be returned from an actual call.

```json
HTTP/1.1 201 Created
Content-type: application/json

{
    "id": "9f196a90-44e3-ea11-bb43-000d3a2feca1",
    "code": "FURNITURE",
    "displayName": "Taxable Olympic Furniture",
    "taxType": "Sales Tax",
    "lastModifiedDateTime": "2020-08-21T00:24:26Z"
}
```


## Related information
[Tips for working with the APIs](../../../developer/devenv-connect-apps-tips.md)    
[taxgroup](../resources/dynamics_taxgroup.md)    
[Get taxgroup](dynamics_taxgroup_Get.md)    
[Delete taxgroup](dynamics_taxgroup_Delete.md)    
[Update taxgroup](dynamics_taxgroup_Update.md)    
