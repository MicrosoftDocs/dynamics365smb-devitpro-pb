---
title: GET bankAccounts | Microsoft Docs
description: Gets a bankAccount object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/11/2020
ms.author: solsen
---

# Get bankAccounts

[!INCLUDE[api_v2_note](../../includes/api_v2_note.md)]

Retrieve the properties and relationships of a bankAccount object for [!INCLUDE[prod_short](../../../includes/prod_short.md)]. 


## HTTP request
Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
```
GET businesscentralPrefix/companies({id})/bankAccounts({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body
Do not supply a request body for this method.

## Response
If successful, this method returns a ```200 OK``` response code and an **bankAccounts** object in the response body.

## Example

**Request**

Here is an example of the request.
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/bankAccounts({id})
```

**Response**

Here is an example of the response. 

```json
{
    "id": "26049aad-bde4-ea11-bbf2-00155df3a615",
    "number": "NBL",
    "displayName": "New Bank of London"
}
```


## See also
[Tips for working with the APIs](../../developer/devenv-connect-apps-tips.md)    
[bankaccount](../resources/dynamics_bankaccount.md)    
[Delete bankaccount](dynamics_bankaccount_Delete.md)    
[Create bankaccount](dynamics_bankaccount_Create.md)    
[Update bankaccount](dynamics_bankaccount_Update.md)    
