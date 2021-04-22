---
title: UPDATE bankAccounts  | Microsoft Docs
description: Updates a bankAccount object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Update bankAccounts 

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Update the properties of a bankAccount object for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)].

## HTTP request
Replace the URL prefix for [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
PATCH businesscentralPrefix/companies({id})/bankAccounts ({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization |Bearer {token}. Required.|
|Content-Type  |application/json|
|If-Match      |Required. When this request header is included and the eTag provided does not match the current tag on the **bankAccount**, the **bankAccount** will not be updated. |

## Request body
In the request body, supply the values for relevant fields that should be updated. Existing properties that are not included in the request body will maintain their previous values or be recalculated based on changes to other property values. For best performance you shouldn't include existing values that haven't changed.

## Response
If successful, this method returns a ```200 OK``` response code and an updated **bankAccounts ** object in the response body.

## Example

**Request**

Here is an example of the request.

```json
PATCH https://{businesscentralPrefix}/api/v2.0/companies({id})/bankAccounts({id})
Content-type: application/json

{

    "displayName": "New Bank of Paris"
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
    "id": "26049aad-bde4-ea11-bbf2-00155df3a615",
    "number": "NBL",
    "displayName": "New Bank of Paris"
}
```


## See also
[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)    
[bankaccount](../resources/dynamics_bankaccount.md)    
[Get bankaccount](dynamics_bankaccount_Get.md)    
[Delete bankaccount](dynamics_bankaccount_Delete.md)    
[Create bankaccount](dynamics_bankaccount_Create.md)    
